.class Lcom/android/camera2/MiCamera2$2;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->preparePhotoImageReader(Lcom/android/camera/CameraSize;)V
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
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$2;->this$0:Lcom/android/camera2/MiCamera2;

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    .line 175
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v2

    .line 176
    .local v2, "image":Landroid/media/Image;
    if-nez v2, :cond_0

    .line 177
    return-void

    .line 179
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$2;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 180
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$PictureCallback;
    if-eqz v0, :cond_1

    .line 181
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$2;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3, v2}, Lcom/android/camera2/MiCamera2;->-wrap0(Lcom/android/camera2/MiCamera2;Landroid/media/Image;)[B

    move-result-object v1

    .line 182
    .local v1, "data":[B
    if-eqz v1, :cond_1

    .line 183
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$2;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-interface {v0, v1, v3}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V

    .line 187
    .end local v1    # "data":[B
    :cond_1
    invoke-virtual {v2}, Landroid/media/Image;->close()V

    .line 188
    return-void
.end method
