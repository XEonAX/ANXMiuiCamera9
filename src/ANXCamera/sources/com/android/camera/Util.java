package com.android.camera;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.AlertDialog.Builder;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.IPackageInstallObserver;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.location.Country;
import android.location.CountryDetector;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.IPowerManager;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.provider.Settings.Secure;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.support.v4.view.ViewCompat;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.IWindowManager;
import android.view.IWindowManager.Stub;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import com.android.camera.data.DataRepository;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.permission.PermissionManager;
import com.android.camera.storage.Storage;
import com.android.camera2.CameraCapabilities;
import com.android.gallery3d.exif.ExifInterface;
import com.android.gallery3d.ui.StringTexture;
import dalvik.system.VMRuntime;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import miui.hardware.display.DisplayFeatureManager;
import miui.reflect.Field;
import miui.reflect.Method;
import miui.reflect.NoSuchMethodException;
import miui.security.SecurityManager;
import miui.util.FeatureParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class Util {
    private static HashSet<String> ANTIBANDING_60_COUNTRY = new HashSet(Arrays.asList(new String[]{"TW", "KR", "SA", "US", "CA", "BR", "CO", "MX", "PH"}));
    private static Boolean CAMERA_KPI_LOG_ENABLED;
    private static final List<Integer> COLOR_TEMPERATURE_LIST = new ArrayList();
    private static final List<Integer> COLOR_TEMPERATURE_MAP = new ArrayList();
    private static final File INTERNAL_STORAGE_DIRECTORY = new File("/data/sdcard");
    private static final String SCREEN_VENDOR = SystemProperties.get("sys.panel.display");
    public static boolean isNotchDevice;
    private static String mCountryIso = null;
    private static int mLockedOrientation = -1;
    private static boolean sClearMemoryLimit;
    public static int sFullScreenExtraMargin;
    private static boolean sHasNavigationBar;
    private static ImageFileNamer sImageFileNamer;
    public static boolean sIsDumpLog;
    public static boolean sIsFullScreenNavBarHidden;
    public static int sNavigationBarHeight;
    private static float sPixelDensity = 1.0f;
    public static int sStatusBarHeight;
    private static HashMap<String, Typeface> sTypefaces = new HashMap();
    public static int sWindowHeight = 1080;
    private static IWindowManager sWindowManager;
    public static int sWindowWidth = 720;

    public interface PackageInstallerListener {
        void onPackageInstalled(String str, boolean z);
    }

    private static class ImageFileNamer {
        private SimpleDateFormat mFormat;
        private long mLastDate;
        private int mSameSecondCount;

        public ImageFileNamer(String format) {
            this.mFormat = new SimpleDateFormat(format);
        }

        public String generateName(long dateTaken) {
            String result = this.mFormat.format(new Date(dateTaken));
            if (dateTaken / 1000 == this.mLastDate / 1000) {
                this.mSameSecondCount++;
                return result + "_" + this.mSameSecondCount;
            }
            this.mLastDate = dateTaken;
            this.mSameSecondCount = 0;
            return result;
        }
    }

    private Util() {
    }

    public static boolean isAntibanding60() {
        return ANTIBANDING_60_COUNTRY.contains(mCountryIso);
    }

    public static void updateCountryIso(Context context) {
        Country detectedCountry = ((CountryDetector) context.getSystemService("country_detector")).detectCountry();
        if (detectedCountry != null) {
            mCountryIso = detectedCountry.getCountryIso();
        }
        Log.v("CameraUtil", "antiBanding mCountryIso=" + mCountryIso);
        sIsDumpLog = SystemProperties.getBoolean("camera_dump_parameters", true);
    }

    public static void initialize(Context context) {
        boolean z;
        if (FeatureParser.getInteger("ro.miui.notch", 0) == 1) {
            z = true;
        } else {
            z = false;
        }
        isNotchDevice = z;
        sIsFullScreenNavBarHidden = isFullScreenNavBarHidden(context);
        DisplayMetrics metrics = new DisplayMetrics();
        WindowManager wm = (WindowManager) context.getSystemService("window");
        wm.getDefaultDisplay().getMetrics(metrics);
        sPixelDensity = metrics.noncompatDensity;
        sImageFileNamer = new ImageFileNamer(context.getString(R.string.image_file_name_format));
        Point p = new Point();
        wm.getDefaultDisplay().getRealSize(p);
        if (p.x < p.y) {
            sWindowWidth = p.x;
            sWindowHeight = p.y;
        } else {
            sWindowWidth = p.y;
            sWindowHeight = p.x;
        }
        sFullScreenExtraMargin = context.getResources().getDimensionPixelSize(R.dimen.fullscreen_extra_margin);
        sNavigationBarHeight = checkDeviceHasNavigationBar(context) ? getNavigationBarHeight(context) : calcNavigationBarHeight(context);
        if (isNotchDevice) {
            sStatusBarHeight = sWindowHeight - (sWindowWidth * 2);
            if (sIsFullScreenNavBarHidden) {
                sNavigationBarHeight -= sFullScreenExtraMargin;
                sStatusBarHeight += sFullScreenExtraMargin / 2;
            }
        }
        CameraSettings.BOTTOM_CONTROL_HEIGHT = getBottomHeight(context.getResources());
        Log.i("CameraUtil", String.format(Locale.ENGLISH, "windowSize=%dx%d density=%.2f", new Object[]{Integer.valueOf(sWindowWidth), Integer.valueOf(sWindowHeight), Float.valueOf(sPixelDensity)}));
    }

    public static void clearMemoryLimit() {
        if (!sClearMemoryLimit) {
            long start = System.currentTimeMillis();
            VMRuntime.getRuntime().clearGrowthLimit();
            sClearMemoryLimit = true;
            Log.v("CameraUtil", "clearMemoryLimit() consume:" + (System.currentTimeMillis() - start));
        }
    }

    public static int dpToPixel(float dp) {
        return Math.round(sPixelDensity * dp);
    }

    public static Bitmap rotate(Bitmap b, int degrees) {
        return rotateAndMirror(b, degrees, false);
    }

    public static Bitmap rotateAndMirror(Bitmap b, int degrees, boolean mirror) {
        if ((degrees == 0 && !mirror) || b == null) {
            return b;
        }
        Matrix m = new Matrix();
        if (mirror) {
            m.postScale(-1.0f, 1.0f);
            degrees = (degrees + 360) % 360;
            if (degrees == 0 || degrees == 180) {
                m.postTranslate((float) b.getWidth(), 0.0f);
            } else if (degrees == 90 || degrees == 270) {
                m.postTranslate((float) b.getHeight(), 0.0f);
            } else {
                throw new IllegalArgumentException("Invalid degrees=" + degrees);
            }
        }
        if (degrees != 0) {
            m.postRotate((float) degrees, ((float) b.getWidth()) / 2.0f, ((float) b.getHeight()) / 2.0f);
        }
        try {
            Bitmap b2 = Bitmap.createBitmap(b, 0, 0, b.getWidth(), b.getHeight(), m, true);
            if (b == b2) {
                return b;
            }
            b.recycle();
            return b2;
        } catch (OutOfMemoryError e) {
            return b;
        }
    }

    public static int computeSampleSize(Options options, int minSideLength, int maxNumOfPixels) {
        int initialSize = computeInitialSampleSize(options, minSideLength, maxNumOfPixels);
        if (initialSize > 8) {
            return ((initialSize + 7) / 8) * 8;
        }
        int roundedSize = 1;
        while (roundedSize < initialSize) {
            roundedSize <<= 1;
        }
        return roundedSize;
    }

    private static int computeInitialSampleSize(Options options, int minSideLength, int maxNumOfPixels) {
        int lowerBound;
        int upperBound;
        double w = (double) options.outWidth;
        double h = (double) options.outHeight;
        if (maxNumOfPixels < 0) {
            lowerBound = 1;
        } else {
            lowerBound = (int) Math.ceil(Math.sqrt((w * h) / ((double) maxNumOfPixels)));
        }
        if (minSideLength < 0) {
            upperBound = 128;
        } else {
            upperBound = (int) Math.min(Math.floor(w / ((double) minSideLength)), Math.floor(h / ((double) minSideLength)));
        }
        if (upperBound < lowerBound) {
            return lowerBound;
        }
        if (maxNumOfPixels < 0 && minSideLength < 0) {
            return 1;
        }
        if (minSideLength < 0) {
            return lowerBound;
        }
        return upperBound;
    }

    public static Bitmap makeBitmap(byte[] jpegData, int maxNumOfPixels) {
        try {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(jpegData, 0, jpegData.length, options);
            if (options.mCancel || options.outWidth == -1 || options.outHeight == -1) {
                return null;
            }
            options.inSampleSize = computeSampleSize(options, -1, maxNumOfPixels);
            options.inJustDecodeBounds = false;
            options.inDither = false;
            options.inPreferredConfig = Config.ARGB_8888;
            return BitmapFactory.decodeByteArray(jpegData, 0, jpegData.length, options);
        } catch (OutOfMemoryError ex) {
            Log.e("CameraUtil", "Got oom exception ", ex);
            return null;
        }
    }

    public static void closeSilently(Closeable c) {
        if (c != null) {
            try {
                c.close();
            } catch (Exception e) {
            }
        }
    }

    public static void Assert(boolean cond) {
        if (!cond) {
            throw new AssertionError();
        }
    }

    public static void showErrorAndFinish(final Activity activity, int msgId) {
        OnClickListener buttonListener = new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                Camera2DataContainer.getInstance().deInit();
                activity.finish();
            }
        };
        ((ActivityBase) activity).setErrorDialog(new Builder(activity).setCancelable(false).setIconAttribute(16843605).setTitle(R.string.camera_error_title).setMessage(msgId).setNeutralButton(R.string.dialog_ok, buttonListener).show());
    }

    public static <T> T checkNotNull(T object) {
        if (object != null) {
            return object;
        }
        throw new NullPointerException();
    }

    public static int clamp(int x, int min, int max) {
        if (x > max) {
            return max;
        }
        if (x < min) {
            return min;
        }
        return x;
    }

    public static float clamp(float x, float min, float max) {
        if (x > max) {
            return max;
        }
        if (x < min) {
            return min;
        }
        return x;
    }

    public static void checkLockedOrientation(Activity activity) {
        try {
            if (System.getInt(activity.getContentResolver(), "accelerometer_rotation") == 0) {
                mLockedOrientation = System.getInt(activity.getContentResolver(), "user_rotation");
            } else {
                mLockedOrientation = -1;
            }
        } catch (SettingNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static int getShootOrientation(Activity activity, int orientation) {
        return ((orientation - getDisplayRotation(activity)) + 360) % 360;
    }

    public static float getShootRotation(Activity activity, float rotation) {
        rotation -= (float) getDisplayRotation(activity);
        while (rotation < 0.0f) {
            rotation += 360.0f;
        }
        while (rotation > 360.0f) {
            rotation -= 360.0f;
        }
        return rotation;
    }

    public static int getDisplayRotation(Activity activity) {
        int rotation = 0;
        if (Device.isFrontCameraAtBottom() && CameraSettings.isFrontCamera() && activity.getRequestedOrientation() == 7) {
            rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
        } else if (mLockedOrientation == 0 || mLockedOrientation == 2) {
            rotation = mLockedOrientation;
        }
        switch (rotation) {
            case 0:
                return 0;
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    public static int getDisplayOrientation(int degrees, int cameraId) {
        CameraCapabilities cc = Camera2DataContainer.getInstance().getCapabilities(cameraId);
        int orientation = cc.getSensorOrientation();
        if (cc.getFacing() == 0) {
            return (360 - ((orientation + degrees) % 360)) % 360;
        }
        return ((orientation - degrees) + 360) % 360;
    }

    public static int roundOrientation(int orientation, int orientationHistory) {
        boolean changeOrientation;
        if (orientationHistory == -1) {
            changeOrientation = true;
        } else {
            int dist = Math.abs(orientation - orientationHistory);
            changeOrientation = Math.min(dist, 360 - dist) >= 50;
        }
        if (changeOrientation) {
            return (((orientation + 45) / 90) * 90) % 360;
        }
        return orientationHistory;
    }

    public static CameraSize getOptimalPreviewSize(int currentMode, int cameraId, List<CameraSize> sizes, double targetRatio) {
        if (sizes == null) {
            Log.w("CameraUtil", "null preview size list");
            return null;
        }
        int diff;
        CameraSize optimalSize = null;
        CameraSize optimalSizeSmaller = null;
        double minDiff = Double.MAX_VALUE;
        double minDiffSmaller = Double.MAX_VALUE;
        boolean small = false;
        int reduceFlag = FeatureParser.getInteger("camera_reduce_preview_flag", 0);
        if (reduceFlag != 0) {
            boolean frontCamera = cameraId == Camera2DataContainer.getInstance().getFrontCameraId();
            if (sWindowWidth < 1080) {
                reduceFlag &= -15;
            }
            int i = frontCamera ? 2 : 1;
            int i2 = (currentMode == 162 || currentMode == 169 || currentMode == 168 || currentMode == 170 || currentMode == 161) ? 2 : 0;
            small = (reduceFlag & ((i << i2) | 0)) != 0;
        }
        Point point = new Point(sWindowWidth, small ? Math.min(sWindowHeight, 1920) : sWindowHeight);
        int limitWidth = (Device.isMDPRender() || !Device.isSurfaceSizeLimited()) ? 1080 : 720;
        if (point.x > limitWidth) {
            point.y = (point.y * limitWidth) / point.x;
            point.x = limitWidth;
        }
        for (CameraSize size : sizes) {
            if (Math.abs((((double) size.width) / ((double) size.height)) - targetRatio) <= 0.02d) {
                if (!small || (point.x > size.height && point.y > size.width)) {
                    diff = Math.abs(point.x - size.height) + Math.abs(point.y - size.width);
                    if (diff == 0) {
                        optimalSize = size;
                        optimalSizeSmaller = size;
                        break;
                    }
                    if (size.height <= point.x && size.width <= point.y && ((double) diff) < minDiffSmaller) {
                        optimalSizeSmaller = size;
                        minDiffSmaller = (double) diff;
                    }
                    if (((double) diff) < minDiff) {
                        optimalSize = size;
                        minDiff = (double) diff;
                    }
                } else {
                    Log.e("CameraUtil", "getOptimalPreviewSize: " + size.toString() + " | " + point.toString());
                }
            }
        }
        if (optimalSizeSmaller != null) {
            optimalSize = optimalSizeSmaller;
        }
        if (optimalSize == null) {
            Log.w("CameraUtil", String.format(Locale.ENGLISH, "no preview size match the aspect ratio: %.2f", new Object[]{Double.valueOf(targetRatio)}));
            minDiff = Double.MAX_VALUE;
            for (CameraSize size2 : sizes) {
                diff = Math.abs(point.x - size2.getHeight()) + Math.abs(point.y - size2.getWidth());
                if (((double) diff) < minDiff) {
                    optimalSize = size2;
                    minDiff = (double) diff;
                }
            }
        }
        if (optimalSize != null) {
            Log.i("CameraUtil", String.format(Locale.ENGLISH, "best preview size: %dx%d", new Object[]{Integer.valueOf(optimalSize.getWidth()), Integer.valueOf(optimalSize.getHeight())}));
        }
        return optimalSize;
    }

    public static CameraSize getOptimalJpegThumbnailSize(List<CameraSize> sizes, double targetRatio) {
        if (sizes == null) {
            Log.w("CameraUtil", "null thumbnail size list");
            return null;
        }
        CameraSize optimalSize = null;
        double approachingRatio = 0.0d;
        for (CameraSize size : sizes) {
            if (!(size.getWidth() == 0 || size.getHeight() == 0)) {
                double ratio = ((double) size.getWidth()) / ((double) size.getHeight());
                double absRatio = Math.abs(ratio - targetRatio);
                if ((absRatio <= Math.abs(approachingRatio - targetRatio) || absRatio <= 0.001d) && (optimalSize == null || absRatio < Math.abs(approachingRatio - targetRatio) || size.getWidth() > optimalSize.getWidth())) {
                    optimalSize = size;
                    approachingRatio = ratio;
                }
            }
        }
        if (optimalSize == null) {
            Log.w("CameraUtil", "No thumbnail size match the aspect ratio");
            for (CameraSize size2 : sizes) {
                if (optimalSize == null || size2.getWidth() > optimalSize.getWidth()) {
                    optimalSize = size2;
                }
            }
        }
        return optimalSize;
    }

    public static CameraSize getOptimalVideoSnapshotPictureSize(List<CameraSize> sizes, double targetRatio, int maxWidth, int maxHeight) {
        if (sizes == null) {
            Log.e("CameraUtil", "null size list");
            return null;
        }
        CameraSize optimalSize = null;
        for (CameraSize size : sizes) {
            if (Math.abs((((double) size.getWidth()) / ((double) size.getHeight())) - targetRatio) <= 0.02d && ((optimalSize == null || size.getWidth() > optimalSize.getWidth()) && size.getWidth() <= maxWidth && size.getHeight() <= maxHeight)) {
                optimalSize = size;
            }
        }
        if (optimalSize == null) {
            Log.w("CameraUtil", "No picture size match the aspect ratio");
            for (CameraSize size2 : sizes) {
                if (optimalSize == null || size2.getWidth() > optimalSize.getWidth()) {
                    optimalSize = size2;
                }
            }
        }
        return optimalSize;
    }

    public static int[] getRelativeLocation(View reference, View view) {
        int[] location = new int[2];
        reference.getLocationInWindow(location);
        int referenceX = location[0];
        int referenceY = location[1];
        view.getLocationInWindow(location);
        location[0] = location[0] - referenceX;
        location[1] = location[1] - referenceY;
        return location;
    }

    public static boolean isUriValid(Uri uri, ContentResolver resolver) {
        if (uri == null) {
            return false;
        }
        try {
            ParcelFileDescriptor pfd = resolver.openFileDescriptor(uri, "r");
            if (pfd == null) {
                Log.e("CameraUtil", "Fail to open URI. URI=" + uri);
                return false;
            }
            pfd.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static void rectFToRect(RectF rectF, Rect rect) {
        rect.left = Math.round(rectF.left);
        rect.top = Math.round(rectF.top);
        rect.right = Math.round(rectF.right);
        rect.bottom = Math.round(rectF.bottom);
    }

    public static void prepareMatrix(Matrix matrix, boolean mirror, int displayOrientation, int viewWidth, int viewHeight, int centerX, int centerY) {
        matrix.setScale((float) (mirror ? -1 : 1), 1.0f);
        matrix.postRotate((float) displayOrientation);
        matrix.postScale(((float) viewWidth) / 2000.0f, ((float) viewHeight) / 2000.0f);
        matrix.postTranslate((float) centerX, (float) centerY);
    }

    public static void scaleCamera2Matrix(Matrix matrix, Rect cropRegion, float zoomValue) {
        matrix.postScale(zoomValue, zoomValue);
        matrix.preTranslate(((float) (-cropRegion.width())) / 2.0f, ((float) (-cropRegion.height())) / 2.0f);
        matrix.postScale(2000.0f / ((float) cropRegion.width()), 2000.0f / ((float) cropRegion.height()));
    }

    public static String dumpMatrix(float[] matrix) {
        int size = matrix.length;
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < size; i++) {
            sb.append(String.format("%f", new Object[]{Float.valueOf(matrix[i])}));
            if (i != size - 1) {
                sb.append(" ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static String createJpegName(long dateTaken) {
        String generateName;
        synchronized (sImageFileNamer) {
            generateName = sImageFileNamer.generateName(dateTaken);
        }
        return generateName;
    }

    public static String getFileTitleFromPath(String filePath) {
        if (TextUtils.isEmpty(filePath)) {
            return null;
        }
        int idx = filePath.lastIndexOf("/");
        if (idx < 0 || idx >= filePath.length() - 1) {
            return null;
        }
        String fileName = filePath.substring(idx + 1);
        if (TextUtils.isEmpty(fileName)) {
            return null;
        }
        idx = fileName.indexOf(".");
        if (idx >= 0) {
            fileName = fileName.substring(0, idx);
        }
        return fileName;
    }

    public static void broadcastNewPicture(Context context, Uri uri) {
        if (VERSION.SDK_INT < 24) {
            context.sendBroadcast(new Intent("android.hardware.action.NEW_PICTURE", uri));
            context.sendBroadcast(new Intent("com.android.camera.NEW_PICTURE", uri));
        }
    }

    public static void fadeIn(View view, int duration) {
        if (view != null && view.getVisibility() != 0) {
            view.setVisibility(0);
            Animation animation = new AlphaAnimation(0.0f, 1.0f);
            animation.setDuration((long) duration);
            view.clearAnimation();
            view.startAnimation(animation);
        }
    }

    public static void fadeIn(View view) {
        fadeIn(view, 400);
    }

    public static void fadeOut(View view, int duration) {
        if (view != null && view.getVisibility() == 0) {
            Animation animation = new AlphaAnimation(1.0f, 0.0f);
            animation.setDuration((long) duration);
            view.clearAnimation();
            view.startAnimation(animation);
            view.setVisibility(8);
        }
    }

    public static void fadeOut(View view) {
        fadeOut(view, 400);
    }

    public static int getJpegRotation(int cameraId, int orientation) {
        CameraCapabilities cc = Camera2DataContainer.getInstance().getCapabilities(cameraId);
        int sensorOrientation = cc.getSensorOrientation();
        if (orientation == -1) {
            return sensorOrientation;
        }
        if (cc.getFacing() == 0) {
            return ((sensorOrientation - orientation) + 360) % 360;
        }
        return (sensorOrientation + orientation) % 360;
    }

    public static <T> int getArrayIndex(T[] array, T needle) {
        if (array == null) {
            return -1;
        }
        int index = 0;
        for (T elem : array) {
            if (Objects.equals(elem, needle)) {
                return index;
            }
            index++;
        }
        return -1;
    }

    public static int getArrayIndex(int[] array, int needle) {
        if (array == null) {
            return -1;
        }
        for (int i = 0; i < array.length; i++) {
            if (array[i] == needle) {
                return i;
            }
        }
        return -1;
    }

    public static boolean isSupported(String value, List<String> supported) {
        return supported != null && supported.indexOf(value) >= 0;
    }

    public static <T> boolean isSupported(T value, T[] supported) {
        return getArrayIndex((Object[]) supported, (Object) value) != -1;
    }

    public static boolean isSupported(int value, int[] supported) {
        return getArrayIndex(supported, value) != -1;
    }

    public static boolean isLayoutRTL(Context context) {
        boolean z = true;
        if (context == null) {
            return false;
        }
        if (context.getResources().getConfiguration().getLayoutDirection() != 1) {
            z = false;
        }
        return z;
    }

    public static boolean mkdirs(File file, int mode, int uid, int gid) {
        if (file.exists()) {
            return false;
        }
        String parentDir = file.getParent();
        if (parentDir != null) {
            mkdirs(new File(parentDir), mode, uid, gid);
        }
        return file.mkdir();
    }

    public static boolean createFile(File file) {
        if (file.exists()) {
            return false;
        }
        String parentDir = file.getParent();
        if (parentDir != null) {
            mkdirs(new File(parentDir), 511, -1, -1);
        }
        try {
            file.createNewFile();
        } catch (IOException e) {
        }
        return true;
    }

    public static boolean isTimeout(long now, long last, long gap) {
        return now < last || now - last > gap;
    }

    public static Typeface getMiuiTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Normal.ttf");
    }

    public static Typeface getMiuiTimeTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Time.ttf");
    }

    private static synchronized Typeface getTypeface(Context context, String fontName) {
        Typeface typeface;
        synchronized (Util.class) {
            if (!sTypefaces.containsKey(fontName)) {
                sTypefaces.put(fontName, Typeface.createFromAsset(context.getAssets(), fontName));
            }
            typeface = (Typeface) sTypefaces.get(fontName);
        }
        return typeface;
    }

    public static boolean isProduceFocusInfoSuccess(byte[] depthMap) {
        return depthMap != null && 25 < depthMap.length && depthMap[depthMap.length - 25] == (byte) 0;
    }

    public static int getCenterFocusDepthIndex(byte[] depthMap, int imageWidth, int imageHeight) {
        if (depthMap == null || depthMap.length < 25) {
            return 1;
        }
        int metaDataIndex = depthMap.length - 25;
        int metaDataIndex2 = metaDataIndex + 1;
        if (depthMap[metaDataIndex] != (byte) 0) {
            return 1;
        }
        metaDataIndex = metaDataIndex2 + 1;
        metaDataIndex2 = metaDataIndex + 1;
        metaDataIndex = metaDataIndex2 + 1;
        metaDataIndex2 = metaDataIndex + 1;
        int mapWidth = ((((depthMap[metaDataIndex2] & 255) << 24) | ((depthMap[metaDataIndex] & 255) << 16)) | ((depthMap[metaDataIndex2] & 255) << 8)) | (depthMap[metaDataIndex] & 255);
        metaDataIndex = metaDataIndex2 + 1;
        metaDataIndex2 = metaDataIndex + 1;
        metaDataIndex = metaDataIndex2 + 1;
        metaDataIndex2 = metaDataIndex + 1;
        int mapHeight = ((((depthMap[metaDataIndex2] & 255) << 24) | ((depthMap[metaDataIndex] & 255) << 16)) | ((depthMap[metaDataIndex2] & 255) << 8)) | (depthMap[metaDataIndex] & 255);
        Resources res = CameraAppImpl.getAndroidContext().getResources();
        int centerWidth = res.getDimensionPixelSize(R.dimen.focus_area_width);
        int width = (mapWidth * centerWidth) / sWindowWidth;
        int height = (int) (((float) (mapHeight * res.getDimensionPixelSize(R.dimen.focus_area_height))) / ((((float) sWindowWidth) * ((float) imageHeight)) / ((float) imageWidth)));
        int[] countArray = new int[5];
        int i = 0;
        int row = (mapHeight - height) / 2;
        while (i < height) {
            int row2 = row + 1;
            int colIndex = (row * mapWidth) + ((mapWidth - width) / 2);
            int j = 0;
            while (true) {
                int colIndex2 = colIndex;
                if (j >= width) {
                    break;
                }
                colIndex = colIndex2 + 1;
                byte b = depthMap[colIndex2];
                countArray[b] = countArray[b] + 1;
                j++;
            }
            i++;
            row = row2;
        }
        int maxIndex = 0;
        for (i = 1; i < 5; i++) {
            if (countArray[maxIndex] < countArray[i]) {
                maxIndex = i;
            }
        }
        return maxIndex;
    }

    public static String getTimeWatermark() {
        return getTimeWatermark(Device.isSupportedNewStyleTimeWaterMark());
    }

    public static String getTimeWatermark(boolean isNewStyle) {
        StringBuilder sb = new StringBuilder();
        if (isNewStyle) {
            sb.append(new SimpleDateFormat("yyyy/M/d", Locale.ENGLISH).format(new Date()).toCharArray());
        } else {
            sb.append(new SimpleDateFormat("yyyy-M-d", Locale.ENGLISH).format(new Date()).toCharArray());
        }
        sb.append(" ");
        new Time().set(System.currentTimeMillis());
        sb.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(time.hour)}));
        sb.append(":");
        sb.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(time.minute)}));
        return sb.toString();
    }

    public static Method getMethod(Class<?>[] ownerClazz, String methodName, String signature) {
        Method method = null;
        if (ownerClazz != null) {
            try {
                if (ownerClazz.length == 1) {
                    method = Method.of(ownerClazz[0], methodName, signature);
                }
            } catch (NoSuchMethodException e) {
                if (ownerClazz[0].getSuperclass() != null) {
                    ownerClazz[0] = ownerClazz[0].getSuperclass();
                    method = getMethod(ownerClazz, methodName, signature);
                }
            }
        }
        if (method == null) {
            Log.e("CameraUtil", "getMethod fail, " + methodName + "[" + signature + "]");
        }
        return method;
    }

    public static int safeDelete(Uri url, String where, String[] selectionArgs) {
        int deleteResult = -1;
        try {
            deleteResult = CameraAppImpl.getAndroidContext().getContentResolver().delete(url, where, selectionArgs);
            Log.v("CameraUtil", "safeDelete url=" + url + " where=" + where + " selectionArgs=" + selectionArgs + " result=" + deleteResult);
            return deleteResult;
        } catch (Exception e) {
            e.printStackTrace();
            return deleteResult;
        }
    }

    public static boolean isShowDebugInfo() {
        return ("1".equals(SystemProperties.get("persist.camera.enable.log")) || "1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.show_awb")) || "1".equals(SystemProperties.get("persist.camera.debug.show_aec")) || "1".equals(SystemProperties.get("persist.camera.debug.autoscene"))) ? true : "1".equals(SystemProperties.get("persist.camera.debug.hht"));
    }

    public static String getDebugInfo() {
        StringBuilder sb = new StringBuilder();
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.enable"))) {
            sb.append(addProperties("persist.camera.debug.param0"));
            sb.append(addProperties("persist.camera.debug.param1"));
            sb.append(addProperties("persist.camera.debug.param2"));
            sb.append(addProperties("persist.camera.debug.param3"));
            sb.append(addProperties("persist.camera.debug.param4"));
            sb.append(addProperties("persist.camera.debug.param5"));
            sb.append(addProperties("persist.camera.debug.param6"));
            sb.append(addProperties("persist.camera.debug.param7"));
            sb.append(addProperties("persist.camera.debug.param8"));
            sb.append(addProperties("persist.camera.debug.param9"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_awb"))) {
            sb.append(addProperties("persist.camera.debug.param10"));
            sb.append(addProperties("persist.camera.debug.param11"));
            sb.append(addProperties("persist.camera.debug.param12"));
            sb.append(addProperties("persist.camera.debug.param13"));
            sb.append(addProperties("persist.camera.debug.param14"));
            sb.append(addProperties("persist.camera.debug.param15"));
            sb.append(addProperties("persist.camera.debug.param16"));
            sb.append(addProperties("persist.camera.debug.param17"));
            sb.append(addProperties("persist.camera.debug.param18"));
            sb.append(addProperties("persist.camera.debug.param19"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_aec"))) {
            sb.append(addProperties("persist.camera.debug.param20"));
            sb.append(addProperties("persist.camera.debug.param21"));
            sb.append(addProperties("persist.camera.debug.param22"));
            sb.append(addProperties("persist.camera.debug.param23"));
            sb.append(addProperties("persist.camera.debug.param24"));
            sb.append(addProperties("persist.camera.debug.param25"));
            sb.append(addProperties("persist.camera.debug.param26"));
            sb.append(addProperties("persist.camera.debug.param27"));
            sb.append(addProperties("persist.camera.debug.param28"));
            sb.append(addProperties("persist.camera.debug.param29"));
        }
        sb.append(addProperties("persist.camera.debug.checkerf"));
        sb.append(addProperties("persist.camera.debug.fc"));
        if ("1".equals(SystemProperties.get("persist.camera.debug.hht"))) {
            sb.append(addProperties("camera.debug.hht.luma"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.autoscene"))) {
            sb.append(addProperties("camera.debug.hht.iso"));
        }
        return sb.toString();
    }

    private static String addProperties(String properties) {
        String content = "";
        if (SystemProperties.get(properties) == null) {
            return content;
        }
        return ("\t " + SystemProperties.get(properties)) + "\n";
    }

    public static boolean isContains(RectF parent, RectF child) {
        boolean z = false;
        if (parent == null || child == null) {
            return false;
        }
        if (parent.left < parent.right && parent.top < parent.bottom && parent.left <= child.left && parent.top <= child.top && parent.right >= child.right && parent.bottom >= child.bottom) {
            z = true;
        }
        return z;
    }

    public static boolean isStringValueContained(Object checkedValue, int valuesResId) {
        return isStringValueContained(checkedValue, CameraAppImpl.getAndroidContext().getResources().getStringArray(valuesResId));
    }

    public static boolean isStringValueContained(Object checkedValue, CharSequence[] values) {
        if (values == null || checkedValue == null) {
            return false;
        }
        for (CharSequence value : values) {
            if (value.equals(checkedValue)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isStringValueContained(Object checkedValue, List<? extends CharSequence> values) {
        if (values == null || checkedValue == null) {
            return false;
        }
        for (CharSequence value : values) {
            if (value.equals(checkedValue)) {
                return true;
            }
        }
        return false;
    }

    public static int getNavigationBarHeight(Context context) {
        Resources resources = context.getResources();
        int height = resources.getDimensionPixelSize(resources.getIdentifier("navigation_bar_height", "dimen", "android"));
        Log.v("CameraUtil", "navBarHeight=" + height);
        return height;
    }

    public static int calcNavigationBarHeight(Context context) {
        int height = context.getResources().getDimensionPixelSize(R.dimen.top_control_panel_height);
        int remain = sWindowHeight - ((sWindowWidth * 16) / 9);
        if (remain > 0) {
            height = remain - height;
        } else {
            height = 0;
        }
        Log.d("CameraUtil", "calculate navBarHeight=" + height);
        return height;
    }

    public static boolean checkDeviceHasNavigationBar(Context activity) {
        if (sWindowManager == null) {
            sWindowManager = Stub.asInterface(ServiceManager.getService("window"));
            try {
                sHasNavigationBar = sWindowManager.hasNavigationBar();
            } catch (Exception e) {
                Log.e("CameraUtil", "checkDeviceHasNavigationBar exception");
            }
        }
        return sHasNavigationBar;
    }

    public static boolean isInVideoCall(Activity context) {
        if (Device.isMTKPlatform() && PermissionManager.checkPhoneStatePermission(context)) {
            return CompatibilityUtils.isInVideoCall(context);
        }
        return false;
    }

    public static boolean isFingerPrintKeyEvent(KeyEvent event) {
        if (event == null || 27 != event.getKeyCode() || event.getDevice() == null) {
            return false;
        }
        return Device.getFpNavEventNameList().contains(event.getDevice().getName());
    }

    public static boolean isMemoryRich(Context context) {
        ActivityManager am = (ActivityManager) context.getSystemService("activity");
        MemoryInfo mi = new MemoryInfo();
        am.getMemoryInfo(mi);
        return mi.availMem > 419430400;
    }

    public static <T> int binarySearchRightMost(List<? extends Comparable<? super T>> list, T key) {
        int low = 0;
        int high = list.size() - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (((Comparable) list.get(mid)).compareTo(key) >= 0) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return low;
    }

    public static boolean isKPILogEnabled() {
        if (CAMERA_KPI_LOG_ENABLED == null) {
            CAMERA_KPI_LOG_ENABLED = Boolean.valueOf(new File(Storage.generatePrimaryFilepath("camera_kpi_log")).exists());
        }
        return CAMERA_KPI_LOG_ENABLED.booleanValue();
    }

    public static Rect getDisplayRect(Context context) {
        int newHeight;
        int topMargin;
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 0:
                newHeight = (int) (((float) (sWindowWidth * 4)) / 3.0f);
                topMargin = (sWindowHeight - newHeight) - getBottomHeight(context.getResources());
                break;
            case 3:
                newHeight = (int) (((float) (sWindowWidth * 18)) / 9.0f);
                topMargin = sStatusBarHeight;
                break;
            default:
                newHeight = (int) (((float) (sWindowWidth * 16)) / 9.0f);
                topMargin = (sWindowHeight - newHeight) - sNavigationBarHeight;
                break;
        }
        if (topMargin <= 2) {
            topMargin = 0;
        }
        return new Rect(0, topMargin, sWindowWidth, newHeight + topMargin);
    }

    public static int getBottomHeight(Resources resources) {
        int height = resources.getDimensionPixelSize(R.dimen.bottom_control_height);
        if (isNotchDevice && sIsFullScreenNavBarHidden) {
            return height - sFullScreenExtraMargin;
        }
        return height;
    }

    public static boolean isFullScreenNavBarHidden(Context context) {
        return true;
    }

    public static boolean isPackageAvailable(Context context, String packageName) {
        boolean z = true;
        if (context == null || packageName == null || packageName.isEmpty()) {
            Log.w("CameraUtil", "invalid params. packageName=" + packageName);
            return false;
        }
        try {
            int status = context.getPackageManager().getApplicationEnabledSetting(packageName);
            if (!(status == 0 || status == 1)) {
                z = false;
            }
            return z;
        } catch (IllegalArgumentException e) {
            Log.e("CameraUtil", e.getMessage());
        } catch (NullPointerException e2) {
            Log.e("CameraUtil", e2.getMessage());
        }
        return false;
    }

    public static void installPackage(Context context, String pkgName, final PackageInstallerListener installedListener, boolean needConfirm, boolean showToast) {
        if (context == null || TextUtils.isEmpty(pkgName)) {
            Log.w("CameraUtil", "invalid params. pkgName=" + pkgName);
            return;
        }
        try {
            IPackageInstallObserver observer = new IPackageInstallObserver.Stub() {
                public void packageInstalled(String packageName, int returnCode) throws RemoteException {
                    boolean z = true;
                    Log.d("CameraUtil", "packageInstalled: packageName=" + packageName + " returnCode=" + returnCode);
                    if (installedListener != null) {
                        PackageInstallerListener packageInstallerListener = installedListener;
                        if (returnCode != 1) {
                            z = false;
                        }
                        packageInstallerListener.onPackageInstalled(packageName, z);
                    }
                }
            };
            Class clazz = Class.forName("miui.content.pm.PreloadedAppPolicy");
            Method method = Method.of(clazz, "installPreloadedDataApp", "(Landroid/content/Context;Ljava/lang/String;Landroid/content/pm/IPackageInstallObserver;I)Z");
            int flags = 0;
            if (needConfirm) {
                flags = 1;
            } else if (showToast) {
                flags = 2;
            }
            Log.d("CameraUtil", "installPackage: result=" + method.invokeBoolean(clazz, null, context, pkgName, observer, Integer.valueOf(flags)));
        } catch (Exception e) {
            Log.e("CameraUtil", e.getMessage(), e);
            if (installedListener != null) {
                installedListener.onPackageInstalled(pkgName, false);
            }
        }
    }

    public static final int calculateDefaultPreviewEdgeSlop(Context context) {
        int resId;
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        float width = ((float) dm.widthPixels) / dm.xdpi;
        float height = ((float) dm.heightPixels) / dm.ydpi;
        if (((float) Math.sqrt((double) ((width * width) + (height * height)))) < 5.0f) {
            resId = R.dimen.preview_edge_touch_slop_small_screen;
        } else {
            resId = R.dimen.preview_edge_touch_slop;
        }
        return context.getResources().getDimensionPixelSize(resId);
    }

    public static final boolean isAppLocked(Context context, String packageName) {
        boolean z = false;
        if (!(Secure.getInt(context.getContentResolver(), "access_control_lock_enabled", -1) == 1)) {
            return false;
        }
        SecurityManager sm = (SecurityManager) context.getSystemService("security");
        boolean lockOn = sm.getApplicationAccessControlEnabled(packageName);
        boolean unlocked = sm.checkAccessControlPass(packageName);
        if (lockOn) {
            z = unlocked ^ 1;
        }
        return z;
    }

    public static SpannableStringBuilder appendInApi26(SpannableStringBuilder ssb, CharSequence text, Object what, int flags) {
        int start = ssb.length();
        ssb.append(text);
        ssb.setSpan(what, start, ssb.length(), flags);
        return ssb;
    }

    public static boolean isDebugOsBuild() {
        return ("userdebug".equals(Build.TYPE) || "eng".equals(Build.TYPE)) ? true : sIsDumpLog;
    }

    public static int stringSparseArraysIndexOf(SparseArray<String> sparseArray, String value) {
        if (value != null) {
            for (int i = 0; i < sparseArray.size(); i++) {
                if (value.equals(sparseArray.valueAt(i))) {
                    return i;
                }
            }
        }
        return -1;
    }

    public static boolean isPathExist(String path) {
        return !TextUtils.isEmpty(path) ? new File(path).exists() : false;
    }

    public static ExifInterface getExif(byte[] jpeg) {
        ExifInterface exif = new ExifInterface();
        try {
            exif.readExif(jpeg);
        } catch (IOException e) {
            Log.d("CameraUtil", e.getMessage());
        }
        return exif;
    }

    public static void insertImageToParallelService(Context context, long mediaStoreId, String path) {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("content");
        builder.authority("com.xiaomi.camera.parallelservice.provider.SpecialTypesProvider");
        builder.appendPath("processing");
        ContentValues cv = new ContentValues();
        cv.put("media_store_id", Long.valueOf(mediaStoreId));
        cv.put("media_path", path);
        try {
            android.util.Log.v("CameraUtil", "insert result uri:" + context.getContentResolver().insert(builder.build(), cv));
        } catch (Exception e) {
            Log.e("CameraUtil", "Error! insert to parallelservice failed!!!");
        }
    }

    public static boolean isZoomAnimationEnabled() {
        return SystemProperties.getBoolean("camera_zoom_animation", true);
    }

    public static boolean isNonUI() {
        return SystemProperties.getBoolean("sys.power.nonui", false);
    }

    public static boolean isNonUIEnabled() {
        return SystemProperties.get("sys.power.nonui").equals("") ^ 1;
    }

    public static int getChildMeasureWidth(View view) {
        MarginLayoutParams layoutParams = (MarginLayoutParams) view.getLayoutParams();
        int margin = layoutParams.leftMargin + layoutParams.rightMargin;
        int measureWidth = view.getMeasuredWidth();
        if (measureWidth > 0) {
            return measureWidth + margin;
        }
        int spec = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(spec, spec);
        return view.getMeasuredWidth() + margin;
    }

    public static String join(String join, List<String> strAry) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < strAry.size(); i++) {
            if (i == strAry.size() - 1) {
                stringBuffer.append((String) strAry.get(i));
            } else {
                stringBuffer.append((String) strAry.get(i)).append(join);
            }
        }
        return stringBuffer.toString();
    }

    public static int parseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            Log.e("CameraUtil", e.getMessage(), e);
            if (!isDebugOsBuild()) {
                return defaultValue;
            }
            throw e;
        }
    }

    public static void setBrightnessRampRate(int rate) {
        CompatibilityUtils.setBrightnessRampRate(IPowerManager.Stub.asInterface(ServiceManager.getService("power")), rate);
    }

    public static void setScreenEffect(boolean enable) {
        if (Device.isSupportScreenLight()) {
            DisplayFeatureManager.getInstance().setScreenEffect(14, enable ? 1 : 0);
        }
    }

    private static void initScreenLightColorMap() {
        if (COLOR_TEMPERATURE_LIST.size() <= 0 && COLOR_TEMPERATURE_MAP.size() <= 0) {
            int xml = CameraAppImpl.getAndroidContext().getResources().getIdentifier("screen_light", "xml", CameraAppImpl.getAndroidContext().getPackageName());
            if (xml <= 0) {
                Log.e("CameraUtil", "res/xml/screen_light.xml not found!");
                return;
            }
            XmlResourceParser parser = CameraAppImpl.getAndroidContext().getResources().getXml(xml);
            while (parser.next() != 3) {
                try {
                    if (parser.getEventType() == 2 && "screen".equals(parser.getName())) {
                        if (SCREEN_VENDOR.equals(parser.getAttributeValue(null, "vendor"))) {
                            Log.d("CameraUtil", "load screen light parameters for " + SCREEN_VENDOR);
                            while (parser.next() != 1) {
                                if (parser.getEventType() == 2) {
                                    if (!"light".equals(parser.getName())) {
                                        break;
                                    }
                                    int cct = parser.getAttributeIntValue(null, "CCT", 0);
                                    int r = parser.getAttributeIntValue(null, "R", 0);
                                    int g = parser.getAttributeIntValue(null, "G", 0);
                                    int b = parser.getAttributeIntValue(null, Field.BYTE_SIGNATURE_PRIMITIVE, 0);
                                    COLOR_TEMPERATURE_LIST.add(Integer.valueOf(cct));
                                    COLOR_TEMPERATURE_MAP.add(Integer.valueOf(Color.rgb(r, g, b)));
                                }
                            }
                            parser.close();
                        }
                        skip(parser);
                    }
                } catch (XmlPullParserException e) {
                    parser.close();
                } catch (IOException e2) {
                    parser.close();
                } catch (Throwable th) {
                    parser.close();
                    throw th;
                }
            }
            parser.close();
        }
    }

    private static void skip(XmlPullParser parser) throws XmlPullParserException, IOException {
        if (parser.getEventType() != 2) {
            throw new IllegalStateException();
        }
        int depth = 1;
        while (depth != 0) {
            switch (parser.next()) {
                case 2:
                    depth++;
                    break;
                case 3:
                    depth--;
                    break;
                default:
                    break;
            }
        }
    }

    public static int getScreenLightColor(int colorTemperature) {
        initScreenLightColorMap();
        if (COLOR_TEMPERATURE_LIST.size() == 0 || COLOR_TEMPERATURE_MAP.size() == 0) {
            Log.e("CameraUtil", "color temperature list empty!");
            return -1;
        }
        int index = binarySearchRightMost(COLOR_TEMPERATURE_LIST, Integer.valueOf(colorTemperature));
        if (index >= COLOR_TEMPERATURE_LIST.size()) {
            index = COLOR_TEMPERATURE_LIST.size() - 1;
        } else if (index > 0 && ((Integer) COLOR_TEMPERATURE_LIST.get(index)).intValue() - colorTemperature > colorTemperature - ((Integer) COLOR_TEMPERATURE_LIST.get(index - 1)).intValue()) {
            index--;
        }
        Log.d("CameraUtil", "getScreenLightColor " + colorTemperature + "K -> " + COLOR_TEMPERATURE_LIST.get(index) + "K");
        return ((Integer) COLOR_TEMPERATURE_MAP.get(index)).intValue();
    }

    private static String getCaller(StackTraceElement[] callStack, int depth) {
        if (depth + 4 >= callStack.length) {
            return "<bottom of call stack>";
        }
        StackTraceElement caller = callStack[depth + 4];
        return caller.getClassName() + "." + caller.getMethodName() + ":" + caller.getLineNumber();
    }

    public static String getCallers(int depth) {
        StackTraceElement[] callStack = Thread.currentThread().getStackTrace();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < depth; i++) {
            sb.append(getCaller(callStack, i)).append(" ");
        }
        return sb.toString();
    }

    public static byte[] getTimeWaterMarkData(int width, int height) {
        return StringTexture.newInstance(getTimeWatermark(), (((float) Math.min(width, height)) / 1080.0f) * 30.079576f, -1, 2).getBitmapData(CompressFormat.PNG);
    }

    public static long getDuration(String filePath) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        long parseLong;
        try {
            retriever.setDataSource(filePath);
            parseLong = Long.parseLong(retriever.extractMetadata(9));
            return parseLong;
        } catch (IllegalArgumentException e) {
            parseLong = "CameraUtil";
            Log.e(parseLong, e.getMessage(), e);
            return 0;
        } finally {
            retriever.release();
        }
    }

    public static boolean isAccessible() {
        if (VERSION.SDK_INT < 14 || !isAccessibilityEnable()) {
            return false;
        }
        return true;
    }

    private static boolean isAccessibilityEnable() {
        return ((AccessibilityManager) CameraAppImpl.getAndroidContext().getSystemService("accessibility")).isEnabled();
    }

    public static void setAccessibilityFocusable(View view, boolean focused) {
        if (VERSION.SDK_INT < 16) {
            return;
        }
        if (focused) {
            ViewCompat.setImportantForAccessibility(view, 1);
        } else {
            ViewCompat.setImportantForAccessibility(view, 2);
        }
    }

    public static boolean isQuotaExceeded(Exception e) {
        if (e != null && (e instanceof FileNotFoundException)) {
            String msg = e.getMessage();
            Log.e("CameraUtil", "isQuotaExceeded: msg=" + msg);
            if (msg != null) {
                return msg.toLowerCase().contains("quota exceeded");
            }
        }
        return false;
    }

    public static boolean isGlobalVersion() {
        return SystemProperties.get("ro.product.mod_device", "").contains("_global");
    }
}
