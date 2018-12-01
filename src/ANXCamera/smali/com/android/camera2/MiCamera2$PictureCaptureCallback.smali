.class Lcom/android/camera2/MiCamera2$PictureCaptureCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/MiCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PictureCaptureCallback"
.end annotation


# instance fields
.field private mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field private mCurrentAEState:Ljava/lang/Integer;

.field private mCurrentColorTemperature:I

.field private volatile mLastAsdEnabled:Z

.field private volatile mLastAsdMode:I

.field private volatile mLastFaceNum:I

.field private volatile mLastHdrMode:I

.field private mLastResultAFState:I

.field private mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field private mState:I

.field private mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 2989
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 2975
    iput v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    .line 2979
    iput v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    .line 2984
    iput v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastAsdMode:I

    .line 2985
    iput v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastHdrMode:I

    .line 2986
    iput-boolean v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastAsdEnabled:Z

    .line 2987
    iput v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastFaceNum:I

    .line 2990
    return-void
.end method

.method private isAutoFocusing(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "afState"    # Ljava/lang/Integer;

    .prologue
    .line 3243
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 3249
    :pswitch_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 3246
    :pswitch_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 3243
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "afState"    # Ljava/lang/Integer;

    .prologue
    .line 3229
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 3239
    :pswitch_0
    const/4 v0, 0x0

    return-object v0

    .line 3232
    :pswitch_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 3236
    :pswitch_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 3229
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private process(Landroid/hardware/camera2/CaptureResult;)V
    .locals 14
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 3035
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get7(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    .line 3036
    :try_start_0
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v6, v9, Lcom/android/camera2/MiCamera2;->mFaceCallback:Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;

    .line 3037
    .local v6, "localFaceCallback":Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v7, v9, Lcom/android/camera2/MiCamera2;->mHDRCheckerCallback:Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;

    .line 3039
    .local v7, "localHDRCallback":Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get12(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 3040
    sget-object v9, Lcom/android/camera/constant/MiCaptureResult;->VIDEO_RECORD_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 3041
    .local v8, "state":Ljava/lang/Integer;
    if-eqz v8, :cond_0

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v11, 0x2

    if-ne v11, v9, :cond_0

    .line 3042
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get12(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;->onVideoRecordStopped()V

    .line 3043
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v11, 0x0

    invoke-static {v9, v11}, Lcom/android/camera2/MiCamera2;->-set4(Lcom/android/camera2/MiCamera2;Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v8    # "state":Ljava/lang/Integer;
    :cond_0
    monitor-exit v10

    .line 3048
    if-eqz v6, :cond_1

    .line 3049
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/hardware/camera2/params/Face;

    .line 3050
    .local v3, "faces":[Landroid/hardware/camera2/params/Face;
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9, p1}, Lcom/android/camera2/MiCamera2;->-wrap7(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureResult;)V

    .line 3051
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get4(Lcom/android/camera2/MiCamera2;)Lcom/android/camera/effect/FaceAnalyzeInfo;

    move-result-object v9

    iget-object v10, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-interface {v6, v3, v9, v10}, Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;->onFaceDetected([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;Lcom/android/camera2/Camera2Proxy;)V

    .line 3053
    .end local v3    # "faces":[Landroid/hardware/camera2/params/Face;
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->processAfResult(Landroid/hardware/camera2/CaptureResult;)V

    .line 3055
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getAWBFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AWBFrameControl;

    move-result-object v2

    .line 3056
    .local v2, "awb":Lcom/android/camera2/AWBFrameControl;
    if-eqz v2, :cond_2

    .line 3057
    invoke-virtual {v2}, Lcom/android/camera2/AWBFrameControl;->getColorTemperature()I

    move-result v9

    iput v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mCurrentColorTemperature:I

    .line 3060
    :cond_2
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    iput-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mCurrentAEState:Ljava/lang/Integer;

    .line 3062
    iget v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    packed-switch v9, :pswitch_data_0

    .line 3148
    :cond_3
    :goto_0
    :pswitch_0
    return-void

    .line 3035
    .end local v2    # "awb":Lcom/android/camera2/AWBFrameControl;
    .end local v6    # "localFaceCallback":Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
    .end local v7    # "localHDRCallback":Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
    :catchall_0
    move-exception v9

    monitor-exit v10

    throw v9

    .line 3064
    .restart local v2    # "awb":Lcom/android/camera2/AWBFrameControl;
    .restart local v6    # "localFaceCallback":Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
    .restart local v7    # "localHDRCallback":Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
    :pswitch_1
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v9, v9, Lcom/android/camera2/MiCamera2;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    if-eqz v9, :cond_4

    .line 3065
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v9, v9, Lcom/android/camera2/MiCamera2;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    invoke-interface {v9, p1}, Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;->onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V

    .line 3068
    :cond_4
    if-eqz v7, :cond_3

    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get3(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/CameraConfigs;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera2/CameraConfigs;->isHDRCheckerEnabled()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 3069
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getHDRDetectedScene(Landroid/hardware/camera2/CaptureResult;)I

    move-result v5

    .line 3071
    .local v5, "hdrMode":I
    const/4 v9, 0x1

    if-ne v5, v9, :cond_5

    const/4 v9, 0x1

    :goto_1
    invoke-interface {v7, v9}, Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;->onHDRSceneChanged(Z)V

    goto :goto_0

    :cond_5
    const/4 v9, 0x0

    goto :goto_1

    .line 3081
    .end local v5    # "hdrMode":I
    :pswitch_2
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 3082
    .local v1, "afState":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x4

    if-eq v10, v9, :cond_6

    .line 3083
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x5

    if-ne v10, v9, :cond_9

    .line 3088
    :cond_6
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get6(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v10

    invoke-virtual {v10}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v10

    if-eq v9, v10, :cond_7

    .line 3089
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get6(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    if-nez v9, :cond_3

    .line 3095
    :cond_7
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get5(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;

    move-result-object v9

    if-eqz v9, :cond_8

    .line 3096
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get5(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeMessages(I)V

    .line 3098
    :cond_8
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-wrap6(Lcom/android/camera2/MiCamera2;)V

    goto :goto_0

    .line 3084
    :cond_9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x2

    if-eq v10, v9, :cond_6

    .line 3085
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x6

    if-eq v10, v9, :cond_6

    .line 3086
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get6(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v10

    invoke-virtual {v10}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v10

    if-ne v9, v10, :cond_a

    .line 3087
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eqz v9, :cond_6

    .line 3102
    :cond_a
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get6(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v10

    invoke-virtual {v10}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v10

    if-ne v9, v10, :cond_3

    .line 3103
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/android/camera2/MiCamera2;->-set1(Lcom/android/camera2/MiCamera2;I)I

    goto/16 :goto_0

    .line 3109
    .end local v1    # "afState":Ljava/lang/Integer;
    :pswitch_3
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3110
    .local v0, "aeState":Ljava/lang/Integer;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x3

    if-ne v9, v10, :cond_3

    .line 3111
    :cond_b
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get1(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->showAutoFocusFinish(Z)V

    .line 3112
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-wrap1(Lcom/android/camera2/MiCamera2;)J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-lez v9, :cond_c

    .line 3113
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-wrap8(Lcom/android/camera2/MiCamera2;)V

    goto/16 :goto_0

    .line 3115
    :cond_c
    const/4 v9, 0x6

    invoke-virtual {p0, v9}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3116
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-wrap4(Lcom/android/camera2/MiCamera2;)V

    goto/16 :goto_0

    .line 3124
    .end local v0    # "aeState":Ljava/lang/Integer;
    :pswitch_4
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3125
    .restart local v0    # "aeState":Ljava/lang/Integer;
    if-eqz v0, :cond_d

    .line 3126
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x5

    if-ne v9, v10, :cond_f

    .line 3129
    :cond_d
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get9(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v10

    invoke-virtual {v10}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v10

    if-eq v9, v10, :cond_e

    .line 3130
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get9(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    if-nez v9, :cond_3

    .line 3131
    :cond_e
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/android/camera2/MiCamera2;->lockExposure(Z)V

    goto/16 :goto_0

    .line 3127
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x4

    if-eq v9, v10, :cond_d

    .line 3128
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x2

    if-eq v9, v10, :cond_d

    .line 3133
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-get9(Lcom/android/camera2/MiCamera2;)I

    move-result v9

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v10

    invoke-virtual {v10}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v10

    if-ne v9, v10, :cond_3

    .line 3134
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/android/camera2/MiCamera2;->-set3(Lcom/android/camera2/MiCamera2;I)I

    goto/16 :goto_0

    .line 3140
    .end local v0    # "aeState":Ljava/lang/Integer;
    :pswitch_5
    sget-object v9, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 3141
    .local v4, "flashState":Ljava/lang/Integer;
    if-eqz v4, :cond_10

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_3

    .line 3142
    :cond_10
    const/4 v9, 0x6

    invoke-virtual {p0, v9}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3143
    iget-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v9}, Lcom/android/camera2/MiCamera2;->-wrap4(Lcom/android/camera2/MiCamera2;)V

    goto/16 :goto_0

    .line 3062
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method private processAfResult(Landroid/hardware/camera2/CaptureResult;)V
    .locals 12
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 3151
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3152
    .local v0, "afState":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 3153
    return-void

    .line 3157
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get7(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 3158
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v1, v3, Lcom/android/camera2/MiCamera2;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v1, "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    monitor-exit v4

    .line 3161
    if-nez v1, :cond_1

    .line 3162
    return-void

    .line 3157
    .end local v1    # "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 3165
    .restart local v1    # "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    if-ne v3, v4, :cond_2

    .line 3166
    return-void

    .line 3169
    :cond_2
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v5, "afState changed from %d to %d"

    new-array v6, v11, [Ljava/lang/Object;

    .line 3170
    iget v7, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    .line 3169
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3172
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    .line 3173
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-nez v3, :cond_5

    .line 3174
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isAutoFocusing(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 3175
    invoke-static {v11}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3176
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v1, v3}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3200
    :cond_3
    :goto_0
    return-void

    .line 3178
    :cond_4
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v2

    .line 3179
    .local v2, "focusResult":Ljava/lang/Boolean;
    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-eqz v3, :cond_3

    .line 3180
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3181
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v1, v3}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3182
    iput-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    goto :goto_0

    .line 3188
    .end local v2    # "focusResult":Ljava/lang/Boolean;
    :cond_5
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-eqz v3, :cond_6

    .line 3189
    iput-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3190
    return-void

    .line 3192
    :cond_6
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v2

    .line 3193
    .restart local v2    # "focusResult":Ljava/lang/Boolean;
    if-eqz v2, :cond_3

    .line 3194
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3195
    iget-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v1, v3}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3196
    iput-object v9, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3197
    invoke-virtual {p0, v10}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    goto :goto_0
.end method


# virtual methods
.method public getCurrentAEState()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 3003
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mCurrentAEState:Ljava/lang/Integer;

    return-object v0
.end method

.method public getCurrentColorTemperature()I
    .locals 1

    .prologue
    .line 3007
    iget v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mCurrentColorTemperature:I

    return v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 2999
    iget v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    return v0
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 3025
    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    if-nez v0, :cond_0

    .line 3026
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onCaptureCompleted Sequence: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getSequenceId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3027
    const-string/jumbo v2, " first frame received"

    .line 3026
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3029
    :cond_0
    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 3030
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "partialResult"    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 3018
    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 3019
    return-void
.end method

.method public setFocusTask(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 0
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;

    .prologue
    .line 3011
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3012
    return-void
.end method

.method public setState(I)V
    .locals 3
    .param p1, "state"    # I

    .prologue
    .line 2993
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2994
    iput p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    .line 2995
    return-void
.end method

.method public showAutoFocusFinish(Z)V
    .locals 4
    .param p1, "success"    # Z

    .prologue
    const/4 v3, 0x0

    .line 3214
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-nez v1, :cond_0

    .line 3215
    return-void

    .line 3218
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->-get7(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 3219
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, v1, Lcom/android/camera2/MiCamera2;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v0, "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    monitor-exit v2

    .line 3221
    if-eqz v0, :cond_1

    .line 3222
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {v1, p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3223
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, v1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3224
    iput-object v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3226
    :cond_1
    return-void

    .line 3218
    .end local v0    # "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public showAutoFocusStart()V
    .locals 3

    .prologue
    .line 3204
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->-get7(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 3205
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, v1, Lcom/android/camera2/MiCamera2;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v0, "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    monitor-exit v2

    .line 3207
    if-eqz v0, :cond_0

    .line 3208
    const/4 v1, 0x3

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3209
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, v1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3211
    :cond_0
    return-void

    .line 3204
    .end local v0    # "focusCallback":Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
