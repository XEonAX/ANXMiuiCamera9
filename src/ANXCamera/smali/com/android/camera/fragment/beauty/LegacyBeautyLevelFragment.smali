.class public Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;
.super Lcom/android/camera/fragment/beauty/BeautyLevelFragment;
.source "LegacyBeautyLevelFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected beautyLevelToPosition(II)I
    .locals 1
    .param p1, "beautyLevel"    # I
    .param p2, "maxPosition"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    return v0
.end method

.method protected initItems()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;>;"
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v2, 0x7f020027

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v2, 0x7f020021

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v2, 0x7f020022

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v1, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;

    const v2, 0x7f020023

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/beauty/SingleCheckAdapter$LevelItem;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    return-object v0
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;)V

    return-object v0
.end method

.method protected provideItemHorizontalMargin()I
    .locals 2

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method
