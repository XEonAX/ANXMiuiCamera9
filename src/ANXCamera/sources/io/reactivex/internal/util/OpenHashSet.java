package io.reactivex.internal.util;

public final class OpenHashSet<T> {
    T[] keys;
    final float loadFactor;
    int mask;
    int maxSize;
    int size;

    public OpenHashSet() {
        this(16, 0.75f);
    }

    public OpenHashSet(int capacity, float loadFactor) {
        this.loadFactor = loadFactor;
        int c = Pow2.roundToPowerOfTwo(capacity);
        this.mask = c - 1;
        this.maxSize = (int) (((float) c) * loadFactor);
        this.keys = new Object[c];
    }

    public boolean add(T value) {
        T[] a = this.keys;
        int m = this.mask;
        int pos = mix(value.hashCode()) & m;
        T curr = a[pos];
        if (curr != null) {
            if (curr.equals(value)) {
                return false;
            }
            do {
                pos = (pos + 1) & m;
                curr = a[pos];
                if (curr != null) {
                }
            } while (!curr.equals(value));
            return false;
        }
        a[pos] = value;
        int i = this.size + 1;
        this.size = i;
        if (i >= this.maxSize) {
            rehash();
        }
        return true;
    }

    public boolean remove(T value) {
        T[] a = this.keys;
        int m = this.mask;
        int pos = mix(value.hashCode()) & m;
        T curr = a[pos];
        if (curr == null) {
            return false;
        }
        if (curr.equals(value)) {
            return removeEntry(pos, a, m);
        }
        do {
            pos = (pos + 1) & m;
            curr = a[pos];
            if (curr == null) {
                return false;
            }
        } while (!curr.equals(value));
        return removeEntry(pos, a, m);
    }

    boolean removeEntry(int pos, T[] a, int m) {
        this.size--;
        while (true) {
            T curr;
            int last = pos;
            while (true) {
                pos = (pos + 1) & m;
                curr = a[pos];
                if (curr != null) {
                    int slot = mix(curr.hashCode()) & m;
                    if (last <= pos) {
                        if (last >= slot || slot > pos) {
                            break;
                        }
                    } else if (last >= slot && slot > pos) {
                        break;
                    }
                }
                a[last] = null;
                return true;
            }
            a[last] = curr;
        }
    }

    void rehash() {
        T[] a = this.keys;
        int i = a.length;
        int newCap = i << 1;
        int m = newCap - 1;
        Object[] b = (Object[]) new Object[newCap];
        int j = this.size;
        while (true) {
            int j2 = j;
            j = j2 - 1;
            if (j2 == 0) {
                this.mask = m;
                this.maxSize = (int) (((float) newCap) * this.loadFactor);
                this.keys = b;
                return;
            }
            do {
                i--;
            } while (a[i] == null);
            int pos = mix(a[i].hashCode()) & m;
            if (b[pos] != null) {
                while (true) {
                    pos = (pos + 1) & m;
                    if (b[pos] == null) {
                        break;
                    }
                }
            }
            b[pos] = a[i];
        }
    }

    static int mix(int x) {
        int h = x * -1640531527;
        return (h >>> 16) ^ h;
    }

    public Object[] keys() {
        return this.keys;
    }
}
