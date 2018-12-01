.class public abstract Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;
.super Lcom/google/android/aidl/BaseStub;
.source "IPublicSearchServiceSessionCallback.java"

# interfaces
.implements Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-string/jumbo v0, "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback"

    invoke-direct {p0, v0}, Lcom/google/android/aidl/BaseStub;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    const/4 v1, 0x0

    .line 41
    if-eqz p0, :cond_0

    .line 44
    const-string/jumbo v1, "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 45
    .local v0, "iin":Landroid/os/IInterface;
    instance-of v1, v0, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;

    if-nez v1, :cond_1

    .line 48
    new-instance v1, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1

    .line 42
    .end local v0    # "iin":Landroid/os/IInterface;
    :cond_0
    return-object v1

    .line 46
    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    check-cast v0, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;

    .end local v0    # "iin":Landroid/os/IInterface;
    return-object v0
.end method


# virtual methods
.method protected dispatchTransaction(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 4
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 54
    if-eq p1, v3, :cond_0

    .line 60
    const/4 v2, 0x0

    return v2

    .line 55
    :cond_0
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v0

    .line 56
    .local v0, "serializedServiceEvent":[B
    sget-object v2, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Lcom/google/android/aidl/Codecs;->createParcelable(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;

    .line 57
    .local v1, "systemParcelableWrapper":Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
    invoke-virtual {p0, v0, v1}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;->onServiceEvent([BLcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;)V

    .line 58
    return v3
.end method
