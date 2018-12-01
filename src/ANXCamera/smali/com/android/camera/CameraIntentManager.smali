.class public Lcom/android/camera/CameraIntentManager;
.super Ljava/lang/Object;
.source "CameraIntentManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/CameraIntentManager$CameraMode;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Intent;",
            "Lcom/android/camera/CameraIntentManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/CameraIntentManager;->TAG:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    .line 22
    return-void
.end method

.method private constructor <init>(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput-object p1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    .line 226
    return-void
.end method

.method public static checkCallerLegality(Landroid/app/Activity;)Z
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 414
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getCaller(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    .line 415
    .local v0, "caller":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 417
    return v4

    .line 419
    :cond_0
    const-string/jumbo v1, "com.google.android.googlequicksearchbox"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 424
    :cond_1
    const/4 v1, 0x1

    return v1

    .line 419
    :cond_2
    const-string/jumbo v1, "com.xiaomi.voiceassistant"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "com.miui.voiceassist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "com.miui.home"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 426
    sget-object v1, Lcom/android/camera/CameraIntentManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "checkCallerLegality: Unknown caller: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    return v4
.end method

.method public static getCaller(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 403
    if-nez p0, :cond_0

    .line 404
    return-object v1

    .line 406
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object v0

    .line 407
    .local v0, "referrer":Landroid/net/Uri;
    if-nez v0, :cond_1

    .line 408
    return-object v1

    .line 410
    :cond_1
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 200
    sget-object v1, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraIntentManager;

    .line 201
    .local v0, "instance":Lcom/android/camera/CameraIntentManager;
    if-nez v0, :cond_0

    .line 202
    new-instance v0, Lcom/android/camera/CameraIntentManager;

    .end local v0    # "instance":Lcom/android/camera/CameraIntentManager;
    invoke-direct {v0, p0}, Lcom/android/camera/CameraIntentManager;-><init>(Landroid/content/Intent;)V

    .line 203
    .restart local v0    # "instance":Lcom/android/camera/CameraIntentManager;
    sget-object v1, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    :cond_0
    return-object v0
.end method

.method public static removeAllInstance()V
    .locals 1

    .prologue
    .line 217
    sget-object v0, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 218
    return-void
.end method

.method public static removeInstance(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 213
    sget-object v0, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    .line 221
    sget-object v0, Lcom/android/camera/CameraIntentManager;->sMap:Ljava/util/WeakHashMap;

    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    return-void
.end method

.method public getCameraFacing()I
    .locals 3

    .prologue
    .line 443
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extras.CAMERA_FACING"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getCameraMode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 327
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.CAMERA_MODE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 328
    const-string/jumbo v1, "android.media.action.VIDEO_CAMERA"

    iget-object v2, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 329
    const-string/jumbo v1, "VIDEO"

    return-object v1

    .line 330
    :cond_0
    const-string/jumbo v1, "android.media.action.STILL_IMAGE_CAMERA"

    iget-object v2, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 331
    const-string/jumbo v1, "CAPTURE"

    return-object v1

    .line 333
    :cond_1
    const-string/jumbo v1, "UNSPECIFIED"

    return-object v1

    .line 336
    :cond_2
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.CAMERA_MODE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 337
    .local v0, "useMode":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 338
    :cond_3
    const-string/jumbo v1, "UNSPECIFIED"

    return-object v1

    .line 340
    :cond_4
    return-object v0
.end method

.method public getCameraModeId()I
    .locals 2

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/android/camera/CameraIntentManager;->getCameraMode()Ljava/lang/String;

    move-result-object v0

    .line 345
    .local v0, "useMode":Ljava/lang/String;
    const-string/jumbo v1, "CAPTURE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 347
    const/16 v1, 0xa3

    return v1

    .line 345
    :cond_0
    const-string/jumbo v1, "MANUAL_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 350
    :cond_1
    const/16 v1, 0xa7

    return v1

    .line 345
    :cond_2
    const-string/jumbo v1, "MANUAL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "PANORAMIC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 353
    :cond_3
    const/16 v1, 0xa6

    return v1

    .line 345
    :cond_4
    const-string/jumbo v1, "PANORAMA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "PORTRAIT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 355
    const/16 v1, 0xab

    return v1

    .line 345
    :cond_5
    const-string/jumbo v1, "SQUARE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 357
    const/16 v1, 0xa5

    return v1

    .line 345
    :cond_6
    const-string/jumbo v1, "SHORT_VIDEO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 359
    const/16 v1, 0xa1

    return v1

    .line 345
    :cond_7
    const-string/jumbo v1, "VIDEO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 361
    const/16 v1, 0xa2

    return v1

    .line 345
    :cond_8
    const-string/jumbo v1, "FAST_MOTION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 363
    const/16 v1, 0xa9

    return v1

    .line 345
    :cond_9
    const-string/jumbo v1, "SLOW_MOTION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 365
    const/16 v1, 0xa8

    return v1

    .line 367
    :cond_a
    const/16 v1, 0xa0

    return v1
.end method

.method public getExtraCropValue()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 261
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 262
    .local v0, "myExtras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 263
    const-string/jumbo v1, "crop"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 265
    :cond_0
    return-object v2
.end method

.method public getExtraSavedUri()Landroid/net/Uri;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 253
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 254
    .local v0, "myExtras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 255
    const-string/jumbo v1, "output"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    return-object v1

    .line 257
    :cond_0
    return-object v2
.end method

.method public getExtraShouldSaveCapture()Ljava/lang/Boolean;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 294
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 295
    .local v0, "myExtras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 296
    const-string/jumbo v1, "save-image"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 298
    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method public getRequestSize()J
    .locals 4

    .prologue
    .line 269
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 270
    .local v0, "myExtras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 271
    const-string/jumbo v1, "android.intent.extra.sizeLimit"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    return-wide v2

    .line 273
    :cond_0
    const-wide/16 v2, 0x0

    return-wide v2
.end method

.method public getTimerDurationSeconds()I
    .locals 3

    .prologue
    .line 316
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getVideoDurationTime()I
    .locals 3

    .prologue
    .line 287
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.durationLimit"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 288
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "EXTRA_DURATION_LIMIT has not been defined"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 290
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.durationLimit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getVideoQuality()I
    .locals 3

    .prologue
    .line 277
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.videoQuality"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 278
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "EXTRA_VIDEO_QUALITY has not been defined"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 280
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.videoQuality"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getVoiceControlAction()Ljava/lang/String;
    .locals 3

    .prologue
    .line 432
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extras.VOICE_CONTROL_ACTION"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 433
    const-string/jumbo v1, "NONE"

    return-object v1

    .line 435
    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extras.VOICE_CONTROL_ACTION"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "action":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 437
    const-string/jumbo v1, "NONE"

    return-object v1

    .line 439
    :cond_1
    return-object v0
.end method

.method public isFromVolumeKey()Ljava/lang/Boolean;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 309
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getFlags()I

    move-result v1

    const/high16 v2, 0x800000

    and-int/2addr v1, v2

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isImageCaptureIntent()Z
    .locals 2

    .prologue
    .line 237
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 238
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public isOpenOnly()Z
    .locals 3

    .prologue
    .line 382
    const/4 v0, 0x0

    .line 383
    .local v0, "defaultValue":Z
    const-string/jumbo v1, "android.media.action.VOICE_COMMAND"

    iget-object v2, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 384
    const-string/jumbo v1, "android.intent.action.MAIN"

    iget-object v2, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 383
    if-eqz v1, :cond_1

    .line 385
    :cond_0
    const/4 v0, 0x1

    .line 387
    :cond_1
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public isQuickCapture()Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 305
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.quickCapture"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isScanQRCodeIntent()Z
    .locals 2

    .prologue
    .line 247
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 248
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "com.android.camera.action.QR_CODE_CAPTURE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    const-string/jumbo v1, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 248
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isUseFrontCamera()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.USE_FRONT_CAMERA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    new-instance v0, Ljava/lang/Exception;

    const-string/jumbo v1, "USE_FRONT_CAMERA extras has not been defined!"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.USE_FRONT_CAMERA"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isVideoCaptureIntent()Z
    .locals 2

    .prologue
    .line 242
    iget-object v1, p0, Lcom/android/camera/CameraIntentManager;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 243
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "android.media.action.VIDEO_CAPTURE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method
