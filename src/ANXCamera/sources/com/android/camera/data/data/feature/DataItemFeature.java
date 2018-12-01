package com.android.camera.data.data.feature;

import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.data.data.DataItemBase;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class DataItemFeature extends DataItemBase {
    private String mHwc;

    public DataItemFeature() {
        parseJsonString();
    }

    public String provideKey() {
        return null;
    }

    public boolean isTransient() {
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x005d A:{SYNTHETIC, Splitter: B:17:0x005d} */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x007a A:{SYNTHETIC, Splitter: B:32:0x007a} */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x008b A:{SYNTHETIC, Splitter: B:40:0x008b} */
    public void parseJsonString() {
        /*
        r12 = this;
        r2 = com.android.camera.CameraAppImpl.getAndroidContext();
        r8 = r2.getResources();
        r9 = new java.lang.StringBuilder;
        r9.<init>();
        r10 = "feature_";
        r9 = r9.append(r10);
        r10 = com.android.camera.Device.BUILD_DEVICE;
        r9 = r9.append(r10);
        r9 = r9.toString();
        r10 = "raw";
        r11 = "com.android.camera";
        r5 = r8.getIdentifier(r9, r10, r11);
        if (r5 > 0) goto L_0x0034;
    L_0x002a:
        r8 = "DataFeature";
        r9 = "feature list default";
        com.android.camera.log.Log.e(r8, r9);
        return;
    L_0x0034:
        r0 = 0;
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r1 = new java.io.BufferedReader;	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
        r8 = new java.io.InputStreamReader;	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
        r9 = r2.getResources();	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
        r9 = r9.openRawResource(r5);	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
        r8.<init>(r9);	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
        r1.<init>(r8);	 Catch:{ IOException -> 0x0097, JSONException -> 0x0074 }
    L_0x004c:
        r7 = r1.readLine();	 Catch:{ IOException -> 0x0056, JSONException -> 0x0099, all -> 0x0094 }
        if (r7 == 0) goto L_0x0061;
    L_0x0052:
        r6.append(r7);	 Catch:{ IOException -> 0x0056, JSONException -> 0x0099, all -> 0x0094 }
        goto L_0x004c;
    L_0x0056:
        r3 = move-exception;
        r0 = r1;
    L_0x0058:
        r3.printStackTrace();	 Catch:{ all -> 0x0088 }
        if (r0 == 0) goto L_0x0060;
    L_0x005d:
        r0.close();	 Catch:{ IOException -> 0x0083 }
    L_0x0060:
        return;
    L_0x0061:
        r8 = r6.toString();	 Catch:{ IOException -> 0x0056, JSONException -> 0x0099, all -> 0x0094 }
        r12.parseJson(r8);	 Catch:{ IOException -> 0x0056, JSONException -> 0x0099, all -> 0x0094 }
        if (r1 == 0) goto L_0x006d;
    L_0x006a:
        r1.close();	 Catch:{ IOException -> 0x006f }
    L_0x006d:
        r0 = r1;
        goto L_0x0060;
    L_0x006f:
        r3 = move-exception;
        r3.printStackTrace();
        goto L_0x006d;
    L_0x0074:
        r4 = move-exception;
    L_0x0075:
        r4.printStackTrace();	 Catch:{ all -> 0x0088 }
        if (r0 == 0) goto L_0x0060;
    L_0x007a:
        r0.close();	 Catch:{ IOException -> 0x007e }
        goto L_0x0060;
    L_0x007e:
        r3 = move-exception;
        r3.printStackTrace();
        goto L_0x0060;
    L_0x0083:
        r3 = move-exception;
        r3.printStackTrace();
        goto L_0x0060;
    L_0x0088:
        r8 = move-exception;
    L_0x0089:
        if (r0 == 0) goto L_0x008e;
    L_0x008b:
        r0.close();	 Catch:{ IOException -> 0x008f }
    L_0x008e:
        throw r8;
    L_0x008f:
        r3 = move-exception;
        r3.printStackTrace();
        goto L_0x008e;
    L_0x0094:
        r8 = move-exception;
        r0 = r1;
        goto L_0x0089;
    L_0x0097:
        r3 = move-exception;
        goto L_0x0058;
    L_0x0099:
        r4 = move-exception;
        r0 = r1;
        goto L_0x0075;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.data.data.feature.DataItemFeature.parseJsonString():void");
    }

    private void parseJson(String jsonString) throws JSONException {
        JSONObject jsonObject = new JSONObject(jsonString);
        Iterator<String> iterator = jsonObject.keys();
        SimpleArrayMap<String, Object> values = getValues();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            values.put(key, jsonObject.opt(key));
        }
    }

    public boolean isIndiaDevice() {
        if (this.mHwc == null) {
            this.mHwc = SystemProperties.get("ro.boot.hwc");
        }
        return !"india".equalsIgnoreCase(this.mHwc) ? "global".equalsIgnoreCase(this.mHwc) : true;
    }

    public boolean supportIndiaAi() {
        return getBoolean("s_i_a", false) ? isIndiaDevice() : false;
    }

    public boolean supportZoomMfnr() {
        return getBoolean("s_z_m", false);
    }

    protected boolean isMutable() {
        return false;
    }
}
