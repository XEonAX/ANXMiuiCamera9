.class Lcom/android/camera/ThumbnailUpdater$1;
.super Ljava/lang/Object;
.source "ThumbnailUpdater.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ThumbnailUpdater;->updateThumbnailView(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ThumbnailUpdater;

.field final synthetic val$needAnimation:Z


# direct methods
.method constructor <init>(Lcom/android/camera/ThumbnailUpdater;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ThumbnailUpdater;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ThumbnailUpdater$1;->this$0:Lcom/android/camera/ThumbnailUpdater;

    iput-boolean p2, p0, Lcom/android/camera/ThumbnailUpdater$1;->val$needAnimation:Z

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 48
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 49
    const/16 v2, 0xa2

    .line 48
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 50
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-nez v0, :cond_0

    .line 51
    const-string/jumbo v1, "ThumbnailUpdater"

    const-string/jumbo v2, "won\'t update thumbnail"

    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v1, v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    return-void

    .line 54
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ThumbnailUpdater$1;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v1}, Lcom/android/camera/ThumbnailUpdater;->-get2(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/ThumbnailUpdater$1;->val$needAnimation:Z

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    .line 55
    return-void
.end method
