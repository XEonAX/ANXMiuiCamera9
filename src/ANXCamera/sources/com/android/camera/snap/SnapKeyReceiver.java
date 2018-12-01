package com.android.camera.snap;

import android.content.BroadcastReceiver;

public class SnapKeyReceiver extends BroadcastReceiver {
    private static final String TAG = SnapKeyReceiver.class.getSimpleName();

    /* JADX WARNING: Missing block: B:4:0x0011, code:
            return;
     */
    public void onReceive(android.content.Context r11, android.content.Intent r12) {
        /*
        r10 = this;
        r8 = 0;
        r6 = 0;
        r2 = android.os.Build.VERSION.SDK_INT;
        r3 = 21;
        if (r2 < r3) goto L_0x0011;
    L_0x0009:
        r2 = com.android.camera.Device.isSupportedQuickSnap();
        r2 = r2 ^ 1;
        if (r2 == 0) goto L_0x0012;
    L_0x0011:
        return;
    L_0x0012:
        r2 = "miui.intent.action.CAMERA_KEY_BUTTON";
        r3 = r12.getAction();
        r2 = r2.equals(r3);
        if (r2 != 0) goto L_0x0020;
    L_0x001f:
        return;
    L_0x0020:
        r2 = com.android.camera.snap.SnapCamera.isSnapEnabled(r11);
        if (r2 != 0) goto L_0x0027;
    L_0x0026:
        return;
    L_0x0027:
        r2 = com.android.camera.permission.PermissionManager.checkCameraLaunchPermissions();
        if (r2 != 0) goto L_0x002e;
    L_0x002d:
        return;
    L_0x002e:
        r2 = "power";
        r0 = r11.getSystemService(r2);
        r0 = (android.os.PowerManager) r0;
        r2 = r0.isScreenOn();
        if (r2 != 0) goto L_0x0048;
    L_0x003d:
        r2 = "key_code";
        r2 = r12.getIntExtra(r2, r6);
        r3 = 26;
        if (r3 != r2) goto L_0x0055;
    L_0x0048:
        r2 = com.android.camera.snap.SnapTrigger.getInstance();
        r2 = r2.isRunning();
        r2 = r2 ^ 1;
        if (r2 == 0) goto L_0x0055;
    L_0x0054:
        return;
    L_0x0055:
        r2 = TAG;
        r3 = 1;
        r2 = r0.newWakeLock(r3, r2);
        r4 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r2.acquire(r4);
        r2 = com.android.camera.snap.SnapTrigger.getInstance();
        r2 = r2.isRunning();
        if (r2 == 0) goto L_0x0088;
    L_0x006b:
        r2 = com.android.camera.snap.SnapTrigger.getInstance();
        r3 = "key_code";
        r3 = r12.getIntExtra(r3, r6);
        r4 = "key_action";
        r4 = r12.getIntExtra(r4, r6);
        r5 = "key_event_time";
        r6 = r12.getLongExtra(r5, r8);
        r2.handleKeyEvent(r3, r4, r6);
    L_0x0087:
        return;
    L_0x0088:
        r1 = new android.content.Intent;
        r2 = com.android.camera.snap.SnapService.class;
        r1.<init>(r11, r2);
        r2 = "key_code";
        r3 = "key_code";
        r3 = r12.getIntExtra(r3, r6);
        r1.putExtra(r2, r3);
        r2 = "key_action";
        r3 = "key_action";
        r3 = r12.getIntExtra(r3, r6);
        r1.putExtra(r2, r3);
        r2 = "key_event_time";
        r3 = "key_event_time";
        r4 = r12.getLongExtra(r3, r8);
        r1.putExtra(r2, r4);
        r11.startService(r1);
        goto L_0x0087;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.snap.SnapKeyReceiver.onReceive(android.content.Context, android.content.Intent):void");
    }
}
