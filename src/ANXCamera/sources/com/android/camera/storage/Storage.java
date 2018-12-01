package com.android.camera.storage;

import android.app.Activity;
import android.app.usage.StorageStatsManager;
import android.content.ComponentName;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.location.Location;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.StatFs;
import android.os.UserHandle;
import android.os.storage.StorageManager;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.text.TextUtils;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import miui.reflect.Method;

public class Storage {
    public static int BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    public static String DIRECTORY = (FIRST_CONSIDER_STORAGE_PATH + "/DCIM/Camera");
    public static String FIRST_CONSIDER_STORAGE_PATH = (Device.IS_HM ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH);
    public static String HIDEDIRECTORY = (FIRST_CONSIDER_STORAGE_PATH + "/DCIM/Camera/.ubifocus");
    private static final AtomicLong LEFT_SPACE = new AtomicLong(0);
    public static int PRIMARY_BUCKET_ID = (PRIMARY_STORAGE_PATH + "/DCIM/Camera").toLowerCase(Locale.ENGLISH).hashCode();
    private static final String PRIMARY_STORAGE_PATH = Environment.getExternalStorageDirectory().toString();
    public static int SECONDARY_BUCKET_ID = (SECONDARY_STORAGE_PATH + "/DCIM/Camera").toLowerCase(Locale.ENGLISH).hashCode();
    private static String SECONDARY_STORAGE_PATH = System.getenv("SECONDARY_STORAGE");
    private static String sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
    private static long sQuotaBytes;
    private static boolean sQuotaSupported;
    private static long sReserveBytes;
    private static WeakReference<StorageListener> sStorageListener;

    public interface StorageListener {
        void onStoragePathChanged();
    }

    static {
        File unUsedFile = new File(DIRECTORY + File.separator + ".nomedia");
        if (unUsedFile.exists()) {
            unUsedFile.delete();
        }
    }

    public static void initStorage(Context context) {
        initQuota(context);
        if (Device.isSupportedSecondaryStorage()) {
            String sdcardPath = CompatibilityUtils.getSdcardPath(context);
            if (sdcardPath != null) {
                Log.v("CameraStorage", "initStorage sd=" + sdcardPath);
                SECONDARY_STORAGE_PATH = sdcardPath;
                SECONDARY_BUCKET_ID = (SECONDARY_STORAGE_PATH + "/DCIM/Camera").toLowerCase(Locale.ENGLISH).hashCode();
            }
            readSystemPriorityStorage();
        }
    }

    private static void initQuota(Context context) {
        if (VERSION.SDK_INT >= 26) {
            StorageStatsManager statsManager = (StorageStatsManager) context.getSystemService(StorageStatsManager.class);
            Class<?>[] ownerClazz = new Class[]{StorageStatsManager.class};
            Method method = Util.getMethod(ownerClazz, "isQuotaSupported", "(Ljava/util/UUID;)Z");
            if (method != null) {
                sQuotaSupported = method.invokeBoolean(ownerClazz[0], statsManager, StorageManager.UUID_DEFAULT);
                if (sQuotaSupported) {
                    long totalBytes = new StatFs(PRIMARY_STORAGE_PATH).getTotalBytes();
                    sQuotaBytes = (long) (((float) totalBytes) * 0.9f);
                    sReserveBytes = totalBytes - sQuotaBytes;
                    Log.d("CameraStorage", "quota: " + sQuotaBytes + "|" + sReserveBytes);
                }
            }
        }
    }

    public static boolean isQuotaSupported() {
        return sQuotaSupported && sQuotaBytes > 0;
    }

    public static Uri addImage(Activity activity, String title, long date, Location location, int orientation, byte[] jpeg, int width, int height, boolean mirror, String usedAlgorithm) {
        return addImage(activity, title, date, location, orientation, jpeg, width, height, mirror, false, false, false, false, usedAlgorithm);
    }

    public static Uri addImage(Context context, String title, long date, Location location, int orientation, byte[] jpeg, int width, int height, boolean mirror, boolean isHide, boolean isMap, String usedAlgorithm) {
        return addImage(context, title, date, location, orientation, jpeg, width, height, mirror, isHide, isMap, false, false, usedAlgorithm);
    }

    /* JADX WARNING: Removed duplicated region for block: B:74:0x0163  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x009b  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00f8 A:{SYNTHETIC, Splitter: B:49:0x00f8} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00fd A:{Catch:{ Exception -> 0x0104 }} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x009b  */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x0163  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0138 A:{SYNTHETIC, Splitter: B:65:0x0138} */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x013d A:{Catch:{ Exception -> 0x0154 }} */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00f8 A:{SYNTHETIC, Splitter: B:49:0x00f8} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00fd A:{Catch:{ Exception -> 0x0104 }} */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x0163  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x009b  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0138 A:{SYNTHETIC, Splitter: B:65:0x0138} */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x013d A:{Catch:{ Exception -> 0x0154 }} */
    public static android.net.Uri addImage(android.content.Context r36, java.lang.String r37, long r38, android.location.Location r40, int r41, byte[] r42, int r43, int r44, boolean r45, boolean r46, boolean r47, boolean r48, boolean r49, java.lang.String r50) {
        /*
        r0 = r42;
        r1 = r49;
        r2 = r50;
        r42 = updateExif(r0, r1, r2);
        r0 = r37;
        r1 = r46;
        r2 = r47;
        r11 = generateFilepath(r0, r1, r2);
        r25 = 0;
        r30 = 0;
        r27 = 0;
        r26 = new java.io.BufferedInputStream;	 Catch:{ Exception -> 0x0280 }
        r4 = new java.io.ByteArrayInputStream;	 Catch:{ Exception -> 0x0280 }
        r0 = r42;
        r4.<init>(r0);	 Catch:{ Exception -> 0x0280 }
        r0 = r26;
        r0.<init>(r4);	 Catch:{ Exception -> 0x0280 }
        r31 = new java.io.BufferedOutputStream;	 Catch:{ Exception -> 0x0283, all -> 0x027b }
        r4 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0283, all -> 0x027b }
        r4.<init>(r11);	 Catch:{ Exception -> 0x0283, all -> 0x027b }
        r0 = r31;
        r0.<init>(r4);	 Catch:{ Exception -> 0x0283, all -> 0x027b }
        if (r45 == 0) goto L_0x0113;
    L_0x0036:
        r0 = r41;
        r4 = r0 % 180;
        if (r4 != 0) goto L_0x009d;
    L_0x003c:
        r23 = 1;
    L_0x003e:
        r4 = r23 ^ 1;
        r0 = r42;
        r1 = r23;
        r18 = flipJpeg(r0, r1, r4);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        if (r18 == 0) goto L_0x00a0;
    L_0x004a:
        r22 = com.android.camera.Util.getExif(r42);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r33 = r22.getThumbnailBytes();	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        if (r33 == 0) goto L_0x006c;
    L_0x0054:
        r4 = r23 ^ 1;
        r0 = r33;
        r1 = r23;
        r32 = flipJpeg(r0, r1, r4);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        if (r32 == 0) goto L_0x006a;
    L_0x0060:
        r0 = r22;
        r1 = r32;
        r0.setCompressedThumbnail(r1);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r32.recycle();	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
    L_0x006a:
        r48 = 0;
    L_0x006c:
        r0 = r22;
        r1 = r18;
        r2 = r31;
        r0.writeExif(r1, r2);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r18.recycle();	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
    L_0x0078:
        if (r48 == 0) goto L_0x0088;
    L_0x007a:
        r31.flush();	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r4 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r0 = r41;
        r1 = r40;
        com.android.camera.ExifHelper.writeExif(r11, r0, r1, r4);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
    L_0x0088:
        if (r26 == 0) goto L_0x008d;
    L_0x008a:
        r26.close();	 Catch:{ Exception -> 0x0144 }
    L_0x008d:
        if (r31 == 0) goto L_0x0095;
    L_0x008f:
        r31.flush();	 Catch:{ Exception -> 0x0144 }
        r31.close();	 Catch:{ Exception -> 0x0144 }
    L_0x0095:
        r30 = r31;
        r25 = r26;
    L_0x0099:
        if (r27 == 0) goto L_0x0163;
    L_0x009b:
        r4 = 0;
        return r4;
    L_0x009d:
        r23 = 0;
        goto L_0x003e;
    L_0x00a0:
        r4 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0 = new byte[r4];	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r19 = r0;
    L_0x00a6:
        r0 = r26;
        r1 = r19;
        r28 = r0.read(r1);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r4 = -1;
        r0 = r28;
        if (r0 == r4) goto L_0x0078;
    L_0x00b3:
        r4 = 0;
        r0 = r31;
        r1 = r19;
        r2 = r28;
        r0.write(r1, r4, r2);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        goto L_0x00a6;
    L_0x00be:
        r21 = move-exception;
        r30 = r31;
        r25 = r26;
    L_0x00c3:
        r4 = "CameraStorage";
        r5 = "Failed to write image";
        r0 = r21;
        com.android.camera.log.Log.e(r4, r5, r0);	 Catch:{ all -> 0x0278 }
        r27 = 1;
        r4 = com.android.camera.Util.isQuotaExceeded(r21);	 Catch:{ all -> 0x0278 }
        if (r4 == 0) goto L_0x00f6;
    L_0x00d6:
        r0 = r36;
        r4 = r0 instanceof com.android.camera.ActivityBase;	 Catch:{ all -> 0x0278 }
        if (r4 == 0) goto L_0x00f6;
    L_0x00dc:
        r0 = r36;
        r0 = (com.android.camera.ActivityBase) r0;	 Catch:{ all -> 0x0278 }
        r4 = r0;
        r4 = r4.isActivityPaused();	 Catch:{ all -> 0x0278 }
        if (r4 != 0) goto L_0x00f6;
    L_0x00e7:
        r0 = r36;
        r0 = (com.android.camera.ActivityBase) r0;	 Catch:{ all -> 0x0278 }
        r4 = r0;
        r5 = new com.android.camera.storage.Storage$1;	 Catch:{ all -> 0x0278 }
        r0 = r36;
        r5.<init>(r0);	 Catch:{ all -> 0x0278 }
        r4.runOnUiThread(r5);	 Catch:{ all -> 0x0278 }
    L_0x00f6:
        if (r25 == 0) goto L_0x00fb;
    L_0x00f8:
        r25.close();	 Catch:{ Exception -> 0x0104 }
    L_0x00fb:
        if (r30 == 0) goto L_0x0099;
    L_0x00fd:
        r30.flush();	 Catch:{ Exception -> 0x0104 }
        r30.close();	 Catch:{ Exception -> 0x0104 }
        goto L_0x0099;
    L_0x0104:
        r21 = move-exception;
        r4 = "CameraStorage";
        r5 = "Failed to flush/close stream";
        r0 = r21;
        com.android.camera.log.Log.e(r4, r5, r0);
        r27 = 1;
        goto L_0x0099;
    L_0x0113:
        r4 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0 = new byte[r4];	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r19 = r0;
    L_0x0119:
        r0 = r26;
        r1 = r19;
        r28 = r0.read(r1);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        r4 = -1;
        r0 = r28;
        if (r0 == r4) goto L_0x0078;
    L_0x0126:
        r4 = 0;
        r0 = r31;
        r1 = r19;
        r2 = r28;
        r0.write(r1, r4, r2);	 Catch:{ Exception -> 0x00be, all -> 0x0131 }
        goto L_0x0119;
    L_0x0131:
        r4 = move-exception;
        r30 = r31;
        r25 = r26;
    L_0x0136:
        if (r25 == 0) goto L_0x013b;
    L_0x0138:
        r25.close();	 Catch:{ Exception -> 0x0154 }
    L_0x013b:
        if (r30 == 0) goto L_0x0143;
    L_0x013d:
        r30.flush();	 Catch:{ Exception -> 0x0154 }
        r30.close();	 Catch:{ Exception -> 0x0154 }
    L_0x0143:
        throw r4;
    L_0x0144:
        r21 = move-exception;
        r4 = "CameraStorage";
        r5 = "Failed to flush/close stream";
        r0 = r21;
        com.android.camera.log.Log.e(r4, r5, r0);
        r27 = 1;
        goto L_0x0095;
    L_0x0154:
        r21 = move-exception;
        r5 = "CameraStorage";
        r6 = "Failed to flush/close stream";
        r0 = r21;
        com.android.camera.log.Log.e(r5, r6, r0);
        r27 = 1;
        goto L_0x0143;
    L_0x0163:
        if (r47 == 0) goto L_0x01c4;
    L_0x0165:
        r24 = com.android.camera.Util.isProduceFocusInfoSuccess(r42);
        r20 = com.android.camera.Util.getCenterFocusDepthIndex(r42, r43, r44);
        if (r24 == 0) goto L_0x01cc;
    L_0x016f:
        r4 = "_";
        r0 = r37;
        r4 = r0.lastIndexOf(r4);
    L_0x0178:
        r5 = 0;
        r0 = r37;
        r37 = r0.substring(r5, r4);
        r4 = 0;
        r5 = 0;
        r0 = r37;
        r11 = generateFilepath(r0, r4, r5);
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r0 = r37;
        r5 = r4.append(r0);
        if (r24 == 0) goto L_0x01d6;
    L_0x0194:
        r4 = "_";
    L_0x0197:
        r4 = r5.append(r4);
        r0 = r20;
        r4 = r4.append(r0);
        r4 = r4.toString();
        r5 = 0;
        r0 = r46;
        r29 = generateFilepath(r4, r0, r5);
        if (r11 == 0) goto L_0x01da;
    L_0x01ae:
        if (r29 == 0) goto L_0x01da;
    L_0x01b0:
        r4 = new java.io.File;
        r0 = r29;
        r4.<init>(r0);
        r5 = new java.io.File;
        r5.<init>(r11);
        r4.renameTo(r5);
    L_0x01bf:
        if (r24 != 0) goto L_0x01c4;
    L_0x01c1:
        deleteImage(r37);
    L_0x01c4:
        if (r46 == 0) goto L_0x020e;
    L_0x01c6:
        r4 = r47 ^ 1;
        if (r4 == 0) goto L_0x020e;
    L_0x01ca:
        r4 = 0;
        return r4;
    L_0x01cc:
        r4 = "_UBIFOCUS_";
        r0 = r37;
        r4 = r0.lastIndexOf(r4);
        goto L_0x0178;
    L_0x01d6:
        r4 = "_UBIFOCUS_";
        goto L_0x0197;
    L_0x01da:
        r5 = "CameraStorage";
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r6 = "oldPath: ";
        r4 = r4.append(r6);
        if (r29 != 0) goto L_0x01ee;
    L_0x01eb:
        r29 = "null";
    L_0x01ee:
        r0 = r29;
        r4 = r4.append(r0);
        r6 = " newPath: ";
        r6 = r4.append(r6);
        if (r11 != 0) goto L_0x020c;
    L_0x01fd:
        r4 = "null";
    L_0x0200:
        r4 = r6.append(r4);
        r4 = r4.toString();
        com.android.camera.log.Log.e(r5, r4);
        goto L_0x01bf;
    L_0x020c:
        r4 = r11;
        goto L_0x0200;
    L_0x020e:
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r0 = r37;
        r4 = r4.append(r0);
        r5 = ".jpg";
        r4 = r4.append(r5);
        r6 = r4.toString();
        r9 = "image/jpeg";
        r4 = new java.io.File;
        r4.<init>(r11);
        r12 = r4.length();
        r4 = r36;
        r5 = r37;
        r7 = r38;
        r10 = r41;
        r14 = r43;
        r15 = r44;
        r16 = r40;
        r17 = r49;
        r34 = insertToMediaStore(r4, r5, r6, r7, r9, r10, r11, r12, r14, r15, r16, r17);
        if (r34 != 0) goto L_0x0262;
    L_0x0246:
        r4 = "CameraStorage";
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r6 = "failed to insert to DB: ";
        r5 = r5.append(r6);
        r5 = r5.append(r11);
        r5 = r5.toString();
        com.android.camera.log.Log.e(r4, r5);
        r4 = 0;
        return r4;
    L_0x0262:
        r4 = com.android.camera.effect.EffectController.getInstance();
        r4 = r4.hasEffect();
        if (r4 != 0) goto L_0x0277;
    L_0x026c:
        r4 = android.content.ContentUris.parseId(r34);
        r0 = r36;
        r1 = r49;
        saveToCloudAlbum(r0, r11, r1, r4);
    L_0x0277:
        return r34;
    L_0x0278:
        r4 = move-exception;
        goto L_0x0136;
    L_0x027b:
        r4 = move-exception;
        r25 = r26;
        goto L_0x0136;
    L_0x0280:
        r21 = move-exception;
        goto L_0x00c3;
    L_0x0283:
        r21 = move-exception;
        r25 = r26;
        goto L_0x00c3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.storage.Storage.addImage(android.content.Context, java.lang.String, long, android.location.Location, int, byte[], int, int, boolean, boolean, boolean, boolean, boolean, java.lang.String):android.net.Uri");
    }

    private static byte[] updateExif(byte[] jpeg, boolean isParallelProcess, String usedAlgorithm) {
        if (!isParallelProcess && (TextUtils.isEmpty(usedAlgorithm) ^ 1) == 0) {
            return jpeg;
        }
        byte[] outJpeg;
        long time = System.currentTimeMillis();
        OutputStream s = new ByteArrayOutputStream();
        try {
            ExifInterface exif = new ExifInterface();
            exif.readExif(jpeg);
            if (isParallelProcess) {
                exif.addParallelProcessComment("processing");
            }
            if (!TextUtils.isEmpty(usedAlgorithm)) {
                Log.d("CameraStorage", "save algorithm: " + usedAlgorithm);
                exif.addAlgorithmComment(usedAlgorithm);
            }
            exif.writeExif(jpeg, s);
            outJpeg = s.toByteArray();
            s.close();
        } catch (IOException e) {
            android.util.Log.e(ExifInterface.class.getName(), e.getMessage(), e);
            outJpeg = jpeg;
        }
        android.util.Log.v("CameraStorage", "update exif cost=" + (System.currentTimeMillis() - time));
        return outJpeg;
    }

    public static Uri addImage(Context context, String filePath, int rotation, long date, Location location, int width, int height) {
        if (context == null || filePath == null) {
            return null;
        }
        File file = null;
        try {
            file = new File(filePath);
        } catch (Throwable e) {
            Log.e("CameraStorage", "Failed to open panorama file: " + e.getMessage(), e);
        }
        if (file == null || (file.exists() ^ 1) != 0) {
            return null;
        }
        String fileName = file.getName();
        Uri uri = insertToMediaStore(context, fileName, fileName, date, "image/jpeg", rotation, filePath, file.length(), width, height, location, false);
        saveToCloudAlbum(context, filePath);
        return uri;
    }

    private static Uri insertToMediaStore(Context context, String title, String displayName, long date, String mime, int rotation, String filePath, long size, int width, int height, Location location, boolean isParallelProcess) {
        ContentValues contentValues = new ContentValues(11);
        contentValues.put("title", title);
        contentValues.put("_display_name", displayName);
        contentValues.put("datetaken", Long.valueOf(date));
        contentValues.put("mime_type", mime);
        contentValues.put("orientation", Integer.valueOf(rotation));
        contentValues.put("_data", filePath);
        contentValues.put("_size", Long.valueOf(size));
        contentValues.put("width", Integer.valueOf(width));
        contentValues.put("height", Integer.valueOf(height));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        if (isParallelProcess) {
            Uri uri = context.getContentResolver().insert(Files.getContentUri("external"), contentValues);
            Util.insertImageToParallelService(context, ContentUris.parseId(uri), filePath);
            return uri;
        }
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        } catch (Exception th) {
            Log.e("CameraStorage", "Failed to write MediaStore:" + th.getMessage(), th);
            return null;
        }
    }

    public static void deleteImage(String title) {
        File hideFolder = new File(HIDEDIRECTORY);
        if (hideFolder.exists() && hideFolder.isDirectory()) {
            for (File file : hideFolder.listFiles()) {
                if (file.getName().indexOf(title) != -1) {
                    file.delete();
                }
            }
        }
    }

    public static Uri newImage(Context context, String title, long date, int orientation, int width, int height) {
        String path = generateFilepath(title);
        ContentValues values = new ContentValues(6);
        values.put("datetaken", Long.valueOf(date));
        values.put("orientation", Integer.valueOf(orientation));
        values.put("_data", path);
        values.put("width", Integer.valueOf(width));
        values.put("height", Integer.valueOf(height));
        values.put("mime_type", "image/jpeg");
        Uri uri = null;
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, values);
        } catch (Exception th) {
            Log.e("CameraStorage", "Failed to new image" + th);
            return uri;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:61:0x01a0 A:{SYNTHETIC, Splitter: B:61:0x01a0} */
    public static boolean updateImage(android.content.Context r17, byte[] r18, com.android.gallery3d.exif.ExifInterface r19, android.net.Uri r20, java.lang.String r21, android.location.Location r22, int r23, int r24, int r25, java.lang.String r26) {
        /*
        r8 = generateFilepath(r21);
        r14 = new java.lang.StringBuilder;
        r14.<init>();
        if (r26 == 0) goto L_0x00ef;
    L_0x000b:
        r13 = generateFilepath(r26);
    L_0x000f:
        r13 = r14.append(r13);
        r14 = ".tmp";
        r13 = r13.append(r14);
        r11 = r13.toString();
        r6 = 0;
        r4 = 0;
        if (r18 == 0) goto L_0x010c;
    L_0x0023:
        r7 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x013f }
        r7.<init>(r11);	 Catch:{ Exception -> 0x013f }
        if (r19 == 0) goto L_0x0104;
    L_0x002a:
        r0 = r19;
        r1 = r18;
        r0.writeExif(r1, r7);	 Catch:{ IOException -> 0x00f2 }
        r6 = r7;
    L_0x0032:
        if (r6 == 0) goto L_0x003a;
    L_0x0034:
        r6.flush();	 Catch:{ Exception -> 0x0114 }
        r6.close();	 Catch:{ Exception -> 0x0114 }
    L_0x003a:
        r10 = new java.io.File;
        r10.<init>(r11);
        r4 = r10.length();
        r13 = new java.io.File;
        r13.<init>(r8);
        r10.renameTo(r13);
        if (r19 == 0) goto L_0x005b;
    L_0x004d:
        if (r26 == 0) goto L_0x005b;
    L_0x004f:
        r13 = new java.io.File;	 Catch:{ Exception -> 0x0120 }
        r14 = generateFilepath(r26);	 Catch:{ Exception -> 0x0120 }
        r13.<init>(r14);	 Catch:{ Exception -> 0x0120 }
        r13.delete();	 Catch:{ Exception -> 0x0120 }
    L_0x005b:
        r12 = new android.content.ContentValues;
        r13 = 9;
        r12.<init>(r13);
        r13 = "title";
        r0 = r21;
        r12.put(r13, r0);
        r13 = "_display_name";
        r14 = new java.lang.StringBuilder;
        r14.<init>();
        r0 = r21;
        r14 = r14.append(r0);
        r15 = ".jpg";
        r14 = r14.append(r15);
        r14 = r14.toString();
        r12.put(r13, r14);
        if (r18 == 0) goto L_0x01f1;
    L_0x0088:
        r13 = "mime_type";
        r14 = "image/jpeg";
        r12.put(r13, r14);
        r13 = "orientation";
        r14 = java.lang.Integer.valueOf(r23);
        r12.put(r13, r14);
        r13 = "_size";
        r14 = java.lang.Long.valueOf(r4);
        r12.put(r13, r14);
        r13 = "width";
        r14 = java.lang.Integer.valueOf(r24);
        r12.put(r13, r14);
        r13 = "height";
        r14 = java.lang.Integer.valueOf(r25);
        r12.put(r13, r14);
        if (r22 == 0) goto L_0x00d7;
    L_0x00bb:
        r13 = "latitude";
        r14 = r22.getLatitude();
        r14 = java.lang.Double.valueOf(r14);
        r12.put(r13, r14);
        r13 = "longitude";
        r14 = r22.getLongitude();
        r14 = java.lang.Double.valueOf(r14);
        r12.put(r13, r14);
    L_0x00d7:
        r13 = "_data";
        r12.put(r13, r8);
    L_0x00dd:
        r13 = r17.getContentResolver();	 Catch:{ Exception -> 0x01fb }
        r14 = 0;
        r15 = 0;
        r0 = r20;
        r13.update(r0, r12, r14, r15);	 Catch:{ Exception -> 0x01fb }
        r0 = r17;
        saveToCloudAlbum(r0, r8);
        r13 = 1;
        return r13;
    L_0x00ef:
        r13 = r8;
        goto L_0x000f;
    L_0x00f2:
        r2 = move-exception;
        r13 = "CameraStorage";
        r14 = "Failed to rewrite Exif";
        com.android.camera.log.Log.e(r13, r14);	 Catch:{ Exception -> 0x021b, all -> 0x0218 }
        r0 = r18;
        r7.write(r0);	 Catch:{ Exception -> 0x021b, all -> 0x0218 }
        r6 = r7;
        goto L_0x0032;
    L_0x0104:
        r0 = r18;
        r7.write(r0);	 Catch:{ Exception -> 0x021b, all -> 0x0218 }
        r6 = r7;
        goto L_0x0032;
    L_0x010c:
        if (r26 == 0) goto L_0x0032;
    L_0x010e:
        r11 = generateFilepath(r26);	 Catch:{ Exception -> 0x013f }
        goto L_0x0032;
    L_0x0114:
        r3 = move-exception;
        r13 = "CameraStorage";
        r14 = "Failed to flush/close stream";
        com.android.camera.log.Log.e(r13, r14, r3);
        goto L_0x003a;
    L_0x0120:
        r3 = move-exception;
        r13 = "CameraStorage";
        r14 = new java.lang.StringBuilder;
        r14.<init>();
        r15 = "Exception when delete oldfile ";
        r14 = r14.append(r15);
        r0 = r26;
        r14 = r14.append(r0);
        r14 = r14.toString();
        com.android.camera.log.Log.e(r13, r14, r3);
        goto L_0x005b;
    L_0x013f:
        r3 = move-exception;
    L_0x0140:
        r13 = "CameraStorage";
        r14 = "Failed to write image";
        com.android.camera.log.Log.e(r13, r14, r3);	 Catch:{ all -> 0x019d }
        r13 = 0;
        if (r6 == 0) goto L_0x0152;
    L_0x014c:
        r6.flush();	 Catch:{ Exception -> 0x0174 }
        r6.close();	 Catch:{ Exception -> 0x0174 }
    L_0x0152:
        r10 = new java.io.File;
        r10.<init>(r11);
        r4 = r10.length();
        r14 = new java.io.File;
        r14.<init>(r8);
        r10.renameTo(r14);
        if (r19 == 0) goto L_0x0173;
    L_0x0165:
        if (r26 == 0) goto L_0x0173;
    L_0x0167:
        r14 = new java.io.File;	 Catch:{ Exception -> 0x017f }
        r15 = generateFilepath(r26);	 Catch:{ Exception -> 0x017f }
        r14.<init>(r15);	 Catch:{ Exception -> 0x017f }
        r14.delete();	 Catch:{ Exception -> 0x017f }
    L_0x0173:
        return r13;
    L_0x0174:
        r3 = move-exception;
        r14 = "CameraStorage";
        r15 = "Failed to flush/close stream";
        com.android.camera.log.Log.e(r14, r15, r3);
        goto L_0x0152;
    L_0x017f:
        r3 = move-exception;
        r14 = "CameraStorage";
        r15 = new java.lang.StringBuilder;
        r15.<init>();
        r16 = "Exception when delete oldfile ";
        r15 = r15.append(r16);
        r0 = r26;
        r15 = r15.append(r0);
        r15 = r15.toString();
        com.android.camera.log.Log.e(r14, r15, r3);
        goto L_0x0173;
    L_0x019d:
        r13 = move-exception;
    L_0x019e:
        if (r6 == 0) goto L_0x01a6;
    L_0x01a0:
        r6.flush();	 Catch:{ Exception -> 0x01c8 }
        r6.close();	 Catch:{ Exception -> 0x01c8 }
    L_0x01a6:
        r10 = new java.io.File;
        r10.<init>(r11);
        r4 = r10.length();
        r14 = new java.io.File;
        r14.<init>(r8);
        r10.renameTo(r14);
        if (r19 == 0) goto L_0x01c7;
    L_0x01b9:
        if (r26 == 0) goto L_0x01c7;
    L_0x01bb:
        r14 = new java.io.File;	 Catch:{ Exception -> 0x01d3 }
        r15 = generateFilepath(r26);	 Catch:{ Exception -> 0x01d3 }
        r14.<init>(r15);	 Catch:{ Exception -> 0x01d3 }
        r14.delete();	 Catch:{ Exception -> 0x01d3 }
    L_0x01c7:
        throw r13;
    L_0x01c8:
        r3 = move-exception;
        r14 = "CameraStorage";
        r15 = "Failed to flush/close stream";
        com.android.camera.log.Log.e(r14, r15, r3);
        goto L_0x01a6;
    L_0x01d3:
        r3 = move-exception;
        r14 = "CameraStorage";
        r15 = new java.lang.StringBuilder;
        r15.<init>();
        r16 = "Exception when delete oldfile ";
        r15 = r15.append(r16);
        r0 = r26;
        r15 = r15.append(r0);
        r15 = r15.toString();
        com.android.camera.log.Log.e(r14, r15, r3);
        goto L_0x01c7;
    L_0x01f1:
        if (r26 == 0) goto L_0x00dd;
    L_0x01f3:
        r13 = "_data";
        r12.put(r13, r8);
        goto L_0x00dd;
    L_0x01fb:
        r9 = move-exception;
        r13 = "CameraStorage";
        r14 = new java.lang.StringBuilder;
        r14.<init>();
        r15 = "Failed to update image";
        r14 = r14.append(r15);
        r14 = r14.append(r9);
        r14 = r14.toString();
        com.android.camera.log.Log.e(r13, r14);
        r13 = 0;
        return r13;
    L_0x0218:
        r13 = move-exception;
        r6 = r7;
        goto L_0x019e;
    L_0x021b:
        r3 = move-exception;
        r6 = r7;
        goto L_0x0140;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.storage.Storage.updateImage(android.content.Context, byte[], com.android.gallery3d.exif.ExifInterface, android.net.Uri, java.lang.String, android.location.Location, int, int, int, java.lang.String):boolean");
    }

    public static void saveToCloudAlbum(Context context, String filePath) {
        saveToCloudAlbum(context, filePath, false, -1);
    }

    public static void saveToCloudAlbum(Context context, String filePath, boolean parallelProcess, long mediaStoreId) {
        context.sendBroadcast(getSaveToCloudIntent(context, filePath, parallelProcess, mediaStoreId));
    }

    private static Intent getSaveToCloudIntent(Context context, String filePath, boolean parallelProcess, long mediaStoreId) {
        Intent intent = new Intent("com.miui.gallery.SAVE_TO_CLOUD");
        intent.setPackage("com.miui.gallery");
        List<ResolveInfo> resolveInfos = context.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (resolveInfos != null && resolveInfos.size() > 0) {
            intent.setComponent(new ComponentName("com.miui.gallery", ((ResolveInfo) resolveInfos.get(0)).activityInfo.name));
        }
        intent.putExtra("extra_file_path", filePath);
        if (parallelProcess) {
            intent.putExtra("extra_is_temp_file", true);
            intent.putExtra("extra_media_store_id", mediaStoreId);
        }
        return intent;
    }

    public static Bitmap flipJpeg(byte[] jpeg, boolean flipH, boolean flipV) {
        int i = 1;
        if (jpeg == null) {
            return null;
        }
        int i2;
        Options options = new Options();
        options.inPurgeable = true;
        Bitmap bitmap = BitmapFactory.decodeByteArray(jpeg, 0, jpeg.length, options);
        Matrix m = new Matrix();
        if (flipH) {
            i2 = -1;
        } else {
            i2 = 1;
        }
        float f = (float) i2;
        if (flipV) {
            i = -1;
        }
        m.setScale(f, (float) i, ((float) bitmap.getWidth()) * 0.5f, ((float) bitmap.getHeight()) * 0.5f);
        try {
            Bitmap flip = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), m, true);
            if (flip != bitmap) {
                bitmap.recycle();
            }
            if (flip.getWidth() == -1 || flip.getHeight() == -1) {
                return null;
            }
            return flip;
        } catch (Exception t) {
            Log.w("CameraStorage", "Failed to rotate thumbnail", t);
            return null;
        }
    }

    public static String generatePrimaryFilepath(String title) {
        return PRIMARY_STORAGE_PATH + "/DCIM/Camera" + '/' + title;
    }

    public static String generateFilepath(String title) {
        return generateFilepath(title, ".jpg");
    }

    public static String generateFilepath(String title, boolean isHide, boolean isMap) {
        if (isHide && isLowStorageSpace(HIDEDIRECTORY)) {
            return null;
        }
        return (isHide ? HIDEDIRECTORY : DIRECTORY) + '/' + title + (isMap ? ".y" : ".jpg");
    }

    public static String generateFilepath(String title, String ext) {
        return DIRECTORY + '/' + title + ext;
    }

    public static long getAvailableSpace(String path) {
        if (path == null) {
            return -1;
        }
        File dir = new File(path);
        boolean needScan = Util.mkdirs(dir, 511, -1, -1);
        if (!dir.exists() || (dir.isDirectory() ^ 1) != 0 || (dir.canWrite() ^ 1) != 0) {
            return -1;
        }
        if (needScan) {
            if (path.endsWith("/DCIM/Camera")) {
                Intent scanIntent = new Intent("miui.intent.action.MEDIA_SCANNER_SCAN_FOLDER");
                scanIntent.setData(Uri.fromFile(dir.getParentFile()));
                CameraAppImpl.getAndroidContext().sendBroadcast(scanIntent);
            }
        }
        try {
            if (HIDEDIRECTORY.equals(path)) {
                Util.createFile(new File(HIDEDIRECTORY + File.separator + ".nomedia"));
            }
            long available = new StatFs(path).getAvailableBytes();
            if (DIRECTORY.equals(path)) {
                if (isUsePhoneStorage() && isQuotaSupported() && available < sReserveBytes) {
                    Context context = CameraAppImpl.getAndroidContext();
                    ApplicationInfo info = context.getApplicationInfo();
                    try {
                        available = sQuotaBytes - ((StorageStatsManager) context.getSystemService(StorageStatsManager.class)).queryExternalStatsForUser(info.storageUuid, UserHandle.getUserHandleForUid(info.uid)).getTotalBytes();
                        if (available < 0) {
                            available = 0;
                        }
                    } catch (IOException e) {
                        Log.e("CameraStorage", e.getMessage(), e);
                    }
                }
                setLeftSpace(available);
            }
            return available;
        } catch (Exception e2) {
            Log.i("CameraStorage", "Fail to access external storage", e2);
            return -3;
        }
    }

    public static long getAvailableSpace() {
        return getAvailableSpace(DIRECTORY);
    }

    public static boolean isLowStorageSpace(String path) {
        return getAvailableSpace(path) < 52428800;
    }

    public static boolean hasSecondaryStorage() {
        return Device.isSupportedSecondaryStorage() && SECONDARY_STORAGE_PATH != null;
    }

    public static boolean secondaryStorageMounted() {
        return hasSecondaryStorage() && getAvailableSpace(SECONDARY_STORAGE_PATH) > 0;
    }

    public static boolean isCurrentStorageIsSecondary() {
        return SECONDARY_STORAGE_PATH != null ? SECONDARY_STORAGE_PATH.equals(sCurrentStoragePath) : false;
    }

    public static void switchStoragePathIfNeeded() {
        if (hasSecondaryStorage()) {
            String firstConsiderPath = FIRST_CONSIDER_STORAGE_PATH;
            String secondConsiderPath = SECONDARY_STORAGE_PATH;
            if (FIRST_CONSIDER_STORAGE_PATH.equals(SECONDARY_STORAGE_PATH)) {
                secondConsiderPath = PRIMARY_STORAGE_PATH;
            }
            String oldPath = sCurrentStoragePath;
            if (!isLowStorageSpace(firstConsiderPath)) {
                sCurrentStoragePath = firstConsiderPath;
            } else if (!isLowStorageSpace(secondConsiderPath)) {
                sCurrentStoragePath = secondConsiderPath;
            } else {
                return;
            }
            if (!sCurrentStoragePath.equals(oldPath)) {
                updateDirectory();
                if (!(sStorageListener == null || sStorageListener.get() == null)) {
                    ((StorageListener) sStorageListener.get()).onStoragePathChanged();
                }
            }
            Log.i("CameraStorage", "Storage path is switched path = " + DIRECTORY);
        }
    }

    public static void switchToPhoneStorage() {
        FIRST_CONSIDER_STORAGE_PATH = PRIMARY_STORAGE_PATH;
        if (!PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath)) {
            Log.v("CameraStorage", "switchToPhoneStorage");
            sCurrentStoragePath = PRIMARY_STORAGE_PATH;
            updateDirectory();
            if (sStorageListener != null && sStorageListener.get() != null) {
                ((StorageListener) sStorageListener.get()).onStoragePathChanged();
            }
        }
    }

    public static void readSystemPriorityStorage() {
        boolean isPriorityStorage = false;
        if (hasSecondaryStorage()) {
            isPriorityStorage = PriorityStorageBroadcastReceiver.isPriorityStorage();
            CameraSettings.setPriorityStoragePreference(isPriorityStorage);
        }
        FIRST_CONSIDER_STORAGE_PATH = isPriorityStorage ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH;
        sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
        updateDirectory();
    }

    public static boolean isRelatedStorage(Uri uri) {
        boolean z = false;
        if (uri == null) {
            return false;
        }
        String path = uri.getPath();
        if (path != null) {
            if (path.equals(PRIMARY_STORAGE_PATH)) {
                z = true;
            } else {
                z = path.equals(SECONDARY_STORAGE_PATH);
            }
        }
        return z;
    }

    public static boolean isUsePhoneStorage() {
        return PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static boolean isPhoneStoragePriority() {
        return PRIMARY_STORAGE_PATH.equals(FIRST_CONSIDER_STORAGE_PATH);
    }

    public static void setStorageListener(StorageListener listener) {
        if (listener != null) {
            sStorageListener = new WeakReference(listener);
        }
    }

    public static boolean isLowStorageAtLastPoint() {
        return getLeftSpace() < 52428800;
    }

    public static long getLeftSpace() {
        long left = LEFT_SPACE.get();
        Log.i("CameraStorage", "getLeftSpace() return " + left);
        return left;
    }

    private static void setLeftSpace(long left) {
        LEFT_SPACE.set(left);
        Log.i("CameraStorage", "setLeftSpace(" + left + ")");
    }

    private static void updateDirectory() {
        DIRECTORY = sCurrentStoragePath + "/DCIM/Camera";
        HIDEDIRECTORY = sCurrentStoragePath + "/DCIM/Camera/.ubifocus";
        BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    }
}
