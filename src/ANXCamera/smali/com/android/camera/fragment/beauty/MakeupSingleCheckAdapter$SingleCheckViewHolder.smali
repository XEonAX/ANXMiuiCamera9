.class Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "MakeupSingleCheckAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SingleCheckViewHolder"
.end annotation


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

.field private mBase:Lcom/android/camera/ui/ColorImageView;

.field private mText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "mAdapter"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .line 84
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 85
    iput-object p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .line 87
    const v1, 0x7f0a006c

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    .line 88
    const v1, 0x7f0a006b

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    .line 90
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v1}, Lcom/android/camera/ui/ColorImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 91
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get1(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 92
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get1(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 93
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    return-void
.end method

.method private colorAnimate(Lcom/android/camera/ui/ColorImageView;II)V
    .locals 5
    .param p1, "v"    # Lcom/android/camera/ui/ColorImageView;
    .param p2, "fromColor"    # I
    .param p3, "toColor"    # I

    .prologue
    .line 167
    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 168
    .local v0, "colorAnimation":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 169
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder$2;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder$2;-><init>(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;Lcom/android/camera/ui/ColorImageView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 177
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 178
    return-void
.end method

.method private textColorAnimate(Landroid/widget/TextView;II)V
    .locals 5
    .param p1, "tv"    # Landroid/widget/TextView;
    .param p2, "fromColor"    # I
    .param p3, "toColor"    # I

    .prologue
    .line 152
    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 153
    .local v0, "colorAnimation":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 154
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder$1;-><init>(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 162
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 163
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v10, 0x7f0d001e

    const v9, 0x7f0d001d

    const v8, 0x7f0d001c

    const v7, 0x7f0d001b

    .line 116
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v1

    .line 117
    .local v1, "newPos":I
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v4

    if-ne v1, v4, :cond_0

    .line 118
    return-void

    .line 120
    :cond_0
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v5

    invoke-static {v4, v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-set0(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I

    .line 121
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v4, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-set1(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I

    .line 123
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get2(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 122
    check-cast v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    .line 125
    .local v2, "pre":Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get3(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 124
    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    .line 126
    .local v0, "curr":Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get0(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 127
    .local v3, "res":Landroid/content/res/Resources;
    if-eqz v2, :cond_1

    .line 128
    iget-object v4, v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    .line 129
    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .line 130
    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    .line 128
    invoke-direct {p0, v4, v5, v6}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->colorAnimate(Lcom/android/camera/ui/ColorImageView;II)V

    .line 132
    :cond_1
    iget-object v4, v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    .line 133
    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .line 134
    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    .line 132
    invoke-direct {p0, v4, v5, v6}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->colorAnimate(Lcom/android/camera/ui/ColorImageView;II)V

    .line 136
    if-eqz v2, :cond_2

    .line 137
    iget-object v4, v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    .line 138
    invoke-virtual {v3, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .line 139
    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    .line 137
    invoke-direct {p0, v4, v5, v6}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->textColorAnimate(Landroid/widget/TextView;II)V

    .line 141
    :cond_2
    iget-object v4, v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    .line 142
    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .line 143
    invoke-virtual {v3, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    .line 141
    invoke-direct {p0, v4, v5, v6}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->textColorAnimate(Landroid/widget/TextView;II)V

    .line 144
    if-nez v2, :cond_3

    .line 145
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get2(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyItemChanged(I)V

    .line 147
    :cond_3
    iget-object v4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v4, p0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemHolderClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;)V

    .line 148
    return-void
.end method

.method public setDateToView(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;I)V
    .locals 4
    .param p1, "item"    # Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get0(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 98
    .local v0, "res":Landroid/content/res/Resources;
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getTextResource()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v1

    if-ne p2, v1, :cond_1

    .line 100
    const v1, 0x7f0d001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 99
    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v1

    if-ne p2, v1, :cond_2

    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getTextResource()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v3, 0x7f0f00dc

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 103
    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 108
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getImageResource()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 109
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->mBase:Lcom/android/camera/ui/ColorImageView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->this$0:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->-get4(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I

    move-result v1

    if-ne p2, v1, :cond_3

    .line 110
    const v1, 0x7f0d001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 109
    :goto_2
    invoke-virtual {v2, v1}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 112
    return-void

    .line 101
    :cond_1
    const v1, 0x7f0d001d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    goto :goto_0

    .line 105
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getTextResource()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v3, 0x7f0f00dd

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 111
    :cond_3
    const v1, 0x7f0d001b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    goto :goto_2
.end method
