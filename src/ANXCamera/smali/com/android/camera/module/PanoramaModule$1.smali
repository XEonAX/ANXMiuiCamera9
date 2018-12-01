.class Lcom/android/camera/module/PanoramaModule$1;
.super Ljava/lang/Object;
.source "PanoramaModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/PanoramaModule;->onPreviewFrame(Lcom/android/camera2/PreviewImageProp;Lcom/android/camera2/Camera2Proxy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/PanoramaModule;

.field final synthetic val$data2:[B


# direct methods
.method constructor <init>(Lcom/android/camera/module/PanoramaModule;[B)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iput-object p2, p0, Lcom/android/camera/module/PanoramaModule$1;->val$data2:[B

    .line 1263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1265
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_0

    .line 1266
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "onPreviewFrame: camera has been released"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1267
    return-void

    .line 1270
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v2, v5}, Lcom/android/camera/module/PanoramaModule;->-set2(Lcom/android/camera/module/PanoramaModule;Z)Z

    .line 1271
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v2}, Lcom/android/camera/module/PanoramaModule;->-wrap2(Lcom/android/camera/module/PanoramaModule;)V

    .line 1272
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "onPreviewFrame: takePicture"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1273
    invoke-static {v4}, Lcom/android/camera/module/PanoramaModule;->getJpegQuality(Z)I

    move-result v0

    .line 1274
    .local v0, "quality":I
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 1275
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v2}, Lcom/android/camera/module/PanoramaModule;->getJpegThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 1276
    .local v1, "size":Lcom/android/camera/CameraSize;
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v1}, Lcom/android/camera2/Camera2Proxy;->setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V

    .line 1277
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v5}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 1278
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v4}, Lcom/android/camera2/Camera2Proxy;->setNeedPausePreview(Z)V

    .line 1279
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$1;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v2, v6, v3}, Lcom/android/camera2/Camera2Proxy;->takePicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 1284
    return-void
.end method
