.class Lcom/android/camera2/MiCamera2$11;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
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
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$11;->this$0:Lcom/android/camera2/MiCamera2;

    .line 2247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2250
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$11;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, v0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    .line 2251
    return-void
.end method
