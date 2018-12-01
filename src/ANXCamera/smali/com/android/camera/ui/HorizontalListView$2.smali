.class Lcom/android/camera/ui/HorizontalListView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/HorizontalListView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    .line 521
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 1
    return-void
.end method

.method private isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z
    .locals 8
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "child"    # Landroid/view/View;

    .prologue
    .line 592
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 593
    .local v5, "viewRect":Landroid/graphics/Rect;
    const/4 v6, 0x2

    new-array v1, v6, [I

    .line 594
    .local v1, "childPosition":[I
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 595
    const/4 v6, 0x0

    aget v2, v1, v6

    .line 596
    .local v2, "left":I
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int v3, v2, v6

    .line 597
    .local v3, "right":I
    const/4 v6, 0x1

    aget v4, v1, v6

    .line 598
    .local v4, "top":I
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int v0, v4, v6

    .line 599
    .local v0, "bottom":I
    invoke-virtual {v5, v2, v4, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 600
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    return v6
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 525
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalListView;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 530
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/ui/HorizontalListView;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 576
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v6

    .line 577
    .local v6, "childCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v6, :cond_0

    .line 578
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, v7}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 579
    .local v2, "child":Landroid/view/View;
    invoke-direct {p0, p1, v2}, Lcom/android/camera/ui/HorizontalListView$2;->isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 580
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get1(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 581
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get0(Lcom/android/camera/ui/HorizontalListView;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    add-int v8, v0, v7

    .line 582
    .local v8, "viewIndex":I
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, v8}, Lcom/android/camera/ui/HorizontalListView;->-wrap0(Lcom/android/camera/ui/HorizontalListView;I)I

    move-result v3

    .line 583
    .local v3, "dataIndex":I
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get1(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    .line 584
    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v4, v4, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    .line 583
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    .line 589
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "dataIndex":I
    .end local v8    # "viewIndex":I
    :cond_0
    return-void

    .line 577
    .restart local v2    # "child":Landroid/view/View;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 5
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v4, 0x1

    .line 535
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->isTouchMoveEnable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 536
    const/4 v0, 0x0

    return v0

    .line 539
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    monitor-enter v1

    .line 540
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget v2, v0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    float-to-int v3, p3

    add-int/2addr v2, v3

    iput v2, v0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 542
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, v4}, Lcom/android/camera/ui/HorizontalListView;->-set2(Lcom/android/camera/ui/HorizontalListView;Z)Z

    .line 543
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    .line 545
    return v4

    .line 539
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x1

    .line 550
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, v8}, Lcom/android/camera/ui/HorizontalListView;->-set0(Lcom/android/camera/ui/HorizontalListView;Z)Z

    .line 551
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    if-ge v6, v0, :cond_1

    .line 552
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0, v6}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 553
    .local v2, "child":Landroid/view/View;
    invoke-direct {p0, p1, v2}, Lcom/android/camera/ui/HorizontalListView$2;->isEventWithinView(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 554
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get0(Lcom/android/camera/ui/HorizontalListView;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    add-int v7, v0, v6

    .line 555
    .local v7, "viewIndex":I
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0, v7}, Lcom/android/camera/ui/HorizontalListView;->-wrap0(Lcom/android/camera/ui/HorizontalListView;I)I

    move-result v3

    .line 560
    .local v3, "dataIndex":I
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get2(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 561
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get2(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    .line 562
    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v4, v4, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    .line 561
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 564
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get3(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 565
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->-get3(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    .line 566
    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView$2;->this$0:Lcom/android/camera/ui/HorizontalListView;

    iget-object v4, v4, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    .line 565
    invoke-interface/range {v0 .. v5}, Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;->onSingleTapDown(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 571
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "dataIndex":I
    .end local v7    # "viewIndex":I
    :cond_1
    return v8

    .line 551
    .restart local v2    # "child":Landroid/view/View;
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method
