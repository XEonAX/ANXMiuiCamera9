.class public final Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;
.super Ljava/lang/Object;
.source "SystemParcelableWrapper.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final parcelable:Landroid/os/Parcelable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper$1;

    invoke-direct {v0}, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper$1;-><init>()V

    sput-object v0, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "parcelable"    # Landroid/os/Parcelable;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    invoke-static {p1}, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;->isSystemParcelable(Landroid/os/Parcelable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 15
    iput-object p1, p0, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;->parcelable:Landroid/os/Parcelable;

    .line 16
    return-void

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Only Android system classes can be passed in SystemParcelableWrapper."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static isSystemParcelable(Landroid/os/Parcelable;)Z
    .locals 2
    .param p0, "parcelable"    # Landroid/os/Parcelable;

    .prologue
    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.os."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 29
    iget-object v0, p0, Lcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;->parcelable:Landroid/os/Parcelable;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 30
    return-void
.end method
