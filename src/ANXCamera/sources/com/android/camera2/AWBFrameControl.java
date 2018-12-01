package com.android.camera2;

import android.hardware.camera2.marshal.MarshalQueryable;
import android.hardware.camera2.marshal.Marshaler;
import android.hardware.camera2.utils.TypeReference;
import java.nio.ByteBuffer;

public class AWBFrameControl {
    float mBGain;
    int mColorTemperature;
    float mGGain;
    float mRGain;

    public static class MarshalQueryableAWBFrameControl implements MarshalQueryable<AWBFrameControl> {

        private class MarshalerAWBFrameControl extends Marshaler<AWBFrameControl> {
            protected MarshalerAWBFrameControl(TypeReference<AWBFrameControl> typeReference, int nativeType) {
                super(MarshalQueryableAWBFrameControl.this, typeReference, nativeType);
            }

            public void marshal(AWBFrameControl value, ByteBuffer buffer) {
                buffer.putFloat(value.mRGain);
                buffer.putFloat(value.mGGain);
                buffer.putFloat(value.mBGain);
                buffer.putInt(value.mColorTemperature);
            }

            public AWBFrameControl unmarshal(ByteBuffer buffer) {
                return new AWBFrameControl(buffer.getFloat(), buffer.getFloat(), buffer.getFloat(), buffer.getInt());
            }

            public int getNativeSize() {
                return 16;
            }
        }

        public Marshaler<AWBFrameControl> createMarshaler(TypeReference<AWBFrameControl> managedType, int nativeType) {
            return new MarshalerAWBFrameControl(managedType, nativeType);
        }

        public boolean isTypeMappingSupported(TypeReference<AWBFrameControl> managedType, int nativeType) {
            return nativeType == 0 ? AWBFrameControl.class.equals(managedType.getType()) : false;
        }
    }

    public AWBFrameControl(float rGain, float gGain, float bGain, int colorTemperature) {
        this.mRGain = rGain;
        this.mGGain = gGain;
        this.mBGain = bGain;
        this.mColorTemperature = colorTemperature;
    }

    public int getColorTemperature() {
        return this.mColorTemperature;
    }
}
