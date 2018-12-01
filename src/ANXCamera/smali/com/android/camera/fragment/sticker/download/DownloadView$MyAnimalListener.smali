.class abstract Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
.super Ljava/lang/Object;
.source "DownloadView.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/sticker/download/DownloadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "MyAnimalListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;


# direct methods
.method private constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/sticker/download/DownloadView;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/sticker/download/DownloadView;
    .param p2, "-this1"    # Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animator"    # Landroid/animation/Animator;

    .prologue
    .line 169
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animator"    # Landroid/animation/Animator;

    .prologue
    .line 173
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animator"    # Landroid/animation/Animator;

    .prologue
    .line 165
    return-void
.end method
