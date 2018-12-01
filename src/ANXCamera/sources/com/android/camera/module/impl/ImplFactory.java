package com.android.camera.module.impl;

import com.android.camera.ActivityBase;
import com.android.camera.module.impl.component.BackStackImpl;
import com.android.camera.module.impl.component.BeautyRecordingImpl;
import com.android.camera.module.impl.component.ConfigChangeImpl;
import com.android.camera.module.impl.component.ManuallyValueChangeImpl;
import com.android.camera.protocol.ModeProtocol$BaseProtocol;
import java.util.ArrayList;
import java.util.List;

public class ImplFactory {
    private List<ModeProtocol$BaseProtocol> mAdditionalProtocolList;
    private List<ModeProtocol$BaseProtocol> mBaseProtocolList;
    private boolean mReleased;

    public void initBase(ActivityBase activityBase, int... types) {
        initTypes(activityBase, true, types);
    }

    public void initAdditional(ActivityBase activityBase, int... types) {
        initTypes(activityBase, false, types);
    }

    private void initTypes(ActivityBase activityBase, boolean isBase, int... types) {
        if (!this.mReleased) {
            for (int type : types) {
                ModeProtocol$BaseProtocol baseProtocol = null;
                switch (type) {
                    case 164:
                        baseProtocol = ConfigChangeImpl.create(activityBase);
                        break;
                    case 171:
                        baseProtocol = BackStackImpl.create(activityBase);
                        break;
                    case 173:
                        baseProtocol = BeautyRecordingImpl.create();
                        break;
                    case 174:
                        baseProtocol = ManuallyValueChangeImpl.create(activityBase);
                        break;
                }
                if (baseProtocol != null) {
                    baseProtocol.registerProtocol();
                    if (isBase) {
                        if (this.mBaseProtocolList == null) {
                            this.mBaseProtocolList = new ArrayList();
                        }
                        this.mBaseProtocolList.add(baseProtocol);
                    } else {
                        if (this.mAdditionalProtocolList == null) {
                            this.mAdditionalProtocolList = new ArrayList();
                        }
                        this.mAdditionalProtocolList.add(baseProtocol);
                    }
                }
            }
        }
    }

    public void detachAdditional() {
        if (!this.mReleased && this.mAdditionalProtocolList != null) {
            for (ModeProtocol$BaseProtocol additionalProtocol : this.mAdditionalProtocolList) {
                additionalProtocol.unRegisterProtocol();
            }
        }
    }

    public void release() {
        if (!this.mReleased) {
            detachAdditional();
            if (this.mBaseProtocolList == null) {
                this.mReleased = true;
                return;
            }
            for (ModeProtocol$BaseProtocol baseProtocol : this.mBaseProtocolList) {
                baseProtocol.unRegisterProtocol();
            }
            this.mReleased = true;
        }
    }
}
