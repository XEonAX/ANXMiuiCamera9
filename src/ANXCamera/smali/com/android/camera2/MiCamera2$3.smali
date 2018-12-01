.class Lcom/android/camera2/MiCamera2$3;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->preparePreviewImageReader(Lcom/android/camera/CameraSize;)V
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
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$3;->this$0:Lcom/android/camera2/MiCamera2;

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    .line 201
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v1

    .line 202
    .local v1, "image":Landroid/media/Image;
    if-nez v1, :cond_0

    .line 203
    return-void

    .line 205
    :cond_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$3;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    move-result-object v0

    .line 206
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    if-eqz v0, :cond_1

    .line 207
    new-instance v2, Lcom/android/camera2/PreviewImageProp;

    invoke-direct {v2, v1}, Lcom/android/camera2/PreviewImageProp;-><init>(Landroid/media/Image;)V

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$3;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-interface {v0, v2, v3}, Lcom/android/camera2/Camera2Proxy$PreviewCallback;->onPreviewFrame(Lcom/android/camera2/PreviewImageProp;Lcom/android/camera2/Camera2Proxy;)V

    .line 209
    :cond_1
    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 210
    return-void
.end method
