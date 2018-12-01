package com.android.camera.module.loader;

import com.android.camera.module.BaseModule;
import io.reactivex.annotations.NonNull;

public class FunctionCameraLegacySetup extends Func1Base<BaseModule, BaseModule> {
    public FunctionCameraLegacySetup(int currentMode) {
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
        return baseModuleNullHolder;
    }
}
