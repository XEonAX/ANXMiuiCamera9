package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import java.io.IOException;

public final class ServiceEventProto extends ExtendableMessageNano<ServiceEventProto> implements Cloneable {
    private int bitField0_;
    private int eventId_;

    public int getEventId() {
        return this.eventId_;
    }

    public ServiceEventProto() {
        clear();
    }

    public ServiceEventProto clear() {
        this.bitField0_ = 0;
        this.eventId_ = 0;
        this.unknownFieldData = null;
        this.cachedSize = -1;
        return this;
    }

    public ServiceEventProto clone() {
        try {
            return (ServiceEventProto) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public void writeTo(CodedOutputByteBufferNano output) throws IOException {
        if ((this.bitField0_ & 1) != 0) {
            output.writeInt32(1, this.eventId_);
        }
        super.writeTo(output);
    }

    protected int computeSerializedSize() {
        int size = super.computeSerializedSize();
        if ((this.bitField0_ & 1) == 0) {
            return size;
        }
        return size + CodedOutputByteBufferNano.computeInt32Size(1, this.eventId_);
    }

    public ServiceEventProto mergeFrom(CodedInputByteBufferNano input) throws IOException {
        while (true) {
            int tag = input.readTag();
            switch (tag) {
                case 0:
                    return this;
                case 8:
                    this.eventId_ = input.readInt32();
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

    public static ServiceEventProto parseFrom(byte[] data) throws InvalidProtocolBufferNanoException {
        return (ServiceEventProto) MessageNano.mergeFrom(new ServiceEventProto(), data);
    }
}
