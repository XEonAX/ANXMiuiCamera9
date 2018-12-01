package com.google.android.apps.lens.library.base;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.google.android.apps.lens.library.base.proto.nano.LensSdkParamsProto$LensSdkParams;
import java.util.ArrayList;
import java.util.List;

public class LensSdkParamsReader {
    private static final LensSdkParamsProto$LensSdkParams DEFAULT_PARAMS = new LensSdkParamsProto$LensSdkParams();
    public static final String LENS_AVAILABILITY_PROVIDER_URI = String.format("content://%s/publicvalue/lens_oem_availability", new Object[]{"com.google.android.googlequicksearchbox.GsaPublicContentProvider"});
    private final List<LensSdkParamsCallback> callbacks;
    private final Context context;
    private LensSdkParamsProto$LensSdkParams lensSdkParams;
    private boolean lensSdkParamsReady;
    private final PackageManager packageManager;

    public interface LensSdkParamsCallback {
        void onLensSdkParamsAvailable(LensSdkParamsProto$LensSdkParams lensSdkParamsProto$LensSdkParams);
    }

    private class QueryGsaTask extends AsyncTask<Void, Void, Integer> {
        private QueryGsaTask() {
        }

        protected Integer doInBackground(Void... params) {
            Cursor cursor = null;
            try {
                cursor = LensSdkParamsReader.this.context.getContentResolver().query(Uri.parse(LensSdkParamsReader.LENS_AVAILABILITY_PROVIDER_URI), null, null, null, null);
                if (cursor == null || cursor.getCount() == 0) {
                    Integer valueOf = Integer.valueOf(4);
                    return valueOf;
                }
                cursor.moveToFirst();
                int value = Integer.parseInt(cursor.getString(0));
                if (value > 6) {
                    value = 6;
                }
                Integer valueOf2 = Integer.valueOf(value);
                if (cursor != null) {
                    cursor.close();
                }
                return valueOf2;
            } finally {
                if (cursor != null) {
                    cursor.close();
                }
            }
        }

        protected void onPostExecute(Integer status) {
            String valueOf = String.valueOf(status);
            Log.i("LensSdkParamsReader", new StringBuilder(String.valueOf(valueOf).length() + 25).append("Lens availability result:").append(valueOf).toString());
            LensSdkParamsReader.this.lensSdkParams.lensAvailabilityStatus = status.intValue();
            LensSdkParamsReader.this.lensSdkParamsReady = true;
            for (LensSdkParamsCallback callback : LensSdkParamsReader.this.callbacks) {
                callback.onLensSdkParamsAvailable(LensSdkParamsReader.this.lensSdkParams);
            }
            LensSdkParamsReader.this.callbacks.clear();
        }
    }

    static {
        DEFAULT_PARAMS.lensSdkVersion = "0.1.0";
        DEFAULT_PARAMS.agsaVersionName = "";
        DEFAULT_PARAMS.lensAvailabilityStatus = -1;
        DEFAULT_PARAMS.arStickersAvailabilityStatus = -1;
    }

    public LensSdkParamsReader(@NonNull Context context) {
        this(context, context.getPackageManager());
    }

    @VisibleForTesting
    LensSdkParamsReader(@NonNull Context context, @NonNull PackageManager packageManager) {
        this.callbacks = new ArrayList();
        this.context = context;
        this.packageManager = packageManager;
        updateParams();
    }

    public int getArStickersAvailability() {
        return this.lensSdkParams.arStickersAvailabilityStatus;
    }

    public void getParams(@NonNull LensSdkParamsCallback callback) {
        if (this.lensSdkParamsReady) {
            callback.onLensSdkParamsAvailable(this.lensSdkParams);
        } else {
            this.callbacks.add(callback);
        }
    }

    private void updateParams() {
        this.lensSdkParamsReady = false;
        this.lensSdkParams = DEFAULT_PARAMS.clone();
        try {
            PackageInfo packageInfo = this.packageManager.getPackageInfo("com.google.android.googlequicksearchbox", 0);
            if (packageInfo != null) {
                this.lensSdkParams.agsaVersionName = packageInfo.versionName;
            }
        } catch (NameNotFoundException e) {
            Log.e("LensSdkParamsReader", "Unable to find agsa package: com.google.android.googlequicksearchbox");
        }
        this.lensSdkParams.arStickersAvailabilityStatus = 1;
        if (VERSION.SDK_INT >= 24) {
            Intent stickersIntent = new Intent();
            stickersIntent.setClassName("com.google.ar.lens", "com.google.vr.apps.ornament.app.MainActivity");
            if (this.packageManager.resolveActivity(stickersIntent, 0) != null) {
                this.lensSdkParams.arStickersAvailabilityStatus = 0;
            }
        }
        new QueryGsaTask().execute(new Void[0]);
    }
}
