.class public abstract Lcom/google/android/aidl/BaseProxy;
.super Ljava/lang/Object;
.source "BaseProxy.java"

# interfaces
.implements Landroid/os/IInterface;


# instance fields
.field private final mDescriptor:Ljava/lang/String;

.field private final mRemote:Landroid/os/IBinder;


# direct methods
.method protected constructor <init>(Landroid/os/IBinder;Ljava/lang/String;)V
    .locals 0
    .param p1, "remote"    # Landroid/os/IBinder;
    .param p2, "descriptor"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/google/android/aidl/BaseProxy;->mRemote:Landroid/os/IBinder;

    .line 20
    iput-object p2, p0, Lcom/google/android/aidl/BaseProxy;->mDescriptor:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/google/android/aidl/BaseProxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method protected obtainAndWriteInterfaceToken()Landroid/os/Parcel;
    .locals 2

    .prologue
    .line 29
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 30
    .local v0, "parcel":Landroid/os/Parcel;
    iget-object v1, p0, Lcom/google/android/aidl/BaseProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 31
    return-object v0
.end method

.method protected transactAndReadException(ILandroid/os/Parcel;)Landroid/os/Parcel;
    .locals 5
    .param p1, "code"    # I
    .param p2, "in"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 45
    .local v2, "out":Landroid/os/Parcel;
    :try_start_0
    iget-object v3, p0, Lcom/google/android/aidl/BaseProxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x0

    invoke-interface {v3, p1, p2, v2, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 46
    invoke-virtual {v2}, Landroid/os/Parcel;->readException()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    .line 53
    return-object v2

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/RuntimeException;
    :try_start_1
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 49
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v0

    .local v0, "-l_5_R":Ljava/lang/Object;
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    throw v0
.end method

.method protected transactOneway(ILandroid/os/Parcel;)V
    .locals 4
    .param p1, "code"    # I
    .param p2, "in"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 80
    :try_start_0
    iget-object v1, p0, Lcom/google/android/aidl/BaseProxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v1, p1, p2, v2, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    .line 84
    return-void

    .line 82
    :catchall_0
    move-exception v0

    .local v0, "-l_3_R":Ljava/lang/Object;
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    throw v0
.end method
