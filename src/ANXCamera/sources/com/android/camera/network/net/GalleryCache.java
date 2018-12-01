package com.android.camera.network.net;

import com.android.camera.log.Log;
import com.android.volley.Cache.Entry;
import com.android.volley.toolbox.DiskBasedCache;
import java.util.HashMap;

public class GalleryCache extends DiskBasedCache {
    @Deprecated
    public synchronized void put(String key, Entry entry) {
    }

    public synchronized void put(String key, byte[] data, long expires, long softTtl) {
        int i = 0;
        synchronized (this) {
            Entry entry = new Entry();
            entry.data = data;
            entry.ttl = expires;
            entry.softTtl = softTtl;
            super.put(key, entry);
            String str = "GalleryCache";
            String str2 = "put cache. key %s size %s expires %s";
            Object[] objArr = new Object[3];
            objArr[0] = Integer.valueOf(key.hashCode());
            if (data != null) {
                i = data.length;
            }
            objArr[1] = Integer.valueOf(i);
            objArr[2] = Long.valueOf(expires);
            Log.d(str, String.format(str2, objArr));
        }
    }

    public synchronized Entry get(String key) {
        Entry entry;
        entry = super.get(key);
        if (entry != null) {
            HashMap<String, String> headers = new HashMap();
            headers.put("From-Cache", String.valueOf(true));
            entry.responseHeaders = headers;
            Log.d("GalleryCache", String.format("get cache: key %s, isExpired: %s", new Object[]{Integer.valueOf(key.hashCode()), Boolean.valueOf(entry.isExpired())}));
            if (!entry.isExpired()) {
                Log.d("GalleryCache", "cache hit.");
            }
        }
        return entry;
    }

    public synchronized boolean isCacheValid(String key) {
        Entry entry = super.get(key);
        if (entry == null || entry.isExpired()) {
            return false;
        }
        return true;
    }
}
