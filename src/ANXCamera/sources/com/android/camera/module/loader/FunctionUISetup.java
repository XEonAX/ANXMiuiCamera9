package com.android.camera.module.loader;

import android.graphics.Rect;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.LocationManager;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.module.BaseModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;

public class FunctionUISetup extends Func1Base<BaseModule, BaseModule> {
    private boolean mNeedNotifyUI;

    public FunctionUISetup(int currentMode, boolean needNotifyUI) {
        super(currentMode);
        this.mNeedNotifyUI = needNotifyUI;
    }

    public Scheduler getWorkThread() {
        return AndroidSchedulers.mainThread();
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> baseModuleNullHolder) throws Exception {
        if (!baseModuleNullHolder.isPresent()) {
            return baseModuleNullHolder;
        }
        BaseModule baseModule = (BaseModule) baseModuleNullHolder.get();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        if (!baseModule.isCreated()) {
            return baseModuleNullHolder;
        }
        Rect displayRect = Util.getDisplayRect(CameraAppImpl.getAndroidContext());
        baseModule.onPreviewLayoutChanged(displayRect);
        baseModule.onPreviewSizeChanged(displayRect.width(), displayRect.height());
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        int lastCameraId = DataRepository.dataItemGlobal().getLastCameraId();
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        int currentUiStyle = DataRepository.dataItemRunning().getUiStyle();
        int dataChangeType = 1;
        if (lastCameraId != currentCameraId) {
            dataChangeType = 2;
        } else if (DataRepository.dataItemRunning().getLastUiStyle() != currentUiStyle) {
            dataChangeType = 3;
        }
        baseModule.setDisplayRectAndUIStyle(displayRect, currentUiStyle);
        if (this.mNeedNotifyUI) {
            baseDelegate.getAnimationComposite().notifyDataChanged(dataChangeType, this.mTargetMode);
        }
        LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
        return baseModuleNullHolder;
    }
}
