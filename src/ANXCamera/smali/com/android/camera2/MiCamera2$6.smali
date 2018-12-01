.class Lcom/android/camera2/MiCamera2$6;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->prepareDepthImageReader(Lcom/android/camera/CameraSize;)V
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
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$6;->this$0:Lcom/android/camera2/MiCamera2;

    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 6
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    .line 271
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v1

    .line 272
    .local v1, "image":Landroid/media/Image;
    if-nez v1, :cond_0

    .line 273
    return-void

    .line 276
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$6;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v3, v3, Lcom/android/camera2/MiCamera2;->mPortraitDepthImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    if-eqz v3, :cond_1

    .line 277
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$6;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3, v1}, Lcom/android/camera2/MiCamera2;->-wrap0(Lcom/android/camera2/MiCamera2;Landroid/media/Image;)[B

    move-result-object v0

    .line 278
    .local v0, "data":[B
    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->isDepthMapData([B)Z

    move-result v2

    .line 279
    .local v2, "isValidDepthMapData":Z
    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 280
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$6;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v3, v3, Lcom/android/camera2/MiCamera2;->mPortraitDepthImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    iget-object v4, p0, Lcom/android/camera2/MiCamera2$6;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-interface {v3, v0, v4}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V

    .line 285
    .end local v0    # "data":[B
    .end local v2    # "isValidDepthMapData":Z
    :cond_1
    :goto_0
    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 286
    return-void

    .line 282
    .restart local v0    # "data":[B
    .restart local v2    # "isValidDepthMapData":Z
    :cond_2
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onImageAvailable: return a invalid depth map! length is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
