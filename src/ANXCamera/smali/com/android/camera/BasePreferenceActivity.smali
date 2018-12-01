.class public abstract Lcom/android/camera/BasePreferenceActivity;
.super Lmiui/preference/PreferenceActivity;
.source "BasePreferenceActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/BasePreferenceActivity$1;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAppInstalledListener:Lcom/android/camera/Util$PackageInstallerListener;

.field private mDualCameraEnablePreference:Landroid/preference/Preference;

.field private mDualCameraSatEnablePreference:Landroid/preference/Preference;

.field private mFaceDetectionAutoHiddenPreference:Landroid/preference/Preference;

.field private mFaceDetectionPreference:Landroid/preference/Preference;

.field private mFromWhere:I

.field private mHasReset:Z

.field private mLabOptionsHitCountDown:I

.field private mMFnrSatEnablePreference:Landroid/preference/Preference;

.field private mParallelProcessEnablePreference:Landroid/preference/Preference;

.field private mPortraitWithFaceBeautyPreference:Landroid/preference/Preference;

.field protected mPreferenceGroup:Landroid/preference/PreferenceScreen;

.field protected mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

.field private mSREnablePreference:Landroid/preference/Preference;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/BasePreferenceActivity;)Lcom/android/camera/Util$PackageInstallerListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/BasePreferenceActivity;

    .prologue
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/Util$PackageInstallerListener;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/BasePreferenceActivity;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->installQRCodeReceiver()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/BasePreferenceActivity;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->restorePreferences()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/android/camera/BasePreferenceActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lmiui/preference/PreferenceActivity;-><init>()V

    .line 457
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$1;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$1;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mAppInstalledListener:Lcom/android/camera/Util$PackageInstallerListener;

    .line 39
    return-void
.end method

.method private filterByCloud()V
    .locals 3

    .prologue
    .line 169
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->getAllDisabledFeatures()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "key$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 170
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v2, v0}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_0

    .line 172
    .end local v0    # "key":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private filterByDeviceID()V
    .locals 2

    .prologue
    .line 235
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v0

    if-nez v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_video_hfr_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_long_press_shutter_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 243
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMovieSolid()Z

    move-result v0

    if-nez v0, :cond_1

    .line 244
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 247
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportedTimeWaterMark()Z

    move-result v0

    if-nez v0, :cond_2

    .line 248
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_watermark_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 251
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-nez v0, :cond_3

    .line 252
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_dualcamera_watermark"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 255
    :cond_3
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMuteCameraSound()Z

    move-result v0

    if-nez v0, :cond_4

    .line 256
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camerasound_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 259
    :cond_4
    invoke-static {}, Lcom/android/camera/Device;->isSupportedGPS()Z

    move-result v0

    if-nez v0, :cond_5

    .line 260
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_recordlocation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 263
    :cond_5
    invoke-static {}, Lcom/android/camera/Device;->isPad()Z

    move-result v0

    if-nez v0, :cond_6

    sget-boolean v0, Lcom/android/camera/Device;->IS_MI3TD:Z

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 264
    :cond_6
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_picturesize_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 267
    :cond_7
    invoke-static {}, Lcom/android/camera/storage/Storage;->secondaryStorageMounted()Z

    move-result v0

    if-nez v0, :cond_8

    .line 268
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_priority_storage"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 271
    :cond_8
    invoke-static {}, Lcom/android/camera/Device;->isSupportedChromaFlash()Z

    move-result v0

    if-nez v0, :cond_9

    .line 272
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_auto_chroma_flash_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 275
    :cond_9
    invoke-static {}, Lcom/android/camera/Device;->isSupportedLongPressBurst()Z

    move-result v0

    if-nez v0, :cond_a

    .line 276
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_long_press_shutter_feature_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 279
    :cond_a
    invoke-static {}, Lcom/android/camera/Device;->isSupportedObjectTrack()Z

    move-result v0

    if-nez v0, :cond_b

    .line 280
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_capture_when_stable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 283
    :cond_b
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAsdNight()Z

    move-result v0

    if-nez v0, :cond_c

    .line 284
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_asd_night_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 287
    :cond_c
    invoke-static {}, Lcom/android/camera/Device;->isSupportedQuickSnap()Z

    move-result v0

    if-nez v0, :cond_d

    .line 288
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_snap_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 291
    :cond_d
    invoke-static {}, Lcom/android/camera/Device;->isSupportGroupShot()Z

    move-result v0

    if-nez v0, :cond_e

    .line 292
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_groupshot_with_primitive_picture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 295
    :cond_e
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-nez v0, :cond_f

    .line 296
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 299
    :cond_f
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-static {}, Lcom/android/camera/Device;->isSupportedPortrait()Z

    move-result v0

    :goto_0
    if-nez v0, :cond_10

    .line 300
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 302
    :cond_10
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_11

    .line 303
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 306
    :cond_11
    invoke-static {}, Lcom/android/camera/Device;->isSupportSuperResolution()Z

    move-result v0

    if-nez v0, :cond_12

    .line 307
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_super_resolution_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 310
    :cond_12
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-nez v0, :cond_13

    .line 311
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 314
    :cond_13
    invoke-static {}, Lcom/android/camera/Device;->isThirdDevice()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 315
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_facedetection_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 316
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 317
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 318
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 319
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 320
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_front_mirror_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 321
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 322
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 323
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 324
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 327
    :cond_14
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result v0

    if-nez v0, :cond_15

    .line 328
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_proximity_lock_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 331
    :cond_15
    invoke-static {}, Lcom/android/camera/Device;->isBackFingerSensor()Z

    move-result v0

    if-nez v0, :cond_16

    .line 332
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_fingerprint_capture_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 334
    :cond_16
    return-void

    .line 299
    :cond_17
    const/4 v0, 0x1

    goto/16 :goto_0
.end method

.method private filterByFrom()V
    .locals 7

    .prologue
    const/16 v6, 0xa9

    const/16 v5, 0xa8

    const/16 v4, 0xa6

    const/16 v3, 0xa2

    const/16 v2, 0xa1

    .line 200
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_0

    .line 201
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_4

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "category_camcorder_setting"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 214
    :cond_1
    :goto_0
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_2

    .line 215
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v3, :cond_7

    .line 220
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeIncompatibleAdvancePreference()V

    .line 222
    :cond_3
    return-void

    .line 202
    :cond_4
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v4, :cond_0

    .line 203
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_0

    .line 204
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    .line 206
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v2, :cond_5

    .line 207
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v3, :cond_6

    .line 211
    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->removeNonVideoPreference()V

    goto :goto_0

    .line 208
    :cond_6
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_5

    .line 209
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_5

    .line 210
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xaa

    if-ne v0, v1, :cond_1

    goto :goto_2

    .line 216
    :cond_7
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v6, :cond_2

    .line 217
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-eq v0, v5, :cond_2

    .line 218
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    const/16 v1, 0xaa

    if-eq v0, v1, :cond_2

    .line 219
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    if-ne v0, v4, :cond_3

    goto :goto_1
.end method

.method private filterByPreference()V
    .locals 5

    .prologue
    .line 137
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_video_quality_key"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 136
    check-cast v2, Lcom/android/camera/ui/PreviewListPreference;

    .line 138
    .local v2, "videoQuality":Lcom/android/camera/ui/PreviewListPreference;
    if-eqz v2, :cond_0

    .line 139
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 140
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v4

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getSupportedVideoQuality(I)Ljava/util/ArrayList;

    move-result-object v4

    .line 139
    invoke-virtual {p0, v3, v2, v4}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 144
    :cond_0
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_video_hfr_key"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 143
    check-cast v1, Lcom/android/camera/ui/PreviewListPreference;

    .line 145
    .local v1, "videoHfr":Lcom/android/camera/ui/PreviewListPreference;
    if-eqz v1, :cond_1

    .line 146
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 147
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v4

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v4

    .line 146
    invoke-virtual {p0, v3, v1, v4}, Lcom/android/camera/BasePreferenceActivity;->filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V

    .line 150
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "speed":Ljava/lang/String;
    sget-boolean v3, Lcom/android/camera/Device;->IS_X9:Z

    if-eqz v3, :cond_2

    const-string/jumbo v3, "normal"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_2

    .line 153
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_movie_solid_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 156
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLabOptionsVisible()Z

    move-result v3

    if-nez v3, :cond_3

    .line 157
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_facedetection_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 158
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 159
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 160
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_dual_enable_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 161
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_dual_sat_enable_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 162
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_mfnr_sat_enable_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 163
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_sr_enable_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 164
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v4, "pref_camera_parallel_process_enable_key"

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 166
    :cond_3
    return-void
.end method

.method private filterGroup()V
    .locals 1

    .prologue
    .line 720
    const-string/jumbo v0, "category_device_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 721
    const-string/jumbo v0, "category_camcorder_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 722
    const-string/jumbo v0, "category_camera_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 723
    const-string/jumbo v0, "category_advance_setting"

    invoke-direct {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->filterGroupIfEmpty(Ljava/lang/String;)V

    .line 724
    return-void
.end method

.method private filterGroupIfEmpty(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 727
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v1, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 728
    .local v0, "group":Landroid/preference/Preference;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_0

    .line 729
    check-cast v0, Landroid/preference/PreferenceGroup;

    .end local v0    # "group":Landroid/preference/Preference;
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-nez v1, :cond_0

    .line 730
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v1, p1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 732
    :cond_0
    return-void
.end method

.method private getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 4
    .param p1, "list"    # Lcom/android/camera/ui/PreviewListPreference;
    .param p2, "sp"    # Landroid/content/SharedPreferences;

    .prologue
    .line 686
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 687
    .local v0, "defaultValue":Ljava/lang/String;
    if-nez p2, :cond_0

    .line 688
    return-object v0

    .line 690
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 691
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;[Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 692
    move-object v2, v0

    .line 693
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 694
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 695
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 697
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1
    return-object v2
.end method

.method private initializeActivity()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 95
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 96
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 99
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceXml()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->addPreferencesFromResource(I)V

    .line 100
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 101
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    if-nez v0, :cond_1

    .line 102
    sget-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "fail to init PreferenceGroup"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_facedetection_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFaceDetectionPreference:Landroid/preference/Preference;

    .line 107
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_portrait_with_facebeauty_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPortraitWithFaceBeautyPreference:Landroid/preference/Preference;

    .line 109
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_facedetection_auto_hidden_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFaceDetectionAutoHiddenPreference:Landroid/preference/Preference;

    .line 111
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_enable_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mDualCameraEnablePreference:Landroid/preference/Preference;

    .line 113
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_dual_sat_enable_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mDualCameraSatEnablePreference:Landroid/preference/Preference;

    .line 115
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_mfnr_sat_enable_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mMFnrSatEnablePreference:Landroid/preference/Preference;

    .line 117
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_sr_enable_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mSREnablePreference:Landroid/preference/Preference;

    .line 121
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_camera_parallel_process_enable_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mParallelProcessEnablePreference:Landroid/preference/Preference;

    .line 122
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener()V

    .line 123
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByCloud()V

    .line 124
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByPreference()V

    .line 125
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByFrom()V

    .line 126
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByDeviceID()V

    .line 127
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->filterByIntent()V

    .line 128
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->filterGroup()V

    .line 130
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateEntries()V

    .line 131
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    .line 132
    invoke-direct {p0, v2}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 133
    return-void
.end method

.method private installQRCodeReceiver()V
    .locals 2

    .prologue
    .line 445
    new-instance v0, Lcom/android/camera/BasePreferenceActivity$4;

    invoke-direct {v0, p0}, Lcom/android/camera/BasePreferenceActivity$4;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/camera/BasePreferenceActivity$4;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 455
    return-void
.end method

.method private registerListener()V
    .locals 6

    .prologue
    .line 175
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-direct {p0, v4, p0}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 177
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_restore"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 178
    .local v2, "restore":Landroid/preference/Preference;
    if-eqz v2, :cond_0

    .line 179
    invoke-virtual {v2, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 183
    :cond_0
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_priority_storage"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 184
    .local v1, "priorityStorage":Landroid/preference/Preference;
    if-eqz v1, :cond_1

    .line 185
    invoke-virtual {v1, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 188
    :cond_1
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_camera_facedetection_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 189
    .local v0, "faceDetection":Landroid/preference/Preference;
    if-eqz v0, :cond_2

    .line 190
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 193
    :cond_2
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_scan_qrcode_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 194
    .local v3, "scanQRCode":Landroid/preference/Preference;
    if-eqz v3, :cond_3

    .line 195
    invoke-virtual {v3, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 197
    :cond_3
    return-void
.end method

.method private registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V
    .locals 4
    .param p1, "group"    # Landroid/preference/PreferenceGroup;
    .param p2, "l"    # Landroid/preference/Preference$OnPreferenceChangeListener;

    .prologue
    .line 365
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    .line 366
    .local v2, "total":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 367
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    .line 368
    .local v0, "child":Landroid/preference/Preference;
    instance-of v3, v0, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_0

    .line 369
    check-cast v0, Landroid/preference/PreferenceGroup;

    .end local v0    # "child":Landroid/preference/Preference;
    invoke-direct {p0, v0, p2}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 366
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 371
    .restart local v0    # "child":Landroid/preference/Preference;
    :cond_0
    invoke-virtual {v0, p2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_1

    .line 374
    .end local v0    # "child":Landroid/preference/Preference;
    :cond_1
    return-void
.end method

.method private removeIncompatibleAdvancePreference()V
    .locals 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 230
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 231
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 232
    return-void
.end method

.method private removeNonVideoPreference()V
    .locals 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v1, "category_camera_setting"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 226
    return-void
.end method

.method private resetIfInvalid(Landroid/preference/ListPreference;)V
    .locals 3
    .param p1, "pref"    # Landroid/preference/ListPreference;

    .prologue
    .line 357
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 358
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 359
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 361
    :cond_0
    return-void
.end method

.method private resetPreferences()V
    .locals 5

    .prologue
    .line 487
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    .line 489
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 490
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v3

    .line 491
    .local v3, "intentType":I
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetAll()V

    .line 493
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v0

    .line 494
    .local v0, "cameraId":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v4

    invoke-interface {v4, v0, v3}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 495
    .local v1, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 497
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v0

    .line 498
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v4

    invoke-interface {v4, v0, v3}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v1

    .end local v1    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    check-cast v1, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 499
    .restart local v1    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->resetAll()V

    .line 501
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->resetAll()V

    .line 503
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/camera/data/backup/DataBackUp;->clearBackUp()V

    .line 504
    return-void
.end method

.method private resetSnapSetting()V
    .locals 4

    .prologue
    .line 507
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 508
    const-string/jumbo v2, "key_long_press_volume_down"

    .line 507
    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 509
    .local v0, "snapType":Ljava/lang/String;
    const-string/jumbo v1, "Street-snap-picture"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 510
    const-string/jumbo v1, "Street-snap-movie"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 509
    if-eqz v1, :cond_1

    .line 511
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 512
    const-string/jumbo v2, "key_long_press_volume_down"

    .line 513
    const-string/jumbo v3, "none"

    .line 511
    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 515
    :cond_1
    return-void
.end method

.method private resetTimeOutFlag()V
    .locals 1

    .prologue
    .line 772
    iget-boolean v0, p0, Lcom/android/camera/BasePreferenceActivity;->mHasReset:Z

    if-nez v0, :cond_0

    .line 773
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    .line 775
    :cond_0
    return-void
.end method

.method private restorePreferences()V
    .locals 2

    .prologue
    .line 477
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetPreferences()V

    .line 478
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetSnapSetting()V

    .line 480
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 482
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 481
    invoke-static {v0}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 483
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 484
    return-void
.end method

.method private updateConflictPreference(Landroid/preference/Preference;)V
    .locals 7
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v6, 0x0

    .line 743
    sget-boolean v4, Lcom/android/camera/Device;->IS_X9:Z

    if-eqz v4, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 744
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality()I

    move-result v4

    const/4 v5, 0x6

    if-gt v5, v4, :cond_0

    .line 746
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_camera_movie_solid_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 748
    .local v2, "movieSolid":Landroid/preference/CheckBoxPreference;
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v5, "pref_video_quality_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/PreviewListPreference;

    .line 749
    .local v3, "videoQuality":Lcom/android/camera/ui/PreviewListPreference;
    if-eqz p1, :cond_1

    const-string/jumbo v4, "pref_camera_movie_solid_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 751
    const v4, 0x7f0f001e

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v4

    .line 750
    invoke-virtual {p0, v4}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 752
    .local v0, "defaultQuality":Ljava/lang/String;
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v4}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 753
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v4, "pref_video_quality_key"

    invoke-interface {v1, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 754
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 755
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 763
    .end local v0    # "defaultQuality":Ljava/lang/String;
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "movieSolid":Landroid/preference/CheckBoxPreference;
    .end local v3    # "videoQuality":Lcom/android/camera/ui/PreviewListPreference;
    :cond_0
    :goto_0
    return-void

    .line 757
    .restart local v2    # "movieSolid":Landroid/preference/CheckBoxPreference;
    .restart local v3    # "videoQuality":Lcom/android/camera/ui/PreviewListPreference;
    :cond_1
    iget-object v4, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v4}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 758
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v4, "pref_camera_movie_solid_key"

    invoke-interface {v1, v4, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 759
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 760
    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0
.end method

.method private updateEntries()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 574
    iget-object v10, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 575
    const-string/jumbo v11, "pref_camera_picturesize_key"

    .line 574
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/PreviewListPreference;

    .line 576
    .local v4, "pictureSize":Lcom/android/camera/ui/PreviewListPreference;
    iget-object v10, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 577
    const-string/jumbo v11, "pref_camera_antibanding_key"

    .line 576
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/PreviewListPreference;

    .line 578
    .local v0, "antiBanding":Lcom/android/camera/ui/PreviewListPreference;
    iget-object v10, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 579
    const-string/jumbo v11, "pref_auto_chroma_flash_key"

    .line 578
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    .line 580
    .local v1, "chromaFlash":Landroid/preference/CheckBoxPreference;
    iget-object v10, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 581
    const-string/jumbo v11, "pref_video_quality_key"

    .line 580
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    check-cast v9, Lcom/android/camera/ui/PreviewListPreference;

    .line 582
    .local v9, "videoQuality":Lcom/android/camera/ui/PreviewListPreference;
    iget-object v10, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    .line 583
    const-string/jumbo v11, "pref_camera_snap_key"

    .line 582
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Lcom/android/camera/ui/PreviewListPreference;

    .line 585
    .local v6, "snapType":Lcom/android/camera/ui/PreviewListPreference;
    if-eqz v4, :cond_0

    .line 586
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntries()[Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/android/camera/ui/PreviewListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 587
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getEntryValues()[Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/android/camera/ui/PreviewListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 588
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 589
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getDefaultValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 592
    :cond_0
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isAntibanding60()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 593
    const v10, 0x7f0f00b0

    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 594
    .local v8, "value":Ljava/lang/String;
    invoke-virtual {v0, v8}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 595
    invoke-virtual {v0, v8}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 598
    .end local v8    # "value":Ljava/lang/String;
    :cond_1
    if-eqz v1, :cond_2

    .line 599
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 601
    const v11, 0x7f0c0003

    .line 600
    invoke-static {v11}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v11

    .line 599
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    invoke-virtual {v1, v10}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 604
    :cond_2
    if-eqz v9, :cond_3

    .line 607
    const v10, 0x7f0f001e

    invoke-static {v10}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v10

    .line 606
    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 608
    .local v3, "defaultVideoQuality":Ljava/lang/String;
    invoke-virtual {v9, v3}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 609
    invoke-virtual {v9, v3}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 612
    .end local v3    # "defaultVideoQuality":Ljava/lang/String;
    :cond_3
    if-eqz v6, :cond_5

    invoke-static {}, Lcom/android/camera/Device;->isSupportedQuickSnap()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 613
    const v10, 0x7f0f0159

    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 614
    .local v2, "defaultSnapType":Ljava/lang/String;
    invoke-virtual {v6, v2}, Lcom/android/camera/ui/PreviewListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 615
    invoke-virtual {v6, v2}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 618
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    .line 619
    const-string/jumbo v11, "key_long_press_volume_down"

    .line 618
    invoke-static {v10, v11}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 620
    .local v5, "settingsSnapType":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    .line 621
    const-string/jumbo v11, "volumekey_wake_screen"

    const/4 v12, 0x0

    .line 620
    invoke-static {v10, v11, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    .line 621
    const/4 v11, 0x1

    .line 620
    if-eq v10, v11, :cond_4

    .line 622
    const-string/jumbo v10, "public_transportation_shortcuts"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    .line 620
    if-nez v10, :cond_4

    .line 623
    const-string/jumbo v10, "none"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    .line 620
    if-eqz v10, :cond_6

    .line 624
    :cond_4
    const v10, 0x7f0f0161

    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 640
    .end local v2    # "defaultSnapType":Ljava/lang/String;
    .end local v5    # "settingsSnapType":Ljava/lang/String;
    :cond_5
    :goto_0
    return-void

    .line 626
    .restart local v2    # "defaultSnapType":Ljava/lang/String;
    .restart local v5    # "settingsSnapType":Ljava/lang/String;
    :cond_6
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v10

    const-string/jumbo v11, "pref_camera_snap_key"

    invoke-virtual {v10, v11, v13}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 627
    .local v7, "snapValue":Ljava/lang/String;
    if-eqz v7, :cond_7

    .line 628
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    .line 629
    const-string/jumbo v11, "key_long_press_volume_down"

    .line 630
    invoke-static {v7}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 628
    invoke-static {v10, v11, v12}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 631
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v10

    const-string/jumbo v11, "pref_camera_snap_key"

    invoke-interface {v10, v11}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v10

    invoke-interface {v10}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 632
    invoke-virtual {v6, v7}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 633
    :cond_7
    const-string/jumbo v10, "Street-snap-picture"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 634
    const v10, 0x7f0f015f

    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 635
    :cond_8
    const-string/jumbo v10, "Street-snap-movie"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 636
    const v10, 0x7f0f0160

    invoke-virtual {p0, v10}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V
    .locals 10
    .param p1, "group"    # Landroid/preference/PreferenceGroup;
    .param p2, "sp"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v9, 0x0

    .line 657
    if-nez p1, :cond_0

    .line 658
    return-void

    .line 660
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    .line 661
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_5

    .line 662
    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 663
    .local v1, "child":Landroid/preference/Preference;
    instance-of v6, v1, Lcom/android/camera/ui/PreviewListPreference;

    if-eqz v6, :cond_2

    move-object v5, v1

    .line 664
    check-cast v5, Lcom/android/camera/ui/PreviewListPreference;

    .line 665
    .local v5, "list":Lcom/android/camera/ui/PreviewListPreference;
    const-string/jumbo v6, "pref_camera_picturesize_key"

    invoke-virtual {v5}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 666
    const/4 v6, 0x1

    invoke-static {v6}, Lcom/android/camera/PictureSizeManager;->getPictureSize(Z)Lcom/android/camera/CameraSize;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/CameraSize;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 670
    :goto_1
    invoke-virtual {v1, v9}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 661
    .end local v1    # "child":Landroid/preference/Preference;
    .end local v5    # "list":Lcom/android/camera/ui/PreviewListPreference;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 668
    .restart local v1    # "child":Landroid/preference/Preference;
    .restart local v5    # "list":Lcom/android/camera/ui/PreviewListPreference;
    :cond_1
    invoke-direct {p0, v5, p2}, Lcom/android/camera/BasePreferenceActivity;->getFilterValue(Lcom/android/camera/ui/PreviewListPreference;Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 671
    .end local v5    # "list":Lcom/android/camera/ui/PreviewListPreference;
    :cond_2
    instance-of v6, v1, Landroid/preference/CheckBoxPreference;

    if-eqz v6, :cond_3

    move-object v0, v1

    .line 672
    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 673
    .local v0, "checkBox":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v4

    .line 674
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v6

    invoke-interface {p2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {v0, v6}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 675
    invoke-virtual {v1, v9}, Landroid/preference/Preference;->setPersistent(Z)V

    goto :goto_2

    .line 676
    .end local v0    # "checkBox":Landroid/preference/CheckBoxPreference;
    .end local v4    # "key":Ljava/lang/String;
    :cond_3
    instance-of v6, v1, Landroid/preference/PreferenceGroup;

    if-eqz v6, :cond_4

    .line 677
    check-cast v1, Landroid/preference/PreferenceGroup;

    .end local v1    # "child":Landroid/preference/Preference;
    invoke-direct {p0, v1, p2}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    goto :goto_2

    .line 680
    .restart local v1    # "child":Landroid/preference/Preference;
    :cond_4
    sget-object v6, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "no need update preference for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 683
    .end local v1    # "child":Landroid/preference/Preference;
    :cond_5
    return-void
.end method

.method private updateQRCodeEntry()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 644
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    const-string/jumbo v3, "pref_scan_qrcode_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    .line 645
    .local v1, "scanQRCode":Landroid/preference/CheckBoxPreference;
    if-eqz v1, :cond_0

    .line 646
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    const-string/jumbo v3, "pref_scan_qrcode_key"

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/preferences/CameraSettingPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 645
    if-eqz v2, :cond_0

    .line 647
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 645
    if-eqz v2, :cond_0

    .line 648
    sget-object v2, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "disable QRCodeScan"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v2}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 650
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v2, "pref_scan_qrcode_key"

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 651
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 652
    invoke-virtual {v1, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 654
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    return-void
.end method


# virtual methods
.method protected addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 565
    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {v1, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 566
    .local v0, "preferenceGroup":Landroid/preference/Preference;
    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_0

    .line 567
    check-cast v0, Landroid/preference/PreferenceGroup;

    .end local v0    # "preferenceGroup":Landroid/preference/Preference;
    invoke-virtual {v0, p2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 568
    const/4 v1, 0x1

    return v1

    .line 570
    .restart local v0    # "preferenceGroup":Landroid/preference/Preference;
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method protected filterByIntent()V
    .locals 5

    .prologue
    .line 711
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "remove_keys"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 712
    .local v2, "removeKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    .line 713
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "key$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 714
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferenceGroup:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v3, v0}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    goto :goto_0

    .line 717
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "key$iterator":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V
    .locals 2
    .param p1, "group"    # Landroid/preference/PreferenceGroup;
    .param p2, "pref"    # Lcom/android/camera/ui/PreviewListPreference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceGroup;",
            "Lcom/android/camera/ui/PreviewListPreference;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "supported":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .line 341
    if-eqz p3, :cond_0

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v1, :cond_1

    .line 342
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 343
    return-void

    .line 346
    :cond_1
    invoke-virtual {p2, p3}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    .line 347
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    array-length v0, v0

    if-gt v0, v1, :cond_2

    .line 348
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 349
    return-void

    .line 352
    :cond_2
    invoke-direct {p0, p2}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    .line 353
    return-void
.end method

.method protected abstract getPreferenceXml()I
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 767
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 768
    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onBackPressed()V

    .line 769
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 70
    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 72
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "from_where"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/BasePreferenceActivity;->mFromWhere:I

    .line 73
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    .line 74
    invoke-static {}, Lcom/android/camera/CameraSettings;->upgradeGlobalPreferences()V

    .line 75
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 76
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->initializeActivity()V

    .line 77
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "StartActivityWhenLocked"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 80
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 702
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 703
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->resetTimeOutFlag()V

    .line 704
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 705
    const/4 v0, 0x1

    return v0

    .line 707
    :cond_0
    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 519
    invoke-virtual {p0, v4}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    .line 520
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v2}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 521
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 522
    .local v1, "key":Ljava/lang/String;
    instance-of v2, p2, Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object v2, p2

    .line 523
    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 536
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 537
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 539
    invoke-direct {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    .line 540
    return v4

    .line 524
    :cond_0
    instance-of v2, p2, Ljava/lang/Boolean;

    if-eqz v2, :cond_1

    move-object v2, p2

    .line 525
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 526
    :cond_1
    instance-of v2, p2, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    move-object v2, p2

    .line 527
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 528
    :cond_2
    instance-of v2, p2, Ljava/lang/Long;

    if-eqz v2, :cond_3

    move-object v2, p2

    .line 529
    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 530
    :cond_3
    instance-of v2, p2, Ljava/lang/Float;

    if-eqz v2, :cond_4

    move-object v2, p2

    .line 531
    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 533
    :cond_4
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unhandled new value with type="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 534
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 533
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 12
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 378
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "pref_restore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    new-instance v4, Lcom/android/camera/BasePreferenceActivity$2;

    invoke-direct {v4, p0}, Lcom/android/camera/BasePreferenceActivity$2;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 387
    .local v4, "restore":Ljava/lang/Runnable;
    const v0, 0x7f0f000e

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 388
    const v0, 0x7f0f000f

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 389
    const v0, 0x104000a

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 390
    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v0, p0

    .line 386
    invoke-static/range {v0 .. v6}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 391
    const/4 v0, 0x1

    return v0

    .line 394
    .end local v4    # "restore":Ljava/lang/Runnable;
    :cond_0
    const-string/jumbo v0, "pref_priority_storage"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 396
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .end local p1    # "preference":Landroid/preference/Preference;
    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    .line 395
    invoke-static {v0}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    .line 441
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 397
    .restart local p1    # "preference":Landroid/preference/Preference;
    :cond_2
    const-string/jumbo v0, "pref_scan_qrcode_key"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 398
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    if-lez v0, :cond_8

    .line 399
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    .line 400
    iget v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    if-nez v0, :cond_8

    .line 401
    const v0, 0x7f0f00f2

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 402
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setLabOptionsVisible(Z)V

    .line 403
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 404
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPortraitWithFaceBeautyPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 406
    :cond_3
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mFaceDetectionPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 407
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mFaceDetectionAutoHiddenPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 408
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/Device;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 409
    :cond_4
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mDualCameraEnablePreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 411
    :cond_5
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 412
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mDualCameraSatEnablePreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 414
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 415
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mParallelProcessEnablePreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 418
    :cond_7
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mMFnrSatEnablePreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 419
    const-string/jumbo v0, "category_advance_setting"

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mSREnablePreference:Landroid/preference/Preference;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/BasePreferenceActivity;->addPreference(Ljava/lang/String;Landroid/preference/Preference;)Z

    .line 425
    :cond_8
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 426
    new-instance v9, Lcom/android/camera/BasePreferenceActivity$3;

    invoke-direct {v9, p0}, Lcom/android/camera/BasePreferenceActivity$3;-><init>(Lcom/android/camera/BasePreferenceActivity;)V

    .line 434
    .local v9, "install":Ljava/lang/Runnable;
    const v0, 0x7f0f01be

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 435
    const v0, 0x7f0f01bf

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 436
    const v0, 0x7f0f01bd

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 437
    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    move-object v5, p0

    .line 433
    invoke-static/range {v5 .. v11}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    .line 438
    const/4 v0, 0x1

    return v0
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 736
    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onRestart()V

    .line 737
    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->finish()V

    .line 738
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 84
    invoke-super {p0}, Lmiui/preference/PreferenceActivity;->onResume()V

    .line 85
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;->updateQRCodeEntry()V

    .line 86
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLabOptionsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    .line 91
    :goto_0
    return-void

    .line 89
    :cond_0
    const/16 v0, 0x8

    iput v0, p0, Lcom/android/camera/BasePreferenceActivity;->mLabOptionsHitCountDown:I

    goto :goto_0
.end method

.method protected abstract onSettingChanged(I)V
.end method

.method protected removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z
    .locals 5
    .param p1, "root"    # Landroid/preference/PreferenceGroup;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 544
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 545
    .local v0, "child":Landroid/preference/Preference;
    if-eqz v0, :cond_0

    .line 546
    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 547
    return v4

    .line 551
    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 552
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 553
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    .line 554
    instance-of v3, v0, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_1

    move-object v3, v0

    .line 555
    check-cast v3, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v3, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 556
    return v4

    .line 552
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 561
    :cond_2
    const/4 v3, 0x0

    return v3
.end method
