package com.android.camera.sticker;

public class FileUtils {
    /* JADX WARNING: Removed duplicated region for block: B:36:0x005c A:{SYNTHETIC, Splitter: B:36:0x005c} */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0061 A:{SYNTHETIC, Splitter: B:39:0x0061} */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x008e A:{SYNTHETIC, Splitter: B:62:0x008e} */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0093 A:{SYNTHETIC, Splitter: B:65:0x0093} */
    public static boolean copyFileIfNeed(android.content.Context r9, java.io.File r10, java.lang.String r11) {
        /*
        r8 = 0;
        if (r10 == 0) goto L_0x0075;
    L_0x0003:
        r7 = android.text.TextUtils.isEmpty(r11);
        r7 = r7 ^ 1;
        if (r7 == 0) goto L_0x0075;
    L_0x000b:
        r1 = r10.getParentFile();
        r7 = r1.exists();
        if (r7 != 0) goto L_0x0018;
    L_0x0015:
        r1.mkdirs();
    L_0x0018:
        r7 = r10.exists();
        if (r7 != 0) goto L_0x0075;
    L_0x001e:
        r3 = 0;
        r5 = 0;
        r7 = r10.exists();	 Catch:{ IOException -> 0x00a4 }
        if (r7 == 0) goto L_0x0029;
    L_0x0026:
        r10.delete();	 Catch:{ IOException -> 0x00a4 }
    L_0x0029:
        r10.createNewFile();	 Catch:{ IOException -> 0x00a4 }
        r7 = r9.getAssets();	 Catch:{ IOException -> 0x00a4 }
        r3 = r7.open(r11);	 Catch:{ IOException -> 0x00a4 }
        if (r3 != 0) goto L_0x0041;
    L_0x0036:
        if (r3 == 0) goto L_0x003b;
    L_0x0038:
        r3.close();	 Catch:{ IOException -> 0x003c }
    L_0x003b:
        return r8;
    L_0x003c:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x003b;
    L_0x0041:
        r6 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x00a4 }
        r6.<init>(r10);	 Catch:{ IOException -> 0x00a4 }
        r7 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0 = new byte[r7];	 Catch:{ IOException -> 0x0055, all -> 0x00a1 }
    L_0x004a:
        r4 = r3.read(r0);	 Catch:{ IOException -> 0x0055, all -> 0x00a1 }
        if (r4 <= 0) goto L_0x0065;
    L_0x0050:
        r7 = 0;
        r6.write(r0, r7, r4);	 Catch:{ IOException -> 0x0055, all -> 0x00a1 }
        goto L_0x004a;
    L_0x0055:
        r2 = move-exception;
        r5 = r6;
    L_0x0057:
        r10.delete();	 Catch:{ all -> 0x008b }
        if (r3 == 0) goto L_0x005f;
    L_0x005c:
        r3.close();	 Catch:{ IOException -> 0x0081 }
    L_0x005f:
        if (r5 == 0) goto L_0x0064;
    L_0x0061:
        r5.close();	 Catch:{ IOException -> 0x0086 }
    L_0x0064:
        return r8;
    L_0x0065:
        r3.close();	 Catch:{ IOException -> 0x0055, all -> 0x00a1 }
        r6.close();	 Catch:{ IOException -> 0x0055, all -> 0x00a1 }
        if (r3 == 0) goto L_0x0070;
    L_0x006d:
        r3.close();	 Catch:{ IOException -> 0x0077 }
    L_0x0070:
        if (r6 == 0) goto L_0x0075;
    L_0x0072:
        r6.close();	 Catch:{ IOException -> 0x007c }
    L_0x0075:
        r7 = 1;
        return r7;
    L_0x0077:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0070;
    L_0x007c:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0075;
    L_0x0081:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x005f;
    L_0x0086:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0064;
    L_0x008b:
        r7 = move-exception;
    L_0x008c:
        if (r3 == 0) goto L_0x0091;
    L_0x008e:
        r3.close();	 Catch:{ IOException -> 0x0097 }
    L_0x0091:
        if (r5 == 0) goto L_0x0096;
    L_0x0093:
        r5.close();	 Catch:{ IOException -> 0x009c }
    L_0x0096:
        throw r7;
    L_0x0097:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0091;
    L_0x009c:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0096;
    L_0x00a1:
        r7 = move-exception;
        r5 = r6;
        goto L_0x008c;
    L_0x00a4:
        r2 = move-exception;
        goto L_0x0057;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.sticker.FileUtils.copyFileIfNeed(android.content.Context, java.io.File, java.lang.String):boolean");
    }
}
