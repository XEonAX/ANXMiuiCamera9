package com.android.camera.network.download;

import android.net.Uri;
import android.text.TextUtils;
import com.android.camera.log.Log;
import java.io.File;

public final class Request {
    private boolean mAllowedOverMetered;
    private File mDestination;
    private int mMaxRetryTimes = 3;
    private String mTag;
    private Uri mUri;
    private Verifier mVerifier;

    public Request(String tag, Uri uri, File destination) {
        this.mTag = tag;
        this.mUri = uri;
        String scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || (TextUtils.equals(scheme, "https") ^ 1) == 0) {
            if (destination.exists()) {
                if (destination.isDirectory()) {
                    Log.d("Request", "output file is a directory");
                    throw new IllegalStateException("dst file exists, is a directory");
                }
                Log.w("Request", "output file will be overwritten");
            }
            this.mDestination = destination;
            return;
        }
        throw new IllegalArgumentException("not support scheme: " + scheme);
    }

    public String getTag() {
        return this.mTag;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public File getDestination() {
        return this.mDestination;
    }

    public Verifier getVerifier() {
        return this.mVerifier;
    }

    public void setVerifier(Verifier verifier) {
        this.mVerifier = verifier;
    }

    public int getMaxRetryTimes() {
        return this.mMaxRetryTimes;
    }

    int getNetworkType() {
        return this.mAllowedOverMetered ? 0 : 1;
    }
}
