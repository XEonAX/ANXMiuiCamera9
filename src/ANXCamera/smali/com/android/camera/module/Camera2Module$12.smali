.class Lcom/android/camera/module/Camera2Module$12;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->onPause()V
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
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1682
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1685
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get7(Lcom/android/camera/module/Camera2Module;)Lcom/google/lens/sdk/LensApi;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1686
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$12;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get7(Lcom/android/camera/module/Camera2Module;)Lcom/google/lens/sdk/LensApi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/lens/sdk/LensApi;->onPause()V

    .line 1687
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "run:  mLensApi.onPause();"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1689
    :cond_0
    return-void
.end method
