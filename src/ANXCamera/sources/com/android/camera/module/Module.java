package com.android.camera.module;

import android.content.Context;
import android.content.Intent;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.KeyEvent;
import com.android.camera.Camera;
import com.android.camera.protocol.ModeProtocol$BaseProtocol;

public interface Module extends ModeProtocol$BaseProtocol {
    void checkActivityOrientation();

    void enableCameraControls(boolean z);

    int getModuleIndex();

    boolean isCreated();

    boolean isDeparted();

    boolean isDoingAction();

    boolean isIgnoreTouchEvent();

    boolean isKeptBitmapTexture();

    boolean isVideoRecording();

    void notifyError();

    void onActivityResult(int i, int i2, Intent intent);

    boolean onBackPressed();

    void onBroadcastReceived(Context context, Intent intent);

    void onDestroy();

    boolean onGestureTrack(RectF rectF, boolean z);

    boolean onKeyDown(int i, KeyEvent keyEvent);

    boolean onKeyUp(int i, KeyEvent keyEvent);

    void onLongPress(int i, int i2);

    void onOrientationChanged(int i, int i2);

    void onPause();

    void onPreviewPixelsRead(byte[] bArr, int i, int i2);

    void onSaveInstanceState(Bundle bundle);

    boolean onScale(float f, float f2, float f3);

    boolean onScaleBegin(float f, float f2);

    void onScaleEnd();

    void onSingleTapUp(int i, int i2);

    void onStop();

    void onWindowFocusChanged(boolean z);

    void pausePreview();

    void preTransferOrientation(int i, int i2);

    void requestRender();

    void resumePreview();

    void setActivity(Camera camera);

    void setDeparted();

    void setFrameAvailable(boolean z);

    boolean shouldReleaseLater();

    void startPreview();

    void unRegisterProtocol();
}
