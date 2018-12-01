package com.android.camera.permission;

import android.app.Activity;
import android.os.Build.VERSION;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import com.android.camera.CameraAppImpl;
import com.android.camera.Device;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import miui.os.Build;

public class PermissionManager {
    private static List<String> mLaunchPermissionList = new ArrayList();
    private static List<String> sLocationPermissionList = new ArrayList();
    private static List<String> sRuntimePermissions = new ArrayList();

    static {
        sLocationPermissionList.add("android.permission.ACCESS_FINE_LOCATION");
        sLocationPermissionList.add("android.permission.ACCESS_COARSE_LOCATION");
        mLaunchPermissionList.add("android.permission.CAMERA");
        mLaunchPermissionList.add("android.permission.RECORD_AUDIO");
        mLaunchPermissionList.add("android.permission.WRITE_EXTERNAL_STORAGE");
        sRuntimePermissions.addAll(mLaunchPermissionList);
        sRuntimePermissions.addAll(sLocationPermissionList);
        if (Device.isMTKPlatform()) {
            sRuntimePermissions.add("android.permission.READ_PHONE_STATE");
        }
    }

    private static List<String> getNeedCheckPermissionList(List<String> permissionList) {
        if (permissionList.size() <= 0) {
            return permissionList;
        }
        List<String> needCheckPermissionsList = new ArrayList();
        for (String permission : permissionList) {
            if (ContextCompat.checkSelfPermission(CameraAppImpl.getAndroidContext(), permission) != 0) {
                Log.i("PermissionManager", "getNeedCheckPermissionList() permission =" + permission);
                needCheckPermissionsList.add(permission);
            }
        }
        Log.i("PermissionManager", "getNeedCheckPermissionList() listSize =" + needCheckPermissionsList.size());
        return needCheckPermissionsList;
    }

    public static boolean checkCameraLaunchPermissions() {
        if (VERSION.SDK_INT < 23 || (Build.IS_INTERNATIONAL_BUILD ^ 1) != 0) {
            return true;
        }
        if (getNeedCheckPermissionList(mLaunchPermissionList).size() > 0) {
            return false;
        }
        Log.i("PermissionManager", "CheckCameraPermissions(), all on");
        return true;
    }

    public static boolean checkCameraLocationPermissions() {
        if (VERSION.SDK_INT < 23 || (Build.IS_INTERNATIONAL_BUILD ^ 1) != 0) {
            return true;
        }
        if (getNeedCheckPermissionList(sLocationPermissionList).size() > 0) {
            return false;
        }
        Log.i("PermissionManager", "checkCameraLocationPermissions(), all on");
        return true;
    }

    public static boolean requestCameraRuntimePermissions(Activity activity) {
        if (VERSION.SDK_INT < 23 || (Build.IS_INTERNATIONAL_BUILD ^ 1) != 0) {
            return true;
        }
        List<String> needCheckPermissionsList = getNeedCheckPermissionList(sRuntimePermissions);
        if (needCheckPermissionsList.size() > 0) {
            Log.i("PermissionManager", "requestCameraRuntimePermissions(), user check");
            ActivityCompat.requestPermissions(activity, (String[]) needCheckPermissionsList.toArray(new String[needCheckPermissionsList.size()]), 100);
            return false;
        }
        Log.i("PermissionManager", "requestCameraRuntimePermissions(), all on");
        return true;
    }

    /* JADX WARNING: Missing block: B:4:0x000e, code:
            return true;
     */
    public static boolean checkPhoneStatePermission(android.app.Activity r4) {
        /*
        r3 = 1;
        r2 = 0;
        r0 = android.os.Build.VERSION.SDK_INT;
        r1 = 23;
        if (r0 < r1) goto L_0x000e;
    L_0x0008:
        r0 = miui.os.Build.IS_INTERNATIONAL_BUILD;
        r0 = r0 ^ 1;
        if (r0 == 0) goto L_0x000f;
    L_0x000e:
        return r3;
    L_0x000f:
        r0 = "android.permission.READ_PHONE_STATE";
        r0 = android.support.v4.content.ContextCompat.checkSelfPermission(r4, r0);
        if (r0 == 0) goto L_0x0019;
    L_0x0018:
        return r2;
    L_0x0019:
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.permission.PermissionManager.checkPhoneStatePermission(android.app.Activity):boolean");
    }

    public static int getCameraRuntimePermissionRequestCode() {
        return 100;
    }

    public static boolean isCameraLocationPermissionsResultReady(String[] permissions, int[] grantResults) {
        Map<String, Integer> perms = new HashMap();
        perms.put("android.permission.ACCESS_COARSE_LOCATION", Integer.valueOf(0));
        perms.put("android.permission.ACCESS_FINE_LOCATION", Integer.valueOf(0));
        for (int i = 0; i < permissions.length; i++) {
            perms.put(permissions[i], Integer.valueOf(grantResults[i]));
        }
        if (((Integer) perms.get("android.permission.ACCESS_COARSE_LOCATION")).intValue() == 0 && ((Integer) perms.get("android.permission.ACCESS_FINE_LOCATION")).intValue() == 0) {
            return true;
        }
        return false;
    }

    public static boolean isCameraLaunchPermissionsResultReady(String[] permissions, int[] grantResults) {
        Map<String, Integer> perms = new HashMap();
        perms.put("android.permission.CAMERA", Integer.valueOf(0));
        perms.put("android.permission.RECORD_AUDIO", Integer.valueOf(0));
        perms.put("android.permission.WRITE_EXTERNAL_STORAGE", Integer.valueOf(0));
        for (int i = 0; i < permissions.length; i++) {
            perms.put(permissions[i], Integer.valueOf(grantResults[i]));
        }
        if (((Integer) perms.get("android.permission.CAMERA")).intValue() == 0 && ((Integer) perms.get("android.permission.RECORD_AUDIO")).intValue() == 0 && ((Integer) perms.get("android.permission.WRITE_EXTERNAL_STORAGE")).intValue() == 0) {
            return true;
        }
        return false;
    }
}
