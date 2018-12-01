package com.android.camera.network.net;

import android.content.Context;
import com.android.camera.sticker.FileUtils;
import com.android.volley.Request;
import com.android.volley.RequestQueue;

public class HttpManager {
    private static HttpManager instance;
    private Context mContext;
    private GalleryCache mRequestCache;
    private RequestQueue mRequestQueue;

    public static synchronized HttpManager getInstance() {
        HttpManager httpManager;
        synchronized (HttpManager.class) {
            if (instance == null) {
                instance = new HttpManager();
            }
            httpManager = instance;
        }
        return httpManager;
    }

    public void putToCache(String key, byte[] data, long expires, long softTtl) {
        this.mRequestCache.put(key, data, expires, softTtl);
    }

    public void putDefaultCache(String key, String assetName) {
        if (!this.mRequestCache.isCacheValid(key)) {
            FileUtils.copyFileIfNeed(this.mContext, this.mRequestCache.getFileForKey(key), assetName);
            this.mRequestCache.initialize();
        }
    }

    public <T> void addToRequestQueue(Request<T> req) {
        this.mRequestQueue.add(req);
    }
}
