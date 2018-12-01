package com.google.android.apps.gsa.publicsearch;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.aidl.BaseProxy;
import com.google.android.aidl.BaseStub;
import com.google.android.aidl.Codecs;

public interface IPublicSearchServiceSessionCallback extends IInterface {

    public static abstract class Stub extends BaseStub implements IPublicSearchServiceSessionCallback {

        public static class Proxy extends BaseProxy implements IPublicSearchServiceSessionCallback {
            Proxy(IBinder remote) {
                super(remote, "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback");
            }

            public void onServiceEvent(byte[] serializedServiceEvent, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException {
                Parcel data = obtainAndWriteInterfaceToken();
                data.writeByteArray(serializedServiceEvent);
                Codecs.writeParcelable(data, systemParcelableWrapper);
                transactOneway(1, data);
            }
        }

        public Stub() {
            super("com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback");
        }

        public static IPublicSearchServiceSessionCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface("com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback");
            if (iin instanceof IPublicSearchServiceSessionCallback) {
                return (IPublicSearchServiceSessionCallback) iin;
            }
            return new Proxy(obj);
        }

        protected boolean dispatchTransaction(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code != 1) {
                return false;
            }
            onServiceEvent(data.createByteArray(), (SystemParcelableWrapper) Codecs.createParcelable(data, SystemParcelableWrapper.CREATOR));
            return true;
        }
    }

    void onServiceEvent(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) throws RemoteException;
}
