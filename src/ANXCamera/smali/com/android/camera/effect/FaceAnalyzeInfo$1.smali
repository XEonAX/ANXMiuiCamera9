.class final Lcom/android/camera/effect/FaceAnalyzeInfo$1;
.super Ljava/lang/Object;
.source "FaceAnalyzeInfo.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/FaceAnalyzeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/android/camera/effect/FaceAnalyzeInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/effect/FaceAnalyzeInfo;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 54
    new-instance v0, Lcom/android/camera/effect/FaceAnalyzeInfo;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/FaceAnalyzeInfo;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/FaceAnalyzeInfo$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/camera/effect/FaceAnalyzeInfo;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/android/camera/effect/FaceAnalyzeInfo;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 59
    new-array v0, p1, [Lcom/android/camera/effect/FaceAnalyzeInfo;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/FaceAnalyzeInfo$1;->newArray(I)[Lcom/android/camera/effect/FaceAnalyzeInfo;

    move-result-object v0

    return-object v0
.end method
