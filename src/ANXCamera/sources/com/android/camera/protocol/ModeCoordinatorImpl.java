package com.android.camera.protocol;

import android.support.annotation.Nullable;
import android.util.SparseArray;

public class ModeCoordinatorImpl implements ModeProtocol$ModeCoordinator {
    private static ModeCoordinatorImpl sInstance;
    private int mHolderKey;
    private SparseArray<ModeProtocol$BaseProtocol> protocolSparseArray = new SparseArray();

    public static void create(int holderKey) {
        getInstance();
        sInstance.mHolderKey = holderKey;
    }

    public static ModeCoordinatorImpl getInstance() {
        if (sInstance == null) {
            synchronized (ModeCoordinatorImpl.class) {
                if (sInstance == null) {
                    sInstance = new ModeCoordinatorImpl();
                }
            }
        }
        return sInstance;
    }

    public <P extends ModeProtocol$BaseProtocol> void attachProtocol(int type, @Nullable P newProtocol) {
        this.protocolSparseArray.put(type, newProtocol);
    }

    public <P extends ModeProtocol$BaseProtocol> P getAttachProtocol(int type) {
        return (ModeProtocol$BaseProtocol) this.protocolSparseArray.get(type);
    }

    public <P extends ModeProtocol$BaseProtocol> void detachProtocol(int type, P baseProtocol) {
        if (getAttachProtocol(type) == baseProtocol) {
            attachProtocol(type, null);
        }
    }

    private void destroyWorkspace() {
        this.protocolSparseArray.clear();
    }

    public static void forceDestroy() {
        if (sInstance != null) {
            sInstance.destroyWorkspace();
            sInstance = null;
        }
    }

    public static void destroyAll(int holderKey) {
        if (sInstance != null && sInstance.mHolderKey == holderKey) {
            sInstance.destroyWorkspace();
            sInstance = null;
        }
    }

    public static boolean isAlive(int holderKey) {
        return sInstance != null && sInstance.mHolderKey == holderKey;
    }
}
