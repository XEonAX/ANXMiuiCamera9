package android.support.v4.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class LruCache<K, V> {
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private final LinkedHashMap<K, V> map;
    private int maxSize;
    private int missCount;
    private int putCount;
    private int size;

    public LruCache(int maxSize) {
        if (maxSize > 0) {
            this.maxSize = maxSize;
            this.map = new LinkedHashMap(0, 0.75f, true);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    public void resize(int maxSize) {
        if (maxSize > 0) {
            synchronized (this) {
                this.maxSize = maxSize;
            }
            trimToSize(maxSize);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    /* JADX WARNING: Missing block: B:9:0x0014, code:
            r3 = create(r8);
     */
    /* JADX WARNING: Missing block: B:10:0x0018, code:
            if (r3 == null) goto L_0x0050;
     */
    /* JADX WARNING: Missing block: B:11:0x001a, code:
            r1 = r7;
     */
    /* JADX WARNING: Missing block: B:12:0x001b, code:
            monitor-enter(r7);
     */
    /* JADX WARNING: Missing block: B:14:?, code:
            r7.createCount++;
            r4 = r7.map.put(r8, r3);
     */
    /* JADX WARNING: Missing block: B:15:0x0028, code:
            if (r4 != null) goto L_0x0051;
     */
    /* JADX WARNING: Missing block: B:16:0x002a, code:
            r7.size += safeSizeOf(r8, r3);
     */
    /* JADX WARNING: Missing block: B:17:0x0033, code:
            monitor-exit(r7);
     */
    /* JADX WARNING: Missing block: B:18:0x0034, code:
            if (r4 != null) goto L_0x005a;
     */
    /* JADX WARNING: Missing block: B:19:0x0036, code:
            trimToSize(r7.maxSize);
     */
    /* JADX WARNING: Missing block: B:20:0x003b, code:
            return r3;
     */
    /* JADX WARNING: Missing block: B:30:0x0050, code:
            return null;
     */
    /* JADX WARNING: Missing block: B:32:?, code:
            r7.map.put(r8, r4);
     */
    /* JADX WARNING: Missing block: B:36:0x005a, code:
            entryRemoved(false, r8, r3, r4);
     */
    /* JADX WARNING: Missing block: B:37:0x005e, code:
            return r4;
     */
    public final V get(K r8) {
        /*
        r7 = this;
        r6 = 0;
        if (r8 == 0) goto L_0x003c;
    L_0x0003:
        r0 = r7;
        monitor-enter(r7);
        r5 = r7.map;	 Catch:{ all -> 0x004d }
        r4 = r5.get(r8);	 Catch:{ all -> 0x004d }
        if (r4 != 0) goto L_0x0045;
    L_0x000d:
        r5 = r7.missCount;	 Catch:{ all -> 0x004d }
        r5 = r5 + 1;
        r7.missCount = r5;	 Catch:{ all -> 0x004d }
        monitor-exit(r7);	 Catch:{ all -> 0x004d }
        r3 = r7.create(r8);
        if (r3 == 0) goto L_0x0050;
    L_0x001a:
        r1 = r7;
        monitor-enter(r7);
        r5 = r7.createCount;	 Catch:{ all -> 0x0057 }
        r5 = r5 + 1;
        r7.createCount = r5;	 Catch:{ all -> 0x0057 }
        r5 = r7.map;	 Catch:{ all -> 0x0057 }
        r4 = r5.put(r8, r3);	 Catch:{ all -> 0x0057 }
        if (r4 != 0) goto L_0x0051;
    L_0x002a:
        r5 = r7.size;	 Catch:{ all -> 0x0057 }
        r6 = r7.safeSizeOf(r8, r3);	 Catch:{ all -> 0x0057 }
        r5 = r5 + r6;
        r7.size = r5;	 Catch:{ all -> 0x0057 }
    L_0x0033:
        monitor-exit(r7);	 Catch:{ all -> 0x0057 }
        if (r4 != 0) goto L_0x005a;
    L_0x0036:
        r5 = r7.maxSize;
        r7.trimToSize(r5);
        return r3;
    L_0x003c:
        r5 = new java.lang.NullPointerException;
        r6 = "key == null";
        r5.<init>(r6);
        throw r5;
    L_0x0045:
        r5 = r7.hitCount;	 Catch:{ all -> 0x004d }
        r5 = r5 + 1;
        r7.hitCount = r5;	 Catch:{ all -> 0x004d }
        monitor-exit(r7);	 Catch:{ all -> 0x004d }
        return r4;
    L_0x004d:
        r1 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x004d }
        throw r1;
    L_0x0050:
        return r6;
    L_0x0051:
        r5 = r7.map;	 Catch:{ all -> 0x0057 }
        r5.put(r8, r4);	 Catch:{ all -> 0x0057 }
        goto L_0x0033;
    L_0x0057:
        r2 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x0057 }
        throw r2;
    L_0x005a:
        r5 = 0;
        r7.entryRemoved(r5, r8, r3, r4);
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.util.LruCache.get(java.lang.Object):V");
    }

    public final V put(K key, V value) {
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        V previous;
        synchronized (this) {
            this.putCount++;
            this.size += safeSizeOf(key, value);
            previous = this.map.put(key, value);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, value);
        }
        trimToSize(this.maxSize);
        return previous;
    }

    /* JADX WARNING: Missing block: B:16:0x0038, code:
            return;
     */
    public void trimToSize(int r9) {
        /*
        r8 = this;
    L_0x0000:
        r0 = r8;
        monitor-enter(r8);
        r5 = r8.size;	 Catch:{ all -> 0x0028 }
        if (r5 >= 0) goto L_0x002b;
    L_0x0006:
        r5 = new java.lang.IllegalStateException;	 Catch:{ all -> 0x0028 }
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0028 }
        r6.<init>();	 Catch:{ all -> 0x0028 }
        r7 = r8.getClass();	 Catch:{ all -> 0x0028 }
        r7 = r7.getName();	 Catch:{ all -> 0x0028 }
        r6 = r6.append(r7);	 Catch:{ all -> 0x0028 }
        r7 = ".sizeOf() is reporting inconsistent results!";
        r6 = r6.append(r7);	 Catch:{ all -> 0x0028 }
        r6 = r6.toString();	 Catch:{ all -> 0x0028 }
        r5.<init>(r6);	 Catch:{ all -> 0x0028 }
        throw r5;	 Catch:{ all -> 0x0028 }
    L_0x0028:
        r1 = move-exception;
        monitor-exit(r8);	 Catch:{ all -> 0x0028 }
        throw r1;
    L_0x002b:
        r5 = r8.map;	 Catch:{ all -> 0x0028 }
        r5 = r5.isEmpty();	 Catch:{ all -> 0x0028 }
        if (r5 != 0) goto L_0x0039;
    L_0x0033:
        r5 = r8.size;	 Catch:{ all -> 0x0028 }
        if (r5 > r9) goto L_0x003e;
    L_0x0037:
        monitor-exit(r8);	 Catch:{ all -> 0x0028 }
        return;
    L_0x0039:
        r5 = r8.size;	 Catch:{ all -> 0x0028 }
        if (r5 != 0) goto L_0x0006;
    L_0x003d:
        goto L_0x0033;
    L_0x003e:
        r5 = r8.map;	 Catch:{ all -> 0x0028 }
        r5 = r5.isEmpty();	 Catch:{ all -> 0x0028 }
        if (r5 != 0) goto L_0x0037;
    L_0x0046:
        r5 = r8.map;	 Catch:{ all -> 0x0028 }
        r5 = r5.entrySet();	 Catch:{ all -> 0x0028 }
        r5 = r5.iterator();	 Catch:{ all -> 0x0028 }
        r3 = r5.next();	 Catch:{ all -> 0x0028 }
        r3 = (java.util.Map.Entry) r3;	 Catch:{ all -> 0x0028 }
        r2 = r3.getKey();	 Catch:{ all -> 0x0028 }
        r4 = r3.getValue();	 Catch:{ all -> 0x0028 }
        r5 = r8.map;	 Catch:{ all -> 0x0028 }
        r5.remove(r2);	 Catch:{ all -> 0x0028 }
        r5 = r8.size;	 Catch:{ all -> 0x0028 }
        r6 = r8.safeSizeOf(r2, r4);	 Catch:{ all -> 0x0028 }
        r5 = r5 - r6;
        r8.size = r5;	 Catch:{ all -> 0x0028 }
        r5 = r8.evictionCount;	 Catch:{ all -> 0x0028 }
        r5 = r5 + 1;
        r8.evictionCount = r5;	 Catch:{ all -> 0x0028 }
        monitor-exit(r8);	 Catch:{ all -> 0x0028 }
        r5 = 1;
        r6 = 0;
        r8.entryRemoved(r5, r2, r4, r6);
        goto L_0x0000;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.util.LruCache.trimToSize(int):void");
    }

    public final V remove(K key) {
        if (key != null) {
            V previous;
            synchronized (this) {
                previous = this.map.remove(key);
                if (previous != null) {
                    this.size -= safeSizeOf(key, previous);
                }
            }
            if (previous != null) {
                entryRemoved(false, key, previous, null);
            }
            return previous;
        }
        throw new NullPointerException("key == null");
    }

    protected void entryRemoved(boolean evicted, K k, V v, V v2) {
    }

    protected V create(K k) {
        return null;
    }

    private int safeSizeOf(K key, V value) {
        int result = sizeOf(key, value);
        if (result >= 0) {
            return result;
        }
        throw new IllegalStateException("Negative size: " + key + "=" + value);
    }

    protected int sizeOf(K k, V v) {
        return 1;
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    public final synchronized int size() {
        return this.size;
    }

    public final synchronized int maxSize() {
        return this.maxSize;
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int createCount() {
        return this.createCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }

    public final synchronized Map<K, V> snapshot() {
        return new LinkedHashMap(this.map);
    }

    public final synchronized String toString() {
        String format;
        int hitPercent = 0;
        synchronized (this) {
            int accesses = this.hitCount + this.missCount;
            if (accesses != 0) {
                hitPercent = (this.hitCount * 100) / accesses;
            }
            format = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", new Object[]{Integer.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(hitPercent)});
        }
        return format;
    }
}
