.class public Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;
.super Lcom/google/android/aidl/BaseProxy;
.source "IPublicSearchServiceSessionCallback.java"

# interfaces
.implements Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;
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
    .line 66
    const-string/jumbo v0, "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback"

    invoke-direct {p0, p1, v0}, Lcom/google/android/aidl/BaseProxy;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    .line 67
    return-void
.end method


# virtual methods
.method public onServiceEvent([BLcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;)V
    .locals 2
    .param p1, "serializedServiceEvent"    # [B
    .param p2, "systemParcelableWrapper"    # Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;->obtainAndWriteInterfaceToken()Landroid/os/Parcel;

    move-result-object v0

    .line 73
    .local v0, "data":Landroid/os/Parcel;
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 74
    invoke-static {v0, p2}, Lcom/google/android/aidl/Codecs;->writeParcelable(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 75
    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;->transactOneway(ILandroid/os/Parcel;)V

    .line 76
    return-void
.end method
