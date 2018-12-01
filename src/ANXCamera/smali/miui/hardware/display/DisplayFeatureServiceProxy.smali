.class Lmiui/hardware/display/DisplayFeatureServiceProxy;
.super Ljava/lang/Object;
.source "DisplayFeatureServiceProxy.java"


# static fields
.field private static final HIDL_TRANSACTION_interfaceDescriptor:I = 0xf445343

.field private static final HIDL_TRANSACTION_setFeature:I = 0x1

.field private static final HWBINDER_BASE_INTERFACE_DESCRIPTOR:Ljava/lang/String; = "android.hidl.base@1.0::IBase"

.field private static final HWBINDER_INTERFACE_DESCRIPTOR:Ljava/lang/String; = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

.field private static final INTERFACE_DESCRIPTOR:Ljava/lang/String; = "miui.hardware.display.IDisplayFeatureService"

.field private static TAG:Ljava/lang/String; = null

.field private static final TRANSACTION_setFeature:I = 0x64


# instance fields
.field private mDescriptor:Ljava/lang/String;

.field private mHwService:Landroid/os/IHwBinder;

.field private mService:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const-string/jumbo v0, "DisplayFeatureServiceProxy"

    sput-object v0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    .line 15
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .registers 4
    .param p1, "service"    # Ljava/lang/Object;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    :try_start_3
    instance-of v1, p1, Landroid/os/IBinder;

    if-eqz v1, :cond_21

    .line 40
    check-cast p1, Landroid/os/IBinder;

    .end local p1    # "service":Ljava/lang/Object;
    iput-object p1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    .line 41
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    invoke-interface {v1}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 42
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 43
    const-string/jumbo v1, "miui.hardware.display.IDisplayFeatureService"

    iput-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 54
    :cond_20
    :goto_20
    return-void

    .line 45
    .restart local p1    # "service":Ljava/lang/Object;
    :cond_21
    instance-of v1, p1, Landroid/os/IHwBinder;

    if-eqz v1, :cond_20

    .line 46
    check-cast p1, Landroid/os/IHwBinder;

    .end local p1    # "service":Ljava/lang/Object;
    iput-object p1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    .line 47
    invoke-virtual {p0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    .line 48
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 49
    const-string/jumbo v1, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

    iput-object v1, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;
    :try_end_3c
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3c} :catch_3d

    goto :goto_20

    .line 52
    :catch_3d
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    goto :goto_20
.end method

.method private varargs callBinderTransact(I[I)I
    .registers 11
    .param p1, "transactId"    # I
    .param p2, "params"    # [I

    .prologue
    const/4 v5, 0x0

    .line 85
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 86
    .local v0, "data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 87
    .local v3, "reply":Landroid/os/Parcel;
    const/4 v4, -0x1

    .line 89
    .local v4, "result":I
    :try_start_a
    iget-object v6, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 90
    array-length v6, p2

    :goto_10
    if-ge v5, v6, :cond_1a

    aget v2, p2, v5

    .line 91
    .local v2, "param":I
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 90
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 93
    .end local v2    # "param":I
    :cond_1a
    iget-object v5, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mService:Landroid/os/IBinder;

    const/4 v6, 0x0

    invoke-interface {v5, p1, v0, v3, v6}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 94
    invoke-virtual {v3}, Landroid/os/Parcel;->readException()V

    .line 95
    invoke-virtual {v3}, Landroid/os/Parcel;->readInt()I
    :try_end_29
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_29} :catch_31
    .catchall {:try_start_a .. :try_end_29} :catchall_52

    move-result v4

    .line 100
    :cond_2a
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 103
    :goto_30
    return v4

    .line 97
    :catch_31
    move-exception v1

    .line 98
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_32
    sget-object v5, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "callBinderTransact transact fail. "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4b
    .catchall {:try_start_32 .. :try_end_4b} :catchall_52

    .line 100
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    goto :goto_30

    .line 99
    .end local v1    # "e":Landroid/os/RemoteException;
    :catchall_52
    move-exception v5

    .line 100
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 99
    throw v5
.end method

.method private varargs callHwBinderTransact(I[I)V
    .registers 10
    .param p1, "_hidl_code"    # I
    .param p2, "params"    # [I

    .prologue
    const/4 v4, 0x0

    .line 107
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 109
    .local v1, "hidl_reply":Landroid/os/HwParcel;
    :try_start_6
    new-instance v2, Landroid/os/HwParcel;

    invoke-direct {v2}, Landroid/os/HwParcel;-><init>()V

    .line 110
    .local v2, "hidl_request":Landroid/os/HwParcel;
    iget-object v5, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mDescriptor:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 111
    array-length v5, p2

    :goto_11
    if-ge v4, v5, :cond_1b

    aget v3, p2, v4

    .line 112
    .local v3, "param":I
    invoke-virtual {v2, v3}, Landroid/os/HwParcel;->writeInt32(I)V

    .line 111
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 114
    .end local v3    # "param":I
    :cond_1b
    iget-object v4, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    const/4 v5, 0x0

    invoke-interface {v4, p1, v2, v1, v5}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 115
    invoke-virtual {v1}, Landroid/os/HwParcel;->verifySuccess()V

    .line 116
    invoke-virtual {v2}, Landroid/os/HwParcel;->releaseTemporaryStorage()V
    :try_end_27
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_27} :catch_2b
    .catchall {:try_start_6 .. :try_end_27} :catchall_49

    .line 120
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 122
    .end local v2    # "hidl_request":Landroid/os/HwParcel;
    :goto_2a
    return-void

    .line 117
    :catch_2b
    move-exception v0

    .line 118
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_2c
    sget-object v4, Lmiui/hardware/display/DisplayFeatureServiceProxy;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "callHwBinderTransact transact fail. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_2c .. :try_end_45} :catchall_49

    .line 120
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    goto :goto_2a

    .line 119
    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_49
    move-exception v4

    .line 120
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 119
    throw v4
.end method


# virtual methods
.method public interfaceDescriptor()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v2, Landroid/os/HwParcel;

    invoke-direct {v2}, Landroid/os/HwParcel;-><init>()V

    .line 68
    .local v2, "_hidl_request":Landroid/os/HwParcel;
    const-string/jumbo v3, "android.hidl.base@1.0::IBase"

    invoke-virtual {v2, v3}, Landroid/os/HwParcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 70
    new-instance v1, Landroid/os/HwParcel;

    invoke-direct {v1}, Landroid/os/HwParcel;-><init>()V

    .line 72
    .local v1, "_hidl_reply":Landroid/os/HwParcel;
    :try_start_10
    iget-object v3, p0, Lmiui/hardware/display/DisplayFeatureServiceProxy;->mHwService:Landroid/os/IHwBinder;

    const v4, 0xf445343

    .line 73
    const/4 v5, 0x0

    .line 72
    invoke-interface {v3, v4, v2, v1, v5}, Landroid/os/IHwBinder;->transact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V

    .line 74
    invoke-virtual {v1}, Landroid/os/HwParcel;->verifySuccess()V

    .line 75
    invoke-virtual {v2}, Landroid/os/HwParcel;->releaseTemporaryStorage()V

    .line 77
    invoke-virtual {v1}, Landroid/os/HwParcel;->readString()Ljava/lang/String;
    :try_end_22
    .catchall {:try_start_10 .. :try_end_22} :catchall_27

    move-result-object v0

    .line 80
    .local v0, "_hidl_out_descriptor":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 78
    return-object v0

    .line 79
    .end local v0    # "_hidl_out_descriptor":Ljava/lang/String;
    :catchall_27
    move-exception v3

    .line 80
    invoke-virtual {v1}, Landroid/os/HwParcel;->release()V

    .line 79
    throw v3
.end method

.method setFeature(IIII)V
    .registers 11
    .param p1, "displayId"    # I
    .param p2, "mode"    # I
    .param p3, "value"    # I
    .param p4, "cookie"    # I

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 58
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    if-eqz v0, :cond_17

    .line 59
    new-array v0, v5, [I

    aput p1, v0, v2

    aput p2, v0, v1

    aput p3, v0, v3

    aput p4, v0, v4

    invoke-direct {p0, v1, v0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callHwBinderTransact(I[I)V

    .line 63
    :goto_16
    return-void

    .line 61
    :cond_17
    new-array v0, v5, [I

    aput p1, v0, v2

    aput p2, v0, v1

    aput p3, v0, v3

    aput p4, v0, v4

    const/16 v1, 0x64

    invoke-direct {p0, v1, v0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->callBinderTransact(I[I)I

    goto :goto_16
.end method
