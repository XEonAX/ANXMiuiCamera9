.class public Lcom/android/camera/CameraSettings;
.super Ljava/lang/Object;
.source "CameraSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/CameraSettings$UiStyle;
    }
.end annotation


# static fields
.field public static BOTTOM_CONTROL_HEIGHT:I

.field public static final SURFACE_LEFT_MARGIN_MDP_QUALITY_480P:I

.field public static final SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW:I

.field public static final TOP_CONTROL_HEIGHT:I

.field public static final sCameraChangeManager:Lcom/android/camera/ChangeManager;

.field public static sCroppedIfNeeded:Z

.field private static sEdgePhotoEnable:Z

.field private static sFaceBeautyLevelToValue:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sGoolgeLensAvilability:Z

.field public static sRemindMode:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sSceneToFlash:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 272
    sput-boolean v3, Lcom/android/camera/CameraSettings;->sCroppedIfNeeded:Z

    .line 273
    sput-boolean v3, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    .line 275
    sput-boolean v3, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    .line 282
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 283
    const v1, 0x7f09001d

    .line 282
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/CameraSettings;->TOP_CONTROL_HEIGHT:I

    .line 285
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 286
    const v1, 0x7f09004e

    .line 285
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/CameraSettings;->SURFACE_LEFT_MARGIN_MDP_QUALITY_480P:I

    .line 287
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 288
    const v1, 0x7f09004f

    .line 287
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/CameraSettings;->SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW:I

    .line 289
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    .line 290
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    .line 291
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    .line 294
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "auto"

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "portrait"

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "landscape"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "sports"

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "night"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "night-portrait"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "beach"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "snow"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "sunset"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "fireworks"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "backlight"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string/jumbo v1, "flowers"

    const-string/jumbo v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget-object v0, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string/jumbo v1, "pref_camera_mode_settings_key"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 308
    sget-object v0, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string/jumbo v1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    invoke-static {}, Lcom/android/camera/Device;->isSupportGroupShot()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 310
    sget-object v0, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string/jumbo v1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 314
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 315
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 316
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 317
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 775
    :goto_0
    new-instance v0, Lcom/android/camera/ChangeManager;

    invoke-direct {v0}, Lcom/android/camera/ChangeManager;-><init>()V

    sput-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    .line 71
    return-void

    .line 320
    :cond_1
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 321
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 322
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 323
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 324
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXHIGH:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 325
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXXHIGH:Ljava/lang/String;

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addLensDirtyDetectedTimes()V
    .locals 12

    .prologue
    const/4 v11, 0x5

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1758
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1759
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v6, "pref_lens_dirty_detect_enabled_key"

    invoke-interface {v0, v6, v8}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1761
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1762
    .local v2, "now":J
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 1763
    .local v5, "today":Ljava/util/Calendar;
    invoke-virtual {v5, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1764
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 1765
    .local v1, "lastDate":Ljava/util/Calendar;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    const-string/jumbo v7, "pref_lens_dirty_detect_date_key"

    invoke-virtual {v6, v7, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1767
    const/4 v4, 0x1

    .line 1768
    .local v4, "times":I
    invoke-virtual {v5, v9}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 1769
    invoke-virtual {v5, v10}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v1, v10}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 1770
    invoke-virtual {v5, v11}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v1, v11}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 1771
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    const-string/jumbo v7, "pref_lens_dirty_detect_times_key"

    invoke-virtual {v6, v7, v8}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 1773
    add-int/lit8 v4, v4, 0x1

    .line 1775
    :cond_0
    const-string/jumbo v6, "pref_lens_dirty_detect_times_key"

    invoke-interface {v0, v6, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1776
    const-string/jumbo v6, "pref_lens_dirty_detect_date_key"

    invoke-interface {v0, v6, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1777
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1778
    const-string/jumbo v6, "CameraSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "add lens dirty detected times: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1779
    return-void
.end method

.method public static addPopupTipBeautyIntroShowTimes()V
    .locals 4

    .prologue
    .line 1715
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_popup_tip_beauty_intro_show_times_key"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1716
    .local v0, "count":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string/jumbo v2, "pref_popup_tip_beauty_intro_show_times_key"

    add-int/lit8 v3, v0, 0x1

    invoke-interface {v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1717
    return-void
.end method

.method private static beautyLevelToIntelligentValue(I)Ljava/lang/String;
    .locals 4
    .param p0, "beautyLevel"    # I

    .prologue
    .line 1283
    sget-object v1, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1284
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1285
    const-string/jumbo v1, "CameraSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "invalid faceBeautyLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1286
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    .line 1288
    :cond_0
    return-object v0
.end method

.method public static checkLensAvailability(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 919
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_ai_detect_enable_key"

    .line 920
    const v4, 0x7f0c0011

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    .line 919
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 921
    .local v0, "enterConfig":Z
    if-nez v0, :cond_0

    .line 922
    return v1

    .line 924
    :cond_0
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 925
    const-string/jumbo v2, "com.google.ar.lens"

    invoke-static {p0, v2}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-boolean v1, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    :cond_1
    return v1

    .line 927
    :cond_2
    const-string/jumbo v1, "com.xiaomi.lens"

    invoke-static {p0, v1}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private static deleteObsoletePreferences()V
    .locals 15

    .prologue
    const/4 v8, 0x0

    .line 620
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    .line 621
    .local v2, "context":Landroid/content/Context;
    const/4 v7, 0x1

    filled-new-array {v8, v7}, [I

    move-result-object v1

    .line 622
    .local v1, "cameraIds":[I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "/data/data/"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, "/shared_prefs"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 623
    .local v5, "parent":Ljava/lang/String;
    sget-object v10, Lcom/android/camera/module/BaseModule;->CAMERA_MODES:[I

    array-length v11, v10

    move v9, v8

    :goto_0
    if-ge v9, v11, :cond_2

    aget v4, v10, v9

    .line 624
    .local v4, "mode":I
    if-eqz v4, :cond_1

    .line 625
    array-length v12, v1

    move v7, v8

    :goto_1
    if-ge v7, v12, :cond_1

    aget v0, v1, v7

    .line 627
    .local v0, "cameraId":I
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "camera_settings_simple_mode_local_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 628
    invoke-static {v0, v4}, Lcom/android/camera/module/BaseModule;->getPreferencesLocalId(II)I

    move-result v14

    .line 627
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 629
    .local v6, "sharedPrefName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ".xml"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v3, v5, v13}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 631
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 625
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 623
    .end local v0    # "cameraId":I
    .end local v3    # "file":Ljava/io/File;
    .end local v6    # "sharedPrefName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v7, v9, 0x1

    move v9, v7

    goto :goto_0

    .line 637
    .end local v4    # "mode":I
    :cond_2
    new-instance v3, Ljava/io/File;

    const-string/jumbo v7, "camera_settings_simple_mode_global.xml"

    invoke-direct {v3, v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    .restart local v3    # "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 639
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 641
    :cond_3
    return-void
.end method

.method public static get4kProfile()I
    .locals 1

    .prologue
    .line 700
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoQuality4kUHD()Z

    move-result v0

    if-nez v0, :cond_0

    .line 701
    const/4 v0, -0x1

    return v0

    .line 703
    :cond_0
    const v0, 0x7f0f0021

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getAiSceneOpen()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 853
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-nez v1, :cond_1

    .line 854
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v1

    .line 853
    if-eqz v1, :cond_1

    .line 855
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_ai_scene_mode_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 853
    :cond_1
    return v0
.end method

.method public static getAntiBanding()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1693
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1694
    const-string/jumbo v1, "pref_camera_antibanding_key"

    .line 1695
    const v2, 0x7f0f00ad

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1693
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAspectRatio(II)I
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 373
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isNearRatio16_9(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 374
    const/4 v0, 0x1

    return v0

    .line 375
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isNearRatio18_9(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 376
    const/4 v0, 0x3

    return v0

    .line 378
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static getBeautifyDefaultValue(Ljava/lang/String;)I
    .locals 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 1308
    const/4 v0, 0x0

    .line 1309
    .local v0, "resId":I
    const-string/jumbo v1, "pref_beautify_skin_color_ratio_key"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1310
    const v0, 0x7f0f0180

    .line 1319
    :cond_0
    :goto_0
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    return v1

    .line 1311
    :cond_1
    const-string/jumbo v1, "pref_beautify_slim_face_ratio_key"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1312
    const v0, 0x7f0f0181

    goto :goto_0

    .line 1313
    :cond_2
    const-string/jumbo v1, "pref_beautify_skin_smooth_ratio_key"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1314
    const v0, 0x7f0f0183

    goto :goto_0

    .line 1315
    :cond_3
    const-string/jumbo v1, "pref_beautify_enlarge_eye_ratio_key"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1316
    const v0, 0x7f0f0182

    goto :goto_0
.end method

.method public static getBeautifyValueRange()[I
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1337
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1338
    const/16 v0, -0xc

    const/16 v1, 0xc

    filled-new-array {v0, v1}, [I

    move-result-object v0

    return-object v0

    .line 1339
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isNvPlatform()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1340
    const/4 v0, 0x7

    filled-new-array {v1, v0}, [I

    move-result-object v0

    return-object v0

    .line 1342
    :cond_1
    const/16 v0, 0xa

    filled-new-array {v1, v0}, [I

    move-result-object v0

    return-object v0
.end method

.method public static getBool(I)Z
    .locals 1
    .param p0, "resId"    # I

    .prologue
    .line 556
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public static getCameraId()I
    .locals 1

    .prologue
    .line 648
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    return v0
.end method

.method public static getCameraZoomMode(I)Ljava/lang/String;
    .locals 1
    .param p0, "module"    # I

    .prologue
    .line 1549
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getContrast()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1657
    const v2, 0x7f0f0088

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1658
    .local v1, "defaultValue":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const-string/jumbo v3, "pref_qc_camera_contrast_key"

    invoke-virtual {v2, v3, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1659
    .local v0, "contrast":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1660
    const v2, 0x7f0b0013

    invoke-static {v0, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 1659
    if-eqz v2, :cond_0

    .line 1661
    const-string/jumbo v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid contrast "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1662
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetContrast()V

    .line 1663
    move-object v0, v1

    .line 1665
    :cond_0
    return-object v0
.end method

.method public static getCountDownTimes()I
    .locals 1

    .prologue
    .line 1217
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getTimer()I

    move-result v0

    return v0
.end method

.method public static getDefaultPreferenceId(I)I
    .locals 1
    .param p0, "prefId"    # I

    .prologue
    .line 802
    sparse-switch p0, :sswitch_data_0

    .line 822
    :cond_0
    return p0

    .line 804
    :sswitch_0
    invoke-static {}, Lcom/android/camera/Util;->isAntibanding60()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 805
    const v0, 0x7f0f00b0

    return v0

    .line 810
    :sswitch_1
    invoke-static {}, Lcom/android/camera/Device;->isFrontVideoQualityShouldBe1080P()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 811
    const v0, 0x7f0f001f

    return v0

    .line 816
    :sswitch_2
    sget-boolean v0, Lcom/android/camera/Device;->IS_X5:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/android/camera/Device;->IS_X7:Z

    if-eqz v0, :cond_0

    .line 817
    :cond_1
    const v0, 0x7f0c0004

    return v0

    .line 802
    :sswitch_data_0
    .sparse-switch
        0x7f0c0003 -> :sswitch_2
        0x7f0f001e -> :sswitch_1
        0x7f0f00ad -> :sswitch_0
    .end sparse-switch
.end method

.method public static getExposureMeteringMode()I
    .locals 4

    .prologue
    .line 549
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 550
    const-string/jumbo v2, "pref_camera_autoexposure_key"

    .line 551
    const v3, 0x7f0f00ec

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 549
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 552
    .local v0, "autoExposure":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static getFaceBeautifyValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1258
    invoke-static {}, Lcom/android/camera/Device;->isSupportedSkinBeautify()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1259
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1260
    const-string/jumbo v2, "pref_camera_face_beauty_advanced_key"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautySwitch()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1261
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    return-object v2

    .line 1264
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyDefaultValue()Ljava/lang/String;

    move-result-object v0

    .line 1265
    .local v0, "defaultBeauty":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    .line 1266
    const-string/jumbo v3, "pref_camera_face_beauty_key"

    .line 1265
    invoke-virtual {v2, v3, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1267
    .local v1, "faceBeautyValue":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isFaceBeautyValid(Ljava/lang/String;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 1268
    const-string/jumbo v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid face beauty value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1269
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_face_beauty_key"

    invoke-interface {v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1270
    move-object v1, v0

    .line 1272
    :cond_1
    return-object v1

    .line 1275
    .end local v0    # "defaultBeauty":Ljava/lang/String;
    .end local v1    # "faceBeautyValue":Ljava/lang/String;
    :cond_2
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    return-object v2
.end method

.method public static getFaceBeautyCloseValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1279
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    return-object v0
.end method

.method public static getFaceBeautyDefaultValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1249
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1250
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    return-object v0

    .line 1252
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1253
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    .line 1252
    :goto_0
    return-object v0

    .line 1253
    :cond_1
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    goto :goto_0
.end method

.method public static getFaceBeautyRatio(Ljava/lang/String;I)I
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultRatio"    # I

    .prologue
    .line 1241
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getFaceBeautySwitch()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1221
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1222
    .local v0, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    const-string/jumbo v2, "pref_camera_face_beauty_switch_key"

    const-string/jumbo v3, "pref_camera_face_beauty_key"

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1223
    .local v1, "value":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "pref_camera_face_beauty_advanced_key"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1224
    const-string/jumbo v2, "CameraSettings"

    const-string/jumbo v3, "reset beauty switch"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1225
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_face_beauty_switch_key"

    invoke-interface {v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1226
    const-string/jumbo v1, "pref_camera_face_beauty_key"

    .line 1228
    :cond_0
    return-object v1
.end method

.method public static getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "sceneMode"    # Ljava/lang/String;

    .prologue
    .line 1199
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getFocusMode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1090
    const-string/jumbo v0, "pref_camera_manual_mode_key"

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1091
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1093
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1094
    :cond_1
    const v0, 0x7f0f0050

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1096
    :cond_2
    const v0, 0x7f0f0051

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFocusPosition()I
    .locals 2

    .prologue
    .line 1151
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object v0

    .line 1152
    const/16 v1, 0xa7

    .line 1151
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1150
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getHfrSetting()Ljava/lang/String;
    .locals 3

    .prologue
    .line 487
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string/jumbo v1, "pref_video_hfr_key"

    .line 488
    const v2, 0x7f0f0052

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 487
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getJpegQuality(Z)Ljava/lang/String;
    .locals 5
    .param p0, "burst"    # Z

    .prologue
    .line 1493
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    .line 1494
    const-string/jumbo v3, "pref_camera_jpegquality_key"

    const v4, 0x7f0f0041

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1493
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1495
    .local v0, "jpegQuality":Ljava/lang/String;
    const-string/jumbo v1, "high"

    .line 1496
    .local v1, "maxQuality":Ljava/lang/String;
    if-eqz p0, :cond_0

    .line 1497
    const-string/jumbo v1, "normal"

    .line 1499
    :cond_0
    invoke-static {v0}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v2

    .line 1500
    invoke-static {v1}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v3

    .line 1499
    if-ge v2, v3, :cond_1

    .line 1501
    return-object v0

    .line 1503
    :cond_1
    return-object v1
.end method

.method public static getKValue()I
    .locals 3

    .prologue
    .line 1065
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string/jumbo v1, "pref_qc_manual_whitebalance_k_value_key"

    const/16 v2, 0x157c

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getMappingFocusMode(I)Ljava/lang/String;
    .locals 1
    .param p0, "focusPosition"    # I

    .prologue
    .line 1085
    const/16 v0, 0x3e8

    if-ne p0, v0, :cond_0

    .line 1086
    const-string/jumbo v0, "continuous-picture"

    .line 1085
    :goto_0
    return-object v0

    .line 1086
    :cond_0
    const-string/jumbo v0, "manual"

    goto :goto_0
.end method

.method public static getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "snapValue"    # Ljava/lang/String;

    .prologue
    .line 1535
    const v0, 0x7f0f015f

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1536
    const-string/jumbo v0, "Street-snap-picture"

    return-object v0

    .line 1537
    :cond_0
    const v0, 0x7f0f0160

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1538
    const-string/jumbo v0, "Street-snap-movie"

    return-object v0

    .line 1540
    :cond_1
    const-string/jumbo v0, "none"

    return-object v0
.end method

.method public static getPanoramaMoveDirection()I
    .locals 3

    .prologue
    .line 1836
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 1837
    const-string/jumbo v1, "pref_panorana_move_direction_key"

    .line 1838
    const/4 v2, 0x4

    .line 1836
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getPictureSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 341
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 342
    const-string/jumbo v0, "4x3"

    return-object v0

    .line 344
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 345
    const-string/jumbo v1, "pref_camera_picturesize_key"

    .line 344
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPreferVideoQuality()I
    .locals 7

    .prologue
    .line 510
    const v4, 0x7f0f001e

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v4

    .line 509
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 512
    .local v0, "defaultQuality":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    const-string/jumbo v5, "pref_video_quality_key"

    invoke-virtual {v4, v5}, Lcom/android/camera/data/data/config/DataItemConfig;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 513
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    .line 514
    const-string/jumbo v5, "pref_video_quality_key"

    .line 513
    invoke-virtual {v4, v5, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 515
    .local v3, "qualityStr":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 516
    const v4, 0x7f0b0003

    invoke-static {v3, v4}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    .line 515
    if-eqz v4, :cond_0

    .line 517
    const-string/jumbo v4, "CameraSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "reset invalid video quality "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    move-object v3, v0

    .line 519
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 520
    .local v1, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v4, "pref_video_quality_key"

    invoke-interface {v1, v4, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 521
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 523
    .end local v1    # "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    :cond_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 534
    .end local v3    # "qualityStr":Ljava/lang/String;
    .local v2, "quality":I
    :goto_0
    return v2

    .line 525
    .end local v2    # "quality":I
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v4

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v4, v5}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    if-nez v4, :cond_2

    .line 526
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 529
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 530
    .restart local v1    # "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v4, "pref_video_quality_key"

    invoke-interface {v1, v4, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 531
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 532
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .restart local v2    # "quality":I
    goto :goto_0
.end method

.method public static getPreviewAspectRatio(II)F
    .locals 10
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    const-wide v8, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    .line 349
    const/4 v0, 0x0

    .line 350
    .local v0, "ratio":F
    int-to-double v2, p0

    int-to-double v4, p1

    div-double/2addr v2, v4

    const-wide v4, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    .line 351
    int-to-double v4, p0

    int-to-double v6, p1

    div-double/2addr v4, v6

    sub-double/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 350
    cmpl-double v1, v2, v4

    if-lez v1, :cond_1

    .line 352
    int-to-double v2, p0

    int-to-double v4, p1

    div-double/2addr v2, v4

    sub-double/2addr v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    .line 353
    int-to-double v4, p0

    int-to-double v6, p1

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    sub-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 352
    cmpl-double v1, v2, v4

    if-lez v1, :cond_0

    .line 354
    const/high16 v0, 0x40000000    # 2.0f

    .line 361
    :goto_0
    return v0

    .line 356
    :cond_0
    const v0, 0x3fe38e39

    goto :goto_0

    .line 359
    :cond_1
    const v0, 0x3faaaaab

    goto :goto_0
.end method

.method public static getRenderAspectRatio(II)I
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 368
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result v0

    return v0
.end method

.method public static getSaturation()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1645
    const v2, 0x7f0f008a

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1646
    .local v0, "defaultValue":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const-string/jumbo v3, "pref_qc_camera_saturation_key"

    invoke-virtual {v2, v3, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1647
    .local v1, "saturation":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1648
    const v2, 0x7f0b0015

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 1647
    if-eqz v2, :cond_0

    .line 1649
    const-string/jumbo v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid saturation "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1650
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetSaturation()V

    .line 1651
    move-object v1, v0

    .line 1653
    :cond_0
    return-object v1
.end method

.method public static getShaderEffect()I
    .locals 4

    .prologue
    .line 1143
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1145
    .local v1, "mode":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v0

    .line 1146
    .local v0, "filterPreference":Lcom/android/camera/data/data/config/ComponentConfigFilter;
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v2, v3}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v2

    return v2
.end method

.method public static getSharpness()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1669
    const v2, 0x7f0f008c

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1670
    .local v0, "defaultValue":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const-string/jumbo v3, "pref_qc_camera_sharpness_key"

    invoke-virtual {v2, v3, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1671
    .local v1, "sharpness":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1672
    const v2, 0x7f0b0017

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 1671
    if-eqz v2, :cond_0

    .line 1673
    const-string/jumbo v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid sharpness "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1674
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetSharpness()V

    .line 1675
    move-object v1, v0

    .line 1677
    :cond_0
    return-object v1
.end method

.method public static getSkipFrameNumber()I
    .locals 2

    .prologue
    .line 502
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 503
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0

    .line 505
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static getStrictAspectRatio(II)I
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 422
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio16_9(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 423
    const/4 v0, 0x1

    return v0

    .line 424
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 425
    const/4 v0, 0x0

    return v0

    .line 426
    :cond_1
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio1_1(II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 427
    const/4 v0, 0x2

    return v0

    .line 431
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public static getString(I)Ljava/lang/String;
    .locals 1
    .param p0, "resId"    # I

    .prologue
    .line 560
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSupportedHfrSettings(I)Ljava/util/ArrayList;
    .locals 17
    .param p0, "cameraId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 756
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 757
    .local v6, "supported":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v8

    move/from16 v0, p0

    invoke-virtual {v8, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 758
    .local v1, "cc":Lcom/android/camera2/CameraCapabilities;
    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoSize()[Landroid/util/Size;

    move-result-object v5

    .line 759
    .local v5, "sizeList":[Landroid/util/Size;
    const/4 v8, 0x0

    array-length v10, v5

    move v9, v8

    :goto_0
    if-ge v9, v10, :cond_3

    aget-object v4, v5, v9

    .line 760
    .local v4, "size":Landroid/util/Size;
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v8

    const/16 v11, 0x780

    if-eq v8, v11, :cond_1

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v8

    const/16 v11, 0x500

    if-eq v8, v11, :cond_1

    .line 759
    :cond_0
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_0

    .line 763
    :cond_1
    invoke-virtual {v1, v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v2

    .line 764
    .local v2, "highSpeedFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v8, 0x0

    array-length v11, v2

    :goto_1
    if-ge v8, v11, :cond_0

    aget-object v3, v2, v8

    .line 765
    .local v3, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v12, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v13, "%dx%d:%d"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    .line 766
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x0

    aput-object v15, v14, v16

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x1

    aput-object v15, v14, v16

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v15

    const/16 v16, 0x2

    aput-object v15, v14, v16

    .line 765
    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 767
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 768
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 764
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 772
    .end local v2    # "highSpeedFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v3    # "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v4    # "size":Landroid/util/Size;
    .end local v7    # "value":Ljava/lang/String;
    :cond_3
    return-object v6
.end method

.method public static getSupportedVideoQuality(I)Ljava/util/ArrayList;
    .locals 12
    .param p0, "cameraId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v11, 0xa

    const/16 v10, 0x9

    const/4 v9, 0x6

    const/4 v8, 0x5

    const/4 v7, 0x4

    .line 714
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 715
    .local v3, "supported":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 716
    .local v0, "cc":Lcom/android/camera2/CameraCapabilities;
    const-class v4, Landroid/media/MediaRecorder;

    invoke-virtual {v0, v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 718
    .local v2, "sizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-static {}, Lcom/android/camera/CameraSettings;->get4kProfile()I

    move-result v1

    .line 719
    .local v1, "quality4k":I
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoQuality4kUHD()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 720
    new-instance v4, Lcom/android/camera/CameraSize;

    const/16 v5, 0xf00

    const/16 v6, 0x870

    invoke-direct {v4, v5, v6}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 719
    if-eqz v4, :cond_0

    .line 721
    invoke-static {p0, v1}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    .line 719
    if-eqz v4, :cond_0

    .line 722
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 724
    :cond_0
    new-instance v4, Lcom/android/camera/CameraSize;

    const/16 v5, 0x780

    const/16 v6, 0x438

    invoke-direct {v4, v5, v6}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 725
    invoke-static {p0, v9}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    .line 724
    if-eqz v4, :cond_1

    .line 726
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 728
    :cond_1
    new-instance v4, Lcom/android/camera/CameraSize;

    const/16 v5, 0x500

    const/16 v6, 0x2d0

    invoke-direct {v4, v5, v6}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 729
    invoke-static {p0, v8}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    .line 728
    if-eqz v4, :cond_2

    .line 730
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 732
    :cond_2
    new-instance v4, Lcom/android/camera/CameraSize;

    const/16 v5, 0x2d0

    const/16 v6, 0x1e0

    invoke-direct {v4, v5, v6}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 733
    invoke-static {p0, v7}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    .line 732
    if-eqz v4, :cond_3

    .line 734
    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 736
    :cond_3
    const/16 v4, 0xb

    invoke-static {p0, v4}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 737
    const/16 v4, 0xb

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 739
    :cond_4
    invoke-static {p0, v11}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 740
    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 742
    :cond_5
    invoke-static {p0, v10}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 743
    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 746
    :cond_6
    return-object v3
.end method

.method public static getSystemEdgeMode(Landroid/content/Context;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 1460
    invoke-static {}, Lcom/android/camera/Device;->isSupportedEdgeTouch()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1461
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "edge_handgrip"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 1462
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "edge_handgrip_clean"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 1461
    or-int/2addr v1, v2

    .line 1463
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "edge_handgrip_back"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 1461
    or-int/2addr v1, v2

    .line 1464
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "edge_handgrip_screenshot"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 1461
    or-int/2addr v1, v2

    .line 1464
    const/4 v2, 0x1

    .line 1461
    if-ne v1, v2, :cond_0

    .line 1464
    const/4 v0, 0x2

    .line 1460
    :cond_0
    return v0
.end method

.method public static getUIStyleByPreview(II)I
    .locals 14
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    const-wide v12, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    const-wide/high16 v10, 0x3ff8000000000000L    # 1.5

    const-wide v8, 0x3f947ae147ae147bL    # 0.02

    .line 971
    invoke-static {}, Lcom/android/camera/Device;->isPad()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 972
    const/4 v1, 0x0

    return v1

    .line 974
    :cond_0
    sget-boolean v1, Lcom/android/camera/CameraSettings;->sCroppedIfNeeded:Z

    if-eqz v1, :cond_1

    .line 975
    const/4 v1, 0x1

    return v1

    .line 977
    :cond_1
    const/4 v0, 0x0

    .line 978
    .local v0, "index":I
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v2, v4, v6

    .line 979
    .local v2, "ratio":D
    invoke-static {}, Lcom/android/camera/Device;->isMDPRender()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 980
    sub-double v4, v2, v10

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpg-double v1, v4, v8

    if-gez v1, :cond_3

    .line 981
    const/4 v0, 0x2

    .line 991
    :cond_2
    :goto_0
    return v0

    .line 982
    :cond_3
    const-wide v4, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double v4, v2, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    sub-double v6, v2, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    cmpl-double v1, v4, v6

    if-gtz v1, :cond_4

    .line 983
    sub-double v4, v2, v10

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpg-double v1, v4, v8

    if-gez v1, :cond_2

    .line 984
    :cond_4
    sub-double v4, v2, v12

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    sub-double v6, v2, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    cmpl-double v1, v4, v6

    if-lez v1, :cond_5

    .line 985
    const/4 v0, 0x3

    goto :goto_0

    .line 988
    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static getVideoEncoder()I
    .locals 4

    .prologue
    .line 538
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 539
    const-string/jumbo v2, "pref_video_encoder_key"

    const v3, 0x7f0f0029

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 538
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 540
    .local v0, "videoEncoder":Ljava/lang/String;
    const-string/jumbo v1, "h265"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 541
    const/4 v1, 0x5

    return v1

    .line 543
    :cond_0
    const/4 v1, 0x2

    return v1
.end method

.method public static getVideoQuality()I
    .locals 2

    .prologue
    .line 492
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 494
    const/4 v1, 0x6

    return v1

    .line 496
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality()I

    move-result v0

    .line 497
    .local v0, "quality":I
    return v0
.end method

.method public static intelligentValueToBeautyLevel(Ljava/lang/String;)I
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 1292
    sget-object v1, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-static {v1, p0}, Lcom/android/camera/Util;->stringSparseArraysIndexOf(Landroid/util/SparseArray;Ljava/lang/String;)I

    move-result v0

    .line 1293
    .local v0, "index":I
    if-gez v0, :cond_0

    .line 1294
    const-string/jumbo v1, "CameraSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "invalid faceBeautyValue: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1295
    const/4 v0, 0x0

    .line 1297
    :cond_0
    sget-object v1, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    return v1
.end method

.method public static is4KHigherVideoQuality(I)Z
    .locals 2
    .param p0, "quality"    # I

    .prologue
    const/4 v0, 0x0

    .line 707
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoQuality4kUHD()Z

    move-result v1

    if-nez v1, :cond_0

    .line 708
    return v0

    .line 710
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->get4kProfile()I

    move-result v1

    if-gt v1, p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static isAEAFLockSupport()Z
    .locals 4

    .prologue
    .line 943
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_ae_af_lock_support_key"

    .line 944
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 945
    const v3, 0x7f0c0002

    .line 944
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 943
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAdvancedBeautyOn()Z
    .locals 2

    .prologue
    .line 1186
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 1187
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static isAspectRatio16_9(II)Z
    .locals 8
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 396
    if-ge p0, p1, :cond_0

    .line 397
    move v2, p0

    .line 398
    .local v2, "tmp":I
    move p0, p1

    .line 399
    move p1, v2

    .line 401
    .end local v2    # "tmp":I
    :cond_0
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v0, v4, v6

    .line 402
    .local v0, "ratio":D
    const-wide v4, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v4, v6

    if-gez v3, :cond_1

    .line 403
    const/4 v3, 0x1

    return v3

    .line 405
    :cond_1
    const/4 v3, 0x0

    return v3
.end method

.method public static isAspectRatio18_9(II)Z
    .locals 8
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 409
    if-ge p0, p1, :cond_0

    .line 410
    move v2, p0

    .line 411
    .local v2, "tmp":I
    move p0, p1

    .line 412
    move p1, v2

    .line 414
    .end local v2    # "tmp":I
    :cond_0
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v0, v4, v6

    .line 415
    .local v0, "ratio":D
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v4, v6

    if-gez v3, :cond_1

    .line 416
    const/4 v3, 0x1

    return v3

    .line 418
    :cond_1
    const/4 v3, 0x0

    return v3
.end method

.method public static isAspectRatio1_1(II)Z
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 441
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isAspectRatio4_3(II)Z
    .locals 8
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 383
    if-ge p0, p1, :cond_0

    .line 384
    move v2, p0

    .line 385
    .local v2, "tmp":I
    move p0, p1

    .line 386
    move p1, v2

    .line 388
    .end local v2    # "tmp":I
    :cond_0
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v0, v4, v6

    .line 389
    .local v0, "ratio":D
    const-wide v4, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v4, v6

    if-gez v3, :cond_1

    .line 390
    const/4 v3, 0x1

    return v3

    .line 392
    :cond_1
    const/4 v3, 0x0

    return v3
.end method

.method public static isBackCamera()Z
    .locals 2

    .prologue
    .line 335
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 336
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v1

    .line 335
    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isBeautyRemodelingClicked()Z
    .locals 3

    .prologue
    .line 1724
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_beauty_remodeling_clicked_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isBurstShootingEnable()Z
    .locals 4

    .prologue
    .line 936
    invoke-static {}, Lcom/android/camera/Device;->isSupportedLongPressBurst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 937
    const-string/jumbo v0, "burst"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 938
    const-string/jumbo v2, "pref_camera_long_press_shutter_feature_key"

    .line 939
    const v3, 0x7f0f0144

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 937
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 936
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCameraFaceDetectionAutoHidden()Z
    .locals 4

    .prologue
    .line 1570
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_facedetection_auto_hidden_key"

    .line 1571
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1572
    const v3, 0x7f0c0007

    .line 1571
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1570
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isCameraParallelProcessEnable()Z
    .locals 4

    .prologue
    .line 1607
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_parallel_process_enable_key"

    .line 1608
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1609
    const v3, 0x7f0c000d

    .line 1608
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1607
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCameraPortraitWithFaceBeauty()Z
    .locals 4

    .prologue
    .line 1564
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_portrait_with_facebeauty_key"

    .line 1565
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1566
    const v3, 0x7f0c0008

    .line 1565
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1564
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isCameraSoundOpen()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 831
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMuteCameraSound()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 832
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_camerasound_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 831
    :cond_0
    return v0
.end method

.method public static isCameraSpecific(Ljava/lang/String;)Z
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 1782
    const-string/jumbo v0, "pref_camera_picturesize_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1783
    const-string/jumbo v0, "pref_camera_jpegquality_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1784
    const-string/jumbo v0, "pref_video_quality_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1785
    const-string/jumbo v0, "pref_video_hfr_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1786
    const-string/jumbo v0, "pref_sticker_path_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1787
    const-string/jumbo v0, "pref_camera_flashmode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1788
    const-string/jumbo v0, "pref_camera_video_flashmode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1789
    const-string/jumbo v0, "pref_camera_hdr_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1790
    const-string/jumbo v0, "pref_video_hdr_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1791
    const-string/jumbo v0, "pref_camera_whitebalance_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1792
    const-string/jumbo v0, "pref_qc_manual_whitebalance_k_value_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1793
    const-string/jumbo v0, "pref_focus_position_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1794
    const-string/jumbo v0, "pref_qc_camera_exposuretime_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1795
    const-string/jumbo v0, "pref_qc_camera_iso_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1796
    const-string/jumbo v0, "pref_camera_zoom_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1797
    const-string/jumbo v0, "pref_camera_manually_lens"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1798
    const-string/jumbo v0, "pref_camera_face_beauty_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1799
    const-string/jumbo v0, "pref_camera_face_beauty_switch_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1800
    const-string/jumbo v0, "pref_beautify_slim_face_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1801
    const-string/jumbo v0, "pref_beautify_skin_smooth_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1802
    const-string/jumbo v0, "pref_beautify_skin_color_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    if-nez v0, :cond_0

    .line 1803
    const-string/jumbo v0, "pref_beautify_enlarge_eye_ratio_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1782
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isDualCameraEnable()Z
    .locals 4

    .prologue
    .line 1576
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_dual_enable_key"

    .line 1577
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1578
    const v3, 0x7f0c0009

    .line 1577
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1576
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDualCameraSatEnable()Z
    .locals 4

    .prologue
    .line 1582
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_dual_sat_enable_key"

    .line 1583
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1584
    const v3, 0x7f0c000a

    .line 1583
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1582
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDualCameraWaterMarkOpen()Z
    .locals 3

    .prologue
    .line 859
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 860
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 861
    const-string/jumbo v1, "pref_dualcamera_watermark"

    .line 862
    const v2, 0x7f0c0012

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 860
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0

    .line 864
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isEdgePhotoEnable()Z
    .locals 1

    .prologue
    .line 1456
    invoke-static {}, Lcom/android/camera/Device;->isSupportedEdgeTouch()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEnableDNG()Z
    .locals 1

    .prologue
    .line 1633
    const/4 v0, 0x0

    return v0
.end method

.method public static isEvAdjustable()Z
    .locals 1

    .prologue
    .line 1705
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isFaceBeautyValid(Ljava/lang/String;)Z
    .locals 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1301
    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1302
    return v0

    .line 1304
    :cond_0
    sget-object v2, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-static {v2, p0}, Lcom/android/camera/Util;->stringSparseArraysIndexOf(Landroid/util/SparseArray;Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public static isFingerprintCaptureEnable()Z
    .locals 3

    .prologue
    .line 1637
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_fingerprint_capture_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFocusModeSwitching()Z
    .locals 3

    .prologue
    .line 1107
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1108
    const-string/jumbo v1, "pref_qc_focus_mode_switching_key"

    const/4 v2, 0x0

    .line 1107
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFovcEnabled()Z
    .locals 1

    .prologue
    .line 1641
    const/4 v0, 0x0

    return v0
.end method

.method public static isFrontCamera()Z
    .locals 2

    .prologue
    .line 330
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 331
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v1

    .line 330
    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isFrontMirror()Z
    .locals 4

    .prologue
    .line 880
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 881
    .local v0, "configGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    const-string/jumbo v2, "pref_front_mirror_key"

    .line 882
    const v3, 0x7f0f013b

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 881
    invoke-virtual {v0, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 884
    .local v1, "value":Ljava/lang/String;
    const-string/jumbo v2, "auto"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 885
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string/jumbo v3, "pref_front_mirror_key"

    invoke-interface {v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 887
    :cond_0
    const v2, 0x7f0f013c

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method public static isGradienterOn()Z
    .locals 2

    .prologue
    .line 1032
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_gradienter_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isGroupShotOn()Z
    .locals 2

    .prologue
    .line 1028
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isLabOptionsVisible()Z
    .locals 3

    .prologue
    .line 1554
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1555
    const-string/jumbo v1, "pref_camera_lab_option_key_visible"

    const/4 v2, 0x0

    .line 1554
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isLensDirtyDetectEnabled()Z
    .locals 4

    .prologue
    .line 1732
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string/jumbo v2, "pref_lens_dirty_detect_enabled_key"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1733
    .local v0, "enabled":Z
    return v0
.end method

.method public static isMagicMirrorOn()Z
    .locals 2

    .prologue
    .line 901
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isMfnrSatEnable()Z
    .locals 4

    .prologue
    .line 1588
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_mfnr_sat_enable_key"

    .line 1589
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1590
    const v3, 0x7f0c000e

    .line 1589
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1588
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMovieSolidOn()Z
    .locals 3

    .prologue
    .line 891
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMovieSolid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 892
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_movie_solid_key"

    .line 893
    const v2, 0x7f0f0100

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 892
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 891
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNearAspectRatio(IIII)Z
    .locals 2
    .param p0, "width1"    # I
    .param p1, "height1"    # I
    .param p2, "width2"    # I
    .param p3, "height2"    # I

    .prologue
    .line 437
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result v0

    invoke-static {p2, p3}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNearRatio16_9(II)Z
    .locals 11
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    const/4 v10, 0x0

    const-wide v8, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    .line 445
    if-ge p0, p1, :cond_0

    .line 446
    move v2, p0

    .line 447
    .local v2, "tmp":I
    move p0, p1

    .line 448
    move p1, v2

    .line 450
    .end local v2    # "tmp":I
    :cond_0
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v0, v4, v6

    .line 452
    .local v0, "ratio":D
    const-wide v4, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 453
    sub-double v6, v0, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 452
    cmpl-double v3, v4, v6

    if-gtz v3, :cond_1

    .line 454
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v4, v6

    if-gez v3, :cond_3

    .line 455
    :cond_1
    sub-double v4, v0, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 456
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    sub-double v6, v0, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 455
    cmpl-double v3, v4, v6

    if-lez v3, :cond_2

    .line 457
    return v10

    .line 459
    :cond_2
    const/4 v3, 0x1

    return v3

    .line 462
    :cond_3
    return v10
.end method

.method public static isNearRatio18_9(II)Z
    .locals 11
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    const/4 v10, 0x0

    const-wide v8, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    .line 466
    if-ge p0, p1, :cond_0

    .line 467
    move v2, p0

    .line 468
    .local v2, "tmp":I
    move p0, p1

    .line 469
    move p1, v2

    .line 471
    .end local v2    # "tmp":I
    :cond_0
    int-to-double v4, p0

    int-to-double v6, p1

    div-double v0, v4, v6

    .line 473
    .local v0, "ratio":D
    const-wide v4, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 474
    sub-double v6, v0, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 473
    cmpl-double v3, v4, v6

    if-gtz v3, :cond_1

    .line 475
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    sub-double v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v4, v6

    if-gez v3, :cond_3

    .line 476
    :cond_1
    sub-double v4, v0, v8

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    .line 477
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    sub-double v6, v0, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 476
    cmpl-double v3, v4, v6

    if-lez v3, :cond_2

    .line 478
    const/4 v3, 0x1

    return v3

    .line 480
    :cond_2
    return v10

    .line 483
    :cond_3
    return v10
.end method

.method public static isOptimizedFlashEnable()Z
    .locals 4

    .prologue
    .line 1594
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_optimized_flash_enable_key"

    .line 1595
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1596
    const v3, 0x7f0c000f

    .line 1595
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1594
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isPopupTipBeautyIntroEnable()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1709
    invoke-static {}, Lcom/android/camera/Device;->isSupport3DFaceBeauty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1710
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_popup_tip_beauty_intro_clicked_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 1709
    if-eqz v1, :cond_0

    .line 1711
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_popup_tip_beauty_intro_show_times_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    const/4 v0, 0x1

    .line 1709
    :cond_0
    return v0
.end method

.method public static isPortraitModeBackOn()Z
    .locals 2

    .prologue
    .line 1020
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_portrait_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isPressDownCapture()Z
    .locals 4

    .prologue
    .line 1416
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFastCapture()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1417
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "focus"

    .line 1418
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_long_press_shutter_feature_key"

    .line 1419
    const v3, 0x7f0f0144

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1418
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1417
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1421
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static isProximityLockOpen()Z
    .locals 3

    .prologue
    .line 872
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_proximity_lock_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isQRCodeReceiverAvailable(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 912
    const-string/jumbo v0, "com.xiaomi.scanner"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isRecordLocation()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 826
    invoke-static {}, Lcom/android/camera/Device;->isSupportedGPS()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 827
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_recordlocation_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 826
    :cond_0
    return v0
.end method

.method public static isSREnable()Z
    .locals 4

    .prologue
    .line 1600
    invoke-static {}, Lcom/android/camera/Device;->isSupportSuperResolution()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1601
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_sr_enable_key"

    .line 1602
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1603
    const v3, 0x7f0c0010

    .line 1602
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1601
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1600
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isScanQRCode(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 905
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 906
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 907
    const-string/jumbo v1, "pref_scan_qrcode_key"

    .line 908
    const v2, 0x7f0f0109

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 906
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 905
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isStereoModeOn()Z
    .locals 2

    .prologue
    .line 1024
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_stereo_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isSupportParallelProcess()Z
    .locals 1

    .prologue
    .line 1621
    invoke-static {}, Lcom/android/camera/Device;->isSupportParallelProcess()Z

    move-result v0

    return v0
.end method

.method public static isSupportedDualCameraWaterMark()Z
    .locals 1

    .prologue
    .line 1625
    invoke-static {}, Lcom/android/camera/Device;->supportPictureWaterMark()Z

    move-result v0

    return v0
.end method

.method public static isSupportedMetadata()Z
    .locals 1

    .prologue
    .line 1629
    invoke-static {}, Lcom/android/camera/Device;->isSupportedASD()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSupportedOpticalZoom()Z
    .locals 1

    .prologue
    .line 1613
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->hasMuxCamera()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSupportedPortrait()Z
    .locals 1

    .prologue
    .line 1617
    invoke-static {}, Lcom/android/camera/Device;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->hasMuxCamera()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSwitchCameraZoomMode()Z
    .locals 1

    .prologue
    .line 1545
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPanoramaModule()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSwitchOn(Ljava/lang/String;)Z
    .locals 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 1005
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1006
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 1007
    :cond_0
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1008
    const-string/jumbo v0, "on"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string/jumbo v2, "off"

    invoke-virtual {v1, p0, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 1010
    :cond_1
    const-string/jumbo v0, "on"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v2, "off"

    invoke-virtual {v1, p0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isTiltShiftOn()Z
    .locals 2

    .prologue
    .line 1036
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isTimeWaterMarkOpen()Z
    .locals 3

    .prologue
    .line 836
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 837
    const-string/jumbo v1, "pref_watermark_key"

    const/4 v2, 0x0

    .line 836
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isTransient(Ljava/lang/String;)Z
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 1807
    const-string/jumbo v0, "pref_delay_capture_mode"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1808
    const-string/jumbo v0, "pref_camera_shader_coloreffect_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1809
    const-string/jumbo v0, "pref_camera_scenemode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1810
    const-string/jumbo v0, "pref_camera_scenemode_setting_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1811
    const-string/jumbo v0, "pref_camera_gradienter_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1812
    const-string/jumbo v0, "pref_camera_ubifocus_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1813
    const-string/jumbo v0, "pref_camera_magic_mirror_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1814
    const-string/jumbo v0, "pref_camera_groupshot_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1815
    const-string/jumbo v0, "pref_camera_super_resolution_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1816
    const-string/jumbo v0, "pref_camera_tilt_shift_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1817
    const-string/jumbo v0, "pref_camera_tilt_shift_mode"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1818
    const-string/jumbo v0, "pref_camera_hand_night_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1819
    const-string/jumbo v0, "pref_video_speed_fast_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1820
    const-string/jumbo v0, "pref_video_speed_slow_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1821
    const-string/jumbo v0, "pref_video_speed_hfr_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1822
    const-string/jumbo v0, "pref_camera_portrait_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1823
    const-string/jumbo v0, "pref_camera_manual_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1824
    const-string/jumbo v0, "pref_camera_square_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1825
    const-string/jumbo v0, "pref_camera_show_gender_age_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1826
    const-string/jumbo v0, "pref_camera_peak_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    if-nez v0, :cond_0

    .line 1827
    const-string/jumbo v0, "pref_camera_stereo_mode_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1807
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isVideoCaptureVisible()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 792
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    :goto_0
    if-nez v0, :cond_5

    .line 793
    invoke-static {}, Lcom/android/camera/Device;->isHFRVideoCaptureSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 794
    const-string/jumbo v0, "slow"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 795
    const-string/jumbo v0, "hfr"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 792
    if-eqz v0, :cond_5

    .line 797
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoQuality4kUHD()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/android/camera/Device;->IS_MI4:Z

    if-nez v0, :cond_3

    sget-boolean v0, Lcom/android/camera/Device;->IS_X5:Z

    :goto_1
    xor-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 798
    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoQuality()I

    move-result v0

    const/4 v3, 0x6

    if-gt v0, v3, :cond_4

    .line 792
    :cond_1
    :goto_2
    return v1

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v0, v1

    .line 797
    goto :goto_1

    :cond_4
    move v1, v2

    .line 798
    goto :goto_2

    :cond_5
    move v1, v2

    .line 792
    goto :goto_2
.end method

.method public static readEdgePhotoSetting(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1468
    invoke-static {}, Lcom/android/camera/Device;->isSupportedEdgeTouch()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1470
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "edge_handgrip_photo"

    .line 1469
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_1

    :goto_0
    sput-boolean v0, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    .line 1472
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 1469
    goto :goto_0
.end method

.method public static readExposure()I
    .locals 4

    .prologue
    .line 652
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 653
    const-string/jumbo v2, "pref_camera_exposure_key"

    const-string/jumbo v3, "0"

    .line 652
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 654
    .local v0, "exposure":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static readPreferredCameraId()I
    .locals 1

    .prologue
    .line 644
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    return v0
.end method

.method public static readZoom()F
    .locals 5

    .prologue
    .line 670
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_zoom_key"

    const-string/jumbo v4, "1"

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 672
    .local v1, "zoom":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 673
    :catch_0
    move-exception v0

    .line 674
    .local v0, "ex":Ljava/lang/Exception;
    const-string/jumbo v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid zoom: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    const/4 v2, 0x0

    return v2
.end method

.method public static resetContrast()V
    .locals 2

    .prologue
    .line 1685
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_qc_camera_contrast_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1686
    return-void
.end method

.method public static resetExposure()V
    .locals 2

    .prologue
    .line 664
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 665
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_exposure_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 666
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 667
    return-void
.end method

.method public static resetSaturation()V
    .locals 2

    .prologue
    .line 1681
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_qc_camera_saturation_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1682
    return-void
.end method

.method public static resetSharpness()V
    .locals 2

    .prologue
    .line 1689
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_qc_camera_sharpness_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1690
    return-void
.end method

.method public static resetZoom()V
    .locals 2

    .prologue
    .line 686
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 687
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_zoom_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 688
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 689
    return-void
.end method

.method public static retainCameraMode()Z
    .locals 3

    .prologue
    .line 868
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_retain_camera_mode_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setAiSceneOpen(Z)V
    .locals 2
    .param p0, "open"    # Z

    .prologue
    .line 848
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 849
    const-string/jumbo v1, "pref_camera_ai_scene_mode_key"

    .line 848
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 850
    return-void
.end method

.method public static setBeautyRemodelingClicked()V
    .locals 3

    .prologue
    .line 1728
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_beauty_remodeling_clicked_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1729
    return-void
.end method

.method public static setDualCameraWaterMarkOpen(Z)V
    .locals 2
    .param p0, "open"    # Z

    .prologue
    .line 841
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 842
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 843
    const-string/jumbo v1, "pref_dualcamera_watermark"

    .line 842
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 845
    :cond_0
    return-void
.end method

.method public static setEdgeMode(Landroid/content/Context;Z)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enable"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 1475
    if-eqz p0, :cond_1

    .line 1476
    if-eqz p1, :cond_0

    .line 1477
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->readEdgePhotoSetting(Landroid/content/Context;)V

    .line 1479
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1480
    const-string/jumbo v4, "input"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 1482
    .local v0, "im":Landroid/hardware/input/InputManager;
    new-array v2, v3, [Ljava/lang/Class;

    const-class v4, Landroid/hardware/input/InputManager;

    aput-object v4, v2, v6

    .line 1483
    .local v2, "ownerClazz":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string/jumbo v4, "switchTouchEdgeMode"

    const-string/jumbo v5, "(I)V"

    invoke-static {v2, v4, v5}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v1

    .line 1484
    .local v1, "method":Lmiui/reflect/Method;
    if-eqz v1, :cond_1

    .line 1485
    aget-object v4, v2, v6

    new-array v5, v3, [Ljava/lang/Object;

    .line 1486
    if-eqz p1, :cond_2

    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v6

    .line 1485
    invoke-virtual {v1, v4, v0, v5}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 1490
    .end local v0    # "im":Landroid/hardware/input/InputManager;
    .end local v1    # "method":Lmiui/reflect/Method;
    .end local v2    # "ownerClazz":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1
    return-void

    .line 1486
    .restart local v0    # "im":Landroid/hardware/input/InputManager;
    .restart local v1    # "method":Lmiui/reflect/Method;
    .restart local v2    # "ownerClazz":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_2
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getSystemEdgeMode(Landroid/content/Context;)I

    move-result v3

    goto :goto_0
.end method

.method public static setFaceBeautyLevel(I)V
    .locals 3
    .param p0, "level"    # I

    .prologue
    .line 1236
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->beautyLevelToIntelligentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1237
    .local v0, "value":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_face_beauty_key"

    invoke-interface {v1, v2, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1238
    return-void
.end method

.method public static setFaceBeautyRatio(Ljava/lang/String;I)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "ratio"    # I

    .prologue
    .line 1245
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1246
    return-void
.end method

.method public static setFaceBeautySwitch(Ljava/lang/String;)V
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 1232
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_face_beauty_switch_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1233
    return-void
.end method

.method public static setFocusModeSwitching(Z)V
    .locals 2
    .param p0, "value"    # Z

    .prologue
    .line 1102
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1103
    const-string/jumbo v1, "pref_qc_focus_mode_switching_key"

    .line 1102
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1104
    return-void
.end method

.method public static setGoogleLensAvailability(Z)V
    .locals 0
    .param p0, "availability"    # Z

    .prologue
    .line 932
    sput-boolean p0, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    .line 933
    return-void
.end method

.method public static setLabOptionsVisible(Z)V
    .locals 2
    .param p0, "visible"    # Z

    .prologue
    .line 1559
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1560
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_lab_option_key_visible"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1561
    return-void
.end method

.method public static setLensDirtyDetectEnable(Z)V
    .locals 2
    .param p0, "enable"    # Z

    .prologue
    .line 1754
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_lens_dirty_detect_enabled_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1755
    return-void
.end method

.method public static setPanoramaMoveDirection(I)V
    .locals 2
    .param p0, "direction"    # I

    .prologue
    .line 1831
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_panorana_move_direction_key"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1833
    return-void
.end method

.method public static setPopupTipBeautyIntroClicked()V
    .locals 3

    .prologue
    .line 1720
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_popup_tip_beauty_intro_clicked_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1721
    return-void
.end method

.method public static setPriorityStoragePreference(Z)V
    .locals 2
    .param p0, "externalPriority"    # Z

    .prologue
    .line 1356
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1357
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_priority_storage"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1358
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1359
    return-void
.end method

.method public static setShaderEffect(I)V
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 1136
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1138
    .local v1, "mode":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v0

    .line 1139
    .local v0, "filterPreference":Lcom/android/camera/data/data/config/ComponentConfigFilter;
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->setComponentValue(ILjava/lang/String;)V

    .line 1140
    return-void
.end method

.method public static shouldShowLensDirtyDetectHint()Z
    .locals 12

    .prologue
    const/4 v11, 0x5

    const/4 v10, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 1737
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1738
    .local v2, "now":J
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    .line 1739
    .local v4, "today":Ljava/util/Calendar;
    invoke-virtual {v4, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1740
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1741
    .local v0, "lastDate":Ljava/util/Calendar;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v7

    const-string/jumbo v8, "pref_lens_dirty_detect_date_key"

    invoke-virtual {v7, v8, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1743
    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_1

    .line 1744
    invoke-virtual {v4, v10}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_1

    .line 1745
    invoke-virtual {v4, v11}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_1

    .line 1746
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v7

    const-string/jumbo v8, "pref_lens_dirty_detect_times_key"

    invoke-virtual {v7, v8, v6}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1747
    .local v1, "times":I
    const/4 v7, 0x3

    if-ge v1, v7, :cond_0

    :goto_0
    return v5

    :cond_0
    move v5, v6

    goto :goto_0

    .line 1749
    .end local v1    # "times":I
    :cond_1
    return v5
.end method

.method public static showGenderAge()Z
    .locals 2

    .prologue
    .line 897
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_show_gender_age_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static updateOpenCameraFailTimes()J
    .locals 8

    .prologue
    .line 778
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 779
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string/jumbo v4, "open_camera_fail_key"

    const-wide/16 v6, 0x0

    invoke-virtual {v1, v4, v6, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long v2, v4, v6

    .line 780
    .local v2, "openCameraFail":J
    const-string/jumbo v1, "open_camera_fail_key"

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 781
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 782
    return-wide v2
.end method

.method public static upgradeGlobalPreferences()V
    .locals 12

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 589
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    .line 590
    .local v4, "pref":Lcom/android/camera/data/data/global/DataItemGlobal;
    const-string/jumbo v8, "pref_version_key"

    invoke-virtual {v4, v8, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 591
    .local v6, "version":I
    if-ge v6, v11, :cond_1

    .line 593
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 594
    .local v1, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 597
    filled-new-array {v7, v10}, [I

    move-result-object v3

    .line 598
    .local v3, "intentTypes":[I
    array-length v8, v3

    :goto_0
    if-ge v7, v8, :cond_0

    aget v2, v3, v7

    .line 599
    .local v2, "intentType":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v0

    .line 600
    .local v0, "cameraId":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v5

    .line 601
    .local v5, "provider":Lcom/android/camera/data/provider/DataProvider;
    invoke-interface {v5, v0, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera/data/provider/DataProvider$ProviderEvent;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 602
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 604
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v0

    .line 605
    invoke-interface {v5, v0, v2}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera/data/provider/DataProvider$ProviderEvent;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 606
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 598
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 610
    .end local v0    # "cameraId":I
    .end local v2    # "intentType":I
    .end local v5    # "provider":Lcom/android/camera/data/provider/DataProvider;
    :cond_0
    invoke-virtual {v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v7

    const-string/jumbo v8, "pref_version_key"

    invoke-interface {v7, v8, v11}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 613
    if-ne v6, v10, :cond_1

    .line 614
    invoke-static {}, Lcom/android/camera/CameraSettings;->deleteObsoletePreferences()V

    .line 617
    .end local v1    # "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .end local v3    # "intentTypes":[I
    :cond_1
    return-void
.end method

.method public static writeExposure(I)V
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 658
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 659
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_exposure_key"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 660
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 661
    return-void
.end method

.method public static writeZoom(F)V
    .locals 3
    .param p0, "value"    # F

    .prologue
    .line 680
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 681
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_zoom_key"

    invoke-static {p0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 682
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 683
    return-void
.end method
