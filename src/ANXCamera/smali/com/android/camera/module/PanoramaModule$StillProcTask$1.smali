.class Lcom/android/camera/module/PanoramaModule$StillProcTask$1;
.super Ljava/lang/Object;
.source "PanoramaModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/PanoramaModule$StillProcTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/module/PanoramaModule$StillProcTask;


# direct methods
.method constructor <init>(Lcom/android/camera/module/PanoramaModule$StillProcTask;)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/camera/module/PanoramaModule$StillProcTask;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask$1;->this$1:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    .line 896
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 899
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask$1;->this$1:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    iget-object v0, v0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/PanoramaModule;->-wrap8(Lcom/android/camera/module/PanoramaModule;Z)V

    .line 900
    return-void
.end method
