.class Lcom/android/camera/fragment/sticker/download/DownloadView$1;
.super Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/download/DownloadView;->startDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/sticker/download/DownloadView;
    .param p2, "this$0_1"    # Lcom/android/camera/fragment/sticker/download/DownloadView;

    .prologue
    .line 1
    iput-object p2, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$1;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;)V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animator"    # Landroid/animation/Animator;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$1;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->-wrap0(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    .line 60
    return-void
.end method
