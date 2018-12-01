package com.google.protobuf.nano;

import android.support.v7.recyclerview.R;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.MessageLite;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class Extension<M extends ExtendableMessageNano<M>, T> {
    protected final Class<T> clazz;
    protected final GeneratedMessageLite<?, ?> defaultInstance;
    protected final boolean repeated;
    public final int tag;
    protected final int type;

    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T> createMessageTyped(int type, Class<T> clazz, long tag) {
        return new Extension(type, clazz, (int) tag, false);
    }

    private Extension(int type, Class<T> clazz, int tag, boolean repeated) {
        this(type, clazz, null, tag, repeated);
    }

    private Extension(int type, Class<T> clazz, GeneratedMessageLite<?, ?> defaultInstance, int tag, boolean repeated) {
        this.type = type;
        this.clazz = clazz;
        this.tag = tag;
        this.repeated = repeated;
        this.defaultInstance = defaultInstance;
    }

    public boolean equals(Object other) {
        boolean z = true;
        if (this == other) {
            return true;
        }
        if (!(other instanceof Extension)) {
            return false;
        }
        Extension<?, ?> that = (Extension) other;
        if (!(this.type == that.type && this.clazz == that.clazz && this.tag == that.tag && this.repeated == that.repeated)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (((((this.type + 1147) * 31) + this.clazz.hashCode()) * 31) + this.tag) * 31;
        if (this.repeated) {
            i = 1;
        }
        return hashCode + i;
    }

    final T getValueFrom(List<UnknownFieldData> unknownFields) {
        if (unknownFields == null) {
            return null;
        }
        return !this.repeated ? getSingularValueFrom(unknownFields) : getRepeatedValueFrom(unknownFields);
    }

    private T getRepeatedValueFrom(List<UnknownFieldData> unknownFields) {
        int i;
        List<Object> resultList = new ArrayList();
        for (i = 0; i < unknownFields.size(); i++) {
            UnknownFieldData data = (UnknownFieldData) unknownFields.get(i);
            if (data.bytes.length != 0) {
                readDataInto(data, resultList);
            }
        }
        int resultSize = resultList.size();
        if (resultSize == 0) {
            return null;
        }
        T result = this.clazz.cast(Array.newInstance(this.clazz.getComponentType(), resultSize));
        for (i = 0; i < resultSize; i++) {
            Array.set(result, i, resultList.get(i));
        }
        return result;
    }

    private T getSingularValueFrom(List<UnknownFieldData> unknownFields) {
        if (unknownFields.isEmpty()) {
            return null;
        }
        return this.clazz.cast(readData(CodedInputByteBufferNano.newInstance(((UnknownFieldData) unknownFields.get(unknownFields.size() - 1)).bytes)));
    }

    protected Object readData(CodedInputByteBufferNano input) {
        String valueOf;
        Class<?> messageType = !this.repeated ? this.clazz : this.clazz.getComponentType();
        try {
            switch (this.type) {
                case R.styleable.ToggleSwitch_textOffColor /*10*/:
                    MessageNano group = (MessageNano) messageType.newInstance();
                    input.readGroup(group, WireFormatNano.getTagFieldNumber(this.tag));
                    return group;
                case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                    if (this.defaultInstance != null) {
                        return input.readMessageLite(this.defaultInstance.getParserForType());
                    }
                    MessageNano message = (MessageNano) messageType.newInstance();
                    input.readMessage(message);
                    return message;
                default:
                    throw new IllegalArgumentException("Unknown type " + this.type);
            }
        } catch (InstantiationException e) {
            valueOf = String.valueOf(messageType);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("Error creating instance of class ").append(valueOf).toString(), e);
        } catch (IllegalAccessException e2) {
            valueOf = String.valueOf(messageType);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("Error creating instance of class ").append(valueOf).toString(), e2);
        } catch (IOException e3) {
            throw new IllegalArgumentException("Error reading extension field", e3);
        }
    }

    protected void readDataInto(UnknownFieldData data, List<Object> resultList) {
        resultList.add(readData(CodedInputByteBufferNano.newInstance(data.bytes)));
    }

    void writeTo(Object value, CodedOutputByteBufferNano output) throws IOException {
        if (this.repeated) {
            writeRepeatedData(value, output);
        } else {
            writeSingularData(value, output);
        }
    }

    protected void writeSingularData(Object value, CodedOutputByteBufferNano out) {
        try {
            out.writeRawVarint32(this.tag);
            switch (this.type) {
                case R.styleable.ToggleSwitch_textOffColor /*10*/:
                    int fieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
                    if (this.defaultInstance != null) {
                        out.writeGroupNoTag((MessageLite) value);
                    } else {
                        out.writeGroupNoTag((MessageNano) value);
                    }
                    out.writeTag(fieldNumber, 4);
                    return;
                case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                    if (this.defaultInstance != null) {
                        out.writeMessageNoTag((MessageLite) value);
                        return;
                    } else {
                        out.writeMessageNoTag((MessageNano) value);
                        return;
                    }
                default:
                    throw new IllegalArgumentException("Unknown type " + this.type);
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
        throw new IllegalStateException(e);
    }

    protected void writeRepeatedData(Object array, CodedOutputByteBufferNano output) {
        int arrayLength = Array.getLength(array);
        for (int i = 0; i < arrayLength; i++) {
            Object element = Array.get(array, i);
            if (element != null) {
                writeSingularData(element, output);
            }
        }
    }

    int computeSerializedSize(Object value) {
        if (this.repeated) {
            return computeRepeatedSerializedSize(value);
        }
        return computeSingularSerializedSize(value);
    }

    protected int computeRepeatedSerializedSize(Object array) {
        int size = 0;
        int arrayLength = Array.getLength(array);
        for (int i = 0; i < arrayLength; i++) {
            if (Array.get(array, i) != null) {
                size += computeSingularSerializedSize(Array.get(array, i));
            }
        }
        return size;
    }

    protected int computeSingularSerializedSize(Object value) {
        int fieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
        switch (this.type) {
            case R.styleable.ToggleSwitch_textOffColor /*10*/:
                if (this.defaultInstance != null) {
                    return CodedOutputStream.computeGroupSize(fieldNumber, (MessageLite) value);
                }
                return CodedOutputByteBufferNano.computeGroupSize(fieldNumber, (MessageNano) value);
            case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                if (this.defaultInstance != null) {
                    return CodedOutputStream.computeMessageSize(fieldNumber, (MessageLite) value);
                }
                return CodedOutputByteBufferNano.computeMessageSize(fieldNumber, (MessageNano) value);
            default:
                throw new IllegalArgumentException("Unknown type " + this.type);
        }
    }
}
