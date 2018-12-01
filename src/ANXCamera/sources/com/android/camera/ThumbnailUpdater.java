package com.android.camera;

import android.content.ContentResolver;
import android.net.Uri;
import android.os.AsyncTask;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import java.io.File;

public class ThumbnailUpdater {
    private ActivityBase mActivityBase;
    private ContentResolver mContentResolver = this.mActivityBase.getContentResolver();
    private AsyncTask<Void, Void, Thumbnail> mLoadThumbnailTask;
    private Thumbnail mThumbnail;

    private class LoadThumbnailTask extends AsyncTask<Void, Void, Thumbnail> {
        private boolean mLookAtCache;

        public LoadThumbnailTask(boolean lookAtCache) {
            this.mLookAtCache = lookAtCache;
        }

        protected Thumbnail doInBackground(Void... params) {
            Thumbnail t = null;
            if (isCancelled()) {
                return null;
            }
            if (ThumbnailUpdater.this.mThumbnail != null) {
                Uri thumbnailUri = ThumbnailUpdater.this.mThumbnail.getUri();
                if (Util.isUriValid(thumbnailUri, ThumbnailUpdater.this.mContentResolver) && thumbnailUri.equals(Thumbnail.getLastThumbnailUri(ThumbnailUpdater.this.mContentResolver))) {
                    return ThumbnailUpdater.this.mThumbnail;
                }
                Module module = ThumbnailUpdater.this.mActivityBase.getCurrentModule();
                if (module != null && module.shouldReleaseLater()) {
                    return ThumbnailUpdater.this.mThumbnail;
                }
            }
            if ((!(ThumbnailUpdater.this.mActivityBase.startFromSecureKeyguard() || (ThumbnailUpdater.this.mActivityBase.isGalleryLocked() ^ 1) == 0) || (ThumbnailUpdater.this.mActivityBase.getSecureUriList() != null && ThumbnailUpdater.this.mActivityBase.getSecureUriList().size() > 0)) && this.mLookAtCache) {
                t = Thumbnail.getLastThumbnailFromFile(ThumbnailUpdater.this.mActivityBase.getFilesDir(), ThumbnailUpdater.this.mContentResolver);
            }
            if (isCancelled()) {
                return null;
            }
            int code;
            Uri uri = null;
            if (t != null) {
                uri = t.getUri();
            }
            Thumbnail[] result = new Thumbnail[1];
            if (ThumbnailUpdater.this.mActivityBase.startFromSecureKeyguard() || (ThumbnailUpdater.this.mActivityBase.isGalleryLocked() ^ 1) == 0) {
                code = Thumbnail.getLastThumbnailFromUriList(ThumbnailUpdater.this.mContentResolver, result, ThumbnailUpdater.this.mActivityBase.getSecureUriList(), uri);
            } else {
                code = Thumbnail.getLastThumbnailFromContentResolver(ThumbnailUpdater.this.mContentResolver, result, uri);
            }
            switch (code) {
                case -1:
                    return t;
                case 0:
                    return null;
                case 1:
                    return result[0];
                case 2:
                    cancel(true);
                    return null;
                default:
                    return null;
            }
        }

        protected void onPostExecute(Thumbnail thumbnail) {
            if (!isCancelled()) {
                ThumbnailUpdater.this.setThumbnail(thumbnail, true, false);
            }
        }
    }

    private class SaveThumbnailTask extends AsyncTask<Thumbnail, Void, Void> {
        /* synthetic */ SaveThumbnailTask(ThumbnailUpdater this$0, SaveThumbnailTask -this1) {
            this();
        }

        private SaveThumbnailTask() {
        }

        protected Void doInBackground(Thumbnail... params) {
            File filesDir = ThumbnailUpdater.this.mActivityBase.getFilesDir();
            for (Thumbnail saveLastThumbnailToFile : params) {
                saveLastThumbnailToFile.saveLastThumbnailToFile(filesDir);
            }
            return null;
        }
    }

    public ThumbnailUpdater(ActivityBase activity) {
        this.mActivityBase = activity;
    }

    public Thumbnail getThumbnail() {
        return this.mThumbnail;
    }

    public void setThumbnail(Thumbnail t, boolean update, boolean needAnimation) {
        this.mThumbnail = t;
        if (update) {
            updateThumbnailView(needAnimation);
        }
    }

    public void updatePreviewThumbnailUri(Uri uri) {
        if (this.mThumbnail != null) {
            this.mThumbnail.setUri(uri);
        }
    }

    public void updateThumbnailView(final boolean needAnimation) {
        this.mActivityBase.runOnUiThread(new Runnable() {
            public void run() {
                ModeProtocol$ActionProcessing actionProcessing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                if (actionProcessing == null) {
                    Log.e("ThumbnailUpdater", "won't update thumbnail", new RuntimeException());
                } else {
                    actionProcessing.updateThumbnail(ThumbnailUpdater.this.mThumbnail, needAnimation);
                }
            }
        });
    }

    public void cancelTask() {
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
            this.mLoadThumbnailTask = null;
        }
    }

    public void getLastThumbnail() {
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
        }
        this.mLoadThumbnailTask = new LoadThumbnailTask(true).execute(new Void[0]);
    }

    public void getLastThumbnailUncached() {
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
        }
        this.mLoadThumbnailTask = new LoadThumbnailTask(false).execute(new Void[0]);
    }

    public void saveThumbnailToFile() {
        if (this.mThumbnail != null && (this.mThumbnail.fromFile() ^ 1) != 0) {
            new SaveThumbnailTask(this, null).execute(new Thumbnail[]{this.mThumbnail});
        }
    }
}
