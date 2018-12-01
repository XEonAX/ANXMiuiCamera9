.class public Lcom/android/camera/PictureSizeManager;
.super Ljava/lang/Object;
.source "PictureSizeManager.java"


# static fields
.field private static sDefaultValue:Ljava/lang/String;

.field private static final sEntryValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sPictureList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    .line 10
    const-string/jumbo v0, "4x3"

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 13
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string/jumbo v1, "4x3"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string/jumbo v1, "16x9"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    invoke-static {}, Lcom/android/camera/Device;->is18x9RatioScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 16
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    const-string/jumbo v1, "18x9"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    const/4 v1, 0x0

    .line 173
    .local v1, "maxWidth":I
    const/4 v0, 0x0

    .line 174
    .local v0, "maxHeight":I
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "size$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 175
    .local v2, "size":Lcom/android/camera/CameraSize;
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->isAspectRatio16_9()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 176
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    mul-int v5, v1, v0

    if-le v4, v5, :cond_0

    .line 177
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    .line 178
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v0

    goto :goto_0

    .line 182
    .end local v2    # "size":Lcom/android/camera/CameraSize;
    :cond_1
    if-eqz v1, :cond_2

    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4, v1, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    :goto_1
    return-object v4

    :cond_2
    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4}, Lcom/android/camera/CameraSize;-><init>()V

    goto :goto_1
.end method

.method private static _findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .prologue
    .line 186
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    const/4 v1, 0x0

    .line 187
    .local v1, "maxWidth":I
    const/4 v0, 0x0

    .line 188
    .local v0, "maxHeight":I
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "size$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 189
    .local v2, "size":Lcom/android/camera/CameraSize;
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->isAspectRatio18_9()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 190
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    mul-int v5, v1, v0

    if-le v4, v5, :cond_0

    .line 191
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    .line 192
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v0

    goto :goto_0

    .line 196
    .end local v2    # "size":Lcom/android/camera/CameraSize;
    :cond_1
    if-eqz v1, :cond_2

    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4, v1, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    :goto_1
    return-object v4

    :cond_2
    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4}, Lcom/android/camera/CameraSize;-><init>()V

    goto :goto_1
.end method

.method private static _findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    const/4 v1, 0x0

    .line 159
    .local v1, "maxWidth":I
    const/4 v0, 0x0

    .line 160
    .local v0, "maxHeight":I
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "size$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 161
    .local v2, "size":Lcom/android/camera/CameraSize;
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->isAspectRatio1_1()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 162
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    mul-int v5, v1, v0

    if-le v4, v5, :cond_0

    .line 163
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    .line 164
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v0

    goto :goto_0

    .line 168
    .end local v2    # "size":Lcom/android/camera/CameraSize;
    :cond_1
    if-eqz v1, :cond_2

    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4, v1, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    :goto_1
    return-object v4

    :cond_2
    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4}, Lcom/android/camera/CameraSize;-><init>()V

    goto :goto_1
.end method

.method private static _findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    const/4 v1, 0x0

    .line 145
    .local v1, "maxWidth":I
    const/4 v0, 0x0

    .line 146
    .local v0, "maxHeight":I
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "size$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    .line 147
    .local v2, "size":Lcom/android/camera/CameraSize;
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->isAspectRatio4_3()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 148
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    mul-int v5, v1, v0

    if-le v4, v5, :cond_0

    .line 149
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    .line 150
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v0

    goto :goto_0

    .line 154
    .end local v2    # "size":Lcom/android/camera/CameraSize;
    :cond_1
    if-eqz v1, :cond_2

    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4, v1, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    :goto_1
    return-object v4

    :cond_2
    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-direct {v4}, Lcom/android/camera/CameraSize;-><init>()V

    goto :goto_1
.end method

.method public static getBestPanoPictureSize()Lcom/android/camera/CameraSize;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "desire":Lcom/android/camera/CameraSize;
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 83
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 93
    .local v0, "desire":Lcom/android/camera/CameraSize;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 94
    :cond_1
    new-instance v0, Lcom/android/camera/CameraSize;

    .line 95
    .end local v0    # "desire":Lcom/android/camera/CameraSize;
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v2, v1, Lcom/android/camera/CameraSize;->width:I

    .line 96
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    .line 94
    invoke-direct {v0, v2, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 98
    .restart local v0    # "desire":Lcom/android/camera/CameraSize;
    :cond_2
    return-object v0

    .line 84
    .local v0, "desire":Lcom/android/camera/CameraSize;
    :cond_3
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->isAspectRatio18_9(II)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 85
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 86
    .local v0, "desire":Lcom/android/camera/CameraSize;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    :cond_4
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    .line 90
    .local v0, "desire":Lcom/android/camera/CameraSize;
    :cond_5
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .local v0, "desire":Lcom/android/camera/CameraSize;
    goto :goto_0
.end method

.method public static getBestPictureSize()Lcom/android/camera/CameraSize;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 62
    invoke-static {v4}, Lcom/android/camera/PictureSizeManager;->getPictureSize(Z)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 63
    .local v0, "candidate":Lcom/android/camera/CameraSize;
    const/4 v1, 0x0

    .line 64
    .local v1, "desire":Lcom/android/camera/CameraSize;
    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isAspectRatio16_9()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 65
    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 74
    .end local v1    # "desire":Lcom/android/camera/CameraSize;
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 75
    :cond_1
    new-instance v1, Lcom/android/camera/CameraSize;

    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v1, v3, v2}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 77
    :cond_2
    return-object v1

    .line 66
    .restart local v1    # "desire":Lcom/android/camera/CameraSize;
    :cond_3
    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isAspectRatio4_3()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 67
    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    .local v1, "desire":Lcom/android/camera/CameraSize;
    goto :goto_0

    .line 68
    .local v1, "desire":Lcom/android/camera/CameraSize;
    :cond_4
    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isAspectRatio1_1()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 69
    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    .local v1, "desire":Lcom/android/camera/CameraSize;
    goto :goto_0

    .line 70
    .local v1, "desire":Lcom/android/camera/CameraSize;
    :cond_5
    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isAspectRatio18_9()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 71
    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    .local v1, "desire":Lcom/android/camera/CameraSize;
    goto :goto_0
.end method

.method public static getDefaultValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public static getEntries()[Ljava/lang/String;
    .locals 6

    .prologue
    const v5, 0x7f0f003c

    const v1, 0x7f0f003b

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 21
    invoke-static {}, Lcom/android/camera/Device;->is18x9RatioScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 23
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 24
    invoke-static {v5}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    .line 25
    const v1, 0x7f0f003d

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    .line 22
    return-object v0

    .line 28
    :cond_0
    new-array v0, v4, [Ljava/lang/String;

    .line 29
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 30
    invoke-static {v5}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    .line 28
    return-object v0
.end method

.method public static getEntryValues()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 36
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 37
    .local v0, "result":[Ljava/lang/String;
    sget-object v1, Lcom/android/camera/PictureSizeManager;->sEntryValues:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 38
    return-object v0
.end method

.method public static getPictureSize(Z)Lcom/android/camera/CameraSize;
    .locals 2
    .param p0, "settingOnly"    # Z

    .prologue
    .line 54
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getPictureSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/CameraSize;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static initSensorRatio(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    sget-boolean v4, Lcom/android/camera/Device;->IS_X9:Z

    if-nez v4, :cond_0

    sget-boolean v4, Lcom/android/camera/Device;->IS_A8:Z

    if-eqz v4, :cond_1

    .line 202
    :cond_0
    const-string/jumbo v4, "16x9"

    sput-object v4, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 203
    return-void

    .line 206
    :cond_1
    const/4 v1, -0x1

    .line 207
    .local v1, "maxIndex":I
    const/4 v2, 0x0

    .line 208
    .local v2, "maxValue":I
    new-instance v3, Lcom/android/camera/CameraSize;

    invoke-direct {v3}, Lcom/android/camera/CameraSize;-><init>()V

    .line 209
    .local v3, "pictureSize":Lcom/android/camera/CameraSize;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 210
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Lcom/android/camera/CameraSize;->parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;

    .line 211
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->area()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 212
    move v1, v0

    .line 213
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->area()I

    move-result v2

    .line 209
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 216
    :cond_3
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Lcom/android/camera/CameraSize;->parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;

    .line 217
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->isAspectRatio4_3()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 218
    const-string/jumbo v4, "4x3"

    sput-object v4, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    .line 222
    :goto_1
    return-void

    .line 220
    :cond_4
    const-string/jumbo v4, "16x9"

    sput-object v4, Lcom/android/camera/PictureSizeManager;->sDefaultValue:Ljava/lang/String;

    goto :goto_1
.end method

.method public static initialize(Ljava/util/List;I)V
    .locals 9
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 103
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_1

    .line 104
    :cond_0
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "The supported picture size list return from hal is null!"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 106
    :cond_1
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->initSensorRatio(Ljava/util/List;)V

    .line 108
    if-eqz p1, :cond_4

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/CameraSize;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "size$iterator":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    .line 111
    .local v1, "size":Lcom/android/camera/CameraSize;
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->area()I

    move-result v7

    if-gt v7, p1, :cond_2

    .line 112
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    .end local v1    # "size":Lcom/android/camera/CameraSize;
    :cond_3
    move-object p0, v0

    .line 118
    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/CameraSize;>;"
    .end local v2    # "size$iterator":Ljava/util/Iterator;
    :cond_4
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v6

    .line 119
    .local v6, "size4_3":Lcom/android/camera/CameraSize;
    if-eqz v6, :cond_5

    .line 120
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    :cond_5
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v5

    .line 124
    .local v5, "size1_1":Lcom/android/camera/CameraSize;
    if-eqz v5, :cond_6

    .line 125
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    :cond_6
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 129
    .local v3, "size16_9":Lcom/android/camera/CameraSize;
    if-eqz v3, :cond_7

    .line 130
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    :cond_7
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v4

    .line 134
    .local v4, "size18_9":Lcom/android/camera/CameraSize;
    if-eqz v4, :cond_8

    .line 135
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    :cond_8
    sget-object v7, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_9

    .line 139
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Not find the desire picture sizes!"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 141
    :cond_9
    return-void
.end method
