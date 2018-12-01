package com.android.camera.effect;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.Locale;

public class FaceAnalyzeInfo implements Parcelable {
    public static final Creator<FaceAnalyzeInfo> CREATOR = new Creator<FaceAnalyzeInfo>() {
        public FaceAnalyzeInfo createFromParcel(Parcel source) {
            return new FaceAnalyzeInfo(source);
        }

        public FaceAnalyzeInfo[] newArray(int size) {
            return new FaceAnalyzeInfo[size];
        }
    };
    public float[] mAge;
    public int mFaceNum;
    public float[] mFaceScore;
    public float[] mGender;
    public float[] mProp;

    public String toString() {
        return String.format(Locale.ENGLISH, "face num: %d | gender: %d | age: %d | facescore: %d", new Object[]{Integer.valueOf(this.mFaceNum), Float.valueOf(this.mGender[0]), Float.valueOf(this.mAge[0]), Float.valueOf(this.mFaceScore[0])});
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.mFaceNum);
        dest.writeFloatArray(this.mGender);
        dest.writeFloatArray(this.mAge);
        dest.writeFloatArray(this.mFaceScore);
        dest.writeFloatArray(this.mProp);
    }

    protected FaceAnalyzeInfo(Parcel in) {
        this.mFaceNum = in.readInt();
        in.readFloatArray(this.mGender);
        in.readFloatArray(this.mAge);
        in.readFloatArray(this.mFaceScore);
        in.readFloatArray(this.mProp);
    }
}
