package com.android.camera.effect;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v7.recyclerview.R;
import com.android.camera.Device;
import com.android.camera.effect.BeautyParameters.Type;
import java.util.Locale;

public class BeautyValues implements Parcelable {
    /* renamed from: -com-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static final /* synthetic */ int[] f3-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = null;
    public static final Creator<BeautyValues> CREATOR = new Creator<BeautyValues>() {
        public BeautyValues createFromParcel(Parcel source) {
            return new BeautyValues(source);
        }

        public BeautyValues[] newArray(int size) {
            return new BeautyValues[size];
        }
    };
    public int mBeautyChin;
    public int mBeautyEnlargeEye;
    public String mBeautyLevel;
    public int mBeautyLips;
    public int mBeautyNeck;
    public int mBeautyNose;
    public int mBeautyRisorius;
    public int mBeautySkinColor;
    public int mBeautySkinSmooth;
    public int mBeautySlimFace;
    public int mBeautySlimNose;
    public int mBeautySmile;

    /* renamed from: -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static /* synthetic */ int[] m2xed999735() {
        if (f3-com-android-camera-effect-BeautyParameters$TypeSwitchesValues != null) {
            return f3-com-android-camera-effect-BeautyParameters$TypeSwitchesValues;
        }
        int[] iArr = new int[Type.values().length];
        try {
            iArr[Type.CHIN_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Type.ENLARGE_EYE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Type.LIPS_RATIO.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Type.NECK_RATIO.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Type.NOSE_RATIO.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Type.RISORIUS_RATIO.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Type.SHRINK_FACE_RATIO.ordinal()] = 7;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[Type.SLIM_NOSE_RATIO.ordinal()] = 8;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[Type.SMILE_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[Type.SMOOTH_STRENGTH.ordinal()] = 10;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[Type.WHITEN_STRENGTH.ordinal()] = 11;
        } catch (NoSuchFieldError e11) {
        }
        f3-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = iArr;
        return iArr;
    }

    public String toString() {
        if (Device.isSupportNewFaceBeauty()) {
            return String.format(Locale.ENGLISH, "3d beauty level: %s | sf: %d | ee: %d | ns: %d | rs: %d | lp: %d | cn: %d | nk: %d | se: %d | sn: %d", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautyEnlargeEye), Integer.valueOf(this.mBeautyNose), Integer.valueOf(this.mBeautyRisorius), Integer.valueOf(this.mBeautyLips), Integer.valueOf(this.mBeautyChin), Integer.valueOf(this.mBeautyNeck), Integer.valueOf(this.mBeautySmile), Integer.valueOf(this.mBeautySlimNose)});
        }
        return String.format(Locale.ENGLISH, "beauty level: %s | sc: %d | sf: %d | ss: %d | ee: %d ", new Object[]{this.mBeautyLevel, Integer.valueOf(this.mBeautySkinColor), Integer.valueOf(this.mBeautySlimFace), Integer.valueOf(this.mBeautySkinSmooth), Integer.valueOf(this.mBeautyEnlargeEye)});
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mBeautyLevel);
        if (Device.isSupportNewFaceBeauty()) {
            dest.writeInt(this.mBeautySlimFace);
            dest.writeInt(this.mBeautyEnlargeEye);
            dest.writeInt(this.mBeautyNose);
            dest.writeInt(this.mBeautyRisorius);
            dest.writeInt(this.mBeautyLips);
            dest.writeInt(this.mBeautyChin);
            dest.writeInt(this.mBeautyNeck);
            dest.writeInt(this.mBeautySmile);
            dest.writeInt(this.mBeautySlimNose);
            return;
        }
        dest.writeInt(this.mBeautySkinColor);
        dest.writeInt(this.mBeautySlimFace);
        dest.writeInt(this.mBeautySkinSmooth);
        dest.writeInt(this.mBeautyEnlargeEye);
    }

    public BeautyValues(BeautyValues other) {
        if (other != null) {
            this.mBeautyLevel = other.mBeautyLevel;
            this.mBeautySkinColor = other.mBeautySkinColor;
            this.mBeautySlimFace = other.mBeautySlimFace;
            this.mBeautySkinSmooth = other.mBeautySkinSmooth;
            this.mBeautyEnlargeEye = other.mBeautyEnlargeEye;
            this.mBeautyNose = other.mBeautyNose;
            this.mBeautyRisorius = other.mBeautyRisorius;
            this.mBeautyLips = other.mBeautyLips;
            this.mBeautyChin = other.mBeautyChin;
            this.mBeautyNeck = other.mBeautyNeck;
            this.mBeautySmile = other.mBeautySmile;
            this.mBeautySlimNose = other.mBeautySlimNose;
        }
    }

    protected BeautyValues(Parcel in) {
        this.mBeautyLevel = in.readString();
        if (Device.isSupportNewFaceBeauty()) {
            this.mBeautySlimFace = in.readInt();
            this.mBeautyEnlargeEye = in.readInt();
            this.mBeautyNose = in.readInt();
            this.mBeautyRisorius = in.readInt();
            this.mBeautyLips = in.readInt();
            this.mBeautyChin = in.readInt();
            this.mBeautyNeck = in.readInt();
            this.mBeautySmile = in.readInt();
            this.mBeautySlimNose = in.readInt();
            return;
        }
        this.mBeautySkinColor = in.readInt();
        this.mBeautySlimFace = in.readInt();
        this.mBeautySkinSmooth = in.readInt();
        this.mBeautyEnlargeEye = in.readInt();
    }

    public int get(Type type) {
        switch (m2xed999735()[type.ordinal()]) {
            case 1:
                return this.mBeautyChin;
            case 2:
                return this.mBeautyEnlargeEye;
            case 3:
                return this.mBeautyLips;
            case 4:
                return this.mBeautyNeck;
            case 5:
                return this.mBeautyNose;
            case 6:
                return this.mBeautyRisorius;
            case 7:
                return this.mBeautySlimFace;
            case 8:
                return this.mBeautySlimNose;
            case R.styleable.ToggleSwitch_textOff /*9*/:
                return this.mBeautySmile;
            case R.styleable.ToggleSwitch_textOffColor /*10*/:
                return this.mBeautySkinSmooth;
            case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                return this.mBeautySkinColor;
            default:
                return 0;
        }
    }
}
