.class public Lcom/android/camera/module/loader/FunctionModuleSetup;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionModuleSetup.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/module/loader/Func1Base",
        "<",
        "Lcom/android/camera/module/BaseModule;",
        "Lcom/android/camera/module/BaseModule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "currentMode"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    .line 30
    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 9
    .param p1    # Lcom/android/camera/module/loader/NullHolder;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "baseModuleNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;"
    const/16 v8, 0xe1

    const/4 v7, 0x3

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 43
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v4

    if-nez v4, :cond_0

    .line 44
    return-object p1

    .line 47
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 49
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 50
    invoke-static {v0, v8}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v4

    return-object v4

    .line 53
    :cond_1
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/EffectController;->reset()V

    .line 56
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    .line 58
    .local v1, "cameraActivity":Lcom/android/camera/Camera;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 59
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    .line 61
    .local v3, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    iget v4, p0, Lcom/android/camera/module/loader/FunctionModuleSetup;->mTargetMode:I

    packed-switch v4, :pswitch_data_0

    .line 128
    :cond_2
    :goto_0
    :pswitch_0
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 129
    :cond_3
    invoke-static {v0, v8}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v4

    return-object v4

    .line 66
    :pswitch_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/android/camera/Camera;->isNewBieAlive(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 67
    return-object p1

    .line 69
    :cond_4
    const-string/jumbo v4, "pref_camera_first_ai_scene_use_hint_shown_key"

    invoke-virtual {v2, v4, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 70
    invoke-static {}, Lcom/android/camera/Device;->isSupportAiScene()Z

    move-result v4

    .line 69
    if-eqz v4, :cond_2

    .line 72
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/android/camera/Camera;->showNewBie(I)Z

    .line 73
    return-object p1

    .line 77
    :pswitch_2
    const-string/jumbo v4, "pref_camera_manual_mode_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    goto :goto_0

    .line 82
    :pswitch_3
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v4

    if-nez v4, :cond_5

    .line 83
    const-string/jumbo v4, "pref_camera_portrait_mode_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 88
    :goto_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/android/camera/Camera;->isNewBieAlive(I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 89
    return-object p1

    .line 85
    :cond_5
    const-string/jumbo v4, "pref_camera_portrait_mode_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto :goto_1

    .line 91
    :cond_6
    const-string/jumbo v4, "pref_camera_first_portrait_use_hint_shown_key"

    invoke-virtual {v2, v4, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 93
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/android/camera/Camera;->showNewBie(I)Z

    .line 94
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    .line 96
    const-string/jumbo v5, "pref_camera_first_portrait_use_hint_shown_key"

    .line 94
    invoke-interface {v4, v5, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 99
    return-object p1

    .line 103
    :pswitch_4
    const-string/jumbo v4, "pref_video_speed_fast_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 104
    const-string/jumbo v4, "pref_video_speed_slow_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 105
    const-string/jumbo v4, "pref_video_speed_hfr_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 108
    :pswitch_5
    const-string/jumbo v4, "pref_video_speed_fast_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 109
    const-string/jumbo v4, "pref_video_speed_slow_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 110
    const-string/jumbo v4, "pref_video_speed_hfr_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 113
    :pswitch_6
    const-string/jumbo v4, "pref_video_speed_fast_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 114
    const-string/jumbo v4, "pref_video_speed_slow_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 115
    const-string/jumbo v4, "pref_video_speed_hfr_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 118
    :pswitch_7
    const-string/jumbo v4, "pref_video_speed_fast_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 119
    const-string/jumbo v4, "pref_video_speed_slow_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 120
    const-string/jumbo v4, "pref_video_speed_hfr_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 123
    :pswitch_8
    const-string/jumbo v4, "pref_camera_square_mode_key"

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 132
    :cond_7
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/android/camera/module/BaseModule;->setCameraDevice(Lcom/android/camera2/Camera2Proxy;)V

    .line 133
    iget v4, p0, Lcom/android/camera/module/loader/FunctionModuleSetup;->mTargetMode:I

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 135
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 136
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 137
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 140
    :cond_8
    return-object p1

    .line 61
    nop

    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_2
        :pswitch_6
        :pswitch_5
        :pswitch_7
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionModuleSetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method
