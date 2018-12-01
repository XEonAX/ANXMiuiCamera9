package com.google.protobuf.nano;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.MessageLite;
import com.sensetime.stmobile.STCommon;
import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ReadOnlyBufferException;

public final class CodedOutputByteBufferNano {
    private final ByteBuffer buffer;
    private CodedOutputStream codedOutputStream;
    private int codedOutputStreamPosition;

    public static class OutOfSpaceException extends IOException {
        private static final long serialVersionUID = -6947486886997889499L;

        OutOfSpaceException(int position, int limit) {
            super("CodedOutputStream was writing to a flat byte array and ran out of space (pos " + position + " limit " + limit + ").");
        }
    }

    private CodedOutputByteBufferNano(byte[] buffer, int offset, int length) {
        this(ByteBuffer.wrap(buffer, offset, length));
    }

    private CodedOutputByteBufferNano(ByteBuffer buffer) {
        this.buffer = buffer;
        this.buffer.order(ByteOrder.LITTLE_ENDIAN);
    }

    public static CodedOutputByteBufferNano newInstance(byte[] flatArray) {
        return newInstance(flatArray, 0, flatArray.length);
    }

    public static CodedOutputByteBufferNano newInstance(byte[] flatArray, int offset, int length) {
        return new CodedOutputByteBufferNano(flatArray, offset, length);
    }

    private CodedOutputStream getCodedOutputStream() throws IOException {
        if (this.codedOutputStream == null) {
            this.codedOutputStream = CodedOutputStream.newInstance(this.buffer);
            this.codedOutputStreamPosition = this.buffer.position();
        } else if (this.codedOutputStreamPosition != this.buffer.position()) {
            this.codedOutputStream.write(this.buffer.array(), this.codedOutputStreamPosition, this.buffer.position() - this.codedOutputStreamPosition);
            this.codedOutputStreamPosition = this.buffer.position();
        }
        return this.codedOutputStream;
    }

    public void writeInt32(int fieldNumber, int value) throws IOException {
        writeTag(fieldNumber, 0);
        writeInt32NoTag(value);
    }

    public void writeString(int fieldNumber, String value) throws IOException {
        writeTag(fieldNumber, 2);
        writeStringNoTag(value);
    }

    public void writeInt32NoTag(int value) throws IOException {
        if (value < 0) {
            writeRawVarint64((long) value);
        } else {
            writeRawVarint32(value);
        }
    }

    public void writeStringNoTag(String value) throws IOException {
        try {
            int minLengthVarIntSize = computeRawVarint32Size(value.length());
            if (minLengthVarIntSize != computeRawVarint32Size(value.length() * 3)) {
                writeRawVarint32(encodedLength(value));
                encode(value, this.buffer);
                return;
            }
            int oldPosition = this.buffer.position();
            if (this.buffer.remaining() >= minLengthVarIntSize) {
                this.buffer.position(oldPosition + minLengthVarIntSize);
                encode(value, this.buffer);
                int newPosition = this.buffer.position();
                this.buffer.position(oldPosition);
                writeRawVarint32((newPosition - oldPosition) - minLengthVarIntSize);
                this.buffer.position(newPosition);
                return;
            }
            throw new OutOfSpaceException(oldPosition + minLengthVarIntSize, this.buffer.limit());
        } catch (BufferOverflowException e) {
            OutOfSpaceException outOfSpaceException = new OutOfSpaceException(this.buffer.position(), this.buffer.limit());
            outOfSpaceException.initCause(e);
            throw outOfSpaceException;
        }
    }

    private static int encodedLength(CharSequence sequence) {
        int utf16Length = sequence.length();
        int utf8Length = utf16Length;
        int i = 0;
        while (i < utf16Length && sequence.charAt(i) < 128) {
            i++;
        }
        while (i < utf16Length) {
            char c = sequence.charAt(i);
            if (c >= 2048) {
                utf8Length += encodedLengthGeneral(sequence, i);
                break;
            }
            utf8Length += (127 - c) >>> 31;
            i++;
        }
        if (utf8Length >= utf16Length) {
            return utf8Length;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (((long) utf8Length) + 4294967296L));
    }

    private static int encodedLengthGeneral(CharSequence sequence, int start) {
        int utf16Length = sequence.length();
        int utf8Length = 0;
        int i = start;
        while (i < utf16Length) {
            char c = sequence.charAt(i);
            if (c >= 2048) {
                utf8Length += 2;
                if (55296 <= c && c <= 57343) {
                    if (Character.codePointAt(sequence, i) >= 65536) {
                        i++;
                    } else {
                        throw new IllegalArgumentException("Unpaired surrogate at index " + i);
                    }
                }
            }
            utf8Length += (127 - c) >>> 31;
            i++;
        }
        return utf8Length;
    }

    private static void encode(CharSequence sequence, ByteBuffer byteBuffer) {
        if (byteBuffer.isReadOnly()) {
            throw new ReadOnlyBufferException();
        } else if (byteBuffer.hasArray()) {
            try {
                byteBuffer.position(encode(sequence, byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.remaining()) - byteBuffer.arrayOffset());
            } catch (ArrayIndexOutOfBoundsException e) {
                BufferOverflowException boe = new BufferOverflowException();
                boe.initCause(e);
                throw boe;
            }
        } else {
            encodeDirect(sequence, byteBuffer);
        }
    }

    private static void encodeDirect(CharSequence sequence, ByteBuffer byteBuffer) {
        int utf16Length = sequence.length();
        int i = 0;
        while (i < utf16Length) {
            char c = sequence.charAt(i);
            if (c < 128) {
                byteBuffer.put((byte) c);
            } else if (c < 2048) {
                byteBuffer.put((byte) ((c >>> 6) | 960));
                byteBuffer.put((byte) ((c & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
            } else if (c >= 55296 && 57343 >= c) {
                if (i + 1 != sequence.length()) {
                    i++;
                    char low = sequence.charAt(i);
                    if (Character.isSurrogatePair(c, low)) {
                        int codePoint = Character.toCodePoint(c, low);
                        byteBuffer.put((byte) ((codePoint >>> 18) | 240));
                        byteBuffer.put((byte) (((codePoint >>> 12) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                        byteBuffer.put((byte) (((codePoint >>> 6) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                        byteBuffer.put((byte) ((codePoint & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                    }
                }
                throw new IllegalArgumentException("Unpaired surrogate at index " + (i - 1));
            } else {
                byteBuffer.put((byte) ((c >>> 12) | 480));
                byteBuffer.put((byte) (((c >>> 6) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                byteBuffer.put((byte) ((c & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
            }
            i++;
        }
    }

    private static int encode(CharSequence sequence, byte[] bytes, int offset, int length) {
        char c;
        int utf16Length = sequence.length();
        int j = offset;
        int i = 0;
        int limit = offset + length;
        while (i < utf16Length && i + offset < limit) {
            c = sequence.charAt(i);
            if (c >= 128) {
                break;
            }
            bytes[offset + i] = (byte) ((byte) c);
            i++;
        }
        if (i == utf16Length) {
            return offset + utf16Length;
        }
        int j2 = offset + i;
        while (i < utf16Length) {
            c = sequence.charAt(i);
            if (c < 128 && j2 < limit) {
                j = j2 + 1;
                bytes[j2] = (byte) ((byte) c);
            } else if (c < 2048 && j2 <= limit - 2) {
                j = j2 + 1;
                bytes[j2] = (byte) ((byte) ((c >>> 6) | 960));
                j2 = j + 1;
                bytes[j] = (byte) ((byte) ((c & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                j = j2;
            } else if ((c < 55296 || 57343 < c) && j2 <= limit - 3) {
                j = j2 + 1;
                bytes[j2] = (byte) ((byte) ((c >>> 12) | 480));
                j2 = j + 1;
                bytes[j] = (byte) ((byte) (((c >>> 6) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                j = j2 + 1;
                bytes[j2] = (byte) ((byte) ((c & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
            } else if (j2 > limit - 4) {
                char c2 = c;
                throw new ArrayIndexOutOfBoundsException("Failed writing " + c + " at index " + j2);
            } else {
                if (i + 1 != sequence.length()) {
                    i++;
                    char low = sequence.charAt(i);
                    if (Character.isSurrogatePair(c, low)) {
                        int codePoint = Character.toCodePoint(c, low);
                        j = j2 + 1;
                        bytes[j2] = (byte) ((byte) ((codePoint >>> 18) | 240));
                        j2 = j + 1;
                        bytes[j] = (byte) ((byte) (((codePoint >>> 12) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                        j = j2 + 1;
                        bytes[j2] = (byte) ((byte) (((codePoint >>> 6) & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                        j2 = j + 1;
                        bytes[j] = (byte) ((byte) ((codePoint & 63) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT));
                        j = j2;
                    }
                }
                throw new IllegalArgumentException("Unpaired surrogate at index " + (i - 1));
            }
            i++;
            j2 = j;
        }
        return j2;
    }

    public void writeGroupNoTag(MessageNano value) throws IOException {
        value.writeTo(this);
    }

    public void writeGroupNoTag(MessageLite value) throws IOException {
        CodedOutputStream codedOutputStream = getCodedOutputStream();
        value.writeTo(codedOutputStream);
        codedOutputStream.flush();
        this.codedOutputStreamPosition = this.buffer.position();
    }

    public void writeMessageNoTag(MessageNano value) throws IOException {
        writeRawVarint32(value.getCachedSize());
        value.writeTo(this);
    }

    public void writeMessageNoTag(MessageLite value) throws IOException {
        writeRawVarint32(value.getSerializedSize());
        CodedOutputStream codedOutputStream = getCodedOutputStream();
        value.writeTo(codedOutputStream);
        codedOutputStream.flush();
        this.codedOutputStreamPosition = this.buffer.position();
    }

    public static int computeInt32Size(int fieldNumber, int value) {
        return computeTagSize(fieldNumber) + computeInt32SizeNoTag(value);
    }

    public static int computeStringSize(int fieldNumber, String value) {
        return computeTagSize(fieldNumber) + computeStringSizeNoTag(value);
    }

    public static int computeGroupSize(int fieldNumber, MessageNano value) {
        return (computeTagSize(fieldNumber) * 2) + computeGroupSizeNoTag(value);
    }

    public static int computeMessageSize(int fieldNumber, MessageNano value) {
        return computeTagSize(fieldNumber) + computeMessageSizeNoTag(value);
    }

    public static int computeInt32SizeNoTag(int value) {
        if (value < 0) {
            return 10;
        }
        return computeRawVarint32Size(value);
    }

    public static int computeStringSizeNoTag(String value) {
        int length = encodedLength(value);
        return computeRawVarint32Size(length) + length;
    }

    public static int computeGroupSizeNoTag(MessageNano value) {
        return value.getSerializedSize();
    }

    public static int computeMessageSizeNoTag(MessageNano value) {
        int size = value.getSerializedSize();
        return computeRawVarint32Size(size) + size;
    }

    public int spaceLeft() {
        return this.buffer.remaining();
    }

    public void checkNoSpaceLeft() {
        if (spaceLeft() != 0) {
            throw new IllegalStateException(String.format("Did not write as much data as expected, %s bytes remaining.", new Object[]{Integer.valueOf(spaceLeft())}));
        }
    }

    public void writeRawByte(byte value) throws IOException {
        if (this.buffer.hasRemaining()) {
            this.buffer.put(value);
            return;
        }
        throw new OutOfSpaceException(this.buffer.position(), this.buffer.limit());
    }

    public void writeRawByte(int value) throws IOException {
        writeRawByte((byte) value);
    }

    public void writeRawBytes(byte[] value) throws IOException {
        writeRawBytes(value, 0, value.length);
    }

    public void writeRawBytes(byte[] value, int offset, int length) throws IOException {
        if (this.buffer.remaining() < length) {
            throw new OutOfSpaceException(this.buffer.position(), this.buffer.limit());
        }
        this.buffer.put(value, offset, length);
    }

    public void writeTag(int fieldNumber, int wireType) throws IOException {
        writeRawVarint32(WireFormatNano.makeTag(fieldNumber, wireType));
    }

    public static int computeTagSize(int fieldNumber) {
        return computeRawVarint32Size(WireFormatNano.makeTag(fieldNumber, 0));
    }

    public void writeRawVarint32(int value) throws IOException {
        while ((value & -128) != 0) {
            writeRawByte((value & 127) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
            value >>>= 7;
        }
        writeRawByte(value);
    }

    public static int computeRawVarint32Size(int value) {
        if ((value & -128) == 0) {
            return 1;
        }
        if ((value & -16384) == 0) {
            return 2;
        }
        if ((-2097152 & value) == 0) {
            return 3;
        }
        if ((-268435456 & value) != 0) {
            return 5;
        }
        return 4;
    }

    public void writeRawVarint64(long value) throws IOException {
        while ((-128 & value) != 0) {
            writeRawByte((((int) value) & 127) | STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
            value >>>= 7;
        }
        writeRawByte((int) value);
    }
}
