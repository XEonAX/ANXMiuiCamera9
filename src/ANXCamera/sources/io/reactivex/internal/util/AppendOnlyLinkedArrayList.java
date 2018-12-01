package io.reactivex.internal.util;

import org.reactivestreams.Subscriber;

public class AppendOnlyLinkedArrayList<T> {
    final int capacity;
    final Object[] head;
    int offset;
    Object[] tail = this.head;

    public AppendOnlyLinkedArrayList(int capacity) {
        this.capacity = capacity;
        this.head = new Object[(capacity + 1)];
    }

    public void add(T value) {
        int c = this.capacity;
        int o = this.offset;
        if (o == c) {
            Object[] next = new Object[(c + 1)];
            this.tail[c] = next;
            this.tail = next;
            o = 0;
        }
        this.tail[o] = value;
        this.offset = o + 1;
    }

    public void setFirst(T value) {
        this.head[0] = value;
    }

    public <U> boolean accept(Subscriber<? super U> subscriber) {
        int c = this.capacity;
        for (Object[] a = this.head; a != null; a = (Object[]) a[c]) {
            int i = 0;
            while (i < c) {
                Object o = a[i];
                if (o == null) {
                    continue;
                    break;
                } else if (NotificationLite.acceptFull(o, subscriber)) {
                    return true;
                } else {
                    i++;
                }
            }
        }
        return false;
    }
}
