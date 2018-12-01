.class Lcom/android/camera/module/BaseModule$3;
.super Ljava/lang/Object;
.source "BaseModule.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/BaseModule;->onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/BaseModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/BaseModule;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/BaseModule;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/BaseModule$3;->this$0:Lcom/android/camera/module/BaseModule;

    .line 1080
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1083
    invoke-static {}, Lcom/android/camera/CameraSettings;->addLensDirtyDetectedTimes()V

    .line 1084
    iget-object v0, p0, Lcom/android/camera/module/BaseModule$3;->this$0:Lcom/android/camera/module/BaseModule;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updateLensDirtyDetect(Z)V

    .line 1085
    return-void
.end method
