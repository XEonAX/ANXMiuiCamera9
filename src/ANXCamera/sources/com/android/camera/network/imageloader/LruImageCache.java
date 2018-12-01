package com.android.camera.network.imageloader;

import android.graphics.Bitmap;
import android.util.LruCache;
import com.android.volley.toolbox.ImageLoader.ImageCache;

class LruImageCache implements ImageCache {
    private LruCache<String, Bitmap> lruCache = new LruCache<String, Bitmap>(this.max) {
        protected int sizeOf(String key, Bitmap value) {
            return value.getRowBytes() * value.getHeight();
        }
    };
    private int max = 5242880;

    public Bitmap getBitmap(String url) {
        return (Bitmap) this.lruCache.get(url);
    }

    public void putBitmap(String url, Bitmap bitmap) {
        this.lruCache.put(url, bitmap);
    }
}
