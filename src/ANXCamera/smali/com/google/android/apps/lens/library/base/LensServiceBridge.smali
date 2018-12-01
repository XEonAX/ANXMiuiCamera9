.class public Lcom/google/android/apps/lens/library/base/LensServiceBridge;
.super Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;
.source "LensServiceBridge.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field private final context:Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private volatile lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private serviceApiVersion:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->context:Landroid/content/Context;

    .line 52
    return-void
.end method

.method private beginLensSession()V
    .locals 5

    .prologue
    .line 149
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    if-eqz v2, :cond_0

    .line 153
    new-instance v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    invoke-direct {v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;-><init>()V

    const/16 v3, 0x15c

    .line 154
    invoke-virtual {v2, v3}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    .line 155
    .local v0, "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    sget-object v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEvent;->lensServiceClientEventData:Lcom/google/protobuf/nano/Extension;

    new-instance v3, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;

    invoke-direct {v3}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;-><init>()V

    const/4 v4, 0x1

    .line 157
    invoke-virtual {v3, v4}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;->setTargetServiceApiVersion(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;

    move-result-object v3

    .line 155
    invoke-virtual {v0, v2, v3}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->setExtension(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)Lcom/google/protobuf/nano/ExtendableMessageNano;

    .line 159
    :try_start_0
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    const-string/jumbo v3, "LENS_SERVICE_SESSION"

    .line 161
    invoke-static {v0}, Lcom/google/protobuf/nano/MessageNano;->toByteArray(Lcom/google/protobuf/nano/MessageNano;)[B

    move-result-object v4

    .line 160
    invoke-interface {v2, v3, p0, v4}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;->beginSession(Ljava/lang/String;Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;[B)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :goto_0
    return-void

    .line 150
    .end local v0    # "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :cond_0
    return-void

    .line 162
    .restart local v0    # "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to begin Lens service session."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private endLensSession()V
    .locals 4

    .prologue
    .line 168
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    if-nez v2, :cond_1

    .line 169
    :cond_0
    return-void

    .line 168
    :cond_1
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    if-eqz v2, :cond_0

    .line 172
    new-instance v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    invoke-direct {v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;-><init>()V

    const/16 v3, 0x159

    invoke-virtual {v2, v3}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    .line 174
    .local v0, "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :try_start_0
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    invoke-static {v0}, Lcom/google/protobuf/nano/MessageNano;->toByteArray(Lcom/google/protobuf/nano/MessageNano;)[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;->onGenericClientEvent([B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v1

    .line 176
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to end Lens service session."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private ensureOnMainThread()V
    .locals 2

    .prologue
    .line 181
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 184
    return-void

    .line 182
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "This should be running on the main thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private isLensSessionReady()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 144
    iget v0, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->serviceApiVersion:I

    .line 145
    .local v0, "localServiceApiVersion":I
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    if-eqz v2, :cond_0

    if-lez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public bindService()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 55
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->ensureOnMainThread()V

    .line 56
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.google.android.apps.gsa.publicsearch.IPublicSearchService"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 57
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.google.android.googlequicksearchbox"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    :try_start_0
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->context:Landroid/content/Context;

    const/16 v3, 0x41

    invoke-virtual {v2, v1, p0, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    const/4 v2, 0x1

    return v2

    .line 60
    :cond_0
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to bind Lens service."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    return v4

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/SecurityException;
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to bind Lens service due to security exception. Maybe the service is not available yet."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    return v4
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->ensureOnMainThread()V

    .line 90
    const-string/jumbo v0, "LensServiceBridge"

    const-string/jumbo v1, "Lens service connected."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-static {p2}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    .line 92
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->beginLensSession()V

    .line 93
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->ensureOnMainThread()V

    .line 98
    const-string/jumbo v0, "LensServiceBridge"

    const-string/jumbo v1, "Lens service disconnected."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void
.end method

.method public onServiceEvent([BLcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;)V
    .locals 4
    .param p1, "serializedServiceEvent"    # [B
    .param p2, "systemParcelableWrapper"    # Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    .prologue
    .line 107
    const/4 v1, 0x0

    .line 109
    .local v1, "serviceEventProto":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;
    :try_start_0
    invoke-static {p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;->parseFrom([B)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;
    :try_end_0
    .catch Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;->getEventId()I

    move-result v2

    const/16 v3, 0xf0

    if-eq v2, v3, :cond_1

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to parse the protobuf."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    return-void

    .line 114
    .end local v0    # "e":Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
    :cond_1
    sget-object v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEvent;->lensServiceEventData:Lcom/google/protobuf/nano/Extension;

    .line 115
    invoke-virtual {v1, v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;->hasExtension(Lcom/google/protobuf/nano/Extension;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    sget-object v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEvent;->lensServiceEventData:Lcom/google/protobuf/nano/Extension;

    .line 118
    invoke-virtual {v1, v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventProto;->getExtension(Lcom/google/protobuf/nano/Extension;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;

    .line 119
    invoke-virtual {v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceEventData;->getServiceApiVersion()I

    move-result v2

    iput v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->serviceApiVersion:I

    goto :goto_0
.end method

.method public prewarmLensActivity()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 126
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->ensureOnMainThread()V

    .line 127
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->isLensSessionReady()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 132
    new-instance v2, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    invoke-direct {v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;-><init>()V

    const/16 v3, 0x15b

    .line 133
    invoke-virtual {v2, v3}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    .line 135
    .local v0, "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :try_start_0
    iget-object v2, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    invoke-static {v0}, Lcom/google/protobuf/nano/MessageNano;->toByteArray(Lcom/google/protobuf/nano/MessageNano;)[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;->onGenericClientEvent([B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    const/4 v2, 0x1

    return v2

    .line 128
    .end local v0    # "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :cond_0
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Lens session is not ready for prewarm."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    return v4

    .line 136
    .restart local v0    # "clientEvent":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :catch_0
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "LensServiceBridge"

    const-string/jumbo v3, "Unable to send prewarm signal."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 138
    return v4
.end method

.method public unbindService()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->ensureOnMainThread()V

    .line 77
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->endLensSession()V

    .line 78
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->context:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 79
    iput-object v1, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensService:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    .line 80
    iput-object v1, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->lensServiceSession:Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->serviceApiVersion:I

    .line 85
    return-void
.end method
