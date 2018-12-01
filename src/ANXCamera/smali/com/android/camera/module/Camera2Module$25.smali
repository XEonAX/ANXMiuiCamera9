.class Lcom/android/camera/module/Camera2Module$25;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->startScreenLight(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$brightness:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$25;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/Camera2Module$25;->val$brightness:I

    .line 4700
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4703
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$25;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    .line 4704
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$25;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/Camera2Module$25;->val$brightness:I

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setWindowBrightness(I)V

    .line 4706
    :cond_0
    return-void
.end method
