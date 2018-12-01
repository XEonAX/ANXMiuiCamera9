package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Message;
import java.util.ArrayList;
import java.util.HashMap;

public class LocalBroadcastManager {
    private static final boolean DEBUG = false;
    static final int MSG_EXEC_PENDING_BROADCASTS = 1;
    private static final String TAG = "LocalBroadcastManager";
    private static LocalBroadcastManager mInstance;
    private static final Object mLock = new Object();
    private final HashMap<String, ArrayList<ReceiverRecord>> mActions = new HashMap();
    private final Context mAppContext;
    private final Handler mHandler;
    private final ArrayList<BroadcastRecord> mPendingBroadcasts = new ArrayList();
    private final HashMap<BroadcastReceiver, ArrayList<IntentFilter>> mReceivers = new HashMap();

    private static class BroadcastRecord {
        final Intent intent;
        final ArrayList<ReceiverRecord> receivers;

        BroadcastRecord(Intent _intent, ArrayList<ReceiverRecord> _receivers) {
            this.intent = _intent;
            this.receivers = _receivers;
        }
    }

    private static class ReceiverRecord {
        boolean broadcasting;
        final IntentFilter filter;
        final BroadcastReceiver receiver;

        ReceiverRecord(IntentFilter _filter, BroadcastReceiver _receiver) {
            this.filter = _filter;
            this.receiver = _receiver;
        }

        public String toString() {
            StringBuilder builder = new StringBuilder(128);
            builder.append("Receiver{");
            builder.append(this.receiver);
            builder.append(" filter=");
            builder.append(this.filter);
            builder.append("}");
            return builder.toString();
        }
    }

    public static LocalBroadcastManager getInstance(Context context) {
        LocalBroadcastManager localBroadcastManager;
        synchronized (mLock) {
            if (mInstance == null) {
                mInstance = new LocalBroadcastManager(context.getApplicationContext());
            }
            localBroadcastManager = mInstance;
        }
        return localBroadcastManager;
    }

    private LocalBroadcastManager(Context context) {
        this.mAppContext = context;
        this.mHandler = new Handler(context.getMainLooper()) {
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        LocalBroadcastManager.this.executePendingBroadcasts();
                        return;
                    default:
                        super.handleMessage(msg);
                        return;
                }
            }
        };
    }

    public void registerReceiver(BroadcastReceiver receiver, IntentFilter filter) {
        synchronized (this.mReceivers) {
            ReceiverRecord entry = new ReceiverRecord(filter, receiver);
            ArrayList<IntentFilter> filters = (ArrayList) this.mReceivers.get(receiver);
            if (filters == null) {
                filters = new ArrayList(1);
                this.mReceivers.put(receiver, filters);
            }
            filters.add(filter);
            for (int i = 0; i < filter.countActions(); i++) {
                String action = filter.getAction(i);
                ArrayList<ReceiverRecord> entries = (ArrayList) this.mActions.get(action);
                if (entries == null) {
                    entries = new ArrayList(1);
                    this.mActions.put(action, entries);
                }
                entries.add(entry);
            }
        }
    }

    public void unregisterReceiver(BroadcastReceiver receiver) {
        synchronized (this.mReceivers) {
            ArrayList<IntentFilter> filters = (ArrayList) this.mReceivers.remove(receiver);
            if (filters != null) {
                for (int i = 0; i < filters.size(); i++) {
                    IntentFilter filter = (IntentFilter) filters.get(i);
                    for (int j = 0; j < filter.countActions(); j++) {
                        String action = filter.getAction(j);
                        ArrayList<ReceiverRecord> receivers = (ArrayList) this.mActions.get(action);
                        if (receivers != null) {
                            int k = 0;
                            while (k < receivers.size()) {
                                if (((ReceiverRecord) receivers.get(k)).receiver == receiver) {
                                    receivers.remove(k);
                                    k--;
                                }
                                k++;
                            }
                            if (receivers.size() <= 0) {
                                this.mActions.remove(action);
                            }
                        }
                    }
                }
                return;
            }
        }
    }

    /* JADX WARNING: Missing block: B:11:0x0040, code:
            return DEBUG;
     */
    /* JADX WARNING: Missing block: B:30:0x00aa, code:
            return true;
     */
    public boolean sendBroadcast(android.content.Intent r19) {
        /*
        r18 = this;
        r0 = r18;
        r10 = r0.mReceivers;
        monitor-enter(r10);
        r3 = r19.getAction();	 Catch:{ all -> 0x0076 }
        r0 = r18;
        r2 = r0.mAppContext;	 Catch:{ all -> 0x0076 }
        r2 = r2.getContentResolver();	 Catch:{ all -> 0x0076 }
        r0 = r19;
        r4 = r0.resolveTypeIfNeeded(r2);	 Catch:{ all -> 0x0076 }
        r6 = r19.getData();	 Catch:{ all -> 0x0076 }
        r5 = r19.getScheme();	 Catch:{ all -> 0x0076 }
        r7 = r19.getCategories();	 Catch:{ all -> 0x0076 }
        r2 = r19.getFlags();	 Catch:{ all -> 0x0076 }
        r2 = r2 & 8;
        if (r2 != 0) goto L_0x0041;
    L_0x002b:
        r11 = 0;
    L_0x002c:
        if (r11 != 0) goto L_0x0043;
    L_0x002e:
        r0 = r18;
        r2 = r0.mActions;	 Catch:{ all -> 0x0076 }
        r8 = r19.getAction();	 Catch:{ all -> 0x0076 }
        r12 = r2.get(r8);	 Catch:{ all -> 0x0076 }
        r12 = (java.util.ArrayList) r12;	 Catch:{ all -> 0x0076 }
        if (r12 != 0) goto L_0x0079;
    L_0x003e:
        monitor-exit(r10);	 Catch:{ all -> 0x0076 }
        r2 = 0;
        return r2;
    L_0x0041:
        r11 = 1;
        goto L_0x002c;
    L_0x0043:
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0076 }
        r2.<init>();	 Catch:{ all -> 0x0076 }
        r8 = "Resolving type ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r4);	 Catch:{ all -> 0x0076 }
        r8 = " scheme ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r5);	 Catch:{ all -> 0x0076 }
        r8 = " of intent ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r0 = r19;
        r2 = r2.append(r0);	 Catch:{ all -> 0x0076 }
        r2 = r2.toString();	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        android.util.Log.v(r8, r2);	 Catch:{ all -> 0x0076 }
        goto L_0x002e;
    L_0x0076:
        r9 = move-exception;
        monitor-exit(r10);	 Catch:{ all -> 0x0076 }
        throw r9;
    L_0x0079:
        if (r11 != 0) goto L_0x00ab;
    L_0x007b:
        r17 = 0;
        r13 = 0;
    L_0x007e:
        r2 = r12.size();	 Catch:{ all -> 0x0076 }
        if (r13 < r2) goto L_0x00c6;
    L_0x0084:
        if (r17 == 0) goto L_0x003e;
    L_0x0086:
        r13 = 0;
    L_0x0087:
        r2 = r17.size();	 Catch:{ all -> 0x0076 }
        if (r13 < r2) goto L_0x0179;
    L_0x008d:
        r0 = r18;
        r2 = r0.mPendingBroadcasts;	 Catch:{ all -> 0x0076 }
        r8 = new android.support.v4.content.LocalBroadcastManager$BroadcastRecord;	 Catch:{ all -> 0x0076 }
        r0 = r19;
        r1 = r17;
        r8.<init>(r0, r1);	 Catch:{ all -> 0x0076 }
        r2.add(r8);	 Catch:{ all -> 0x0076 }
        r0 = r18;
        r2 = r0.mHandler;	 Catch:{ all -> 0x0076 }
        r8 = 1;
        r2 = r2.hasMessages(r8);	 Catch:{ all -> 0x0076 }
        if (r2 == 0) goto L_0x0188;
    L_0x00a8:
        monitor-exit(r10);	 Catch:{ all -> 0x0076 }
        r2 = 1;
        return r2;
    L_0x00ab:
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0076 }
        r2.<init>();	 Catch:{ all -> 0x0076 }
        r8 = "Action list: ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r12);	 Catch:{ all -> 0x0076 }
        r2 = r2.toString();	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        android.util.Log.v(r8, r2);	 Catch:{ all -> 0x0076 }
        goto L_0x007b;
    L_0x00c6:
        r16 = r12.get(r13);	 Catch:{ all -> 0x0076 }
        r16 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r16;	 Catch:{ all -> 0x0076 }
        if (r11 != 0) goto L_0x00e6;
    L_0x00ce:
        r0 = r16;
        r2 = r0.broadcasting;	 Catch:{ all -> 0x0076 }
        if (r2 != 0) goto L_0x0105;
    L_0x00d4:
        r0 = r16;
        r2 = r0.filter;	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        r14 = r2.match(r3, r4, r5, r6, r7, r8);	 Catch:{ all -> 0x0076 }
        if (r14 >= 0) goto L_0x0111;
    L_0x00e1:
        if (r11 != 0) goto L_0x0147;
    L_0x00e3:
        r13 = r13 + 1;
        goto L_0x007e;
    L_0x00e6:
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0076 }
        r2.<init>();	 Catch:{ all -> 0x0076 }
        r8 = "Matching against filter ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r0 = r16;
        r8 = r0.filter;	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.toString();	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        android.util.Log.v(r8, r2);	 Catch:{ all -> 0x0076 }
        goto L_0x00ce;
    L_0x0105:
        if (r11 == 0) goto L_0x00e3;
    L_0x0107:
        r2 = "LocalBroadcastManager";
        r8 = "  Filter's target already added";
        android.util.Log.v(r2, r8);	 Catch:{ all -> 0x0076 }
        goto L_0x00e3;
    L_0x0111:
        if (r11 != 0) goto L_0x0122;
    L_0x0113:
        if (r17 == 0) goto L_0x0141;
    L_0x0115:
        r0 = r17;
        r1 = r16;
        r0.add(r1);	 Catch:{ all -> 0x0076 }
        r2 = 1;
        r0 = r16;
        r0.broadcasting = r2;	 Catch:{ all -> 0x0076 }
        goto L_0x00e3;
    L_0x0122:
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0076 }
        r2.<init>();	 Catch:{ all -> 0x0076 }
        r8 = "  Filter matched!  match=0x";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r8 = java.lang.Integer.toHexString(r14);	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.toString();	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        android.util.Log.v(r8, r2);	 Catch:{ all -> 0x0076 }
        goto L_0x0113;
    L_0x0141:
        r17 = new java.util.ArrayList;	 Catch:{ all -> 0x0076 }
        r17.<init>();	 Catch:{ all -> 0x0076 }
        goto L_0x0115;
    L_0x0147:
        switch(r14) {
            case -4: goto L_0x016d;
            case -3: goto L_0x0169;
            case -2: goto L_0x0171;
            case -1: goto L_0x0175;
            default: goto L_0x014a;
        };	 Catch:{ all -> 0x0076 }
    L_0x014a:
        r15 = "unknown reason";
    L_0x014d:
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0076 }
        r2.<init>();	 Catch:{ all -> 0x0076 }
        r8 = "  Filter did not match: ";
        r2 = r2.append(r8);	 Catch:{ all -> 0x0076 }
        r2 = r2.append(r15);	 Catch:{ all -> 0x0076 }
        r2 = r2.toString();	 Catch:{ all -> 0x0076 }
        r8 = "LocalBroadcastManager";
        android.util.Log.v(r8, r2);	 Catch:{ all -> 0x0076 }
        goto L_0x00e3;
    L_0x0169:
        r15 = "action";
        goto L_0x014d;
    L_0x016d:
        r15 = "category";
        goto L_0x014d;
    L_0x0171:
        r15 = "data";
        goto L_0x014d;
    L_0x0175:
        r15 = "type";
        goto L_0x014d;
    L_0x0179:
        r0 = r17;
        r2 = r0.get(r13);	 Catch:{ all -> 0x0076 }
        r2 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r2;	 Catch:{ all -> 0x0076 }
        r8 = 0;
        r2.broadcasting = r8;	 Catch:{ all -> 0x0076 }
        r13 = r13 + 1;
        goto L_0x0087;
    L_0x0188:
        r0 = r18;
        r2 = r0.mHandler;	 Catch:{ all -> 0x0076 }
        r8 = 1;
        r2.sendEmptyMessage(r8);	 Catch:{ all -> 0x0076 }
        goto L_0x00a8;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.LocalBroadcastManager.sendBroadcast(android.content.Intent):boolean");
    }

    public void sendBroadcastSync(Intent intent) {
        if (sendBroadcast(intent)) {
            executePendingBroadcasts();
        }
    }

    /* JADX WARNING: Missing block: B:7:0x0019, code:
            r5 = 0;
     */
    /* JADX WARNING: Missing block: B:9:0x001b, code:
            if (r5 >= r4.length) goto L_0x0000;
     */
    /* JADX WARNING: Missing block: B:10:0x001d, code:
            r3 = r4[r5];
            r6 = 0;
     */
    /* JADX WARNING: Missing block: B:12:0x0026, code:
            if (r6 < r3.receivers.size()) goto L_0x0030;
     */
    /* JADX WARNING: Missing block: B:13:0x0028, code:
            r5 = r5 + 1;
     */
    /* JADX WARNING: Missing block: B:20:0x0030, code:
            ((android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r3.receivers.get(r6)).receiver.onReceive(r10.mAppContext, r3.intent);
            r6 = r6 + 1;
     */
    private void executePendingBroadcasts() {
        /*
        r10 = this;
    L_0x0000:
        r4 = 0;
        r0 = r10.mReceivers;
        monitor-enter(r0);
        r7 = r10.mPendingBroadcasts;	 Catch:{ all -> 0x002d }
        r2 = r7.size();	 Catch:{ all -> 0x002d }
        if (r2 <= 0) goto L_0x002b;
    L_0x000c:
        r4 = new android.support.v4.content.LocalBroadcastManager.BroadcastRecord[r2];	 Catch:{ all -> 0x002d }
        r7 = r10.mPendingBroadcasts;	 Catch:{ all -> 0x002d }
        r7.toArray(r4);	 Catch:{ all -> 0x002d }
        r7 = r10.mPendingBroadcasts;	 Catch:{ all -> 0x002d }
        r7.clear();	 Catch:{ all -> 0x002d }
        monitor-exit(r0);	 Catch:{ all -> 0x002d }
        r5 = 0;
    L_0x001a:
        r7 = r4.length;
        if (r5 >= r7) goto L_0x0000;
    L_0x001d:
        r3 = r4[r5];
        r6 = 0;
    L_0x0020:
        r7 = r3.receivers;
        r7 = r7.size();
        if (r6 < r7) goto L_0x0030;
    L_0x0028:
        r5 = r5 + 1;
        goto L_0x001a;
    L_0x002b:
        monitor-exit(r0);	 Catch:{ all -> 0x002d }
        return;
    L_0x002d:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x002d }
        throw r1;
    L_0x0030:
        r7 = r3.receivers;
        r7 = r7.get(r6);
        r7 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r7;
        r7 = r7.receiver;
        r8 = r10.mAppContext;
        r9 = r3.intent;
        r7.onReceive(r8, r9);
        r6 = r6 + 1;
        goto L_0x0020;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.LocalBroadcastManager.executePendingBroadcasts():void");
    }
}
