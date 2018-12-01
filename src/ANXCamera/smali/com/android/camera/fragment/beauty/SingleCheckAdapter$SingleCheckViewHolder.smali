.class Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "SingleCheckAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/SingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SingleCheckViewHolder"
.end annotation


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

.field private mBase:Lcom/android/camera/ui/ColorImageView;

.field private mText:Lcom/android/camera/ui/ColorImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/SingleCheckAdapter;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "adapter"    # Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    .line 102
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 103
    iput-object p3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    .line 104
    const v1, 0x7f0a0008

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    .line 105
    const v1, 0x7f0a0007

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    .line 107
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v1}, Lcom/android/camera/ui/ColorImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 108
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get6(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 109
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get6(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 110
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    return-void
.end method

.method private animateIn(Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V
    .locals 4
    .param p1, "imageView"    # Lcom/android/camera/ui/ColorImageView;
    .param p2, "textImage"    # Lcom/android/camera/ui/ColorImageView;

    .prologue
    .line 184
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 185
    .local v0, "animator":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 186
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder$3;-><init>(Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 197
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 198
    return-void

    .line 184
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private animateOut(Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V
    .locals 4
    .param p1, "imageView"    # Lcom/android/camera/ui/ColorImageView;
    .param p2, "textImage"    # Lcom/android/camera/ui/ColorImageView;

    .prologue
    .line 167
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 168
    .local v0, "animator":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 169
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder$2;-><init>(Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 180
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 181
    return-void

    .line 167
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 132
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 133
    return-void

    .line 135
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v1

    .line 136
    .local v1, "newPos":I
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v3

    if-ne v1, v3, :cond_1

    .line 137
    return-void

    .line 139
    :cond_1
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    iget-object v4, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-set0(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;I)I

    .line 140
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v3, v1}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-set1(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;I)I

    .line 141
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get8(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v3

    .line 142
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get7(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v4

    .line 141
    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;

    .line 143
    .local v2, "pre":Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v3}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get8(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v3

    .line 144
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v4

    .line 143
    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;

    .line 146
    .local v0, "curr":Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;
    iget-object v3, v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    iget-object v4, v2, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    invoke-direct {p0, v3, v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->animateOut(Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V

    .line 147
    iget-object v3, v0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    iget-object v4, v0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    invoke-direct {p0, v3, v4}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->animateIn(Lcom/android/camera/ui/ColorImageView;Lcom/android/camera/ui/ColorImageView;)V

    .line 149
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-virtual {v3, p0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->onItemHolderClick(Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;)V

    .line 150
    return-void
.end method

.method public setDateToView(Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;I)V
    .locals 4
    .param p1, "item"    # Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;->getTextResource()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorImageView;->setBackgroundResource(I)V

    .line 115
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    if-ne p2, v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/ColorImageView;->setAlpha(F)V

    .line 116
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    if-ne p2, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get2(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    :goto_1
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 117
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    if-nez p2, :cond_4

    .line 119
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    if-ne p2, v0, :cond_3

    .line 120
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0f00df

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 119
    :goto_2
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/ColorImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 128
    :cond_0
    :goto_3
    return-void

    .line 115
    :cond_1
    const v0, 0x3f19999a    # 0.6f

    goto :goto_0

    .line 116
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get1(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    goto :goto_1

    .line 121
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0f00de

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 123
    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->mText:Lcom/android/camera/ui/ColorImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get9(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)I

    move-result v0

    if-ne p2, v0, :cond_5

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00dc

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    :goto_4
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/ColorImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 125
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/SingleCheckAdapter;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/SingleCheckAdapter;)Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00dd

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method
