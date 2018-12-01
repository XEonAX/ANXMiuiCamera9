package com.android.camera;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.android.camera.log.Log;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.WeakHashMap;

public class CameraIntentManager {
    private static final String TAG = CameraIntentManager.class.getSimpleName();
    private static WeakHashMap<Intent, CameraIntentManager> sMap = new WeakHashMap();
    private Intent mIntent;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraMode {
    }

    public static CameraIntentManager getInstance(Intent intent) {
        CameraIntentManager instance = (CameraIntentManager) sMap.get(intent);
        if (instance != null) {
            return instance;
        }
        instance = new CameraIntentManager(intent);
        sMap.put(intent, instance);
        return instance;
    }

    public static void removeInstance(Intent intent) {
        sMap.remove(intent);
    }

    public static void removeAllInstance() {
        sMap.clear();
    }

    public void destroy() {
        sMap.remove(this.mIntent);
    }

    private CameraIntentManager(Intent intent) {
        this.mIntent = intent;
    }

    public boolean isImageCaptureIntent() {
        return "android.media.action.IMAGE_CAPTURE".equals(this.mIntent.getAction());
    }

    public boolean isVideoCaptureIntent() {
        return "android.media.action.VIDEO_CAPTURE".equals(this.mIntent.getAction());
    }

    public boolean isScanQRCodeIntent() {
        String action = this.mIntent.getAction();
        if ("com.android.camera.action.QR_CODE_CAPTURE".equals(action)) {
            return true;
        }
        return "com.google.zxing.client.android.SCAN".equals(action);
    }

    public Uri getExtraSavedUri() {
        Bundle myExtras = this.mIntent.getExtras();
        if (myExtras != null) {
            return (Uri) myExtras.getParcelable("output");
        }
        return null;
    }

    public String getExtraCropValue() {
        Bundle myExtras = this.mIntent.getExtras();
        if (myExtras != null) {
            return myExtras.getString("crop");
        }
        return null;
    }

    public long getRequestSize() {
        Bundle myExtras = this.mIntent.getExtras();
        if (myExtras != null) {
            return myExtras.getLong("android.intent.extra.sizeLimit");
        }
        return 0;
    }

    public int getVideoQuality() {
        if (this.mIntent.hasExtra("android.intent.extra.videoQuality")) {
            return this.mIntent.getIntExtra("android.intent.extra.videoQuality", 0);
        }
        throw new RuntimeException("EXTRA_VIDEO_QUALITY has not been defined");
    }

    public int getVideoDurationTime() {
        if (this.mIntent.hasExtra("android.intent.extra.durationLimit")) {
            return this.mIntent.getIntExtra("android.intent.extra.durationLimit", 0);
        }
        throw new RuntimeException("EXTRA_DURATION_LIMIT has not been defined");
    }

    public Boolean getExtraShouldSaveCapture() {
        Bundle myExtras = this.mIntent.getExtras();
        if (myExtras != null) {
            return Boolean.valueOf(myExtras.getBoolean("save-image", false));
        }
        return Boolean.valueOf(false);
    }

    public Boolean isQuickCapture() {
        return Boolean.valueOf(this.mIntent.getBooleanExtra("android.intent.extra.quickCapture", false));
    }

    public Boolean isFromVolumeKey() {
        boolean z = false;
        if ((this.mIntent.getFlags() & 8388608) == 0) {
            z = true;
        }
        return Boolean.valueOf(z);
    }

    public int getTimerDurationSeconds() {
        return this.mIntent.getIntExtra("android.intent.extra.TIMER_DURATION_SECONDS", -1);
    }

    public boolean isUseFrontCamera() throws Exception {
        if (this.mIntent.hasExtra("android.intent.extra.USE_FRONT_CAMERA")) {
            return this.mIntent.getBooleanExtra("android.intent.extra.USE_FRONT_CAMERA", false);
        }
        throw new Exception("USE_FRONT_CAMERA extras has not been defined!");
    }

    public String getCameraMode() {
        if (this.mIntent.hasExtra("android.intent.extra.CAMERA_MODE")) {
            String useMode = this.mIntent.getStringExtra("android.intent.extra.CAMERA_MODE");
            if (useMode == null || useMode.isEmpty()) {
                return "UNSPECIFIED";
            }
            return useMode;
        } else if ("android.media.action.VIDEO_CAMERA".equals(this.mIntent.getAction())) {
            return "VIDEO";
        } else {
            if ("android.media.action.STILL_IMAGE_CAMERA".equals(this.mIntent.getAction())) {
                return "CAPTURE";
            }
            return "UNSPECIFIED";
        }
    }

    public int getCameraModeId() {
        String useMode = getCameraMode();
        if (useMode.equals("CAPTURE")) {
            return 163;
        }
        if (useMode.equals("MANUAL_MODE") || useMode.equals("MANUAL")) {
            return 167;
        }
        if (useMode.equals("PANORAMIC") || useMode.equals("PANORAMA")) {
            return 166;
        }
        if (useMode.equals("PORTRAIT")) {
            return 171;
        }
        if (useMode.equals("SQUARE")) {
            return 165;
        }
        if (useMode.equals("SHORT_VIDEO")) {
            return 161;
        }
        if (useMode.equals("VIDEO")) {
            return 162;
        }
        if (useMode.equals("FAST_MOTION")) {
            return 169;
        }
        if (useMode.equals("SLOW_MOTION")) {
            return 168;
        }
        return 160;
    }

    public boolean isOpenOnly() {
        boolean defaultValue = false;
        if ("android.media.action.VOICE_COMMAND".equals(this.mIntent.getAction()) || "android.intent.action.MAIN".equals(this.mIntent.getAction())) {
            defaultValue = true;
        }
        return this.mIntent.getBooleanExtra("android.intent.extra.CAMERA_OPEN_ONLY", defaultValue);
    }

    public static String getCaller(@Nullable Activity activity) {
        if (activity == null) {
            return null;
        }
        Uri referrer = activity.getReferrer();
        if (referrer == null) {
            return null;
        }
        return referrer.getHost();
    }

    public static boolean checkCallerLegality(@Nullable Activity activity) {
        String caller = getCaller(activity);
        if (caller == null) {
            return false;
        }
        if (caller.equals("com.google.android.googlequicksearchbox") || caller.equals("com.xiaomi.voiceassistant") || caller.equals("com.miui.voiceassist") || caller.equals("com.miui.home")) {
            return true;
        }
        Log.e(TAG, "checkCallerLegality: Unknown caller: " + caller);
        return false;
    }

    public String getVoiceControlAction() {
        if (!this.mIntent.hasExtra("android.intent.extras.VOICE_CONTROL_ACTION")) {
            return "NONE";
        }
        String action = this.mIntent.getStringExtra("android.intent.extras.VOICE_CONTROL_ACTION");
        if (action == null) {
            return "NONE";
        }
        return action;
    }

    public int getCameraFacing() {
        return this.mIntent.getIntExtra("android.intent.extras.CAMERA_FACING", -1);
    }
}
