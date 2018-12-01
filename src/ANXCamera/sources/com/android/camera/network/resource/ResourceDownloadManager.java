package com.android.camera.network.resource;

import android.net.Uri;
import android.util.LongSparseArray;
import com.android.camera.log.Log;
import com.android.camera.network.download.GalleryDownloadManager;
import com.android.camera.network.download.GalleryDownloadManager.OnCompleteListener;
import com.android.camera.network.download.Request;
import com.android.camera.network.download.Verifier.Sha1;
import com.android.camera.network.net.BaseGalleryRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

public class ResourceDownloadManager {
    private static ResourceDownloadManager mInstance;
    private LongSparseArray<Integer> mDownloadState = new LongSparseArray();
    private List<OnDownloadListener> mListeners = new ArrayList();
    private OnCompleteListener mOnCompleteListener = new OnCompleteListener() {
        public void onRequestComplete(Request request, int code) {
            Log.v("ResourceDownloadManager", "download finish " + code);
            long id = Long.parseLong(request.getTag());
            synchronized (ResourceDownloadManager.this.object) {
                ResourceDownloadManager.this.mDownloadState.remove(id);
            }
            if (code == 0) {
                ResourceDownloadManager.this.dispatchListener(id, 3);
            } else {
                ResourceDownloadManager.this.dispatchListener(id, 4);
            }
        }
    };
    private Object object = new Object();

    public static ResourceDownloadManager getInstance() {
        if (mInstance == null) {
            synchronized (ResourceDownloadManager.class) {
                if (mInstance == null) {
                    mInstance = new ResourceDownloadManager();
                }
            }
        }
        return mInstance;
    }

    private ResourceDownloadManager() {
    }

    public void download(Resource resource, DownloadHelper downloadHelper) {
        final long id = resource.id;
        Log.v("ResourceDownloadManager", "downloading " + id);
        final File file = new File(downloadHelper.getDownloadPath(resource));
        if (file.exists()) {
            Log.v("ResourceDownloadManager", "file downloaded " + file);
            dispatchListener(id, 1);
        }
        BaseGalleryRequest request = new BaseGalleryRequest(0, "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/download");
        request.addParam("id", String.valueOf(id));
        request.execute(new ResponseListener() {
            public void onResponse(Object... response) {
                try {
                    JSONObject json = response[0];
                    Log.v("ResourceDownloadManager", String.format("download %s, %s", new Object[]{json.getString("url"), json.getString("sha1Base16")}));
                    Request downloadRequest = new Request(Long.toString(id), Uri.parse(url), file);
                    downloadRequest.setVerifier(new Sha1(sha1));
                    synchronized (this) {
                        ResourceDownloadManager.this.mDownloadState.put(id, Integer.valueOf(2));
                    }
                    GalleryDownloadManager.INSTANCE.enqueue(downloadRequest, ResourceDownloadManager.this.mOnCompleteListener);
                } catch (Throwable e) {
                    Log.w("ResourceDownloadManager", e);
                    ResourceDownloadManager.this.dispatchListener(id, 4);
                }
            }

            public void onResponseError(ErrorCode errorCode, String errorMessage, Object responseData) {
                ResourceDownloadManager.this.dispatchListener(id, 4);
            }
        });
    }

    public void addDownloadListener(OnDownloadListener listener) {
        this.mListeners.add(listener);
    }

    public void removeDownloadListener(OnDownloadListener listener) {
        this.mListeners.remove(listener);
    }

    public int getDownloadState(long id) {
        return ((Integer) this.mDownloadState.get(id, Integer.valueOf(0))).intValue();
    }

    private void dispatchListener(long id, int state) {
        for (OnDownloadListener listener : this.mListeners) {
            listener.onFinish(id, state);
        }
    }
}
