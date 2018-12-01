package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import java.io.IOException;

public final class LensServiceClientEventData extends ExtendableMessageNano<LensServiceClientEventData> implements Cloneable {
    private int bitField0_;
    private int targetServiceApiVersion_;

    public LensServiceClientEventData setTargetServiceApiVersion(int value) {
        this.bitField0_ |= 1;
        this.targetServiceApiVersion_ = value;
        return this;
    }

    public LensServiceClientEventData() {
        clear();
    }

    public LensServiceClientEventData clear() {
        this.bitField0_ = 0;
        this.targetServiceApiVersion_ = 0;
        this.unknownFieldData = null;
        this.cachedSize = -1;
        return this;
    }

    public LensServiceClientEventData clone() {
        try {
            return (LensServiceClientEventData) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public void writeTo(CodedOutputByteBufferNano output) throws IOException {
        if ((this.bitField0_ & 1) != 0) {
            output.writeInt32(1, this.targetServiceApiVersion_);
        }
        super.writeTo(output);
    }

    protected int computeSerializedSize() {
        int size = super.computeSerializedSize();
        if ((this.bitField0_ & 1) == 0) {
            return size;
        }
        return size + CodedOutputByteBufferNano.computeInt32Size(1, this.targetServiceApiVersion_);
    }

    public LensServiceClientEventData mergeFrom(CodedInputByteBufferNano input) throws IOException {
        while (true) {
            int tag = input.readTag();
            switch (tag) {
                case 0:
                    return this;
                case 8:
                    this.targetServiceApiVersion_ = input.readInt32();
                    this.bitField0_ |= 1;
                    break;
                default:
                    if (super.storeUnknownField(input, tag)) {
                        break;
                    }
                    return this;
            }
        }
    }
}
