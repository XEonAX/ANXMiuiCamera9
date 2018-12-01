.class public Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;
.super Ljava/lang/Object;
.source "ManuallyValueChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->TAG:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0
    .param p1, "activityBase"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 41
    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;
    .locals 1
    .param p0, "activityBase"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 36
    new-instance v0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method


# virtual methods
.method public getBaseModule()Lcom/android/camera/module/BaseModule;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    return-object v0
.end method

.method public onDualLensSwitch(Lcom/android/camera/data/data/config/ComponentManuallyDualLens;I)V
    .locals 6
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
    .param p2, "module"    # I

    .prologue
    const/4 v5, 0x1

    .line 146
    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "currentValue":Ljava/lang/String;
    const-string/jumbo v2, "wide"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    const-string/jumbo v1, "tele"

    .line 149
    .local v1, "newValue":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1, p2, v1}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->setComponentValue(ILjava/lang/String;)V

    .line 151
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLensChanged(Ljava/lang/String;)V

    .line 155
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {p2}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 156
    const/4 v4, 0x5

    .line 155
    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 159
    return-void

    .line 148
    .end local v1    # "newValue":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, "wide"

    .restart local v1    # "newValue":Ljava/lang/String;
    goto :goto_0
.end method

.method public onDualLensZooming(Z)V
    .locals 3
    .param p1, "start"    # Z

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 133
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    return-void

    .line 136
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 137
    return-void

    .line 139
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActualCameraId()I

    move-result v1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMuxCameraId()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 140
    invoke-virtual {v0, p1}, Lcom/android/camera/module/BaseModule;->notifyZooming(Z)V

    .line 142
    :cond_2
    return-void
.end method

.method public onDualZoomHappened(Z)V
    .locals 3
    .param p1, "isTo2X"    # Z

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 119
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 120
    return-void

    .line 122
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 123
    return-void

    .line 125
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActualCameraId()I

    move-result v1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMuxCameraId()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 126
    invoke-virtual {v0, p1}, Lcom/android/camera/module/BaseModule;->notifyDualZoom(Z)V

    .line 128
    :cond_2
    return-void
.end method

.method public onDualZoomValueChanged(FZ)V
    .locals 1
    .param p1, "newValueRatio"    # F
    .param p2, "sync"    # Z

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 164
    return-void

    .line 166
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/BaseModule;->onZoomRatioChanged(FZ)V

    .line 167
    return-void
.end method

.method public onETValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyET;Ljava/lang/String;)V
    .locals 3
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyET;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackExposureTimeChanged(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 106
    const/16 v1, 0x10

    .line 107
    const/16 v2, 0x14

    .line 105
    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 108
    return-void
.end method

.method public onFocusValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyFocus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyFocus;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0xc7

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 71
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "currentFocusMode":Ljava/lang/String;
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "targetFocusMode":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 77
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->setFocusModeSwitching(Z)V

    .line 79
    const/16 v4, 0xa7

    invoke-virtual {p1, v4}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 82
    .local v1, "switchMode":Z
    invoke-static {}, Lcom/android/camera/Device;->isSupportedPeakingMF()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xac

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 85
    .local v3, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    if-eqz v1, :cond_1

    .line 86
    invoke-interface {v3, v8}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeConfigItem(I)V

    .line 87
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    .line 98
    .end local v1    # "switchMode":Z
    .end local v3    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v4

    new-array v5, v6, [I

    const/16 v6, 0xe

    aput v6, v5, v7

    invoke-virtual {v4, v5}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 99
    return-void

    .line 89
    .restart local v1    # "switchMode":Z
    .restart local v3    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :cond_1
    invoke-interface {v3, v8}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->insertConfigItem(I)V

    .line 90
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v4

    .line 91
    const-string/jumbo v5, "pref_camera_peak_key"

    .line 90
    invoke-virtual {v4, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    goto :goto_0
.end method

.method public onISOValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyISO;Ljava/lang/String;)V
    .locals 4
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyISO;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackIsoChanged(Ljava/lang/String;)V

    .line 113
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/16 v2, 0xf

    const/4 v3, 0x0

    aput v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 114
    return-void
.end method

.method public onWBValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyWB;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyWB;
    .param p2, "newValue"    # Ljava/lang/String;
    .param p3, "isCustomValue"    # Z

    .prologue
    .line 62
    if-eqz p3, :cond_1

    const-string/jumbo v0, "pref_qc_manual_whitebalance_k_value_key"

    .line 64
    .local v0, "key":Ljava/lang/String;
    :goto_0
    if-eqz p3, :cond_0

    const-string/jumbo p2, "manual"

    .end local p2    # "newValue":Ljava/lang/String;
    :cond_0
    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackAwbChanged(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x6

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 67
    return-void

    .line 63
    .end local v0    # "key":Ljava/lang/String;
    .restart local p2    # "newValue":Ljava/lang/String;
    :cond_1
    const/16 v1, 0xa7

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getKey(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "key":Ljava/lang/String;
    goto :goto_0
.end method

.method public registerProtocol()V
    .locals 2

    .prologue
    .line 49
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 50
    const/16 v1, 0xae

    .line 49
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 51
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 55
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 56
    const/16 v1, 0xae

    .line 55
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 57
    return-void
.end method
