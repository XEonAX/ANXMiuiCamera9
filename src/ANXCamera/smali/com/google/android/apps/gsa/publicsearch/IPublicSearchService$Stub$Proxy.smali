.class public Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;
.super Lcom/google/android/aidl/BaseProxy;
.source "IPublicSearchService.java"

# interfaces
.implements Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Proxy"
.end annotation


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 1
    .param p1, "remote"    # Landroid/os/IBinder;

    .prologue
    .line 71
    const-string/jumbo v0, "com.google.android.apps.gsa.publicsearch.IPublicSearchService"

    invoke-direct {p0, p1, v0}, Lcom/google/android/aidl/BaseProxy;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    .line 72
    return-void
.end method


# virtual methods
.method public beginSession(Ljava/lang/String;Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;[B)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;
    .locals 4
    .param p1, "sessionType"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;
    .param p3, "serializedSessionContext"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;->obtainAndWriteInterfaceToken()Landroid/os/Parcel;

    move-result-object v0

    .line 79
    .local v0, "data":Landroid/os/Parcel;
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 80
    invoke-static {v0, p2}, Lcom/google/android/aidl/Codecs;->writeStrongBinder(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 81
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 82
    const/4 v3, 0x1

    invoke-virtual {p0, v3, v0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;->transactAndReadException(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v1

    .line 83
    .local v1, "reply":Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    move-result-object v2

    .line 84
    .local v2, "retval":Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 85
    return-object v2
.end method
