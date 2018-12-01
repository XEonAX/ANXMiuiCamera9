.class Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/storage/ImageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThumbnailUpdater"
.end annotation


# instance fields
.field private mNeedAnimation:Z

.field final synthetic this$0:Lcom/android/camera/storage/ImageSaver;


# direct methods
.method public constructor <init>(Lcom/android/camera/storage/ImageSaver;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    .line 338
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 339
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    .line 340
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 348
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver;->-get0(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 349
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->this$0:Lcom/android/camera/storage/ImageSaver;

    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    invoke-static {v0, v1}, Lcom/android/camera/storage/ImageSaver;->-wrap7(Lcom/android/camera/storage/ImageSaver;Z)V

    .line 350
    return-void
.end method

.method public setNeedAnimation(Z)V
    .locals 0
    .param p1, "needAnimation"    # Z

    .prologue
    .line 343
    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->mNeedAnimation:Z

    .line 344
    return-void
.end method
