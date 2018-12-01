.class public Lcom/android/camera/data/data/config/ComponentConfigBeauty;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBeauty.java"


# static fields
.field public static final BEAUTY_CLOSE:Ljava/lang/String;

.field public static final BEAUTY_DEEP:Ljava/lang/String;

.field public static final BEAUTY_DEEP_LEGACY:Ljava/lang/String;

.field public static final BEAUTY_LOW:Ljava/lang/String;

.field public static final BEAUTY_LOW_LEGACY:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mIsClosed:Landroid/util/SparseBooleanArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    .line 25
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW:Ljava/lang/String;

    .line 27
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXXHIGH:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    .line 28
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW_LEGACY:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP_LEGACY:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 8
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    const v7, 0x7f0f0151

    const v6, 0x7f0200a8

    const v5, 0x7f0200a7

    const v4, 0x7f0f0150

    const v3, 0x7f0200a9

    .line 48
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    .line 50
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 51
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    .line 50
    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 54
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW:Ljava/lang/String;

    .line 53
    invoke-direct {v1, v3, v6, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 56
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    .line 55
    invoke-direct {v1, v3, v5, v7, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 59
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW_LEGACY:Ljava/lang/String;

    .line 58
    invoke-direct {v1, v3, v6, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 61
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP_LEGACY:Ljava/lang/String;

    .line 60
    invoke-direct {v1, v3, v5, v7, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 153
    :cond_0
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 5
    .param p1, "mode"    # I

    .prologue
    .line 86
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 87
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    return-object v2

    .line 89
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, "value":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 91
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 92
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP_LEGACY:Ljava/lang/String;

    .line 109
    :cond_1
    :goto_0
    return-object v1

    .line 93
    :cond_2
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 94
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXHIGH:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 93
    if-nez v2, :cond_3

    .line 95
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXXHIGH:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 96
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyDefaultValue()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "defaultValue":Ljava/lang/String;
    sget-object v2, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid beauty level "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    move-object v1, v0

    goto :goto_0

    .line 101
    .end local v0    # "defaultValue":Ljava/lang/String;
    :cond_4
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 102
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 101
    if-eqz v2, :cond_6

    .line 103
    :cond_5
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW:Ljava/lang/String;

    goto :goto_0

    .line 104
    :cond_6
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 105
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXHIGH:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 104
    if-eqz v2, :cond_1

    .line 106
    :cond_7
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    goto :goto_0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 81
    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 76
    const-string/jumbo v0, "pref_camera_face_beauty_key"

    return-object v0
.end method

.method public getNextValue(I)Ljava/lang/String;
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "value":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 130
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW:Ljava/lang/String;

    return-object v1

    .line 132
    :cond_0
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 133
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    return-object v1

    .line 134
    :cond_1
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 135
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    return-object v1

    .line 138
    :cond_2
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 139
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW_LEGACY:Ljava/lang/String;

    return-object v1

    .line 140
    :cond_3
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_LOW_LEGACY:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 141
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP_LEGACY:Ljava/lang/String;

    return-object v1

    .line 142
    :cond_4
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_DEEP:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 143
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    return-object v1

    .line 146
    :cond_5
    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    return-object v1
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 113
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isClosed(I)Z
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 35
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    return v0
.end method

.method public isSwitchOn(I)Z
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 71
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public setClosed(ZI)V
    .locals 1
    .param p1, "close"    # Z
    .param p2, "mode"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 45
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1
    .param p1, "mode"    # I
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 119
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 120
    return-void
.end method
