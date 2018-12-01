.class Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "V6GestureRecognizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/V6GestureRecognizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyScaleListener"
.end annotation


# instance fields
.field private mZoomScaled:Z

.field final synthetic this$0:Lcom/android/camera/ui/V6GestureRecognizer;


# direct methods
.method private constructor <init>(Lcom/android/camera/ui/V6GestureRecognizer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    .line 402
    iput-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/ui/V6GestureRecognizer;Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p2, "-this1"    # Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;)V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/16 v3, 0x9

    const/4 v2, 0x0

    .line 418
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap2(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 419
    return v2

    .line 421
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v1, v2}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap1(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-virtual {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->getCurrentGesture()I

    move-result v1

    if-ne v1, v3, :cond_3

    .line 422
    :cond_1
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/V6GestureRecognizer;->setGesture(I)V

    .line 423
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->-get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    .line 424
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v4

    .line 423
    invoke-interface {v1, v2, v3, v4}, Lcom/android/camera/module/Module;->onScale(FFF)Z

    move-result v0

    .line 425
    .local v0, "scaled":Z
    iget-boolean v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    if-nez v1, :cond_2

    .line 426
    iput-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    .line 428
    :cond_2
    return v0

    .line 430
    .end local v0    # "scaled":Z
    :cond_3
    return v2
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 3
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v1, 0x0

    .line 409
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap2(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->-get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 410
    :cond_0
    return v1

    .line 412
    :cond_1
    iput-boolean v1, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    .line 413
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->-get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/module/Module;->onScaleBegin(FF)Z

    move-result v0

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    if-eqz v0, :cond_0

    .line 436
    const-string/jumbo v0, "\u624b\u52bf"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackZoomAdjusted(Ljava/lang/String;)V

    .line 437
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->mZoomScaled:Z

    .line 440
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap2(Lcom/android/camera/ui/V6GestureRecognizer;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 441
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v0}, Lcom/android/camera/ui/V6GestureRecognizer;->-get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onScaleEnd()V

    .line 443
    :cond_1
    return-void
.end method
