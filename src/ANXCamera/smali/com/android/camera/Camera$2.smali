.class Lcom/android/camera/Camera$2;
.super Ljava/lang/Object;
.source "Camera.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/android/camera/module/loader/NullHolder",
        "<",
        "Lcom/android/camera/module/BaseModule;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/Camera;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public accept(Lcom/android/camera/module/loader/NullHolder;)V
    .locals 3
    .param p1    # Lcom/android/camera/module/loader/NullHolder;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "baseModuleNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;"
    const/4 v2, 0x0

    .line 147
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->getException()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/Camera;->-wrap3(Lcom/android/camera/Camera;I)V

    .line 149
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    iput-object v2, v0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 154
    :goto_0
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->resetFrameAvailableFlag()V

    .line 155
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 156
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0, v2}, Lcom/android/camera/Camera;->-set0(Lcom/android/camera/Camera;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 157
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->fillCloudValues()V

    .line 158
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 159
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Camera;->-wrap4(Lcom/android/camera/Camera;)V

    .line 160
    invoke-static {}, Lcom/android/camera/Camera;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "cameraSetupConsumer#accept switch module done."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    return-void

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera$2;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/Module;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/V6GestureRecognizer;->setCurrentModule(Lcom/android/camera/module/Module;)V

    goto :goto_0
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 145
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera$2;->accept(Lcom/android/camera/module/loader/NullHolder;)V

    return-void
.end method
