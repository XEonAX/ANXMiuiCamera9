.class public Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;
.super Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.source "RemodelingParamsFragment.java"


# static fields
.field private static final MAKEUP_ITEM_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/camera/effect/BeautyParameters$Type;",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBeautyTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/effect/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)Ljava/util/List;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    sput-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    .line 25
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 26
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020103

    const v4, 0x7f0f01ac

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 28
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020102

    const v4, 0x7f0f01ab

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 27
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 30
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020106

    const v4, 0x7f0f01ad

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 29
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 32
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020107

    const v4, 0x7f0f01ae

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 31
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 34
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020104

    const v4, 0x7f0f01af

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 36
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020101

    const v4, 0x7f0f01b0

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 35
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 38
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020105

    const v4, 0x7f0f01b1

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 40
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020108

    const v4, 0x7f0f01b2

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 39
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 42
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v3, 0x7f020109

    const v4, 0x7f0f01b3

    invoke-direct {v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    .line 41
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected beautyTypetoPosition(Lcom/android/camera/effect/BeautyParameters$Type;)I
    .locals 1
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected initItems()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;>;"
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v4

    const/4 v2, 0x0

    array-length v5, v4

    move v3, v2

    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v1, v4, v3

    .line 53
    .local v1, "type":Lcom/android/camera/effect/BeautyParameters$Type;
    sget-object v2, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 54
    sget-object v2, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->MAKEUP_ITEM_MAP:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    :cond_0
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    .line 58
    .end local v1    # "type":Lcom/android/camera/effect/BeautyParameters$Type;
    :cond_1
    return-object v0
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    .prologue
    .line 74
    new-instance v0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V

    return-object v0
.end method

.method protected provideItemHorizontalMargin()I
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mBeautyTypes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 65
    const v1, 0x7f090063

    .line 64
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 68
    const v1, 0x7f090062

    .line 67
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method
