.class Lcom/android/camera/module/Camera2Module$23;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->consumeAiSceneResult(IZ)V
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
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 4497
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Lcom/android/camera/ui/ToggleSwitch;Z)V
    .locals 3
    .param p1, "s"    # Lcom/android/camera/ui/ToggleSwitch;
    .param p2, "isChecked"    # Z

    .prologue
    const/16 v2, 0x18

    .line 4500
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 4501
    :cond_0
    return-void

    .line 4503
    :cond_1
    if-eqz p2, :cond_2

    .line 4504
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, v1, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->-wrap16(Lcom/android/camera/module/Camera2Module;II)V

    .line 4505
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, v2}, Lcom/android/camera/module/Camera2Module;->-wrap10(Lcom/android/camera/module/Camera2Module;I)V

    .line 4506
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    const-string/jumbo v1, "off"

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->-wrap17(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)V

    .line 4513
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap9(Lcom/android/camera/module/Camera2Module;)V

    .line 4514
    return-void

    .line 4511
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$23;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap5(Lcom/android/camera/module/Camera2Module;)V

    goto :goto_0
.end method
