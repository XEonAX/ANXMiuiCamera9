.class Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;
.super Ljava/lang/Object;
.source "FragmentPopupMakeup.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 114
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 134
    return v8

    .line 116
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v4, v6

    .line 117
    .local v4, "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v5, v6

    .line 118
    .local v5, "y":I
    iget-object v6, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v6}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->-get3(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Landroid/widget/SeekBar;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 119
    .local v2, "thumbRect":Landroid/graphics/Rect;
    invoke-virtual {v2, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-nez v6, :cond_0

    .line 120
    return v9

    .line 125
    .end local v2    # "thumbRect":Landroid/graphics/Rect;
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_0
    :pswitch_1
    iget-object v6, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v6}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->-get3(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Landroid/widget/SeekBar;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getWidth()I

    move-result v3

    .line 126
    .local v3, "width":I
    iget-object v6, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v6}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->-get2(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Z

    move-result v6

    if-eqz v6, :cond_1

    int-to-float v6, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    sub-float v1, v6, v7

    .line 127
    .local v1, "progress":F
    :goto_0
    int-to-float v6, v3

    div-float v6, v1, v6

    const/high16 v7, 0x42c80000    # 100.0f

    mul-float/2addr v6, v7

    float-to-int v0, v6

    .line 128
    .local v0, "nextProgress":I
    const/16 v6, 0x64

    invoke-static {v0, v8, v6}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    .line 129
    iget-object v6, p0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup$5;->this$0:Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    invoke-static {v6}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;->-get3(Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;)Landroid/widget/SeekBar;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 131
    return v9

    .line 126
    .end local v0    # "nextProgress":I
    .end local v1    # "progress":F
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .restart local v1    # "progress":F
    goto :goto_0

    .line 114
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
