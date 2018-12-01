package com.android.camera.module.loader;

import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import io.reactivex.annotations.NonNull;

public class FunctionResumeModule extends Func1Base<BaseModule, BaseModule> {
    public FunctionResumeModule(int currentMode) {
        super(currentMode);
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> baseModuleNullHolder) throws Exception {
        if (!baseModuleNullHolder.isPresent()) {
            return baseModuleNullHolder;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataRepository.getInstance().backUp().revertRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getCurrentCameraId());
        BaseModule baseModule = (BaseModule) baseModuleNullHolder.get();
        baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
        baseModule.onCreate(this.mTargetMode, dataItemGlobal.getCurrentCameraId());
        baseModule.onResume();
        return baseModuleNullHolder;
    }
}
