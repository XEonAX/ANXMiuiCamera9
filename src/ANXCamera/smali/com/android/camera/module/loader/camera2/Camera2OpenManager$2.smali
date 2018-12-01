.class Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;
.super Landroid/os/Handler;
.source "Camera2OpenManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->initData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .param p2, "$anonymous0"    # Landroid/os/Looper;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .line 78
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-wrap1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Message;)V

    .line 82
    return-void
.end method
