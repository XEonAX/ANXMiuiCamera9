package com.android.camera.module.loader.camera2;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class FocusTask implements Parcelable {
    public static final Creator<FocusTask> CREATOR = new Creator<FocusTask>() {
        public FocusTask createFromParcel(Parcel source) {
            return new FocusTask(source);
        }

        public FocusTask[] newArray(int size) {
            return new FocusTask[size];
        }
    };
    private long mElapsedTime;
    private int mFocusBy;
    private long mFocusStartTime;
    private boolean mSuccess;

    @Retention(RetentionPolicy.SOURCE)
    public @interface FocusTriggerBy {
    }

    public static final FocusTask create(int focusBy) {
        return new FocusTask(focusBy);
    }

    private FocusTask(int focusBy) {
        this.mFocusBy = focusBy;
        this.mFocusStartTime = System.currentTimeMillis();
    }

    public int getFocusTrigger() {
        return this.mFocusBy;
    }

    public void setResult(boolean result) {
        this.mSuccess = result;
        this.mElapsedTime = System.currentTimeMillis() - this.mFocusStartTime;
    }

    public boolean isSuccess() {
        return this.mSuccess;
    }

    public boolean isFocusing() {
        return this.mElapsedTime == 0;
    }

    public long getElapsedTime() {
        if (this.mFocusStartTime != 0) {
            return this.mElapsedTime;
        }
        throw new RuntimeException("unknown focus time");
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.mFocusBy);
        dest.writeLong(this.mFocusStartTime);
        dest.writeLong(this.mElapsedTime);
        dest.writeByte(this.mSuccess ? (byte) 1 : (byte) 0);
    }

    protected FocusTask(Parcel in) {
        boolean z = false;
        this.mFocusBy = in.readInt();
        this.mFocusStartTime = in.readLong();
        this.mElapsedTime = in.readLong();
        if (in.readByte() != (byte) 0) {
            z = true;
        }
        this.mSuccess = z;
    }
}
