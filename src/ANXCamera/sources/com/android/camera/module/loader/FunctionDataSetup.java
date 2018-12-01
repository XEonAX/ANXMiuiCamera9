package com.android.camera.module.loader;

import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.BaseModule;
import io.reactivex.annotations.NonNull;

public class FunctionDataSetup extends Func1Base<BaseModule, BaseModule> {
    public FunctionDataSetup(int currentMode) {
        super(currentMode);
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
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataRepository.dataItemConfig().reInitComponent(this.mTargetMode, baseModule.getCameraCapabilities());
        dataItemGlobal.reInit();
        CameraSize pictureSize = baseModule.getPreviewSize();
        DataRepository.dataItemRunning().setUiStyle(CameraSettings.getUIStyleByPreview(pictureSize.width, pictureSize.height));
        return baseModuleNullHolder;
    }
}
