package com.android.camera.module.loader.camera2;

import android.content.Intent;
import android.support.v4.util.Pair;
import com.android.camera.CameraScreenNail;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.Module;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

public class CompletablePreFixCamera2Setup implements CompletableOnSubscribe, Observer<Camera2Result> {
    private boolean isFromVoiceControl;
    private CameraScreenNail mCameraScreenNail;
    private CompletableEmitter mEmitter;
    private Intent mIntent;
    private Module mLastMode;
    private boolean mNeedBlur;
    private boolean mStartFromKeyguard;

    public CompletablePreFixCamera2Setup(Module lastMode, boolean needBlur, CameraScreenNail cameraScreenNail, Intent intent, boolean isFromVoiceControl, boolean startFromKeyguard) {
        this.mLastMode = lastMode;
        this.mNeedBlur = needBlur;
        this.mCameraScreenNail = cameraScreenNail;
        this.mIntent = intent;
        this.isFromVoiceControl = isFromVoiceControl;
        this.mStartFromKeyguard = startFromKeyguard;
    }

    public void subscribe(CompletableEmitter emitter) throws Exception {
        int pendingOpenId;
        int pendingOpenModule;
        this.mEmitter = emitter;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        if (isLastModuleAlive()) {
            DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mLastMode.getModuleIndex()), dataItemGlobal.getLastCameraId(), true);
            closeLastModule();
        }
        if (this.mNeedBlur) {
            this.mCameraScreenNail.animateModuleCopyTexture();
        }
        if (this.mIntent != null) {
            Pair<Integer, Integer> pending = dataItemGlobal.parseIntent(this.mIntent, Boolean.valueOf(this.isFromVoiceControl), this.mStartFromKeyguard, true);
            pendingOpenId = ((Integer) pending.first).intValue();
            pendingOpenModule = ((Integer) pending.second).intValue();
        } else {
            pendingOpenId = dataItemGlobal.getCurrentCameraId();
            pendingOpenModule = dataItemGlobal.getCurrentMode();
        }
        Camera2OpenManager.getInstance().openCamera(pendingOpenId, pendingOpenModule, this, true);
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void onNext(Camera2Result camera2Result) {
        this.mEmitter.onComplete();
    }

    public void onError(Throwable throwable) {
    }

    public void onComplete() {
    }

    private boolean isLastModuleAlive() {
        return this.mLastMode != null ? this.mLastMode.isCreated() : false;
    }

    private void closeLastModule() {
        this.mLastMode.unRegisterProtocol();
        this.mLastMode.onPause();
        this.mLastMode.onStop();
        this.mLastMode.onDestroy();
    }
}
