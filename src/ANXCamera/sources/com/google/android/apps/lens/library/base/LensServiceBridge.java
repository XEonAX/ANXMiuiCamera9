package com.google.android.apps.lens.library.base;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.google.android.apps.gsa.publicsearch.IPublicSearchService;
import com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSession;
import com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback.Stub;
import com.google.android.apps.gsa.publicsearch.SystemParcelableWrapper;
import com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceEvent;
import com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceEventData;
import com.google.android.apps.gsa.search.shared.service.proto.nano.ServiceEventProto;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;

public class LensServiceBridge extends Stub implements ServiceConnection {
    @NonNull
    private final Context context;
    @Nullable
    private IPublicSearchService lensService;
    @Nullable
    private volatile IPublicSearchServiceSession lensServiceSession;
    private int serviceApiVersion;

    public LensServiceBridge(@NonNull Context context) {
        this.context = context;
    }

    public boolean bindService() {
        ensureOnMainThread();
        Intent intent = new Intent("com.google.android.apps.gsa.publicsearch.IPublicSearchService");
        intent.setPackage("com.google.android.googlequicksearchbox");
        try {
            if (this.context.bindService(intent, this, 65)) {
                return true;
            }
            Log.e("LensServiceBridge", "Unable to bind Lens service.");
            return false;
        } catch (SecurityException e) {
            Log.i("LensServiceBridge", "Unable to bind Lens service due to security exception. Maybe the service is not available yet.");
            return false;
        }
    }

    public void unbindService() {
        ensureOnMainThread();
        endLensSession();
        this.context.unbindService(this);
        this.lensService = null;
        this.lensServiceSession = null;
        this.serviceApiVersion = 0;
    }

    public void onServiceConnected(ComponentName name, IBinder service) {
        ensureOnMainThread();
        Log.i("LensServiceBridge", "Lens service connected.");
        this.lensService = IPublicSearchService.Stub.asInterface(service);
        beginLensSession();
    }

    public void onServiceDisconnected(ComponentName name) {
        ensureOnMainThread();
        Log.w("LensServiceBridge", "Lens service disconnected.");
    }

    public void onServiceEvent(byte[] serializedServiceEvent, SystemParcelableWrapper systemParcelableWrapper) {
        try {
            ServiceEventProto serviceEventProto = ServiceEventProto.parseFrom(serializedServiceEvent);
            if (serviceEventProto.getEventId() == 240 && serviceEventProto.hasExtension(LensServiceEvent.lensServiceEventData)) {
                this.serviceApiVersion = ((LensServiceEventData) serviceEventProto.getExtension(LensServiceEvent.lensServiceEventData)).getServiceApiVersion();
            }
        } catch (InvalidProtocolBufferNanoException e) {
            Log.e("LensServiceBridge", "Unable to parse the protobuf.", e);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x002a A:{ExcHandler: android.os.RemoteException (r1_0 'e' java.lang.Exception), Splitter: B:3:0x0015} */
    /* JADX WARNING: Missing block: B:9:0x002a, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x002b, code:
            android.util.Log.e("LensServiceBridge", "Unable to send prewarm signal.", r1);
     */
    /* JADX WARNING: Missing block: B:11:0x0034, code:
            return false;
     */
    public boolean prewarmLensActivity() {
        /*
        r5 = this;
        r4 = 0;
        r5.ensureOnMainThread();
        r2 = r5.isLensSessionReady();
        if (r2 == 0) goto L_0x0020;
    L_0x000a:
        r2 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r2.<init>();
        r3 = 347; // 0x15b float:4.86E-43 double:1.714E-321;
        r0 = r2.setEventId(r3);
        r2 = r5.lensServiceSession;	 Catch:{ RemoteException -> 0x002a, RemoteException -> 0x002a }
        r3 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x002a, RemoteException -> 0x002a }
        r2.onGenericClientEvent(r3);	 Catch:{ RemoteException -> 0x002a, RemoteException -> 0x002a }
        r2 = 1;
        return r2;
    L_0x0020:
        r2 = "LensServiceBridge";
        r3 = "Lens session is not ready for prewarm.";
        android.util.Log.i(r2, r3);
        return r4;
    L_0x002a:
        r1 = move-exception;
        r2 = "LensServiceBridge";
        r3 = "Unable to send prewarm signal.";
        android.util.Log.e(r2, r3, r1);
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.prewarmLensActivity():boolean");
    }

    private boolean isLensSessionReady() {
        int localServiceApiVersion = this.serviceApiVersion;
        if (this.lensService == null || this.lensServiceSession == null || localServiceApiVersion <= 0) {
            return false;
        }
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:7:0x002f A:{ExcHandler: android.os.RemoteException (r1_0 'e' java.lang.Exception), Splitter: B:3:0x001e} */
    /* JADX WARNING: Missing block: B:7:0x002f, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:8:0x0030, code:
            android.util.Log.e("LensServiceBridge", "Unable to begin Lens service session.", r1);
     */
    private void beginLensSession() {
        /*
        r5 = this;
        r2 = r5.lensService;
        if (r2 == 0) goto L_0x002e;
    L_0x0004:
        r2 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r2.<init>();
        r3 = 348; // 0x15c float:4.88E-43 double:1.72E-321;
        r0 = r2.setEventId(r3);
        r2 = com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceClientEvent.lensServiceClientEventData;
        r3 = new com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceClientEventData;
        r3.<init>();
        r4 = 1;
        r3 = r3.setTargetServiceApiVersion(r4);
        r0.setExtension(r2, r3);
        r2 = r5.lensService;	 Catch:{ RemoteException -> 0x002f, RemoteException -> 0x002f }
        r3 = "LENS_SERVICE_SESSION";
        r4 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x002f, RemoteException -> 0x002f }
        r2 = r2.beginSession(r3, r5, r4);	 Catch:{ RemoteException -> 0x002f, RemoteException -> 0x002f }
        r5.lensServiceSession = r2;	 Catch:{ RemoteException -> 0x002f, RemoteException -> 0x002f }
    L_0x002d:
        return;
    L_0x002e:
        return;
    L_0x002f:
        r1 = move-exception;
        r2 = "LensServiceBridge";
        r3 = "Unable to begin Lens service session.";
        android.util.Log.e(r2, r3, r1);
        goto L_0x002d;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.beginLensSession():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x001e A:{ExcHandler: android.os.RemoteException (r1_0 'e' java.lang.Exception), Splitter: B:6:0x0014} */
    /* JADX WARNING: Missing block: B:9:0x001e, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x001f, code:
            android.util.Log.e("LensServiceBridge", "Unable to end Lens service session.", r1);
     */
    private void endLensSession() {
        /*
        r4 = this;
        r2 = r4.lensService;
        if (r2 != 0) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        r2 = r4.lensServiceSession;
        if (r2 == 0) goto L_0x0004;
    L_0x0009:
        r2 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r2.<init>();
        r3 = 345; // 0x159 float:4.83E-43 double:1.705E-321;
        r0 = r2.setEventId(r3);
        r2 = r4.lensServiceSession;	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
        r3 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
        r2.onGenericClientEvent(r3);	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
    L_0x001d:
        return;
    L_0x001e:
        r1 = move-exception;
        r2 = "LensServiceBridge";
        r3 = "Unable to end Lens service session.";
        android.util.Log.e(r2, r3, r1);
        goto L_0x001d;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.endLensSession():void");
    }

    private void ensureOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("This should be running on the main thread.");
        }
    }
}
