package com.google.android.apps.lens.library.base.proto.nano;

import android.support.v7.recyclerview.R;
import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.NanoEnumValue;
import java.io.IOException;

public final class LensSdkParamsProto$LensSdkParams extends ExtendableMessageNano<LensSdkParamsProto$LensSdkParams> implements Cloneable {
    public String agsaVersionName;
    @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
    public int arStickersAvailabilityStatus;
    @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
    public int lensAvailabilityStatus;
    public String lensSdkVersion;

    public interface LensAvailabilityStatus {
    }

    @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
    public static int checkLensAvailabilityStatusOrThrow(int value) {
        if (value >= -1 && value <= 6) {
            return value;
        }
        throw new IllegalArgumentException(value + " is not a valid enum LensAvailabilityStatus");
    }

    public LensSdkParamsProto$LensSdkParams() {
        clear();
    }

    public LensSdkParamsProto$LensSdkParams clear() {
        this.lensSdkVersion = "";
        this.agsaVersionName = "";
        this.lensAvailabilityStatus = -1;
        this.arStickersAvailabilityStatus = -1;
        this.unknownFieldData = null;
        this.cachedSize = -1;
        return this;
    }

    public LensSdkParamsProto$LensSdkParams clone() {
        try {
            return (LensSdkParamsProto$LensSdkParams) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public void writeTo(CodedOutputByteBufferNano output) throws IOException {
        if (!(this.lensSdkVersion == null || this.lensSdkVersion.equals(""))) {
            output.writeString(1, this.lensSdkVersion);
        }
        if (!(this.agsaVersionName == null || this.agsaVersionName.equals(""))) {
            output.writeString(2, this.agsaVersionName);
        }
        if (this.lensAvailabilityStatus != -1) {
            output.writeInt32(3, this.lensAvailabilityStatus);
        }
        if (this.arStickersAvailabilityStatus != -1) {
            output.writeInt32(4, this.arStickersAvailabilityStatus);
        }
        super.writeTo(output);
    }

    protected int computeSerializedSize() {
        int size = super.computeSerializedSize();
        if (!(this.lensSdkVersion == null || this.lensSdkVersion.equals(""))) {
            size += CodedOutputByteBufferNano.computeStringSize(1, this.lensSdkVersion);
        }
        if (!(this.agsaVersionName == null || this.agsaVersionName.equals(""))) {
            size += CodedOutputByteBufferNano.computeStringSize(2, this.agsaVersionName);
        }
        if (this.lensAvailabilityStatus != -1) {
            size += CodedOutputByteBufferNano.computeInt32Size(3, this.lensAvailabilityStatus);
        }
        if (this.arStickersAvailabilityStatus == -1) {
            return size;
        }
        return size + CodedOutputByteBufferNano.computeInt32Size(4, this.arStickersAvailabilityStatus);
    }

    public LensSdkParamsProto$LensSdkParams mergeFrom(CodedInputByteBufferNano input) throws IOException {
        int initialPos;
        while (true) {
            int tag = input.readTag();
            switch (tag) {
                case 0:
                    return this;
                case R.styleable.ToggleSwitch_textOffColor /*10*/:
                    this.lensSdkVersion = input.readString();
                    break;
                case 18:
                    this.agsaVersionName = input.readString();
                    break;
                case 24:
                    initialPos = input.getPosition();
                    try {
                        this.lensAvailabilityStatus = checkLensAvailabilityStatusOrThrow(input.readInt32());
                        break;
                    } catch (IllegalArgumentException e) {
                        input.rewindToPosition(initialPos);
                        storeUnknownField(input, tag);
                        break;
                    }
                case 32:
                    initialPos = input.getPosition();
                    try {
                        this.arStickersAvailabilityStatus = checkLensAvailabilityStatusOrThrow(input.readInt32());
                        break;
                    } catch (IllegalArgumentException e2) {
                        input.rewindToPosition(initialPos);
                        storeUnknownField(input, tag);
                        break;
                    }
                default:
                    if (super.storeUnknownField(input, tag)) {
                        break;
                    }
                    return this;
            }
        }
    }
}
