.class public Lcom/google/android/aidl/Codecs;
.super Ljava/lang/Object;
.source "Codecs.java"


# static fields
.field private static final CLASS_LOADER:Ljava/lang/ClassLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/google/android/aidl/Codecs;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    sput-object v0, Lcom/google/android/aidl/Codecs;->CLASS_LOADER:Ljava/lang/ClassLoader;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createParcelable(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;
    .locals 1
    .param p0, "parcel"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Parcel;",
            "Landroid/os/Parcelable$Creator",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "creator":Landroid/os/Parcelable$Creator;, "Landroid/os/Parcelable$Creator<TT;>;"
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-interface {p1, p0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    return-object v0

    .line 68
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static writeParcelable(Landroid/os/Parcel;Landroid/os/Parcelable;)V
    .locals 2
    .param p0, "parcel"    # Landroid/os/Parcel;
    .param p1, "parcelable"    # Landroid/os/Parcelable;

    .prologue
    const/4 v1, 0x0

    .line 74
    if-eqz p1, :cond_0

    .line 77
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    invoke-interface {p1, p0, v1}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 80
    :goto_0
    return-void

    .line 75
    :cond_0
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0
.end method

.method public static writeStrongBinder(Landroid/os/Parcel;Landroid/os/IInterface;)V
    .locals 1
    .param p0, "parcel"    # Landroid/os/Parcel;
    .param p1, "iinterface"    # Landroid/os/IInterface;

    .prologue
    const/4 v0, 0x0

    .line 92
    if-eqz p1, :cond_0

    .line 95
    invoke-interface {p1}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 97
    :goto_0
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    goto :goto_0
.end method
