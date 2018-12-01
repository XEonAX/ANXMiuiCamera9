.class Lcom/android/camera/ui/FocusView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "FocusView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/FocusView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/FocusView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/FocusView;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    .line 731
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 736
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get14(Lcom/android/camera/ui/FocusView;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 737
    return v4

    .line 740
    :cond_0
    const/4 v2, 0x0

    .line 741
    .local v2, "supportTapDownCapture":Z
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get7(Lcom/android/camera/ui/FocusView;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 752
    .end local v2    # "supportTapDownCapture":Z
    :goto_0
    :pswitch_0
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get8(Lcom/android/camera/ui/FocusView;)I

    move-result v3

    if-nez v3, :cond_3

    if-eqz v2, :cond_3

    .line 754
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get9(Lcom/android/camera/ui/FocusView;)Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get9(Lcom/android/camera/ui/FocusView;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    .line 755
    sget v6, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v6, v6

    const/high16 v7, 0x3f000000    # 0.5f

    mul-float/2addr v6, v7

    .line 754
    invoke-static {v3, v4, v5, v6}, Lcom/android/camera/ui/FocusView;->-wrap0(Lcom/android/camera/ui/FocusView;FFF)Z

    move-result v3

    .line 752
    if-eqz v3, :cond_3

    .line 756
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 757
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 758
    const/16 v4, 0xa6

    .line 757
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 759
    .local v1, "main":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->removeTiltShiftMask()V

    .line 761
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 762
    const/16 v4, 0xa1

    .line 761
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 763
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1

    .line 765
    const/16 v3, 0x5a

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 775
    .end local v0    # "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    .end local v1    # "main":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    :cond_1
    :goto_1
    return v8

    .line 746
    .restart local v2    # "supportTapDownCapture":Z
    :pswitch_1
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get12(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/FocusView$ExposureViewListener;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 747
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get12(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/FocusView$ExposureViewListener;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v3

    .line 746
    if-eqz v3, :cond_2

    .line 748
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-get12(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/FocusView$ExposureViewListener;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowAeAfLockIndicator()Z

    move-result v3

    xor-int/lit8 v2, v3, 0x1

    .local v2, "supportTapDownCapture":Z
    goto/16 :goto_0

    .line 746
    .local v2, "supportTapDownCapture":Z
    :cond_2
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 770
    .end local v2    # "supportTapDownCapture":Z
    :cond_3
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3, v8}, Lcom/android/camera/ui/FocusView;->-set5(Lcom/android/camera/ui/FocusView;Z)Z

    .line 771
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-wrap4(Lcom/android/camera/ui/FocusView;)V

    .line 772
    iget-object v3, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v3}, Lcom/android/camera/ui/FocusView;->-wrap8(Lcom/android/camera/ui/FocusView;)V

    goto :goto_1

    .line 741
    nop

    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 781
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get13(Lcom/android/camera/ui/FocusView;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 782
    const/4 v5, 0x0

    return v5

    .line 785
    :cond_0
    if-nez p2, :cond_1

    .line 786
    const/4 v5, 0x0

    return v5

    .line 789
    :cond_1
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get15(Lcom/android/camera/ui/FocusView;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 790
    const/4 v5, 0x0

    return v5

    .line 793
    :cond_2
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get2(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/Camera;

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->getGestureOrientation()I

    move-result v1

    .line 794
    .local v1, "gestureOri":I
    const/16 v5, 0xc8

    if-ne v1, v5, :cond_3

    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get16(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    div-int/lit8 v5, v5, 0x5a

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_5

    .line 795
    :cond_3
    const/16 v5, 0x64

    if-ne v1, v5, :cond_4

    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get16(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    div-int/lit8 v5, v5, 0x5a

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_5

    .line 796
    :cond_4
    const/4 v5, 0x0

    return v5

    .line 799
    :cond_5
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get17(Lcom/android/camera/ui/FocusView;)I

    move-result v3

    .line 800
    .local v3, "newScrollY":I
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get16(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 819
    :goto_0
    sget v5, Lcom/android/camera/Util;->sWindowHeight:I

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    sget v6, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    int-to-float v6, v6

    const/high16 v7, 0x40800000    # 4.0f

    div-float/2addr v6, v7

    div-float v0, v5, v6

    .line 820
    .local v0, "base":F
    int-to-float v5, v3

    div-float/2addr v5, v0

    float-to-int v2, v5

    .line 821
    .local v2, "newDistanceY":I
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    .line 822
    sget v6, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    neg-int v6, v6

    div-int/lit8 v6, v6, 0x2

    invoke-static {}, Lcom/android/camera/ui/FocusView;->-get1()I

    move-result v7

    sub-int/2addr v6, v7

    sget v7, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/lit8 v7, v7, 0x2

    .line 821
    invoke-static {v2, v6, v7}, Lcom/android/camera/Util;->clamp(III)I

    move-result v6

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set1(Lcom/android/camera/ui/FocusView;I)I

    .line 823
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get5(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    if-ne v2, v5, :cond_6

    .line 824
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5, v3}, Lcom/android/camera/ui/FocusView;->-set7(Lcom/android/camera/ui/FocusView;I)I

    .line 827
    :cond_6
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set0(Lcom/android/camera/ui/FocusView;Z)Z

    .line 829
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-wrap1(Lcom/android/camera/ui/FocusView;)I

    move-result v4

    .line 831
    .local v4, "targetItem":I
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    if-eq v4, v5, :cond_8

    .line 832
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get8(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    const/4 v6, 0x3

    if-eq v5, v6, :cond_b

    .line 833
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    if-ge v4, v5, :cond_b

    .line 834
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v6

    if-lt v5, v6, :cond_b

    .line 835
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v5

    if-ge v4, v5, :cond_b

    .line 836
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-wrap9(Lcom/android/camera/ui/FocusView;)V

    .line 837
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v6

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set6(Lcom/android/camera/ui/FocusView;I)I

    .line 838
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v6, 0x3

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set2(Lcom/android/camera/ui/FocusView;I)I

    .line 848
    :cond_7
    :goto_1
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v6, 0x0

    invoke-static {v5, v4, v6}, Lcom/android/camera/ui/FocusView;->-wrap7(Lcom/android/camera/ui/FocusView;IZ)V

    .line 851
    :cond_8
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get4(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get5(Lcom/android/camera/ui/FocusView;)I

    move-result v6

    int-to-float v6, v6

    iget-object v7, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v7}, Lcom/android/camera/ui/FocusView;->-get11(Lcom/android/camera/ui/FocusView;)F

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvChanged(FF)V

    .line 853
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get8(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get8(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_a

    .line 854
    :cond_9
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set2(Lcom/android/camera/ui/FocusView;I)I

    .line 855
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-wrap2(Lcom/android/camera/ui/FocusView;)V

    .line 856
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v5}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 858
    :cond_a
    const/4 v5, 0x1

    return v5

    .line 802
    .end local v0    # "base":F
    .end local v2    # "newDistanceY":I
    .end local v4    # "targetItem":I
    :sswitch_0
    int-to-float v5, v3

    sub-float/2addr v5, p4

    float-to-int v3, v5

    .line 803
    goto/16 :goto_0

    .line 805
    :sswitch_1
    int-to-float v5, v3

    add-float/2addr v5, p3

    float-to-int v3, v5

    .line 806
    goto/16 :goto_0

    .line 808
    :sswitch_2
    int-to-float v5, v3

    add-float/2addr v5, p4

    float-to-int v3, v5

    .line 809
    goto/16 :goto_0

    .line 811
    :sswitch_3
    int-to-float v5, v3

    sub-float/2addr v5, p3

    float-to-int v3, v5

    .line 812
    goto/16 :goto_0

    .line 839
    .restart local v0    # "base":F
    .restart local v2    # "newDistanceY":I
    .restart local v4    # "targetItem":I
    :cond_b
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get8(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    const/4 v6, 0x4

    if-eq v5, v6, :cond_7

    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    if-le v4, v5, :cond_7

    .line 840
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v6

    if-ge v5, v6, :cond_7

    .line 841
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v5

    if-lt v4, v5, :cond_7

    .line 842
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v5}, Lcom/android/camera/ui/FocusView;->-wrap9(Lcom/android/camera/ui/FocusView;)V

    .line 843
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    iget-object v6, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v6}, Lcom/android/camera/ui/FocusView;->-get6(Lcom/android/camera/ui/FocusView;)I

    move-result v6

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set6(Lcom/android/camera/ui/FocusView;I)I

    .line 844
    iget-object v5, p0, Lcom/android/camera/ui/FocusView$2;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v6, 0x4

    invoke-static {v5, v6}, Lcom/android/camera/ui/FocusView;->-set2(Lcom/android/camera/ui/FocusView;I)I

    goto/16 :goto_1

    .line 800
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5a -> :sswitch_1
        0xb4 -> :sswitch_2
        0x10e -> :sswitch_3
    .end sparse-switch
.end method
