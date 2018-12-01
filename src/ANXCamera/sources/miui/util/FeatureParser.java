package miui.util;

import java.util.ArrayList;
import java.util.HashMap;

public class FeatureParser {
    private static final String ASSET_DIR = "device_features/";
    private static final String SYSTEM_DIR = "/sdcard/etc/device_features";
    private static final String TAG = "FeatureParser";
    private static final String TAG_BOOL = "bool";
    private static final String TAG_FLOAT = "float";
    private static final String TAG_INTEGER = "integer";
    private static final String TAG_INTEGER_ARRAY = "integer-array";
    private static final String TAG_ITEM = "item";
    private static final String TAG_STRING = "string";
    private static final String TAG_STRING_ARRAY = "string-array";
    public static final int TYPE_BOOL = 1;
    public static final int TYPE_FLOAT = 6;
    public static final int TYPE_INTEGER = 2;
    public static final int TYPE_INTEGER_ARRAY = 5;
    public static final int TYPE_STRING = 3;
    public static final int TYPE_STRING_ARRAY = 4;
    private static HashMap<String, Boolean> sBooleanMap = new HashMap();
    private static HashMap<String, Float> sFloatMap = new HashMap();
    private static HashMap<String, ArrayList<Integer>> sIntArrMap = new HashMap();
    private static HashMap<String, Integer> sIntMap = new HashMap();
    private static HashMap<String, ArrayList<String>> sStrArrMap = new HashMap();
    private static HashMap<String, String> sStrMap = new HashMap();

    static {
        read();
    }

    public static boolean getBoolean(String name, boolean defaultValue) {
        Boolean value = (Boolean) sBooleanMap.get(name);
        if (value != null) {
            return value.booleanValue();
        }
        return defaultValue;
    }

    public static String getString(String name) {
        return (String) sStrMap.get(name);
    }

    public static int getInteger(String name, int defaultValue) {
        Integer value = (Integer) sIntMap.get(name);
        if (value != null) {
            return value.intValue();
        }
        return defaultValue;
    }

    public static int[] getIntArray(String name) {
        ArrayList<Integer> intList = (ArrayList) sIntArrMap.get(name);
        if (intList == null) {
            return null;
        }
        int length = intList.size();
        int[] intArr = new int[length];
        for (int i = 0; i < length; i++) {
            intArr[i] = ((Integer) intList.get(i)).intValue();
        }
        return intArr;
    }

    public static String[] getStringArray(String name) {
        ArrayList<String> strList = (ArrayList) sStrArrMap.get(name);
        if (strList != null) {
            return (String[]) strList.toArray(new String[0]);
        }
        return null;
    }

    public static Float getFloat(String name, float defaultValue) {
        Float value = (Float) sFloatMap.get(name);
        if (value != null) {
            defaultValue = value.floatValue();
        }
        return Float.valueOf(defaultValue);
    }

    public static boolean hasFeature(String name, int type) {
        switch (type) {
            case 1:
                return sBooleanMap.containsKey(name);
            case 2:
                return sIntMap.containsKey(name);
            case 3:
                return sStrMap.containsKey(name);
            case 4:
                return sStrArrMap.containsKey(name);
            case 5:
                return sIntArrMap.containsKey(name);
            case 6:
                return sFloatMap.containsKey(name);
            default:
                return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:57:0x015a A:{PHI: r6 , ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), Splitter: B:1:0x0002} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0177 A:{PHI: r6 , ExcHandler: all (th java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x013e A:{SYNTHETIC, Splitter: B:50:0x013e} */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x015d A:{SYNTHETIC, Splitter: B:59:0x015d} */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x017a A:{SYNTHETIC, Splitter: B:68:0x017a} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:51:?, code:
            r6.close();
     */
    /* JADX WARNING: Missing block: B:60:?, code:
            r6.close();
     */
    /* JADX WARNING: Missing block: B:66:0x0177, code:
            r14 = th;
     */
    /* JADX WARNING: Missing block: B:69:?, code:
            r6.close();
     */
    private static void read() {
        /*
        r6 = 0;
        r5 = 0;
        r14 = "cancro";
        r15 = miui.os.Build.DEVICE;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = r14.equals(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0081;
    L_0x000d:
        r14 = miui.os.Build.MODEL;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = "MI 3";
        r14 = r14.startsWith(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0072;
    L_0x0018:
        r5 = "cancro_MI3.xml";
    L_0x001b:
        r14 = android.content.res.Resources.getSystem();	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = r14.getAssets();	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15.<init>();	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = "device_features/";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r15.append(r5);	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r15.toString();	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r6 = r14.open(r15);	 Catch:{ IOException -> 0x0098, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r7 = r6;
    L_0x003c:
        if (r7 != 0) goto L_0x01fd;
    L_0x003e:
        r4 = new java.io.File;	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r14 = "/sdcard/etc/device_features";
        r4.<init>(r14, r5);	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r14 = r4.exists();	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        if (r14 == 0) goto L_0x00d2;
    L_0x004c:
        r6 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r6.<init>(r4);	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
    L_0x0051:
        r3 = org.xmlpull.v1.XmlPullParserFactory.newInstance();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r10 = r3.newPullParser();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = "UTF-8";
        r10.setInput(r6, r14);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r13 = r10.getEventType();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r12 = 0;
        r9 = 0;
        r8 = 0;
        r11 = 0;
    L_0x0067:
        r14 = 1;
        if (r14 == r13) goto L_0x01e3;
    L_0x006a:
        switch(r13) {
            case 2: goto L_0x00f4;
            case 3: goto L_0x01bd;
            default: goto L_0x006d;
        };	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
    L_0x006d:
        r13 = r10.next();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x0067;
    L_0x0072:
        r14 = miui.os.Build.MODEL;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = "MI 4";
        r14 = r14.startsWith(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x001b;
    L_0x007d:
        r5 = "cancro_MI4.xml";
        goto L_0x001b;
    L_0x0081:
        r14 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.<init>();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = miui.os.Build.DEVICE;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = r14.append(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = ".xml";
        r14 = r14.append(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r5 = r14.toString();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x001b;
    L_0x0098:
        r0 = move-exception;
        r14 = "FeatureParser";
        r15 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15.<init>();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = "can't find ";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r15.append(r5);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = " in assets/";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = "device_features/";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = ",it may be in ";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r16 = "/sdcard/etc/device_features";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r15.toString();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        android.util.Log.i(r14, r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r7 = r6;
        goto L_0x003c;
    L_0x00d2:
        r14 = "FeatureParser";
        r15 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r15.<init>();	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r16 = "both assets/device_features/ and /sdcard/device_features don't exist ";
        r15 = r15.append(r16);	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r15 = r15.append(r5);	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        r15 = r15.toString();	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        android.util.Log.e(r14, r15);	 Catch:{ IOException -> 0x01f5, XmlPullParserException -> 0x01f9, all -> 0x01f2 }
        if (r7 == 0) goto L_0x00f1;
    L_0x00ee:
        r7.close();	 Catch:{ IOException -> 0x00f2 }
    L_0x00f1:
        return;
    L_0x00f2:
        r0 = move-exception;
        goto L_0x00f1;
    L_0x00f4:
        r12 = r10.getName();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = r10.getAttributeCount();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 <= 0) goto L_0x0103;
    L_0x00fe:
        r14 = 0;
        r9 = r10.getAttributeValue(r14);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
    L_0x0103:
        r14 = "integer-array";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0113;
    L_0x010c:
        r8 = new java.util.ArrayList;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r8.<init>();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x0113:
        r14 = "string-array";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0123;
    L_0x011c:
        r11 = new java.util.ArrayList;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r11.<init>();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x0123:
        r14 = "bool";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0142;
    L_0x012c:
        r14 = sBooleanMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = java.lang.Boolean.valueOf(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x013b:
        r0 = move-exception;
    L_0x013c:
        if (r6 == 0) goto L_0x0141;
    L_0x013e:
        r6.close();	 Catch:{ IOException -> 0x01ed }
    L_0x0141:
        return;
    L_0x0142:
        r14 = "integer";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x0163;
    L_0x014b:
        r14 = sIntMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = java.lang.Integer.valueOf(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x015a:
        r1 = move-exception;
    L_0x015b:
        if (r6 == 0) goto L_0x0141;
    L_0x015d:
        r6.close();	 Catch:{ IOException -> 0x0161 }
        goto L_0x0141;
    L_0x0161:
        r0 = move-exception;
        goto L_0x0141;
    L_0x0163:
        r14 = "string";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x017e;
    L_0x016c:
        r14 = sStrMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x0177:
        r14 = move-exception;
    L_0x0178:
        if (r6 == 0) goto L_0x017d;
    L_0x017a:
        r6.close();	 Catch:{ IOException -> 0x01f0 }
    L_0x017d:
        throw r14;
    L_0x017e:
        r14 = "float";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x019a;
    L_0x0187:
        r14 = sFloatMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = java.lang.Float.parseFloat(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r15 = java.lang.Float.valueOf(r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r15);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x019a:
        r14 = "item";
        r14 = r14.equals(r12);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x006d;
    L_0x01a3:
        if (r8 == 0) goto L_0x01b2;
    L_0x01a5:
        r14 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = java.lang.Integer.valueOf(r14);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r8.add(r14);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x01b2:
        if (r11 == 0) goto L_0x006d;
    L_0x01b4:
        r14 = r10.nextText();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r11.add(r14);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        goto L_0x006d;
    L_0x01bd:
        r2 = r10.getName();	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14 = "integer-array";
        r14 = r14.equals(r2);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x01d2;
    L_0x01ca:
        r14 = sIntArrMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r8);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r8 = 0;
        goto L_0x006d;
    L_0x01d2:
        r14 = "string-array";
        r14 = r14.equals(r2);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        if (r14 == 0) goto L_0x006d;
    L_0x01db:
        r14 = sStrArrMap;	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r14.put(r9, r11);	 Catch:{ IOException -> 0x013b, XmlPullParserException -> 0x015a, all -> 0x0177 }
        r11 = 0;
        goto L_0x006d;
    L_0x01e3:
        if (r6 == 0) goto L_0x0141;
    L_0x01e5:
        r6.close();	 Catch:{ IOException -> 0x01ea }
        goto L_0x0141;
    L_0x01ea:
        r0 = move-exception;
        goto L_0x0141;
    L_0x01ed:
        r0 = move-exception;
        goto L_0x0141;
    L_0x01f0:
        r0 = move-exception;
        goto L_0x017d;
    L_0x01f2:
        r14 = move-exception;
        r6 = r7;
        goto L_0x0178;
    L_0x01f5:
        r0 = move-exception;
        r6 = r7;
        goto L_0x013c;
    L_0x01f9:
        r1 = move-exception;
        r6 = r7;
        goto L_0x015b;
    L_0x01fd:
        r6 = r7;
        goto L_0x0051;
        */
        throw new UnsupportedOperationException("Method not decompiled: miui.util.FeatureParser.read():void");
    }
}
