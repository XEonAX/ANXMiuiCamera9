.class public Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ManuallyAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/android/camera/fragment/CommonRecyclerViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mComponentDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentData;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentMode:I

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mSelectedTitle:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILandroid/view/View$OnClickListener;Ljava/util/List;)V
    .locals 0
    .param p1, "currentMode"    # I
    .param p2, "onClickListener"    # Landroid/view/View$OnClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/view/View$OnClickListener;",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "componentDataList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentData;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 35
    iput p1, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mCurrentMode:I

    .line 36
    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 37
    iput-object p3, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mComponentDataList:Ljava/util/List;

    .line 38
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mComponentDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 54
    check-cast p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
    .locals 11
    .param p1, "holder"    # Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .param p2, "position"    # I

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 56
    iget-object v7, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mComponentDataList:Ljava/util/List;

    invoke-interface {v7, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentData;

    .line 58
    .local v1, "componentData":Lcom/android/camera/data/data/ComponentData;
    iget-object v7, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    iget-object v8, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v7, p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 61
    const v7, 0x7f0a0043

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 62
    .local v3, "key":Landroid/widget/TextView;
    invoke-virtual {v1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v7

    if-lez v7, :cond_0

    .line 63
    invoke-virtual {v1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v7

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(I)V

    .line 67
    :cond_0
    invoke-virtual {v1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v7

    iget v8, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mSelectedTitle:I

    if-ne v7, v8, :cond_1

    .line 68
    const v0, -0xff5701

    .line 72
    .local v0, "color":I
    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    const v7, 0x7f0a0044

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 75
    .local v5, "value":Landroid/widget/TextView;
    const v7, 0x7f0a0045

    invoke-virtual {p1, v7}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 77
    .local v6, "valueImage":Landroid/widget/ImageView;
    iget v7, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mCurrentMode:I

    invoke-virtual {v1, v7}, Lcom/android/camera/data/data/ComponentData;->getValueDisplayString(I)I

    move-result v4

    .line 78
    .local v4, "text":I
    const/4 v7, -0x2

    if-eq v4, v7, :cond_2

    .line 79
    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 80
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(I)V

    .line 81
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 88
    :goto_1
    return-void

    .line 70
    .end local v0    # "color":I
    .end local v4    # "text":I
    .end local v5    # "value":Landroid/widget/TextView;
    .end local v6    # "valueImage":Landroid/widget/ImageView;
    :cond_1
    const v0, -0x4c000001

    .restart local v0    # "color":I
    goto :goto_0

    .line 83
    .restart local v4    # "text":I
    .restart local v5    # "value":Landroid/widget/TextView;
    .restart local v6    # "valueImage":Landroid/widget/ImageView;
    :cond_2
    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 84
    iget v7, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mCurrentMode:I

    invoke-virtual {v1, v7}, Lcom/android/camera/data/data/ComponentData;->getValueSelectedDrawable(I)I

    move-result v2

    .line 85
    .local v2, "drawable":I
    invoke-virtual {v6, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 86
    invoke-virtual {v6, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 48
    const v2, 0x7f040012

    const/4 v3, 0x0

    .line 47
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 49
    .local v0, "view":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 50
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->getItemCount()I

    move-result v3

    div-int/2addr v2, v3

    .line 49
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    new-instance v1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-direct {v1, v0}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method

.method public setSelectedTitle(I)V
    .locals 0
    .param p1, "selectedTitle"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 41
    iput p1, p0, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->mSelectedTitle:I

    .line 42
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->notifyDataSetChanged()V

    .line 43
    return-void
.end method
