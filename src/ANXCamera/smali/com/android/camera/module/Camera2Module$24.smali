.class Lcom/android/camera/module/Camera2Module$24;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->resetAiSceneInHdrOrFlashOn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$24;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 4671
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 4674
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$24;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->-wrap6(Lcom/android/camera/module/Camera2Module;IZ)V

    .line 4675
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$24;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, v2}, Lcom/android/camera/module/Camera2Module;->-set13(Lcom/android/camera/module/Camera2Module;Z)Z

    .line 4676
    return-void
.end method
