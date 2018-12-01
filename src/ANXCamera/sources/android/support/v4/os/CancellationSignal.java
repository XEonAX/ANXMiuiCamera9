package android.support.v4.os;

import android.os.Build.VERSION;

public final class CancellationSignal {
    private boolean mCancelInProgress;
    private Object mCancellationSignalObj;
    private boolean mIsCanceled;
    private OnCancelListener mOnCancelListener;

    public interface OnCancelListener {
        void onCancel();
    }

    public boolean isCanceled() {
        boolean z;
        synchronized (this) {
            z = this.mIsCanceled;
        }
        return z;
    }

    public void throwIfCanceled() {
        if (isCanceled()) {
            throw new OperationCanceledException();
        }
    }

    /* JADX WARNING: Missing block: B:7:0x0011, code:
            if (r6 != null) goto L_0x0024;
     */
    /* JADX WARNING: Missing block: B:8:0x0013, code:
            if (r7 != null) goto L_0x0033;
     */
    /* JADX WARNING: Missing block: B:9:0x0015, code:
            r0 = r9;
     */
    /* JADX WARNING: Missing block: B:10:0x0016, code:
            monitor-enter(r9);
     */
    /* JADX WARNING: Missing block: B:13:?, code:
            r9.mCancelInProgress = false;
            notifyAll();
     */
    /* JADX WARNING: Missing block: B:14:0x001d, code:
            monitor-exit(r9);
     */
    /* JADX WARNING: Missing block: B:15:0x001e, code:
            return;
     */
    /* JADX WARNING: Missing block: B:23:?, code:
            r6.onCancel();
     */
    /* JADX WARNING: Missing block: B:25:0x0029, code:
            r4 = r9;
     */
    /* JADX WARNING: Missing block: B:26:0x002a, code:
            monitor-enter(r9);
     */
    /* JADX WARNING: Missing block: B:29:?, code:
            r9.mCancelInProgress = false;
            notifyAll();
     */
    /* JADX WARNING: Missing block: B:33:?, code:
            android.support.v4.os.CancellationSignalCompatJellybean.cancel(r7);
     */
    public void cancel() {
        /*
        r9 = this;
        r0 = r9;
        monitor-enter(r9);
        r8 = r9.mIsCanceled;	 Catch:{ all -> 0x0021 }
        if (r8 != 0) goto L_0x001f;
    L_0x0006:
        r8 = 1;
        r9.mIsCanceled = r8;	 Catch:{ all -> 0x0021 }
        r8 = 1;
        r9.mCancelInProgress = r8;	 Catch:{ all -> 0x0021 }
        r6 = r9.mOnCancelListener;	 Catch:{ all -> 0x0021 }
        r7 = r9.mCancellationSignalObj;	 Catch:{ all -> 0x0021 }
        monitor-exit(r9);	 Catch:{ all -> 0x0021 }
        if (r6 != 0) goto L_0x0024;
    L_0x0013:
        if (r7 != 0) goto L_0x0033;
    L_0x0015:
        r0 = r9;
        monitor-enter(r9);
        r8 = 0;
        r9.mCancelInProgress = r8;	 Catch:{ all -> 0x0037 }
        r9.notifyAll();	 Catch:{ all -> 0x0037 }
        monitor-exit(r9);	 Catch:{ all -> 0x0037 }
        return;
    L_0x001f:
        monitor-exit(r9);	 Catch:{ all -> 0x0021 }
        return;
    L_0x0021:
        r1 = move-exception;
        monitor-exit(r9);	 Catch:{ all -> 0x0021 }
        throw r1;
    L_0x0024:
        r6.onCancel();	 Catch:{ all -> 0x0028 }
        goto L_0x0013;
    L_0x0028:
        r3 = move-exception;
        r4 = r9;
        monitor-enter(r9);
        r8 = 0;
        r9.mCancelInProgress = r8;	 Catch:{ all -> 0x003a }
        r9.notifyAll();	 Catch:{ all -> 0x003a }
        monitor-exit(r9);	 Catch:{ all -> 0x003a }
        throw r3;
    L_0x0033:
        android.support.v4.os.CancellationSignalCompatJellybean.cancel(r7);	 Catch:{ all -> 0x0028 }
        goto L_0x0015;
    L_0x0037:
        r2 = move-exception;
        monitor-exit(r9);	 Catch:{ all -> 0x0037 }
        throw r2;
    L_0x003a:
        r5 = move-exception;
        monitor-exit(r9);	 Catch:{ all -> 0x003a }
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.os.CancellationSignal.cancel():void");
    }

    /* JADX WARNING: Missing block: B:8:0x0010, code:
            return;
     */
    public void setOnCancelListener(android.support.v4.os.CancellationSignal.OnCancelListener r4) {
        /*
        r3 = this;
        r0 = r3;
        monitor-enter(r3);
        r3.waitForCancelFinishedLocked();	 Catch:{ all -> 0x001a }
        r2 = r3.mOnCancelListener;	 Catch:{ all -> 0x001a }
        if (r2 == r4) goto L_0x0011;
    L_0x0009:
        r3.mOnCancelListener = r4;	 Catch:{ all -> 0x001a }
        r2 = r3.mIsCanceled;	 Catch:{ all -> 0x001a }
        if (r2 != 0) goto L_0x0013;
    L_0x000f:
        monitor-exit(r3);	 Catch:{ all -> 0x001a }
        return;
    L_0x0011:
        monitor-exit(r3);	 Catch:{ all -> 0x001a }
        return;
    L_0x0013:
        if (r4 == 0) goto L_0x000f;
    L_0x0015:
        monitor-exit(r3);	 Catch:{ all -> 0x001a }
        r4.onCancel();
        return;
    L_0x001a:
        r1 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x001a }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.os.CancellationSignal.setOnCancelListener(android.support.v4.os.CancellationSignal$OnCancelListener):void");
    }

    public Object getCancellationSignalObject() {
        if (VERSION.SDK_INT < 16) {
            return null;
        }
        Object obj;
        synchronized (this) {
            if (this.mCancellationSignalObj == null) {
                this.mCancellationSignalObj = CancellationSignalCompatJellybean.create();
                if (this.mIsCanceled) {
                    CancellationSignalCompatJellybean.cancel(this.mCancellationSignalObj);
                }
            }
            obj = this.mCancellationSignalObj;
        }
        return obj;
    }

    private void waitForCancelFinishedLocked() {
        while (this.mCancelInProgress) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
    }
}
