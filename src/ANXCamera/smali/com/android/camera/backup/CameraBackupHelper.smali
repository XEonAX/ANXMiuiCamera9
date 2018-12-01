.class public Lcom/android/camera/backup/CameraBackupHelper;
.super Ljava/lang/Object;
.source "CameraBackupHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/android/camera/backup/CameraBackupHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertAntiBandingMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 133
    if-nez p0, :cond_0

    .line 134
    return-object v3

    .line 137
    :cond_0
    const-string/jumbo v0, "off"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 137
    :cond_1
    const-string/jumbo v0, "50hz"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 141
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 137
    :cond_2
    const-string/jumbo v0, "60hz"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 143
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 137
    :cond_3
    const-string/jumbo v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 145
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 147
    :cond_4
    sget-object v0, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unknown antibanding mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    return-object v3
.end method

.method private static convertContrast(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    .line 265
    const/4 v0, 0x0

    return-object v0
.end method

.method private static convertExposureMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 200
    if-nez p0, :cond_0

    .line 201
    return-object v3

    .line 204
    :cond_0
    const-string/jumbo v0, "average"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 207
    :cond_1
    const-string/jumbo v0, "0"

    return-object v0

    .line 204
    :cond_2
    const-string/jumbo v0, "frame-average"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "center"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 210
    :cond_3
    const-string/jumbo v0, "1"

    return-object v0

    .line 204
    :cond_4
    const-string/jumbo v0, "center-weighted"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, "spot"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 213
    :cond_5
    const-string/jumbo v0, "2"

    return-object v0

    .line 204
    :cond_6
    const-string/jumbo v0, "spot-metering"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 215
    sget-object v0, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unknown exposure mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    return-object v3
.end method

.method private static convertSaturation(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    .line 315
    const/4 v0, 0x0

    return-object v0
.end method

.method private static convertSharpness(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    .line 369
    const/4 v0, 0x0

    return-object v0
.end method

.method private static convertVideoQuality(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "legacyValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 164
    if-nez p0, :cond_0

    .line 165
    return-object v3

    .line 168
    :cond_0
    const-string/jumbo v0, "4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 171
    :cond_1
    const-string/jumbo v0, "4"

    return-object v0

    .line 168
    :cond_2
    const-string/jumbo v0, "9"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "5"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 174
    :cond_3
    const-string/jumbo v0, "5"

    return-object v0

    .line 168
    :cond_4
    const-string/jumbo v0, "10"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, "6"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 177
    :cond_5
    const-string/jumbo v0, "6"

    return-object v0

    .line 168
    :cond_6
    const-string/jumbo v0, "11"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string/jumbo v0, "8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 180
    :cond_7
    const-string/jumbo v0, "8"

    return-object v0

    .line 168
    :cond_8
    const-string/jumbo v0, "12"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 182
    sget-object v0, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unknown video quality "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    return-object v3
.end method

.method private static filterValue(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p0, "currentValue"    # Ljava/lang/String;
    .param p1, "supportedArray"    # I

    .prologue
    .line 373
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 374
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "supported":[Ljava/lang/String;
    invoke-static {p0, v1}, Lcom/android/camera/Util;->isSupported(Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 376
    return-object p0

    .line 378
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method

.method private static getSettingsKeys()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x3

    .line 102
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v3, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 104
    .local v5, "res":Landroid/content/res/Resources;
    const/high16 v6, 0x7f070000

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v4

    .line 106
    .local v4, "parser":Landroid/content/res/XmlResourceParser;
    :try_start_0
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v1

    .line 107
    .local v1, "eventType":I
    :goto_0
    const/4 v6, 0x1

    if-eq v1, v6, :cond_2

    .line 108
    const/4 v6, 0x2

    if-eq v1, v6, :cond_0

    if-ne v1, v8, :cond_1

    .line 109
    :cond_0
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v6

    if-lt v6, v8, :cond_1

    .line 111
    const-string/jumbo v6, "http://schemas.android.com/apk/res/android"

    const-string/jumbo v7, "key"

    .line 110
    invoke-interface {v4, v6, v7}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 113
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 119
    .end local v1    # "eventType":I
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->close()V

    .line 123
    return-object v3
.end method

.method public static restoreSettings(Landroid/content/SharedPreferences;Lcom/xiaomi/settingsdk/backup/data/DataPackage;[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;Z)V
    .locals 12
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
    .param p1, "dataPackage"    # Lcom/xiaomi/settingsdk/backup/data/DataPackage;
    .param p2, "entries"    # [Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;
    .param p3, "isGlobal"    # Z

    .prologue
    .line 34
    invoke-static {}, Lcom/android/camera/backup/CameraBackupHelper;->getSettingsKeys()Ljava/util/List;

    move-result-object v4

    .line 35
    .local v4, "restoreSettings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 36
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const/4 v6, 0x0

    array-length v8, p2

    move v7, v6

    :goto_0
    if-ge v7, v8, :cond_e

    aget-object v2, p2, v7

    .line 37
    .local v2, "entry":Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 36
    :cond_0
    :goto_1
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_0

    .line 41
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 45
    :cond_2
    if-nez p3, :cond_3

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_0

    .line 50
    :cond_3
    :try_start_0
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getCloudKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/xiaomi/settingsdk/backup/data/DataPackage;->get(Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/SettingItem;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;

    .line 51
    .local v3, "item":Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;
    if-eqz v3, :cond_0

    .line 53
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v9, "pref_video_quality_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 55
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertVideoQuality(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 80
    .local v5, "value":Ljava/lang/String;
    :goto_2
    if-eqz v5, :cond_0

    .line 81
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getValueClass()Ljava/lang/Class;

    move-result-object v6

    const-class v9, Ljava/lang/Integer;

    if-ne v6, v9, :cond_b

    .line 82
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v1, v6, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 93
    .end local v3    # "item":Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;
    .end local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/ClassCastException;
    sget-object v6, Lcom/android/camera/backup/CameraBackupHelper;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "entry "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getCloudKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " is not KeyStringSettingItem"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 53
    .end local v0    # "e":Ljava/lang/ClassCastException;
    .restart local v3    # "item":Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;
    :cond_4
    :try_start_1
    const-string/jumbo v9, "pref_camera_antibanding_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 58
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertAntiBandingMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_2

    .line 53
    .end local v5    # "value":Ljava/lang/String;
    :cond_5
    const-string/jumbo v9, "pref_camera_autoexposure_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 61
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertExposureMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_2

    .line 53
    .end local v5    # "value":Ljava/lang/String;
    :cond_6
    const-string/jumbo v9, "pref_qc_camera_contrast_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 64
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertContrast(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_2

    .line 53
    .end local v5    # "value":Ljava/lang/String;
    :cond_7
    const-string/jumbo v9, "pref_qc_camera_saturation_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 67
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertSaturation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto/16 :goto_2

    .line 53
    .end local v5    # "value":Ljava/lang/String;
    :cond_8
    const-string/jumbo v9, "pref_qc_camera_sharpness_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 70
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/camera/backup/CameraBackupHelper;->convertSharpness(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto/16 :goto_2

    .line 53
    .end local v5    # "value":Ljava/lang/String;
    :cond_9
    const-string/jumbo v9, "pref_front_mirror_key"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 73
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 74
    const v9, 0x7f0b0020

    .line 73
    invoke-static {v6, v9}, Lcom/android/camera/backup/CameraBackupHelper;->filterValue(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto/16 :goto_2

    .line 77
    .end local v5    # "value":Ljava/lang/String;
    :cond_a
    invoke-virtual {v3}, Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .restart local v5    # "value":Ljava/lang/String;
    goto/16 :goto_2

    .line 83
    :cond_b
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getValueClass()Ljava/lang/Class;

    move-result-object v6

    const-class v9, Ljava/lang/Long;

    if-ne v6, v9, :cond_c

    .line 84
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-interface {v1, v6, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_1

    .line 85
    :cond_c
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getValueClass()Ljava/lang/Class;

    move-result-object v6

    const-class v9, Ljava/lang/Boolean;

    if-ne v6, v9, :cond_d

    .line 86
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v9

    invoke-interface {v1, v6, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_1

    .line 87
    :cond_d
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getValueClass()Ljava/lang/Class;

    move-result-object v6

    const-class v9, Ljava/lang/String;

    if-ne v6, v9, :cond_0

    .line 88
    invoke-virtual {v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->getLocalKey()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 97
    .end local v2    # "entry":Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;
    .end local v3    # "item":Lcom/xiaomi/settingsdk/backup/data/KeyStringSettingItem;
    .end local v5    # "value":Ljava/lang/String;
    :cond_e
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 99
    return-void
.end method
