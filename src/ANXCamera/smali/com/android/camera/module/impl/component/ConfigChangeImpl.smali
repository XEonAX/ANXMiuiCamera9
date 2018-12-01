.class public Lcom/android/camera/module/impl/component/ConfigChangeImpl;
.super Ljava/lang/Object;
.source "ConfigChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mLastAiSceneStateOn:Z

.field private mRecordingMutexElements:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-class v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1
    .param p1, "activityBase"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 62
    iput-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 63
    return-void
.end method

.method private applyConfig(II)V
    .locals 0
    .param p1, "selectedItem"    # I
    .param p2, "checkType"    # I

    .prologue
    .line 123
    packed-switch p1, :pswitch_data_0

    .line 208
    :goto_0
    :pswitch_0
    return-void

    .line 125
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showSetting()V

    goto :goto_0

    .line 129
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showFilter()V

    goto :goto_0

    .line 133
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configTimerSwitch()V

    goto :goto_0

    .line 137
    :pswitch_4
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configTiltSwitch(I)V

    goto :goto_0

    .line 141
    :pswitch_5
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGradienterSwitch(I)V

    goto :goto_0

    .line 145
    :pswitch_6
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configHHTSwitch(I)V

    goto :goto_0

    .line 149
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMagicFocusSwitch()V

    goto :goto_0

    .line 153
    :pswitch_8
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGroupSwitch(I)V

    goto :goto_0

    .line 157
    :pswitch_9
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configScene(I)V

    goto :goto_0

    .line 161
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoHFR()V

    goto :goto_0

    .line 165
    :pswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoSlow()V

    goto :goto_0

    .line 169
    :pswitch_c
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoFast()V

    goto :goto_0

    .line 173
    :pswitch_d
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMagicMirrorSwitch(I)V

    goto :goto_0

    .line 177
    :pswitch_e
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configRawSwitch()V

    goto :goto_0

    .line 181
    :pswitch_f
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configPortraitSwitch(I)V

    goto :goto_0

    .line 185
    :pswitch_10
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGenderAgeSwitch(I)V

    goto :goto_0

    .line 189
    :pswitch_11
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configFocusPeakSwitch(I)V

    goto :goto_0

    .line 193
    :pswitch_12
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configDualWaterMarkSwitch()V

    goto :goto_0

    .line 197
    :pswitch_13
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSuperResolutionSwitch(I)V

    goto :goto_0

    .line 201
    :pswitch_14
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configBeautySwitch(I)V

    goto :goto_0

    .line 205
    :pswitch_15
    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configAiSceneSwitch(I)V

    goto :goto_0

    .line 123
    :pswitch_data_0
    .packed-switch 0xc3
        :pswitch_f
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_11
        :pswitch_0
        :pswitch_15
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_b
        :pswitch_c
        :pswitch_9
        :pswitch_8
        :pswitch_d
        :pswitch_e
        :pswitch_10
        :pswitch_14
        :pswitch_12
        :pswitch_13
    .end packed-switch
.end method

.method private configAiSceneSwitch(I)V
    .locals 9
    .param p1, "checkType"    # I

    .prologue
    const/16 v8, 0xc9

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 733
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v1

    .line 734
    .local v1, "switchOn":Z
    sget-object v3, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "configAiSceneSwitch: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    xor-int/lit8 v5, v1, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 736
    const/16 v4, 0xac

    .line 735
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 737
    .local v2, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    packed-switch p1, :pswitch_data_0

    .line 772
    :cond_0
    :goto_0
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    new-array v4, v7, [I

    const/16 v5, 0x24

    aput v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/android/camera/module/BaseModule;->updatePreferenceTrampoline([I)V

    .line 773
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 774
    return-void

    .line 742
    :pswitch_1
    if-nez v1, :cond_1

    .line 743
    iput-boolean v7, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 744
    invoke-interface {v2, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSwitchHint(I)V

    .line 745
    invoke-static {v7}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 746
    const-string/jumbo v3, "pref_camera_ai_scene_mode_key"

    const-string/jumbo v4, "on"

    invoke-static {v3, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 753
    :goto_1
    new-array v3, v7, [I

    aput v8, v3, v6

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 755
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 757
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 758
    const/16 v4, 0xa4

    .line 757
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 759
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    const/4 v3, 0x4

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configGroupSwitch(I)V

    .line 760
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    goto :goto_0

    .line 748
    .end local v0    # "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    :cond_1
    iput-boolean v6, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 749
    const/16 v3, 0x8

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSwitchHint(I)V

    .line 750
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 751
    const-string/jumbo v3, "pref_camera_ai_scene_mode_key"

    const-string/jumbo v4, "off"

    invoke-static {v3, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 764
    :pswitch_2
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 765
    new-array v3, v7, [I

    aput v8, v3, v6

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    goto :goto_0

    .line 737
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private conflictWithFlashAndHdr()V
    .locals 4

    .prologue
    .line 985
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 986
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    const-string/jumbo v2, "pref_camera_hand_night_key"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 987
    const-string/jumbo v2, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 988
    const-string/jumbo v2, "pref_camera_super_resolution_key"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 991
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 992
    const/16 v3, 0xaf

    .line 991
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 993
    .local v1, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 994
    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/ConfigChangeImpl;
    .locals 1
    .param p0, "activityBase"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 58
    new-instance v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private getState(ILjava/lang/String;)Z
    .locals 1
    .param p1, "checkType"    # I
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 777
    packed-switch p1, :pswitch_data_0

    .line 779
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->triggerSwitchAndGet(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 782
    :pswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 785
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 786
    const/4 v0, 0x0

    return v0

    .line 777
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private hideTipMessage(I)V
    .locals 3
    .param p1, "tokenResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 1006
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1007
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1008
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 1010
    :cond_1
    return-void
.end method

.method private isAlive()Z
    .locals 1

    .prologue
    .line 1014
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private trackFocusPeakChanged(Z)V
    .locals 3
    .param p1, "on"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1043
    const-string/jumbo v0, "manual_focus_peak_changed"

    .line 1044
    const-string/jumbo v1, "\u5cf0\u503c\u5bf9\u7126"

    .line 1043
    invoke-static {v0, v1, p1, v2, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1045
    return-void
.end method

.method private trackGenderAgeChanged(Z)V
    .locals 4
    .param p1, "on"    # Z

    .prologue
    .line 1033
    const-string/jumbo v0, "gender_age_changed"

    .line 1034
    const-string/jumbo v1, "\u5e74\u9f84\u68c0\u6d4b"

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1033
    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1035
    return-void
.end method

.method private trackGotoSettings()V
    .locals 2

    .prologue
    .line 237
    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 238
    .local v0, "module":Lcom/android/camera/module/BaseModule;
    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 241
    :cond_0
    return-void
.end method

.method private trackGradienterChanged(Z)V
    .locals 4
    .param p1, "on"    # Z

    .prologue
    .line 1019
    const-string/jumbo v0, "gradienter_changed"

    .line 1020
    const-string/jumbo v1, "\u6c34\u5e73\u4eea"

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1019
    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1021
    return-void
.end method

.method private trackGroupChanged(Z)V
    .locals 4
    .param p1, "on"    # Z

    .prologue
    .line 1024
    const-string/jumbo v0, "group_shot_changed"

    .line 1025
    const-string/jumbo v1, "\u5408\u5f71\u4f18\u9009"

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1024
    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1026
    return-void
.end method

.method private trackHHTChanged(Z)V
    .locals 4
    .param p1, "on"    # Z

    .prologue
    .line 1029
    const-string/jumbo v0, "hht_changed"

    const-string/jumbo v1, "HHT"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1030
    return-void
.end method

.method private trackMagicMirrorChanged(Z)V
    .locals 4
    .param p1, "on"    # Z

    .prologue
    .line 1038
    const-string/jumbo v0, "magic_mirror_changed"

    .line 1039
    const-string/jumbo v1, "\u9b54\u955c"

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1038
    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1040
    return-void
.end method

.method private trackSuperResolutionChanged(Z)V
    .locals 3
    .param p1, "on"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1048
    const-string/jumbo v0, "super_resolution_changed"

    .line 1049
    const-string/jumbo v1, "\u8d85\u5206\u8fa8\u7387"

    .line 1048
    invoke-static {v0, v1, p1, v2, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 1050
    return-void
.end method

.method private updateAiScene(Z)V
    .locals 5
    .param p1, "close"    # Z

    .prologue
    .line 970
    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    if-nez v2, :cond_0

    .line 971
    return-void

    .line 973
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    .line 974
    .local v0, "isSwitchOn":Z
    xor-int/lit8 v2, p1, 0x1

    if-ne v0, v2, :cond_1

    .line 975
    return-void

    .line 977
    :cond_1
    xor-int/lit8 v2, p1, 0x1

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 979
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xac

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 980
    .local v1, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/16 v3, 0xc9

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 981
    return-void
.end method

.method private updateBeauty(Z)V
    .locals 3
    .param p1, "close"    # Z

    .prologue
    .line 944
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 945
    .local v1, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 946
    .local v0, "currentMode":I
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 947
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v2

    if-ne v2, p1, :cond_1

    .line 948
    :cond_0
    return-void

    .line 951
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 952
    return-void
.end method

.method private updateBokeh(Z)V
    .locals 5
    .param p1, "close"    # Z

    .prologue
    .line 955
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 956
    .local v0, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 957
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->isClosed()Z

    move-result v2

    if-ne v2, p1, :cond_1

    .line 958
    :cond_0
    return-void

    .line 961
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->setClosed(Z)V

    .line 964
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xac

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 965
    .local v1, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/16 v3, 0xc8

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 966
    return-void
.end method

.method private updateComponentFilter(Z)V
    .locals 7
    .param p1, "close"    # Z

    .prologue
    .line 927
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v0

    .line 928
    .local v0, "configFilter":Lcom/android/camera/data/data/config/ComponentConfigFilter;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 929
    .local v1, "currentMode":I
    invoke-virtual {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->setClosed(ZI)V

    .line 932
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xac

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 933
    .local v3, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v4, 0x1

    new-array v4, v4, [I

    const/16 v5, 0xc4

    const/4 v6, 0x0

    aput v5, v4, v6

    invoke-interface {v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 936
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xa2

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 937
    .local v2, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->filterUiChange()V

    .line 938
    if-eqz p1, :cond_0

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilter()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 939
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilter()V

    .line 941
    :cond_0
    return-void
.end method

.method private updateComponentFlash(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "trigger"    # Ljava/lang/String;
    .param p2, "close"    # Z

    .prologue
    .line 891
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    .line 892
    .local v0, "configFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 893
    .local v1, "currentMode":I
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 894
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v3

    if-ne v3, p2, :cond_1

    .line 895
    :cond_0
    return-void

    .line 899
    :cond_1
    if-eqz p2, :cond_2

    .line 900
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 899
    if-eqz v3, :cond_2

    .line 901
    const-string/jumbo v3, "d"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 899
    if-eqz v3, :cond_2

    .line 903
    return-void

    .line 906
    :cond_2
    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setClosed(Z)V

    .line 908
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xac

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 909
    .local v2, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v3, 0x1

    new-array v3, v3, [I

    const/16 v4, 0xc1

    const/4 v5, 0x0

    aput v4, v3, v5

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 910
    return-void
.end method

.method private updateComponentHdr(Z)V
    .locals 6
    .param p1, "close"    # Z

    .prologue
    .line 913
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 914
    .local v0, "configHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 915
    .local v1, "currentMode":I
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 916
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v3

    if-ne v3, p1, :cond_1

    .line 917
    :cond_0
    return-void

    .line 920
    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setClosed(Z)V

    .line 922
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xac

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 923
    .local v2, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v3, 0x1

    new-array v3, v3, [I

    const/16 v4, 0xc2

    const/4 v5, 0x0

    aput v4, v3, v5

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 924
    return-void
.end method

.method private updateTipMessage(III)V
    .locals 3
    .param p1, "tipType"    # I
    .param p2, "stringResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "duration"    # I

    .prologue
    .line 1000
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1001
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 1002
    return-void
.end method


# virtual methods
.method public varargs closeMutexElement(Ljava/lang/String;[I)V
    .locals 5
    .param p1, "trigger"    # Ljava/lang/String;
    .param p2, "items"    # [I

    .prologue
    const/4 v4, 0x1

    .line 801
    array-length v3, p2

    new-array v2, v3, [I

    .line 802
    .local v2, "updateTypes":[I
    iput-object p2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    .line 803
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_0

    .line 804
    aget v3, p2, v1

    sparse-switch v3, :sswitch_data_0

    .line 832
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "unknown mutex element"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 806
    :sswitch_0
    invoke-direct {p0, p1, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFlash(Ljava/lang/String;Z)V

    .line 807
    const/16 v3, 0xa

    aput v3, v2, v1

    .line 803
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 810
    :sswitch_1
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentHdr(Z)V

    .line 811
    const/16 v3, 0xb

    aput v3, v2, v1

    goto :goto_1

    .line 814
    :sswitch_2
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFilter(Z)V

    .line 815
    const/4 v3, 0x2

    aput v3, v2, v1

    goto :goto_1

    .line 819
    :sswitch_3
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateBeauty(Z)V

    .line 820
    const/16 v3, 0xd

    aput v3, v2, v1

    goto :goto_1

    .line 823
    :sswitch_4
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateAiScene(Z)V

    .line 824
    const/16 v3, 0x24

    aput v3, v2, v1

    goto :goto_1

    .line 827
    :sswitch_5
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateBokeh(Z)V

    .line 828
    const/16 v3, 0x25

    aput v3, v2, v1

    goto :goto_1

    .line 836
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 838
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceTrampoline([I)V

    .line 839
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 840
    return-void

    .line 804
    :sswitch_data_0
    .sparse-switch
        0xc1 -> :sswitch_0
        0xc2 -> :sswitch_1
        0xc4 -> :sswitch_2
        0xc8 -> :sswitch_5
        0xc9 -> :sswitch_4
        0xef -> :sswitch_3
    .end sparse-switch
.end method

.method public configBeautySwitch(I)V
    .locals 8
    .param p1, "checkType"    # I

    .prologue
    .line 718
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v4

    const/16 v5, 0xa3

    if-eq v4, v5, :cond_0

    .line 719
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v4

    const/16 v5, 0xa5

    if-eq v4, v5, :cond_0

    .line 720
    return-void

    .line 722
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 723
    .local v0, "camera2Module":Lcom/android/camera/module/Camera2Module;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    .line 724
    .local v2, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v1

    .line 725
    .local v1, "componentConfigBeauty":Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getNextValue(I)Ljava/lang/String;

    move-result-object v3

    .line 726
    .local v3, "nextValue":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v4

    invoke-virtual {v1, v4, v3}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setComponentValue(ILjava/lang/String;)V

    .line 728
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/16 v6, 0xd

    const/4 v7, 0x0

    aput v6, v5, v7

    invoke-virtual {v4, v5}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 729
    return-void
.end method

.method public configBokeh(Ljava/lang/String;)V
    .locals 4
    .param p1, "newConfig"    # Ljava/lang/String;

    .prologue
    const v3, 0x7f0f016c

    .line 286
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 288
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    const-string/jumbo v1, "on"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 289
    const/4 v1, 0x4

    .line 291
    const/4 v2, 0x2

    .line 289
    invoke-direct {p0, v1, v3, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 299
    :goto_0
    const/16 v1, 0xb

    const/16 v2, 0x25

    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 300
    return-void

    .line 293
    :cond_0
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    goto :goto_0
.end method

.method public configDualWaterMarkSwitch()V
    .locals 4

    .prologue
    const v3, 0x7f0f0194

    .line 698
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v0

    .line 699
    .local v0, "switchOn":Z
    xor-int/lit8 v1, v0, 0x1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualWaterMarkChanged(Z)V

    .line 701
    if-eqz v0, :cond_0

    .line 702
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 704
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setDualCameraWaterMarkOpen(Z)V

    .line 713
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 714
    return-void

    .line 706
    :cond_0
    const/4 v1, 0x4

    .line 707
    const/4 v2, 0x2

    .line 706
    invoke-direct {p0, v1, v3, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 709
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setDualCameraWaterMarkOpen(Z)V

    goto :goto_0
.end method

.method public configFlash(Ljava/lang/String;)V
    .locals 3
    .param p1, "newConfig"    # Ljava/lang/String;

    .prologue
    .line 262
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->conflictWithFlashAndHdr()V

    .line 263
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 269
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    const/16 v1, 0xb

    const/16 v2, 0xa

    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 270
    return-void
.end method

.method public configFocusPeakSwitch(I)V
    .locals 3
    .param p1, "checkType"    # I

    .prologue
    .line 684
    const-string/jumbo v1, "pref_camera_peak_key"

    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 685
    .local v0, "switchOn":Z
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 686
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackFocusPeakChanged(Z)V

    .line 689
    :cond_0
    if-nez v0, :cond_2

    .line 690
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    .line 694
    :cond_1
    :goto_0
    return-void

    .line 691
    :cond_2
    const-string/jumbo v1, "manual"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 692
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    goto :goto_0
.end method

.method public configGenderAgeSwitch(I)V
    .locals 9
    .param p1, "checkType"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 653
    const-string/jumbo v4, "pref_camera_show_gender_age_key"

    invoke-direct {p0, p1, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v3

    .line 654
    .local v3, "switchOn":Z
    if-ne v7, p1, :cond_0

    .line 655
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGenderAgeChanged(Z)V

    .line 659
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 660
    const/16 v5, 0xa6

    .line 659
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 661
    .local v2, "mainContentProtocol":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setShowGenderAndAge(Z)V

    .line 663
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    new-array v5, v7, [I

    const/16 v6, 0x26

    aput v6, v5, v8

    invoke-virtual {v4, v5}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 666
    if-eqz v3, :cond_2

    .line 667
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v1

    .line 668
    .local v1, "device":Lcom/android/camera2/Camera2Proxy;
    if-eqz v1, :cond_1

    .line 670
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0f011d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 671
    .local v0, "ageFormat":Ljava/lang/String;
    invoke-virtual {v1, v7}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 672
    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 680
    .end local v0    # "ageFormat":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 675
    .end local v1    # "device":Lcom/android/camera2/Camera2Proxy;
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v1

    .line 676
    .restart local v1    # "device":Lcom/android/camera2/Camera2Proxy;
    if-eqz v1, :cond_1

    .line 677
    invoke-virtual {v1, v8}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    goto :goto_0
.end method

.method public configGradienterSwitch(I)V
    .locals 2
    .param p1, "checkType"    # I

    .prologue
    .line 304
    const-string/jumbo v1, "pref_camera_gradienter_key"

    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 305
    .local v0, "switchOn":Z
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 306
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGradienterChanged(Z)V

    .line 308
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/Camera2Module;->onGradienterSwitched(Z)V

    .line 309
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setDrawGradienter(Z)V

    .line 310
    return-void
.end method

.method public configGroupSwitch(I)V
    .locals 8
    .param p1, "checkType"    # I

    .prologue
    const v5, 0x7f0f018f

    .line 415
    const-string/jumbo v3, "pref_camera_groupshot_mode_key"

    invoke-direct {p0, p1, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v2

    .line 416
    .local v2, "switchOn":Z
    const/4 v3, 0x1

    if-ne v3, p1, :cond_0

    .line 417
    invoke-direct {p0, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGroupChanged(Z)V

    .line 420
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 421
    .local v0, "cameraModule":Lcom/android/camera/module/Camera2Module;
    if-eqz v2, :cond_1

    .line 422
    const/4 v3, 0x4

    .line 423
    const/4 v4, 0x2

    .line 422
    invoke-direct {p0, v3, v5, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 425
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getGroupShotMaxImage()I

    move-result v1

    .line 426
    .local v1, "maxImage":I
    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module;->initGroupShot(I)V

    .line 428
    const-string/jumbo v3, "b"

    .line 429
    const/16 v4, 0xc1

    .line 430
    const/16 v5, 0xc2

    .line 431
    const/16 v6, 0xc4

    .line 432
    const/16 v7, 0xc9

    .line 428
    filled-new-array {v4, v5, v6, v7}, [I

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 440
    .end local v1    # "maxImage":I
    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->onSharedPreferenceChanged()V

    .line 441
    return-void

    .line 435
    :cond_1
    const-string/jumbo v3, "b"

    invoke-virtual {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 438
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    goto :goto_0
.end method

.method public configHHTSwitch(I)V
    .locals 5
    .param p1, "checkType"    # I

    .prologue
    const v4, 0x7f0f0190

    .line 314
    const-string/jumbo v2, "pref_camera_hand_night_key"

    invoke-direct {p0, p1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v1

    .line 315
    .local v1, "switchOn":Z
    const/4 v2, 0x1

    if-ne v2, p1, :cond_0

    .line 316
    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackHHTChanged(Z)V

    .line 319
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->getMutexModePicker()Lcom/android/camera/MutexModeManager;

    move-result-object v0

    .line 320
    .local v0, "mutexModeManager":Lcom/android/camera/MutexModeManager;
    if-eqz v1, :cond_1

    .line 321
    const/4 v2, 0x4

    .line 322
    const/4 v3, 0x2

    .line 321
    invoke-direct {p0, v2, v4, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 324
    const-string/jumbo v2, "a"

    const/16 v3, 0xc1

    const/16 v4, 0xc2

    filled-new-array {v3, v4}, [I

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 326
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Lcom/android/camera/MutexModeManager;->setMutexModeMandatory(I)V

    .line 335
    :goto_0
    return-void

    .line 328
    :cond_1
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 329
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->clearMandatoryFlag()V

    .line 330
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->resetMutexModeManually()V

    .line 331
    const-string/jumbo v2, "a"

    invoke-virtual {p0, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public configHdr(Ljava/lang/String;)V
    .locals 4
    .param p1, "newConfig"    # Ljava/lang/String;

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->conflictWithFlashAndHdr()V

    .line 275
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 281
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    const/16 v1, 0x25

    const/16 v2, 0xb

    const/16 v3, 0xa

    filled-new-array {v1, v2, v3}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 282
    return-void
.end method

.method public configMagicFocusSwitch()V
    .locals 3

    .prologue
    .line 408
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 409
    const-string/jumbo v2, "pref_camera_ubifocus_key"

    .line 408
    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->triggerSwitchAndGet(Ljava/lang/String;)Z

    move-result v0

    .line 410
    .local v0, "switchOn":Z
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackMagicMirrorChanged(Z)V

    .line 411
    return-void
.end method

.method public configMagicMirrorSwitch(I)V
    .locals 9
    .param p1, "checkType"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 611
    const-string/jumbo v4, "pref_camera_magic_mirror_key"

    invoke-direct {p0, p1, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v3

    .line 612
    .local v3, "switchOn":Z
    if-ne v7, p1, :cond_0

    .line 613
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackMagicMirrorChanged(Z)V

    .line 617
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 618
    const/16 v5, 0xa6

    .line 617
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 619
    .local v2, "mainContentProtocol":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setShowMagicMirror(Z)V

    .line 621
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    new-array v5, v7, [I

    const/16 v6, 0x27

    aput v6, v5, v8

    invoke-virtual {v4, v5}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 623
    if-eqz v3, :cond_2

    .line 624
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v0

    .line 625
    .local v0, "device":Lcom/android/camera2/Camera2Proxy;
    if-eqz v0, :cond_1

    .line 627
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0f011e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 628
    .local v1, "format":Ljava/lang/String;
    invoke-virtual {v0, v7}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 629
    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 637
    .end local v1    # "format":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 632
    .end local v0    # "device":Lcom/android/camera2/Camera2Proxy;
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v0

    .line 633
    .restart local v0    # "device":Lcom/android/camera2/Camera2Proxy;
    if-eqz v0, :cond_1

    .line 634
    invoke-virtual {v0, v8}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    goto :goto_0
.end method

.method public configPortraitSwitch(I)V
    .locals 1
    .param p1, "checkType"    # I

    .prologue
    .line 648
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 649
    return-void
.end method

.method public configRawSwitch()V
    .locals 0

    .prologue
    .line 643
    return-void
.end method

.method public configScene(I)V
    .locals 6
    .param p1, "checkType"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x2

    .line 446
    const-string/jumbo v2, "pref_camera_scenemode_setting_key"

    invoke-direct {p0, p1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v1

    .line 448
    .local v1, "switchOn":Z
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 449
    const/16 v4, 0xb5

    .line 448
    invoke-virtual {v2, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    .line 451
    .local v0, "manuallyAdjust":Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;
    if-eqz v1, :cond_0

    .line 453
    new-instance v2, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;

    invoke-direct {v2, p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;-><init>(Lcom/android/camera/module/impl/component/ConfigChangeImpl;)V

    .line 452
    invoke-interface {v0, v3, v5, v2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyVisible(IILcom/android/camera/fragment/manually/ManuallyListener;)I

    .line 471
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 472
    return-void

    .line 465
    :cond_0
    if-ne p1, v5, :cond_1

    move v2, v3

    .line 468
    :goto_1
    const/4 v4, 0x0

    .line 464
    invoke-interface {v0, v3, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyVisible(IILcom/android/camera/fragment/manually/ManuallyListener;)I

    goto :goto_0

    .line 467
    :cond_1
    const/4 v2, 0x3

    goto :goto_1
.end method

.method public configSuperResolutionSwitch(I)V
    .locals 5
    .param p1, "checkType"    # I

    .prologue
    .line 339
    const-string/jumbo v2, "pref_camera_super_resolution_key"

    invoke-direct {p0, p1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v1

    .line 340
    .local v1, "switchOn":Z
    const/4 v2, 0x1

    if-ne v2, p1, :cond_0

    .line 341
    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackSuperResolutionChanged(Z)V

    .line 344
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->getMutexModePicker()Lcom/android/camera/MutexModeManager;

    move-result-object v0

    .line 345
    .local v0, "mutexModeManager":Lcom/android/camera/MutexModeManager;
    if-eqz v1, :cond_1

    .line 346
    const-string/jumbo v2, "c"

    const/16 v3, 0xc1

    const/16 v4, 0xc2

    filled-new-array {v3, v4}, [I

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 348
    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Lcom/android/camera/MutexModeManager;->setMutexModeMandatory(I)V

    .line 354
    :goto_0
    return-void

    .line 350
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->clearMandatoryFlag()V

    .line 351
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->resetMutexModeManually()V

    .line 352
    const-string/jumbo v2, "c"

    invoke-virtual {p0, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public configTiltSwitch(I)V
    .locals 6
    .param p1, "checkType"    # I

    .prologue
    const/16 v5, 0xa0

    .line 358
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 359
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    const-string/jumbo v3, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    .line 360
    .local v1, "switchOn":Z
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v2

    .line 361
    .local v2, "tiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    packed-switch p1, :pswitch_data_0

    .line 392
    .end local v1    # "switchOn":Z
    :goto_0
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    check-cast v3, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v3, v1}, Lcom/android/camera/module/Camera2Module;->onTiltShiftSwitched(Z)V

    .line 393
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/android/camera/effect/EffectController;->setDrawTilt(Z)V

    .line 394
    return-void

    .line 363
    .restart local v1    # "switchOn":Z
    :pswitch_1
    const/4 v1, 0x0

    .line 364
    .local v1, "switchOn":Z
    const-string/jumbo v3, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto :goto_0

    .line 371
    .local v1, "switchOn":Z
    :pswitch_2
    if-nez v1, :cond_0

    .line 372
    const/4 v1, 0x1

    .line 373
    .local v1, "switchOn":Z
    const-string/jumbo v3, "circle"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 374
    const-string/jumbo v3, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 376
    const-string/jumbo v3, "circle"

    .line 375
    invoke-virtual {v2, v5, v3}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->setComponentValue(ILjava/lang/String;)V

    goto :goto_0

    .line 378
    .local v1, "switchOn":Z
    :cond_0
    const-string/jumbo v3, "circle"

    .line 379
    invoke-virtual {v2, v5}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v4

    .line 378
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 380
    const-string/jumbo v3, "parallel"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 382
    const-string/jumbo v3, "parallel"

    .line 381
    invoke-virtual {v2, v5, v3}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->setComponentValue(ILjava/lang/String;)V

    goto :goto_0

    .line 384
    :cond_1
    const-string/jumbo v3, "off"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 385
    const-string/jumbo v3, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 386
    const/4 v1, 0x0

    .local v1, "switchOn":Z
    goto :goto_0

    .line 361
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public configTimerSwitch()V
    .locals 4

    .prologue
    .line 398
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 399
    .local v1, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v0

    .line 400
    .local v0, "componentRunningTimer":Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getNextValue()Ljava/lang/String;

    move-result-object v2

    .line 402
    .local v2, "nextValue":Ljava/lang/String;
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackTimerChanged(Ljava/lang/String;)V

    .line 403
    const/16 v3, 0xa0

    invoke-virtual {v0, v3, v2}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->setComponentValue(ILjava/lang/String;)V

    .line 404
    return-void
.end method

.method public configVideoFast()V
    .locals 7

    .prologue
    const v6, 0x7f0f0191

    const/16 v5, 0xa2

    const/16 v3, 0xa9

    const/4 v4, 0x1

    .line 477
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 479
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 481
    .local v1, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 482
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 483
    const-string/jumbo v2, "fast"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 486
    const-string/jumbo v2, "pref_video_speed_slow_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 487
    const-string/jumbo v2, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 490
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 502
    const/4 v2, 0x4

    .line 503
    const/4 v3, 0x2

    .line 502
    invoke-direct {p0, v2, v6, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 527
    :goto_0
    return-void

    .line 506
    :cond_0
    invoke-direct {p0, v6}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 509
    const-string/jumbo v2, "pref_video_speed_fast_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 511
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 512
    const-string/jumbo v2, "normal"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 513
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_0
.end method

.method public configVideoHFR()V
    .locals 7

    .prologue
    const/16 v6, 0xa2

    const/16 v4, 0xaa

    const/4 v5, 0x1

    .line 576
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 577
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 579
    .local v1, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v3

    if-eq v3, v4, :cond_0

    .line 580
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 581
    const-string/jumbo v3, "hfr"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 584
    const-string/jumbo v3, "pref_video_speed_fast_key"

    invoke-virtual {v1, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 585
    const-string/jumbo v3, "pref_video_speed_slow_key"

    invoke-virtual {v1, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 589
    const/4 v2, 0x1

    .line 591
    .local v2, "needReConfigure":Z
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v4}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 607
    .end local v2    # "needReConfigure":Z
    :goto_0
    return-void

    .line 598
    :cond_0
    const-string/jumbo v3, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 600
    invoke-virtual {v0, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 601
    const-string/jumbo v3, "normal"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 602
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v6}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_0
.end method

.method public configVideoSlow()V
    .locals 7

    .prologue
    const v6, 0x7f0f0192

    const/16 v5, 0xa2

    const/16 v3, 0xa8

    const/4 v4, 0x1

    .line 532
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 533
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 535
    .local v1, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 536
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 537
    const-string/jumbo v2, "slow"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 540
    const-string/jumbo v2, "pref_video_speed_fast_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 541
    const-string/jumbo v2, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 544
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 552
    const/4 v2, 0x4

    .line 553
    const/4 v3, 0x2

    .line 552
    invoke-direct {p0, v2, v6, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 572
    :goto_0
    return-void

    .line 555
    :cond_0
    invoke-direct {p0, v6}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 558
    const-string/jumbo v2, "pref_video_speed_slow_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 560
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 561
    const-string/jumbo v2, "normal"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 562
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_0
.end method

.method public getBaseModule()Lcom/android/camera/module/BaseModule;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    return-object v0
.end method

.method public onConfigChanged(I)V
    .locals 6
    .param p1, "selectedItem"    # I

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isAlive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 83
    return-void

    .line 86
    :cond_0
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->isMutexConfig(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 87
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 88
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    sget-object v3, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    const/4 v2, 0x0

    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_3

    aget v1, v3, v2

    .line 89
    .local v1, "mutexItem":I
    if-ne v1, p1, :cond_2

    .line 88
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 93
    :cond_2
    invoke-static {v1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 94
    const/4 v5, 0x3

    invoke-direct {p0, v1, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    goto :goto_1

    .line 97
    .end local v1    # "mutexItem":I
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 100
    .end local v0    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    :cond_4
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    .line 101
    return-void
.end method

.method public reCheckMutexConfigs()V
    .locals 6

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isAlive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 106
    return-void

    .line 108
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v2

    if-nez v2, :cond_1

    .line 109
    return-void

    .line 112
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 113
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    sget-object v3, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    const/4 v2, 0x0

    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_2

    aget v1, v3, v2

    .line 114
    .local v1, "mutexItem":I
    invoke-static {v1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 115
    const/4 v2, 0x2

    invoke-direct {p0, v1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    .line 119
    .end local v1    # "mutexItem":I
    :cond_2
    return-void

    .line 113
    .restart local v1    # "mutexItem":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public registerProtocol()V
    .locals 2

    .prologue
    .line 71
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 72
    return-void
.end method

.method public restoreAllMutexElement(Ljava/lang/String;)V
    .locals 6
    .param p1, "trigger"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 844
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    if-nez v3, :cond_0

    .line 845
    return-void

    .line 847
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    array-length v3, v3

    new-array v2, v3, [I

    .line 848
    .local v2, "updateTypes":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 849
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    aget v3, v3, v1

    sparse-switch v3, :sswitch_data_0

    .line 876
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "unknown mutex element"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 851
    :sswitch_0
    invoke-direct {p0, v5, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFlash(Ljava/lang/String;Z)V

    .line 852
    const/16 v3, 0xa

    aput v3, v2, v1

    .line 848
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 855
    :sswitch_1
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentHdr(Z)V

    .line 856
    const/16 v3, 0xb

    aput v3, v2, v1

    goto :goto_1

    .line 859
    :sswitch_2
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFilter(Z)V

    .line 860
    const/4 v3, 0x2

    aput v3, v2, v1

    goto :goto_1

    .line 864
    :sswitch_3
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateBeauty(Z)V

    .line 865
    const/16 v3, 0xd

    aput v3, v2, v1

    goto :goto_1

    .line 868
    :sswitch_4
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateAiScene(Z)V

    .line 869
    const/16 v3, 0x24

    aput v3, v2, v1

    goto :goto_1

    .line 872
    :sswitch_5
    invoke-direct {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateBokeh(Z)V

    .line 873
    const/16 v3, 0x25

    aput v3, v2, v1

    goto :goto_1

    .line 879
    :cond_1
    iput-object v5, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    .line 880
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 881
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 882
    return-void

    .line 849
    nop

    :sswitch_data_0
    .sparse-switch
        0xc1 -> :sswitch_0
        0xc2 -> :sswitch_1
        0xc4 -> :sswitch_2
        0xc8 -> :sswitch_5
        0xc9 -> :sswitch_4
        0xef -> :sswitch_3
    .end sparse-switch
.end method

.method public showFilter()V
    .locals 4

    .prologue
    .line 246
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 247
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_0

    .line 248
    return-void

    .line 251
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 252
    const/16 v3, 0xa2

    .line 251
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 253
    .local v1, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilter()V

    .line 255
    const v2, 0x7f0a009c

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xfb

    if-ne v2, v3, :cond_1

    .line 256
    const/4 v2, 0x7

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 258
    :cond_1
    return-void
.end method

.method public showSetting()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 213
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 214
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const-class v3, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 215
    const-string/jumbo v2, "from_where"

    .line 216
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v3

    .line 215
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 218
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    .line 220
    .local v1, "intentType":I
    if-ne v1, v5, :cond_0

    .line 221
    const-string/jumbo v2, "IsCaptureIntent"

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 224
    :cond_0
    const-string/jumbo v2, ":miui:starting_window_label"

    .line 225
    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v3}, Lcom/android/camera/ActivityBase;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0039

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 224
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 228
    const-string/jumbo v2, "StartActivityWhenLocked"

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 230
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v2, v0}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 231
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->setJumpFlag(I)V

    .line 233
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGotoSettings()V

    .line 234
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 77
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 78
    return-void
.end method
