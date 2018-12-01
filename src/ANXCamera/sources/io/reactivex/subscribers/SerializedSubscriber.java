package io.reactivex.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.NotificationLite;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class SerializedSubscriber<T> implements FlowableSubscriber<T>, Subscription {
    final Subscriber<? super T> actual;
    final boolean delayError;
    volatile boolean done;
    boolean emitting;
    AppendOnlyLinkedArrayList<Object> queue;
    Subscription subscription;

    public SerializedSubscriber(Subscriber<? super T> actual) {
        this(actual, false);
    }

    public SerializedSubscriber(Subscriber<? super T> actual, boolean delayError) {
        this.actual = actual;
        this.delayError = delayError;
    }

    public void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.subscription, s)) {
            this.subscription = s;
            this.actual.onSubscribe(this);
        }
    }

    public void onNext(T t) {
        if (!this.done) {
            if (t != null) {
                synchronized (this) {
                    if (this.done) {
                        return;
                    } else if (this.emitting) {
                        AppendOnlyLinkedArrayList<Object> q = this.queue;
                        if (q == null) {
                            q = new AppendOnlyLinkedArrayList(4);
                            this.queue = q;
                        }
                        q.add(NotificationLite.next(t));
                        return;
                    } else {
                        this.emitting = true;
                        this.actual.onNext(t);
                        emitLoop();
                        return;
                    }
                }
            }
            this.subscription.cancel();
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
        }
    }

    /* JADX WARNING: Missing block: B:11:0x0016, code:
            if (r4 != false) goto L_0x0048;
     */
    /* JADX WARNING: Missing block: B:12:0x0018, code:
            r6.actual.onError(r7);
     */
    /* JADX WARNING: Missing block: B:13:0x001d, code:
            return;
     */
    /* JADX WARNING: Missing block: B:25:0x0037, code:
            return;
     */
    /* JADX WARNING: Missing block: B:32:0x0048, code:
            io.reactivex.plugins.RxJavaPlugins.onError(r7);
     */
    /* JADX WARNING: Missing block: B:33:0x004b, code:
            return;
     */
    public void onError(java.lang.Throwable r7) {
        /*
        r6 = this;
        r5 = r6.done;
        if (r5 != 0) goto L_0x001e;
    L_0x0004:
        r0 = r6;
        monitor-enter(r6);
        r5 = r6.done;	 Catch:{ all -> 0x0041 }
        if (r5 != 0) goto L_0x0022;
    L_0x000a:
        r5 = r6.emitting;	 Catch:{ all -> 0x0041 }
        if (r5 != 0) goto L_0x0024;
    L_0x000e:
        r5 = 1;
        r6.done = r5;	 Catch:{ all -> 0x0041 }
        r5 = 1;
        r6.emitting = r5;	 Catch:{ all -> 0x0041 }
        r4 = 0;
    L_0x0015:
        monitor-exit(r6);	 Catch:{ all -> 0x0041 }
        if (r4 != 0) goto L_0x0048;
    L_0x0018:
        r5 = r6.actual;
        r5.onError(r7);
        return;
    L_0x001e:
        io.reactivex.plugins.RxJavaPlugins.onError(r7);
        return;
    L_0x0022:
        r4 = 1;
        goto L_0x0015;
    L_0x0024:
        r5 = 1;
        r6.done = r5;	 Catch:{ all -> 0x0041 }
        r3 = r6.queue;	 Catch:{ all -> 0x0041 }
        if (r3 == 0) goto L_0x0038;
    L_0x002b:
        r2 = io.reactivex.internal.util.NotificationLite.error(r7);	 Catch:{ all -> 0x0041 }
        r5 = r6.delayError;	 Catch:{ all -> 0x0041 }
        if (r5 != 0) goto L_0x0044;
    L_0x0033:
        r3.setFirst(r2);	 Catch:{ all -> 0x0041 }
    L_0x0036:
        monitor-exit(r6);	 Catch:{ all -> 0x0041 }
        return;
    L_0x0038:
        r3 = new io.reactivex.internal.util.AppendOnlyLinkedArrayList;	 Catch:{ all -> 0x0041 }
        r5 = 4;
        r3.<init>(r5);	 Catch:{ all -> 0x0041 }
        r6.queue = r3;	 Catch:{ all -> 0x0041 }
        goto L_0x002b;
    L_0x0041:
        r1 = move-exception;
        monitor-exit(r6);	 Catch:{ all -> 0x0041 }
        throw r1;
    L_0x0044:
        r3.add(r2);	 Catch:{ all -> 0x0041 }
        goto L_0x0036;
    L_0x0048:
        io.reactivex.plugins.RxJavaPlugins.onError(r7);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.subscribers.SerializedSubscriber.onError(java.lang.Throwable):void");
    }

    public void onComplete() {
        if (!this.done) {
            synchronized (this) {
                if (this.done) {
                } else if (this.emitting) {
                    AppendOnlyLinkedArrayList<Object> q = this.queue;
                    if (q == null) {
                        q = new AppendOnlyLinkedArrayList(4);
                        this.queue = q;
                    }
                    q.add(NotificationLite.complete());
                } else {
                    this.done = true;
                    this.emitting = true;
                    this.actual.onComplete();
                }
            }
        }
    }

    void emitLoop() {
        AppendOnlyLinkedArrayList<Object> q;
        do {
            synchronized (this) {
                q = this.queue;
                if (q != null) {
                    this.queue = null;
                } else {
                    this.emitting = false;
                    return;
                }
            }
        } while (!q.accept(this.actual));
    }

    public void request(long n) {
        this.subscription.request(n);
    }

    public void cancel() {
        this.subscription.cancel();
    }
}
