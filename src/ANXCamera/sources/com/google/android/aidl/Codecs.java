package com.google.android.aidl;

import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class Codecs {
    private static final ClassLoader CLASS_LOADER = Codecs.class.getClassLoader();

    private Codecs() {
    }

    public static <T extends Parcelable> T createParcelable(Parcel parcel, Creator<T> creator) {
        if (parcel.readInt() != 0) {
            return (Parcelable) creator.createFromParcel(parcel);
        }
        return null;
    }

    public static void writeParcelable(Parcel parcel, Parcelable parcelable) {
        if (parcelable != null) {
            parcel.writeInt(1);
            parcelable.writeToParcel(parcel, 0);
            return;
        }
        parcel.writeInt(0);
    }

    public static void writeStrongBinder(Parcel parcel, IInterface iinterface) {
        if (iinterface != null) {
            parcel.writeStrongBinder(iinterface.asBinder());
        } else {
            parcel.writeStrongBinder(null);
        }
    }
}
