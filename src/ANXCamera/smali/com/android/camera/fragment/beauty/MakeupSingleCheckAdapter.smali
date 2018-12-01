.class public Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MakeupSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;,
        Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mItemHorizontalMargin:I

.field private mPreSelectedItem:I

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mSelectedItem:I

.field private mSingleCheckList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field private onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    return p1
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "horizontalMargin"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p2, "listItems":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;>;"
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 23
    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    .line 24
    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    .line 25
    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    .line 33
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    .line 35
    iput p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    .line 36
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 42
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 43
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 52
    check-cast p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onBindViewHolder(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;I)V
    .locals 3
    .param p1, "viewHolder"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 54
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 56
    .local v1, "item":Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;
    :try_start_0
    invoke-virtual {p1, v1, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->setDateToView(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "i"    # I

    .prologue
    .line 47
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 48
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v2, 0x7f040021

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 49
    .local v1, "view":Landroid/view/View;
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    invoke-direct {v2, p0, v1, p0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;-><init>(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)V

    return-object v2
.end method

.method public onItemHolderClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;)V
    .locals 6
    .param p1, "holder"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    .prologue
    const/4 v1, 0x0

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    iget-object v2, p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->itemView:Landroid/view/View;

    .line 74
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v3

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->getItemId()J

    move-result-wide v4

    .line 73
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 75
    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0
    .param p1, "onItemClickListener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 69
    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 182
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    .line 183
    return-void
.end method
