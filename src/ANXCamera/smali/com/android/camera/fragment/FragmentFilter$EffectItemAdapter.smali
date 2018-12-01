.class public Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EffectItemAdapter"
.end annotation


# instance fields
.field protected mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

.field protected mLayoutInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFilter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/content/Context;Lcom/android/camera/data/data/config/ComponentConfigFilter;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentFilter;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "filters"    # Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .prologue
    .line 478
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 479
    iput-object p3, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .line 480
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 481
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 503
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 495
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/ComponentDataItem;

    .local v0, "componentDataItem":Lcom/android/camera/data/data/ComponentDataItem;
    move-object v1, p1

    .line 496
    check-cast v1, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;

    .line 497
    .local v1, "effectHolder":Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;
    iget-object v2, v1, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 498
    invoke-virtual {v1, p2, v0}, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V

    .line 499
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 5
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 485
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040001

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 486
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {v0, v2, v1}, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;-><init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/view/View;)V

    .line 488
    .local v0, "holder":Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 489
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v2}, Lcom/android/camera/fragment/FragmentFilter;->-get3(Lcom/android/camera/fragment/FragmentFilter;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 490
    return-object v0
.end method

.method public updateData(Lcom/android/camera/data/data/config/ComponentConfigFilter;)V
    .locals 0
    .param p1, "filters"    # Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .prologue
    .line 507
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->notifyDataSetChanged()V

    .line 509
    return-void
.end method
