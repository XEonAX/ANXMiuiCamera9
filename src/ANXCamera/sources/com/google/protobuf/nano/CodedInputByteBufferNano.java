package com.google.protobuf.nano;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.Parser;
import java.io.IOException;

public final class CodedInputByteBufferNano {
    private final byte[] buffer;
    private int bufferPos;
    private final int bufferSize;
    private int bufferSizeAfterLimit;
    private final int bufferStart;
    private CodedInputStream codedInputStream;
    private int currentLimit = Integer.MAX_VALUE;
    private int lastTag;
    private int maybeLimitedBufferSize;
    private int recursionDepth;
    private int recursionLimit = 64;
    private int sizeLimit = 67108864;

    public static CodedInputByteBufferNano newInstance(byte[] buf) {
        return newInstance(buf, 0, buf.length);
    }

    public static CodedInputByteBufferNano newInstance(byte[] buf, int off, int len) {
        return new CodedInputByteBufferNano(buf, off, len);
    }

    public int readTag() throws IOException {
        if (isAtEnd()) {
            this.lastTag = 0;
            return 0;
        }
        this.lastTag = readRawVarint32();
        if (this.lastTag != 0) {
            return this.lastTag;
        }
        throw InvalidProtocolBufferNanoException.invalidTag();
    }

    public void checkLastTagWas(int value) throws InvalidProtocolBufferNanoException {
        if (this.lastTag != value) {
            throw InvalidProtocolBufferNanoException.invalidEndTag();
        }
    }

    public boolean skipField(int tag) throws IOException {
        switch (WireFormatNano.getTagWireType(tag)) {
            case 0:
                readInt32();
                return true;
            case 1:
                readRawLittleEndian64();
                return true;
            case 2:
                skipRawBytes(readRawVarint32());
                return true;
            case 3:
                skipMessage();
                checkLastTagWas(WireFormatNano.makeTag(WireFormatNano.getTagFieldNumber(tag), 4));
                return true;
            case 4:
                return false;
            case 5:
                readRawLittleEndian32();
                return true;
            default:
                throw InvalidProtocolBufferNanoException.invalidWireType();
        }
    }

    public void skipMessage() throws IOException {
        while (true) {
            int tag = readTag();
            if (tag == 0 || !skipField(tag)) {
                return;
            }
        }
    }

    public int readInt32() throws IOException {
        return readRawVarint32();
    }

    public String readString() throws IOException {
        int size = readRawVarint32();
        if (size < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (size <= this.maybeLimitedBufferSize - this.bufferPos) {
            String result = new String(this.buffer, this.bufferPos, size, InternalNano.UTF_8);
            this.bufferPos += size;
            return result;
        } else {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
    }

    public void readGroup(MessageNano msg, int fieldNumber) throws IOException {
        if (this.recursionDepth < this.recursionLimit) {
            this.recursionDepth++;
            msg.mergeFrom(this);
            checkLastTagWas(WireFormatNano.makeTag(fieldNumber, 4));
            this.recursionDepth--;
            return;
        }
        throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
    }

    public void readMessage(MessageNano msg) throws IOException {
        int length = readRawVarint32();
        if (this.recursionDepth < this.recursionLimit) {
            int oldLimit = pushLimit(length);
            this.recursionDepth++;
            msg.mergeFrom(this);
            checkLastTagWas(0);
            this.recursionDepth--;
            popLimit(oldLimit);
            return;
        }
        throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
    }

    public int readRawVarint32() throws IOException {
        byte tmp = readRawByte();
        if (tmp >= (byte) 0) {
            return tmp;
        }
        int result = tmp & 127;
        tmp = readRawByte();
        if (tmp < (byte) 0) {
            result |= (tmp & 127) << 7;
            tmp = readRawByte();
            if (tmp < (byte) 0) {
                result |= (tmp & 127) << 14;
                tmp = readRawByte();
                if (tmp < (byte) 0) {
                    result |= (tmp & 127) << 21;
                    tmp = readRawByte();
                    result |= tmp << 28;
                    if (tmp < (byte) 0) {
                        for (int i = 0; i < 5; i++) {
                            if (readRawByte() >= (byte) 0) {
                                return result;
                            }
                        }
                        throw InvalidProtocolBufferNanoException.malformedVarint();
                    }
                }
                result |= tmp << 21;
            } else {
                result |= tmp << 14;
            }
        } else {
            result |= tmp << 7;
        }
        return result;
    }

    public int readRawLittleEndian32() throws IOException {
        return (((readRawByte() & 255) | ((readRawByte() & 255) << 8)) | ((readRawByte() & 255) << 16)) | ((readRawByte() & 255) << 24);
    }

    public long readRawLittleEndian64() throws IOException {
        return (((((((((long) readRawByte()) & 255) | ((((long) readRawByte()) & 255) << 8)) | ((((long) readRawByte()) & 255) << 16)) | ((((long) readRawByte()) & 255) << 24)) | ((((long) readRawByte()) & 255) << 32)) | ((((long) readRawByte()) & 255) << 40)) | ((((long) readRawByte()) & 255) << 48)) | ((((long) readRawByte()) & 255) << 56);
    }

    private CodedInputByteBufferNano(byte[] buffer, int off, int len) {
        this.buffer = buffer;
        this.bufferStart = off;
        int i = off + len;
        this.maybeLimitedBufferSize = i;
        this.bufferSize = i;
        this.bufferPos = off;
    }

    private CodedInputStream getCodedInputStream() throws IOException {
        if (this.codedInputStream == null) {
            this.codedInputStream = CodedInputStream.newInstance(this.buffer, this.bufferStart, this.bufferSize);
        }
        int liteBytesRead = this.codedInputStream.getTotalBytesRead();
        int nanoBytesRead = this.bufferPos - this.bufferStart;
        if (liteBytesRead <= nanoBytesRead) {
            this.codedInputStream.skipRawBytes(nanoBytesRead - liteBytesRead);
            this.codedInputStream.setRecursionLimit(this.recursionLimit - this.recursionDepth);
            return this.codedInputStream;
        }
        throw new IOException(String.format("CodedInputStream read ahead of CodedInputByteBufferNano: %s > %s", new Object[]{Integer.valueOf(liteBytesRead), Integer.valueOf(nanoBytesRead)}));
    }

    public <T extends GeneratedMessageLite<T, ?>> T readMessageLite(Parser<T> parser) throws IOException {
        GeneratedMessageLite result = (GeneratedMessageLite) getCodedInputStream().readMessage(parser, ExtensionRegistryLite.getGeneratedRegistry());
        skipField(this.lastTag);
        return result;
    }

    public int pushLimit(int byteLimit) throws InvalidProtocolBufferNanoException {
        if (byteLimit >= 0) {
            byteLimit += this.bufferPos;
            int oldLimit = this.currentLimit;
            if (byteLimit <= oldLimit) {
                this.currentLimit = byteLimit;
                recomputeBufferSizeAfterLimit();
                return oldLimit;
            }
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        throw InvalidProtocolBufferNanoException.negativeSize();
    }

    private void recomputeBufferSizeAfterLimit() {
        this.maybeLimitedBufferSize += this.bufferSizeAfterLimit;
        int bufferEnd = this.maybeLimitedBufferSize;
        if (bufferEnd <= this.currentLimit) {
            this.bufferSizeAfterLimit = 0;
            return;
        }
        this.bufferSizeAfterLimit = bufferEnd - this.currentLimit;
        this.maybeLimitedBufferSize -= this.bufferSizeAfterLimit;
    }

    public void popLimit(int oldLimit) {
        this.currentLimit = oldLimit;
        recomputeBufferSizeAfterLimit();
    }

    public boolean isAtEnd() {
        return this.bufferPos == this.maybeLimitedBufferSize;
    }

    public int getPosition() {
        return this.bufferPos - this.bufferStart;
    }

    public byte[] getData(int offset, int length) {
        if (length == 0) {
            return WireFormatNano.EMPTY_BYTES;
        }
        byte[] copy = new byte[length];
        System.arraycopy(this.buffer, this.bufferStart + offset, copy, 0, length);
        return copy;
    }

    public void rewindToPosition(int position) {
        rewindToPositionAndTag(position, this.lastTag);
    }

    void rewindToPositionAndTag(int position, int tag) {
        if (position > this.bufferPos - this.bufferStart) {
            throw new IllegalArgumentException("Position " + position + " is beyond current " + (this.bufferPos - this.bufferStart));
        } else if (position >= 0) {
            this.bufferPos = this.bufferStart + position;
            this.lastTag = tag;
        } else {
            throw new IllegalArgumentException("Bad position " + position);
        }
    }

    public byte readRawByte() throws IOException {
        if (this.bufferPos != this.maybeLimitedBufferSize) {
            byte[] bArr = this.buffer;
            int i = this.bufferPos;
            this.bufferPos = i + 1;
            return bArr[i];
        }
        throw InvalidProtocolBufferNanoException.truncatedMessage();
    }

    public void skipRawBytes(int size) throws IOException {
        if (size < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (this.bufferPos + size > this.currentLimit) {
            skipRawBytes(this.currentLimit - this.bufferPos);
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        } else if (size > this.maybeLimitedBufferSize - this.bufferPos) {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        } else {
            this.bufferPos += size;
        }
    }
}
