.class Lcom/android/camera2/MiCamera2$5;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    .line 245
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v1

    .line 246
    .local v1, "image":Landroid/media/Image;
    if-nez v1, :cond_0

    .line 247
    return-void

    .line 250
    :cond_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v2, v2, Lcom/android/camera2/MiCamera2;->mVideoSnapshotCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    if-eqz v2, :cond_1

    .line 251
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v2, v1}, Lcom/android/camera2/MiCamera2;->-wrap0(Lcom/android/camera2/MiCamera2;Landroid/media/Image;)[B

    move-result-object v0

    .line 252
    .local v0, "data":[B
    if-eqz v0, :cond_1

    .line 253
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v2, v2, Lcom/android/camera2/MiCamera2;->mVideoSnapshotCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-interface {v2, v0, v3}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V

    .line 256
    .end local v0    # "data":[B
    :cond_1
    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 257
    return-void
.end method