.class Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecyclerViewDataObserver"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 2

    .prologue
    .line 4100
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "x1"    # Landroid/support/v7/widget/RecyclerView$1;

    .prologue
    .line 4100
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 4103
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 4104
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$2400(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v0

    if-nez v0, :cond_2a

    .line 4111
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-static {v0, v2}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    .line 4112
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->setDataSetChangedAfterLayout()V
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3300(Landroid/support/v7/widget/RecyclerView;)V

    .line 4114
    :goto_1f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->hasPendingUpdates()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 4117
    :goto_29
    return-void

    .line 4108
    :cond_2a
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-static {v0, v2}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    .line 4109
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->setDataSetChangedAfterLayout()V
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3300(Landroid/support/v7/widget/RecyclerView;)V

    goto :goto_1f

    .line 4115
    :cond_37
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    goto :goto_29
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .registers 6
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I
    .param p3, "payload"    # Ljava/lang/Object;

    .prologue
    .line 4121
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 4122
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/AdapterHelper;->onItemRangeChanged(IILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 4125
    :goto_10
    return-void

    .line 4123
    :cond_11
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->triggerUpdateProcessor()V

    goto :goto_10
.end method

.method public onItemRangeInserted(II)V
    .registers 5
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 4129
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 4130
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/AdapterHelper;->onItemRangeInserted(II)Z

    move-result v0

    if-nez v0, :cond_11

    .line 4133
    :goto_10
    return-void

    .line 4131
    :cond_11
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->triggerUpdateProcessor()V

    goto :goto_10
.end method

.method public onItemRangeMoved(III)V
    .registers 6
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 4145
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 4146
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/AdapterHelper;->onItemRangeMoved(III)Z

    move-result v0

    if-nez v0, :cond_11

    .line 4149
    :goto_10
    return-void

    .line 4147
    :cond_11
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->triggerUpdateProcessor()V

    goto :goto_10
.end method

.method public onItemRangeRemoved(II)V
    .registers 5
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 4137
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 4138
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/AdapterHelper;->onItemRangeRemoved(II)Z

    move-result v0

    if-nez v0, :cond_11

    .line 4141
    :goto_10
    return-void

    .line 4139
    :cond_11
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->triggerUpdateProcessor()V

    goto :goto_10
.end method

.method triggerUpdateProcessor()V
    .registers 3

    .prologue
    .line 4152
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mPostUpdatesOnAnimation:Z
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3400(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 4155
    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    # setter for: Landroid/support/v7/widget/RecyclerView;->mAdapterUpdateDuringMeasure:Z
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView;->access$3802(Landroid/support/v7/widget/RecyclerView;Z)Z

    .line 4156
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    .line 4158
    :goto_13
    return-void

    .line 4152
    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mHasFixedSize:Z
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3500(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3600(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 4153
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mUpdateChildViewsRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Landroid/support/v7/widget/RecyclerView;->access$3700(Landroid/support/v7/widget/RecyclerView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_13
.end method
