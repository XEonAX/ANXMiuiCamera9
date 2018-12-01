.class public Lcom/android/camera/data/data/global/DataItemGlobal;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemGlobal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/data/global/DataItemGlobal$IntentType;
    }
.end annotation


# instance fields
.field private mIntentType:I

.field private mIsTimeOut:Ljava/lang/Boolean;

.field private mLastCameraId:I

.field private mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

.field private mRetriedIfCameraError:Z

.field private mStartFromKeyguard:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    .line 85
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    .line 86
    new-instance v0, Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/global/ComponentModuleList;-><init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    .line 87
    return-void
.end method

.method private determineTimeOut()Z
    .locals 8

    .prologue
    .line 247
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 249
    .local v0, "currentTime":J
    const-string/jumbo v3, "pref_camera_open_time"

    invoke-virtual {p0, v3, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long v4, v0, v4

    const-wide/16 v6, 0x7530

    cmp-long v3, v4, v6

    if-gtz v3, :cond_1

    .line 250
    iget-object v3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    if-nez v3, :cond_2

    const/4 v2, 0x1

    .line 252
    .local v2, "timeOut":Z
    :goto_0
    if-eqz v2, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->retainCameraMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 253
    const/4 v2, 0x0

    .line 256
    :cond_0
    return v2

    .line 249
    .end local v2    # "timeOut":Z
    :cond_1
    const/4 v2, 0x1

    .restart local v2    # "timeOut":Z
    goto :goto_0

    .line 250
    .end local v2    # "timeOut":Z
    :cond_2
    const/4 v2, 0x0

    .restart local v2    # "timeOut":Z
    goto :goto_0
.end method

.method private getCurrentCameraId(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x0

    .line 108
    packed-switch p1, :pswitch_data_0

    .line 120
    :pswitch_0
    const-string/jumbo v0, "pref_camera_id_key"

    .line 121
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 120
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 110
    :pswitch_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    const-string/jumbo v0, "pref_camera_id_key"

    .line 112
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 111
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 114
    :cond_0
    return v1

    .line 118
    :pswitch_2
    return v1

    .line 108
    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getCurrentMode(I)I
    .locals 3
    .param p1, "intentType"    # I

    .prologue
    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "pref_camera_mode_key_intent_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 161
    .local v0, "mode":I
    return v0
.end method

.method private getDefaultCameraId(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 132
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getCTACanCollect()Z
    .locals 2

    .prologue
    .line 202
    const-string/jumbo v0, "can_connect_network"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    return-object v0
.end method

.method public getCurrentCameraId()I
    .locals 1

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    return v0
.end method

.method public getCurrentMode()I
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result v0

    return v0
.end method

.method public getDataBackUpKey(I)I
    .locals 2
    .param p1, "mCurrentMode"    # I

    .prologue
    .line 381
    iget v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    add-int/lit8 v1, v1, 0x2

    shl-int/lit8 v1, v1, 0x8

    or-int v0, v1, p1

    .line 382
    .local v0, "result":I
    iget-boolean v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    if-eqz v1, :cond_0

    .line 383
    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    .line 385
    :cond_0
    return v0
.end method

.method public getDefaultMode(I)I
    .locals 1
    .param p1, "intentType"    # I

    .prologue
    const/16 v0, 0xa3

    .line 223
    packed-switch p1, :pswitch_data_0

    .line 233
    return v0

    .line 227
    :pswitch_0
    return v0

    .line 230
    :pswitch_1
    const/16 v0, 0xa2

    return v0

    .line 223
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getIntentType()I
    .locals 1

    .prologue
    .line 219
    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    return v0
.end method

.method public getLastCameraId()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    return v0
.end method

.method public isGlobalSwitchOn(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isIntentAction()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 214
    iget v1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isRetriedIfCameraError()Z
    .locals 1

    .prologue
    .line 389
    iget-boolean v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mRetriedIfCameraError:Z

    return v0
.end method

.method public isTimeOut()Z
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isTransient()Z
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    return v0
.end method

.method public parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZ)Landroid/support/v4/util/Pair;
    .locals 12
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "isFromVoiceControl"    # Ljava/lang/Boolean;
    .param p3, "startFromKeyguard"    # Z
    .param p4, "justFetch"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/Boolean;",
            "ZZ)",
            "Landroid/support/v4/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 269
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "action":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 271
    const-string/jumbo v0, "<unknown>"

    .line 275
    :cond_0
    const-string/jumbo v9, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 277
    const/4 v5, 0x1

    .line 336
    .local v5, "newIntentType":I
    :goto_0
    if-eqz v5, :cond_1

    .line 337
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/CameraIntentManager;->getCameraFacing()I

    move-result v3

    .line 338
    .local v3, "intentCameraId":I
    const/4 v9, -0x1

    if-eq v3, v9, :cond_1

    .line 339
    invoke-virtual {p0, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraIdTransient(I)V

    .line 343
    .end local v3    # "intentCameraId":I
    :cond_1
    if-nez v5, :cond_14

    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result v8

    .line 344
    :goto_1
    iget v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    if-ne v9, v5, :cond_2

    iget-boolean v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    if-eq v9, p3, :cond_15

    :cond_2
    const/4 v4, 0x1

    .line 346
    .local v4, "intentChanged":Z
    :goto_2
    if-eqz v4, :cond_16

    const-string/jumbo v9, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 347
    const/16 v7, 0xa3

    .line 348
    .local v7, "pendingOpenModule":I
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v6

    .line 362
    .local v6, "pendingOpenId":I
    :goto_3
    if-nez p4, :cond_5

    .line 363
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iput-object v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    .line 364
    if-eqz v4, :cond_3

    .line 365
    iput v5, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    .line 366
    iput-boolean p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    .line 367
    iget-object v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v10, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {v9, v10}, Lcom/android/camera/data/data/global/ComponentModuleList;->setIntentType(I)V

    .line 369
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v9

    if-eq v7, v9, :cond_4

    .line 370
    invoke-virtual {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 371
    invoke-static {v7}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    .line 373
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v9

    if-eq v6, v9, :cond_5

    .line 374
    invoke-virtual {p0, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 377
    :cond_5
    new-instance v9, Landroid/support/v4/util/Pair;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v9

    .line 275
    .end local v4    # "intentChanged":Z
    .end local v5    # "newIntentType":I
    .end local v6    # "pendingOpenId":I
    .end local v7    # "pendingOpenModule":I
    :cond_6
    const-string/jumbo v9, "android.media.action.VIDEO_CAPTURE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 280
    const/4 v5, 0x2

    .line 281
    .restart local v5    # "newIntentType":I
    goto :goto_0

    .line 275
    .end local v5    # "newIntentType":I
    :cond_7
    const-string/jumbo v9, "com.android.camera.action.QR_CODE_CAPTURE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 284
    :cond_8
    const/4 v5, 0x3

    .line 285
    .restart local v5    # "newIntentType":I
    goto :goto_0

    .line 275
    .end local v5    # "newIntentType":I
    :cond_9
    const-string/jumbo v9, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    const-string/jumbo v9, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 289
    :cond_a
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-nez v9, :cond_c

    .line 290
    const/4 v5, 0x0

    .line 291
    .restart local v5    # "newIntentType":I
    goto/16 :goto_0

    .line 275
    .end local v5    # "newIntentType":I
    :cond_b
    const-string/jumbo v9, "android.media.action.VIDEO_CAMERA"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_a

    const-string/jumbo v9, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 294
    :cond_c
    const/4 v5, 0x0

    .line 295
    .restart local v5    # "newIntentType":I
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    .line 296
    .local v1, "cameraIntentManager":Lcom/android/camera/CameraIntentManager;
    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->getCameraModeId()I

    move-result v7

    .line 297
    .restart local v7    # "pendingOpenModule":I
    const/16 v9, 0xa0

    if-ne v7, v9, :cond_d

    .line 298
    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result v9

    if-eqz v9, :cond_10

    .line 299
    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result v7

    .line 306
    :cond_d
    :goto_4
    :try_start_0
    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isUseFrontCamera()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-eqz v9, :cond_11

    const/4 v6, 0x1

    .line 315
    .restart local v6    # "pendingOpenId":I
    :goto_5
    const-string/jumbo v9, "DataItemGlobal"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "intent from voice control assist : pendingOpenId = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 317
    const-string/jumbo v11, ";pendingOpenModule = "

    .line 315
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const/4 v9, 0x0

    .line 320
    iput v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    .line 321
    iput-boolean p3, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    .line 322
    iget-object v9, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v10, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {v9, v10}, Lcom/android/camera/data/data/global/ComponentModuleList;->setIntentType(I)V

    .line 323
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v9

    if-eq v7, v9, :cond_e

    .line 324
    invoke-virtual {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 325
    invoke-static {v7}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    .line 327
    :cond_e
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v9

    if-eq v6, v9, :cond_f

    .line 328
    invoke-virtual {p0, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 330
    :cond_f
    new-instance v9, Landroid/support/v4/util/Pair;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v9

    .line 301
    .end local v6    # "pendingOpenId":I
    :cond_10
    invoke-direct {p0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result v7

    goto :goto_4

    .line 306
    :cond_11
    const/4 v6, 0x0

    .restart local v6    # "pendingOpenId":I
    goto :goto_5

    .line 307
    .end local v6    # "pendingOpenId":I
    :catch_0
    move-exception v2

    .line 308
    .local v2, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->determineTimeOut()Z

    move-result v9

    if-eqz v9, :cond_12

    .line 309
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result v6

    .restart local v6    # "pendingOpenId":I
    goto :goto_5

    .line 311
    .end local v6    # "pendingOpenId":I
    :cond_12
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v6

    .restart local v6    # "pendingOpenId":I
    goto :goto_5

    .line 332
    .end local v1    # "cameraIntentManager":Lcom/android/camera/CameraIntentManager;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v5    # "newIntentType":I
    .end local v6    # "pendingOpenId":I
    .end local v7    # "pendingOpenModule":I
    :cond_13
    const/4 v5, 0x0

    .line 333
    .restart local v5    # "newIntentType":I
    goto/16 :goto_0

    .line 343
    :cond_14
    const/4 v8, 0x0

    .local v8, "timeOut":Z
    goto/16 :goto_1

    .line 344
    .end local v8    # "timeOut":Z
    :cond_15
    const/4 v4, 0x0

    .restart local v4    # "intentChanged":Z
    goto/16 :goto_2

    .line 349
    :cond_16
    if-eqz v4, :cond_17

    const-string/jumbo v9, "android.media.action.VIDEO_CAMERA"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_17

    .line 350
    const/16 v7, 0xa2

    .line 351
    .restart local v7    # "pendingOpenModule":I
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v6

    .restart local v6    # "pendingOpenId":I
    goto/16 :goto_3

    .line 353
    .end local v6    # "pendingOpenId":I
    .end local v7    # "pendingOpenModule":I
    :cond_17
    if-eqz v8, :cond_18

    .line 354
    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultMode(I)I

    move-result v7

    .line 355
    .restart local v7    # "pendingOpenModule":I
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDefaultCameraId(I)I

    move-result v6

    .restart local v6    # "pendingOpenId":I
    goto/16 :goto_3

    .line 357
    .end local v6    # "pendingOpenId":I
    .end local v7    # "pendingOpenModule":I
    :cond_18
    invoke-direct {p0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode(I)I

    move-result v7

    .line 358
    .restart local v7    # "pendingOpenModule":I
    invoke-direct {p0, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v6

    .restart local v6    # "pendingOpenId":I
    goto/16 :goto_3
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    const-string/jumbo v0, "camera_settings_global"

    return-object v0
.end method

.method public reInit()V
    .locals 6

    .prologue
    .line 181
    iget-object v2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->reInit()V

    .line 183
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 186
    .local v1, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    .line 187
    const-string/jumbo v2, "pref_camera_open_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v1, v2, v4, v5}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 190
    const-string/jumbo v2, "open_camera_fail_key"

    const-wide/16 v4, 0x0

    invoke-interface {v1, v2, v4, v5}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 193
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    .line 194
    .local v0, "currentCameraId":I
    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    .line 195
    const-string/jumbo v2, "pref_camera_id_key"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 198
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 199
    return-void
.end method

.method public resetAll()V
    .locals 3

    .prologue
    .line 397
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    .line 398
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 401
    const-string/jumbo v1, "pref_version_key"

    const/4 v2, 0x4

    .line 398
    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 403
    return-void
.end method

.method public resetTimeOut()V
    .locals 4

    .prologue
    .line 242
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIsTimeOut:Ljava/lang/Boolean;

    .line 243
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_open_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 244
    return-void
.end method

.method public setCTACanCollect(Z)V
    .locals 2
    .param p1, "bool"    # Z

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "can_connect_network"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 207
    return-void
.end method

.method public setCameraId(I)V
    .locals 3
    .param p1, "cameraId"    # I

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    .line 138
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_id_key"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 139
    return-void
.end method

.method public setCameraIdTransient(I)V
    .locals 2
    .param p1, "cameraId"    # I

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mLastCameraId:I

    .line 148
    const-string/jumbo v0, "pref_camera_id_key"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 150
    return-void
.end method

.method public setCurrentMode(I)V
    .locals 3
    .param p1, "newMode"    # I

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "pref_camera_mode_key_intent_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mIntentType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 166
    return-void
.end method

.method public setRetriedIfCameraError(Z)V
    .locals 0
    .param p1, "retriedIfCameraError"    # Z

    .prologue
    .line 393
    iput-boolean p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mRetriedIfCameraError:Z

    .line 394
    return-void
.end method

.method public setStartFromKeyguard(Z)V
    .locals 0
    .param p1, "mStartFromKeyguard"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lcom/android/camera/data/data/global/DataItemGlobal;->mStartFromKeyguard:Z

    .line 261
    return-void
.end method
