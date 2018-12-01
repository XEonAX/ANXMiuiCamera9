.class public Lcom/android/camera/MiuiCameraSound;
.super Ljava/lang/Object;
.source "MiuiCameraSound.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/MiuiCameraSound$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final SOUND_FILES:[Ljava/lang/String;


# instance fields
.field private final mAssetManager:Landroid/content/res/AssetManager;

.field private final mAudioManager:Landroid/media/AudioManager;

.field private mDisposable:Lio/reactivex/disposables/Disposable;

.field private mFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mLastPlayTime:J

.field private mLoadCompleteListener:Landroid/media/SoundPool$OnLoadCompleteListener;

.field private mSoundIdToPlay:I

.field private mSoundIds:[I

.field private mSoundPool:Landroid/media/SoundPool;


# direct methods
.method static synthetic -get0(Lcom/android/camera/MiuiCameraSound;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/MiuiCameraSound;

    .prologue
    iget v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/MiuiCameraSound;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/MiuiCameraSound;
    .param p1, "-value"    # Lio/reactivex/FlowableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/MiuiCameraSound;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/MiuiCameraSound;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/MiuiCameraSound;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    return p1
.end method

.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 36
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    .line 37
    const-string/jumbo v1, "camera_click_v9.mp3"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 38
    const-string/jumbo v1, "camera_focus_v9.mp3"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 39
    const-string/jumbo v1, "video_record_start_v9.ogg"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 40
    const-string/jumbo v1, "video_record_end_v9.ogg"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 41
    const-string/jumbo v1, "camera_fast_burst_v9.ogg"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 42
    const-string/jumbo v1, "sound_shuter_delay_bee.ogg"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 43
    const-string/jumbo v1, "/system/media/audio/ui/NumberPickerValueChange.ogg"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 44
    const-string/jumbo v1, "audio_capture.ogg"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 36
    sput-object v0, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    const/4 v8, -0x1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lcom/android/camera/MiuiCameraSound;->mLastPlayTime:J

    .line 151
    new-instance v3, Lcom/android/camera/MiuiCameraSound$1;

    invoke-direct {v3, p0}, Lcom/android/camera/MiuiCameraSound$1;-><init>(Lcom/android/camera/MiuiCameraSound;)V

    .line 150
    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mLoadCompleteListener:Landroid/media/SoundPool$OnLoadCompleteListener;

    .line 64
    const-string/jumbo v3, "audio"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/media/AudioManager;

    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mAudioManager:Landroid/media/AudioManager;

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mAssetManager:Landroid/content/res/AssetManager;

    .line 66
    new-instance v2, Landroid/media/SoundPool$Builder;

    invoke-direct {v2}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 67
    .local v2, "soundBuilder":Landroid/media/SoundPool$Builder;
    invoke-virtual {v2, v4}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 68
    new-instance v5, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v5}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 69
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMuteCameraSound()Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v4

    .line 68
    :goto_0
    invoke-virtual {v5, v3}, Landroid/media/AudioAttributes$Builder;->setInternalLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 73
    invoke-virtual {v2}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    .line 74
    iget-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v4, p0, Lcom/android/camera/MiuiCameraSound;->mLoadCompleteListener:Landroid/media/SoundPool$OnLoadCompleteListener;

    invoke-virtual {v3, v4}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 75
    sget-object v3, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    array-length v3, v3

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    .line 76
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 77
    iget-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    aput v8, v3, v1

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 71
    .end local v1    # "i":I
    :cond_0
    const/4 v3, 0x7

    goto :goto_0

    .line 79
    .restart local v1    # "i":I
    :cond_1
    iput v8, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    .line 81
    new-instance v3, Lcom/android/camera/MiuiCameraSound$2;

    invoke-direct {v3, p0}, Lcom/android/camera/MiuiCameraSound$2;-><init>(Lcom/android/camera/MiuiCameraSound;)V

    .line 86
    sget-object v4, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 81
    invoke-static {v3, v4}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v3

    .line 87
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v4

    .line 81
    invoke-virtual {v3, v4}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v3

    .line 88
    new-instance v4, Lcom/android/camera/MiuiCameraSound$3;

    invoke-direct {v4, p0}, Lcom/android/camera/MiuiCameraSound$3;-><init>(Lcom/android/camera/MiuiCameraSound;)V

    .line 81
    invoke-virtual {v3, v4}, Lio/reactivex/Flowable;->onBackpressureDrop(Lio/reactivex/functions/Consumer;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 95
    .local v0, "flowable":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<Ljava/lang/Integer;>;"
    invoke-virtual {v0, p0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mDisposable:Lio/reactivex/disposables/Disposable;

    .line 96
    return-void
.end method

.method private loadFromAsset(I)I
    .locals 6
    .param p1, "soundName"    # I

    .prologue
    .line 112
    const/4 v2, -0x1

    .line 113
    .local v2, "soundId":I
    const/4 v0, 0x0

    .line 115
    .local v0, "afd":Landroid/content/res/AssetFileDescriptor;
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mAssetManager:Landroid/content/res/AssetManager;

    sget-object v4, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    .line 116
    .local v0, "afd":Landroid/content/res/AssetFileDescriptor;
    iget-object v3, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    const/4 v4, 0x1

    invoke-virtual {v3, v0, v4}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 120
    if-eqz v0, :cond_0

    .line 122
    :try_start_1
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 129
    .end local v0    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_0
    :goto_0
    return v2

    .line 123
    .restart local v0    # "afd":Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v1

    .line 124
    .local v1, "e":Ljava/io/IOException;
    const-string/jumbo v3, "MiuiCameraSound"

    const-string/jumbo v4, "IOException occurs when closing Camera Sound AssetFileDescriptor."

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 117
    .end local v0    # "afd":Landroid/content/res/AssetFileDescriptor;
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 118
    .restart local v1    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    if-eqz v0, :cond_0

    .line 122
    :try_start_3
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 123
    :catch_2
    move-exception v1

    .line 124
    const-string/jumbo v3, "MiuiCameraSound"

    const-string/jumbo v4, "IOException occurs when closing Camera Sound AssetFileDescriptor."

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 119
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 120
    if-eqz v0, :cond_1

    .line 122
    :try_start_4
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 119
    :cond_1
    :goto_1
    throw v3

    .line 123
    :catch_3
    move-exception v1

    .line 124
    .restart local v1    # "e":Ljava/io/IOException;
    const-string/jumbo v4, "MiuiCameraSound"

    const-string/jumbo v5, "IOException occurs when closing Camera Sound AssetFileDescriptor."

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private declared-synchronized play(II)V
    .locals 7
    .param p1, "soundName"    # I
    .param p2, "times"    # I

    .prologue
    monitor-enter p0

    .line 133
    if-ltz p1, :cond_0

    :try_start_0
    sget-object v0, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    array-length v0, v0

    if-lt p1, v0, :cond_1

    .line 134
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown sound requested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 136
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    aget v0, v0, p1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 137
    sget-object v0, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 138
    invoke-direct {p0, p1}, Lcom/android/camera/MiuiCameraSound;->loadFromAsset(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    .line 143
    :goto_0
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    iget v1, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    aput v1, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    monitor-exit p0

    .line 148
    return-void

    .line 141
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    sget-object v1, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    aget-object v1, v1, p1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v0

    .line 140
    iput v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIdToPlay:I

    goto :goto_0

    .line 145
    :cond_3
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    aget v1, v1, p1

    add-int/lit8 v5, p2, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 146
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/MiuiCameraSound;->mLastPlayTime:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private playSound(II)V
    .locals 2
    .param p1, "soundId"    # I
    .param p2, "times"    # I

    .prologue
    .line 178
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMuteCameraSound()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 180
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/MiuiCameraSound;->play(II)V

    .line 182
    :cond_1
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "soundId"    # Ljava/lang/Integer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 203
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/MiuiCameraSound;->playSound(II)V

    .line 204
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
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
    .line 200
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/MiuiCameraSound;->accept(Ljava/lang/Integer;)V

    return-void
.end method

.method public declared-synchronized load(I)V
    .locals 4
    .param p1, "soundName"    # I

    .prologue
    monitor-enter p0

    .line 99
    if-ltz p1, :cond_0

    :try_start_0
    sget-object v0, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    array-length v0, v0

    if-lt p1, v0, :cond_1

    .line 100
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown sound requested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 102
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    aget v0, v0, p1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 103
    sget-object v0, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    aget-object v0, v0, p1

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 104
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    invoke-direct {p0, p1}, Lcom/android/camera/MiuiCameraSound;->loadFromAsset(I)I

    move-result v1

    aput v1, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :goto_0
    monitor-exit p0

    .line 109
    return-void

    .line 106
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundIds:[I

    iget-object v1, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    sget-object v2, Lcom/android/camera/MiuiCameraSound;->SOUND_FILES:[Ljava/lang/String;

    aget-object v2, v2, p1

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v1

    aput v1, v0, p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public playSound(I)V
    .locals 2
    .param p1, "soundId"    # I

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    return-void

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 194
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 167
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_1

    .line 172
    iget-object v0, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 173
    iput-object v1, p0, Lcom/android/camera/MiuiCameraSound;->mSoundPool:Landroid/media/SoundPool;

    .line 175
    :cond_1
    return-void
.end method
