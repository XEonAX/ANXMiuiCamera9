.class Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "MakeupParamsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

.field final synthetic val$isRTL:Z

.field final synthetic val$margin:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;ZI)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iput-boolean p2, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$isRTL:Z

    iput p3, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$margin:I

    .line 87
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 3
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, 0x0

    .line 90
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 91
    .local v0, "position":I
    iget-boolean v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$isRTL:Z

    if-eqz v1, :cond_2

    .line 92
    if-nez v0, :cond_1

    .line 93
    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$margin:I

    invoke-virtual {p1, v2, v2, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 95
    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$margin:I

    invoke-virtual {p1, v1, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 98
    :cond_2
    if-nez v0, :cond_3

    .line 99
    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$margin:I

    invoke-virtual {p1, v1, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    .line 100
    :cond_3
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 101
    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;->val$margin:I

    invoke-virtual {p1, v2, v2, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0
.end method
