.class final Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JpegQuickPictureCallback"
.end annotation


# instance fields
.field mDropped:Z

.field mLocation:Landroid/location/Location;

.field mPressDownTitle:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;Landroid/location/Location;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;
    .param p2, "loc"    # Landroid/location/Location;

    .prologue
    .line 1179
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1180
    iput-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    .line 1181
    return-void
.end method

.method private getBurstShotTitle()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 1184
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get16(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1185
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 1186
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mPressDownTitle:Ljava/lang/String;

    .line 1187
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2, v4}, Lcom/android/camera/module/Camera2Module;->-set3(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)Ljava/lang/String;

    .line 1189
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1190
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1191
    .local v0, "currentTime":J
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/module/Camera2Module;->-set3(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)Ljava/lang/String;

    .line 1192
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x13

    if-eq v2, v3, :cond_1

    .line 1193
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    const-wide/16 v4, 0x3e8

    add-long/2addr v4, v0

    invoke-static {v4, v5}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/module/Camera2Module;->-set3(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)Ljava/lang/String;

    .line 1196
    .end local v0    # "currentTime":J
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1197
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1198
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "_UBIFOCUS_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1196
    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1199
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "_BURST"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public onPictureBurstFinished(Z)V
    .locals 1
    .param p1, "success"    # Z

    .prologue
    .line 1309
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap15(Lcom/android/camera/module/Camera2Module;)V

    .line 1310
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get1(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object v0

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 1311
    return-void
.end method

.method public onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V
    .locals 19
    .param p1, "jpegData"    # [B
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 1203
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v2, v2, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v2, :cond_0

    .line 1204
    if-nez p1, :cond_1

    .line 1207
    :cond_0
    return-void

    .line 1205
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1206
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get10(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 1203
    if-nez v2, :cond_0

    .line 1210
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get11(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    .line 1212
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-wrap0(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1213
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get3(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onShutter()V

    .line 1216
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1217
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mPressDownTitle:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/storage/ImageSaver;->updateImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 1221
    :cond_3
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1222
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get10(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1223
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 1224
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_5

    const/4 v2, 0x1

    :goto_0
    const/4 v6, 0x1

    invoke-virtual {v3, v4, v6, v2}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZ)V

    .line 1225
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-wrap15(Lcom/android/camera/module/Camera2Module;)V

    .line 1227
    :cond_4
    return-void

    .line 1224
    :cond_5
    const/4 v2, 0x0

    goto :goto_0

    .line 1231
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Lcom/android/camera/module/Camera2Module;->-set11(Lcom/android/camera/module/Camera2Module;I)I

    .line 1233
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v2

    if-nez v2, :cond_15

    .line 1234
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Lcom/android/camera/module/Camera2Module;->-set12(Lcom/android/camera/module/Camera2Module;I)I

    .line 1235
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_7

    .line 1236
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/android/camera/module/Camera2Module;->playSound(I)V

    .line 1239
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get1(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get14(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1241
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1242
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-gt v2, v3, :cond_b

    const/4 v14, 0x1

    .line 1243
    .local v14, "isHide":Z
    :goto_1
    if-eqz v14, :cond_d

    const/4 v13, 0x0

    .line 1245
    .local v13, "orientation":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get6(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    add-int/2addr v2, v13

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_e

    .line 1246
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get9(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v10

    .line 1247
    .local v10, "width":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get9(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v11

    .line 1253
    .local v11, "height":I
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v5

    .line 1254
    .local v5, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 1255
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_f

    const/4 v15, 0x1

    .line 1257
    .local v15, "isMap":Z
    :goto_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_11

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-ne v2, v3, :cond_11

    const/4 v2, 0x1

    :goto_5
    if-nez v2, :cond_8

    .line 1259
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_12

    .line 1260
    const/16 v18, 0x4

    .line 1269
    .local v18, "saveType":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    .line 1271
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    move/from16 v0, v18

    invoke-static {v3, v0}, Lcom/android/camera/module/Camera2Module;->-wrap1(Lcom/android/camera/module/Camera2Module;I)Z

    move-result v4

    .line 1273
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 1275
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mLocation:Landroid/location/Location;

    .line 1274
    const/4 v8, 0x0

    .line 1278
    const/4 v12, 0x0

    .line 1282
    const/16 v16, 0x1

    .line 1283
    const/16 v17, 0x0

    move-object/from16 v3, p1

    .line 1269
    invoke-virtual/range {v2 .. v17}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZ)V

    .line 1284
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    .line 1296
    .end local v5    # "title":Ljava/lang/String;
    .end local v10    # "width":I
    .end local v11    # "height":I
    .end local v13    # "orientation":I
    .end local v14    # "isHide":Z
    .end local v15    # "isMap":Z
    .end local v18    # "saveType":I
    :cond_8
    :goto_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-ge v2, v3, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get11(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1297
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-wrap15(Lcom/android/camera/module/Camera2Module;)V

    .line 1300
    :cond_a
    return-void

    .line 1242
    :cond_b
    const/4 v14, 0x0

    .restart local v14    # "isHide":Z
    goto/16 :goto_1

    .line 1241
    .end local v14    # "isHide":Z
    :cond_c
    const/4 v14, 0x0

    .restart local v14    # "isHide":Z
    goto/16 :goto_1

    .line 1243
    :cond_d
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v13

    .restart local v13    # "orientation":I
    goto/16 :goto_2

    .line 1249
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get9(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v10

    .line 1250
    .restart local v10    # "width":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get9(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v11

    .restart local v11    # "height":I
    goto/16 :goto_3

    .line 1255
    .restart local v5    # "title":Ljava/lang/String;
    :cond_f
    const/4 v15, 0x0

    .restart local v15    # "isMap":Z
    goto/16 :goto_4

    .line 1254
    .end local v15    # "isMap":Z
    :cond_10
    const/4 v15, 0x0

    .restart local v15    # "isMap":Z
    goto/16 :goto_4

    .line 1257
    :cond_11
    const/4 v2, 0x0

    goto/16 :goto_5

    .line 1261
    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-eq v2, v3, :cond_13

    .line 1262
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get11(Lcom/android/camera/module/Camera2Module;)Z

    move-result v2

    .line 1261
    if-nez v2, :cond_13

    .line 1263
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    .line 1261
    if-eqz v2, :cond_14

    .line 1264
    :cond_13
    const/16 v18, 0x6

    .restart local v18    # "saveType":I
    goto/16 :goto_6

    .line 1266
    .end local v18    # "saveType":I
    :cond_14
    const/16 v18, 0x5

    .restart local v18    # "saveType":I
    goto/16 :goto_6

    .line 1287
    .end local v5    # "title":Ljava/lang/String;
    .end local v10    # "width":I
    .end local v11    # "height":I
    .end local v13    # "orientation":I
    .end local v14    # "isHide":Z
    .end local v15    # "isMap":Z
    .end local v18    # "saveType":I
    :cond_15
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CaptureBurst queue full and drop "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1288
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->mDropped:Z

    .line 1290
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get13(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get15(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    if-lt v2, v3, :cond_8

    .line 1291
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    goto/16 :goto_7
.end method

.method public onPictureTakenFailed()V
    .locals 0

    .prologue
    .line 1305
    return-void
.end method
