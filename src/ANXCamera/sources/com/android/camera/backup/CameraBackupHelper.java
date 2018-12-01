package com.android.camera.backup;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.v7.recyclerview.R;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.KeyStringSettingItem;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry;
import java.util.List;

public class CameraBackupHelper {
    private static final String TAG = CameraBackupHelper.class.getSimpleName();

    public static void restoreSettings(SharedPreferences prefs, DataPackage dataPackage, PrefEntry[] entries, boolean isGlobal) {
        List<String> restoreSettings = getSettingsKeys();
        Editor editor = prefs.edit();
        for (PrefEntry entry : entries) {
            if (restoreSettings.contains(entry.getLocalKey()) && (!(isGlobal && CameraSettings.isCameraSpecific(entry.getLocalKey())) && (isGlobal || (CameraSettings.isCameraSpecific(entry.getLocalKey()) ^ 1) == 0))) {
                try {
                    KeyStringSettingItem item = (KeyStringSettingItem) dataPackage.get(entry.getCloudKey());
                    if (item != null) {
                        String value;
                        String localKey = entry.getLocalKey();
                        if (localKey.equals("pref_video_quality_key")) {
                            value = convertVideoQuality((String) item.getValue());
                        } else if (localKey.equals("pref_camera_antibanding_key")) {
                            value = convertAntiBandingMode((String) item.getValue());
                        } else if (localKey.equals("pref_camera_autoexposure_key")) {
                            value = convertExposureMode((String) item.getValue());
                        } else if (localKey.equals("pref_qc_camera_contrast_key")) {
                            value = convertContrast((String) item.getValue());
                        } else if (localKey.equals("pref_qc_camera_saturation_key")) {
                            value = convertSaturation((String) item.getValue());
                        } else if (localKey.equals("pref_qc_camera_sharpness_key")) {
                            value = convertSharpness((String) item.getValue());
                        } else if (localKey.equals("pref_front_mirror_key")) {
                            value = filterValue((String) item.getValue(), R.array.pref_front_mirror_entryvalues);
                        } else {
                            value = (String) item.getValue();
                        }
                        if (value != null) {
                            if (entry.getValueClass() == Integer.class) {
                                editor.putInt(entry.getLocalKey(), Integer.parseInt(value));
                            } else if (entry.getValueClass() == Long.class) {
                                editor.putLong(entry.getLocalKey(), Long.parseLong(value));
                            } else if (entry.getValueClass() == Boolean.class) {
                                editor.putBoolean(entry.getLocalKey(), Boolean.parseBoolean(value));
                            } else if (entry.getValueClass() == String.class) {
                                editor.putString(entry.getLocalKey(), value);
                            }
                        }
                    }
                } catch (ClassCastException e) {
                    Log.e(TAG, "entry " + entry.getCloudKey() + " is not KeyStringSettingItem");
                }
            }
        }
        editor.commit();
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x003a A:{Splitter: B:1:0x0014, ExcHandler: org.xmlpull.v1.XmlPullParserException (r0_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:15:0x003a, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x003b, code:
            com.android.camera.log.Log.e(TAG, r0.getMessage(), r0);
     */
    private static java.util.List<java.lang.String> getSettingsKeys() {
        /*
        r8 = 3;
        r3 = new java.util.ArrayList;
        r3.<init>();
        r6 = com.android.camera.CameraAppImpl.getAndroidContext();
        r5 = r6.getResources();
        r6 = 2131165184; // 0x7f070000 float:1.7944578E38 double:1.052935503E-314;
        r4 = r5.getXml(r6);
        r1 = r4.getEventType();	 Catch:{ XmlPullParserException -> 0x003a, XmlPullParserException -> 0x003a }
    L_0x0018:
        r6 = 1;
        if (r1 == r6) goto L_0x0044;
    L_0x001b:
        r6 = 2;
        if (r1 == r6) goto L_0x0020;
    L_0x001e:
        if (r1 != r8) goto L_0x0035;
    L_0x0020:
        r6 = r4.getDepth();	 Catch:{ XmlPullParserException -> 0x003a, XmlPullParserException -> 0x003a }
        if (r6 < r8) goto L_0x0035;
    L_0x0026:
        r6 = "http://schemas.android.com/apk/res/android";
        r7 = "key";
        r2 = r4.getAttributeValue(r6, r7);	 Catch:{ XmlPullParserException -> 0x003a, XmlPullParserException -> 0x003a }
        if (r2 == 0) goto L_0x0035;
    L_0x0032:
        r3.add(r2);	 Catch:{ XmlPullParserException -> 0x003a, XmlPullParserException -> 0x003a }
    L_0x0035:
        r1 = r4.next();	 Catch:{ XmlPullParserException -> 0x003a, XmlPullParserException -> 0x003a }
        goto L_0x0018;
    L_0x003a:
        r0 = move-exception;
        r6 = TAG;
        r7 = r0.getMessage();
        com.android.camera.log.Log.e(r6, r7, r0);
    L_0x0044:
        r4.close();
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.backup.CameraBackupHelper.getSettingsKeys():java.util.List<java.lang.String>");
    }

    private static String convertAntiBandingMode(String legacyValue) {
        if (legacyValue == null) {
            return null;
        }
        if (legacyValue.equals("off")) {
            return String.valueOf(0);
        }
        if (legacyValue.equals("50hz")) {
            return String.valueOf(1);
        }
        if (legacyValue.equals("60hz")) {
            return String.valueOf(2);
        }
        if (legacyValue.equals("auto")) {
            return String.valueOf(3);
        }
        Log.w(TAG, "unknown antibanding mode " + legacyValue);
        return null;
    }

    private static String convertVideoQuality(String legacyValue) {
        if (legacyValue == null) {
            return null;
        }
        if (legacyValue.equals("4") || legacyValue.equals("9")) {
            return "4";
        }
        if (legacyValue.equals("5") || legacyValue.equals("10")) {
            return "5";
        }
        if (legacyValue.equals("6") || legacyValue.equals("11")) {
            return "6";
        }
        if (legacyValue.equals("8") || legacyValue.equals("12")) {
            return "8";
        }
        Log.w(TAG, "unknown video quality " + legacyValue);
        return null;
    }

    private static String convertExposureMode(String legacyValue) {
        if (legacyValue == null) {
            return null;
        }
        if (legacyValue.equals("average") || legacyValue.equals("frame-average")) {
            return "0";
        }
        if (legacyValue.equals("center") || legacyValue.equals("center-weighted")) {
            return "1";
        }
        if (legacyValue.equals("spot") || legacyValue.equals("spot-metering")) {
            return "2";
        }
        Log.w(TAG, "unknown exposure mode " + legacyValue);
        return null;
    }

    private static String convertContrast(String legacyValue) {
        return null;
    }

    private static String convertSaturation(String legacyValue) {
        return null;
    }

    private static String convertSharpness(String legacyValue) {
        return null;
    }

    private static String filterValue(String currentValue, int supportedArray) {
        if (Util.isSupported((Object) currentValue, CameraAppImpl.getAndroidContext().getResources().getStringArray(supportedArray))) {
            return currentValue;
        }
        return null;
    }
}
