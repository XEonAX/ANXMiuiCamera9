package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.camera.log.Log;
import com.android.camera.permission.PermissionManager;

public class CameraButtonIntentReceiver extends BroadcastReceiver {
    private static final String TAG = CameraButtonIntentReceiver.class.getSimpleName();

    public void onReceive(Context context, Intent intent) {
        if (PermissionManager.checkCameraLaunchPermissions()) {
            Intent i = new Intent("android.intent.action.MAIN");
            i.setClass(context, Camera.class);
            i.addCategory("android.intent.category.LAUNCHER");
            i.setFlags(268435456);
            context.startActivity(i);
            return;
        }
        Log.e(TAG, "no camera permission");
    }
}
