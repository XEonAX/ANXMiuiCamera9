.class public abstract Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub;
.super Lcom/google/android/aidl/BaseStub;
.source "IPublicSearchService.java"

# interfaces
.implements Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-string/jumbo v0, "com.google.android.apps.gsa.publicsearch.IPublicSearchService"

    invoke-direct {p0, v0}, Lcom/google/android/aidl/BaseStub;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    const/4 v1, 0x0

    .line 43
    if-eqz p0, :cond_0

    .line 46
    const-string/jumbo v1, "com.google.android.apps.gsa.publicsearch.IPublicSearchService"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 47
    .local v0, "iin":Landroid/os/IInterface;
    instance-of v1, v0, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    if-nez v1, :cond_1

    .line 50
    new-instance v1, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1

    .line 44
    .end local v0    # "iin":Landroid/os/IInterface;
    :cond_0
    return-object v1

    .line 48
    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    check-cast v0, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService;

    .end local v0    # "iin":Landroid/os/IInterface;
    return-object v0
.end method


# virtual methods
.method protected dispatchTransaction(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 6
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
    const/4 v5, 0x1

    .line 56
    if-eq p1, v5, :cond_0

    .line 65
    const/4 v4, 0x0

    return v4

    .line 57
    :cond_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, "sessionType":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;

    move-result-object v0

    .line 59
    .local v0, "callback":Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v2

    .line 60
    .local v2, "serializedSessionContext":[B
    invoke-virtual {p0, v3, v0, v2}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchService$Stub;->beginSession(Ljava/lang/String;Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSessionCallback;[B)Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;

    move-result-object v1

    .line 61
    .local v1, "retval":Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 62
    invoke-static {p3, v1}, Lcom/google/android/aidl/Codecs;->writeStrongBinder(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 63
    return v5
.end method
