.class public Lcom/android/camera/module/encoder/MediaAudioEncoder;
.super Lcom/android/camera/module/encoder/MediaEncoder;
.source "MediaAudioEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;
    }
.end annotation


# static fields
.field private static final AUDIO_SOURCES:[I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

.field protected final mMediaCodecLock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    const-class v0, Lcom/android/camera/module/encoder/MediaAudioEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    .line 122
    const/4 v0, 0x1

    .line 123
    const/4 v1, 0x0

    .line 124
    const/4 v2, 0x5

    .line 121
    filled-new-array {v0, v1, v2}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->AUDIO_SOURCES:[I

    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V
    .locals 1
    .param p1, "muxer"    # Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    .param p2, "listener"    # Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;-><init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMediaCodecLock:Ljava/lang/Object;

    .line 48
    return-void
.end method

.method private initAudioRecord()Landroid/media/AudioRecord;
    .locals 12

    .prologue
    const v2, 0xac44

    const/16 v3, 0x10

    const/4 v4, 0x2

    .line 128
    invoke-static {v2, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v6

    .line 130
    .local v6, "minBufferSize":I
    const/16 v5, 0x6400

    .local v5, "bufferSize":I
    const/16 v7, 0x6400

    .line 131
    if-ge v7, v6, :cond_0

    .line 132
    div-int/lit16 v7, v6, 0x400

    add-int/lit8 v7, v7, 0x1

    mul-int/lit16 v7, v7, 0x400

    mul-int/lit8 v5, v7, 0x2

    .line 135
    :cond_0
    const/4 v0, 0x0

    .line 136
    .local v0, "audioRecord":Landroid/media/AudioRecord;
    sget-object v8, Lcom/android/camera/module/encoder/MediaAudioEncoder;->AUDIO_SOURCES:[I

    const/4 v7, 0x0

    array-length v9, v8

    .end local v0    # "audioRecord":Landroid/media/AudioRecord;
    :goto_0
    if-ge v7, v9, :cond_2

    aget v1, v8, v7

    .line 137
    .local v1, "source":I
    new-instance v0, Landroid/media/AudioRecord;

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 139
    .local v0, "audioRecord":Landroid/media/AudioRecord;
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_1

    .line 140
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 141
    const/4 v0, 0x0

    .line 143
    .end local v0    # "audioRecord":Landroid/media/AudioRecord;
    :cond_1
    if-eqz v0, :cond_3

    .line 148
    .end local v1    # "source":I
    :cond_2
    return-object v0

    .line 136
    .restart local v1    # "source":I
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method private static selectAudioCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 7
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 215
    const/4 v4, 0x0

    .line 217
    .local v4, "result":Landroid/media/MediaCodecInfo;
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v3

    .line 219
    .local v3, "numCodecs":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_2

    .line 220
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 221
    .local v0, "codecInfo":Landroid/media/MediaCodecInfo;
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v6

    if-nez v6, :cond_1

    .line 219
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 224
    :cond_1
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, "types":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    array-length v6, v5

    if-ge v2, v6, :cond_0

    .line 227
    aget-object v6, v5, v2

    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 229
    move-object v4, v0

    .line 235
    .end local v0    # "codecInfo":Landroid/media/MediaCodecInfo;
    .end local v2    # "j":I
    .end local v4    # "result":Landroid/media/MediaCodecInfo;
    .end local v5    # "types":[Ljava/lang/String;
    :cond_2
    return-object v4

    .line 225
    .restart local v0    # "codecInfo":Landroid/media/MediaCodecInfo;
    .restart local v2    # "j":I
    .restart local v4    # "result":Landroid/media/MediaCodecInfo;
    .restart local v5    # "types":[Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected prepare()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 52
    sget-object v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "prepare>>>"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mTrackIndex:I

    .line 54
    iput-boolean v4, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMuxerStarted:Z

    .line 55
    iput-boolean v4, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mIsEOS:Z

    .line 57
    const-string/jumbo v2, "audio/mp4a-latm"

    invoke-static {v2}, Lcom/android/camera/module/encoder/MediaAudioEncoder;->selectAudioCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 58
    .local v0, "audioCodecInfo":Landroid/media/MediaCodecInfo;
    if-nez v0, :cond_0

    .line 59
    sget-object v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "no appropriate codec for audio/mp4a-latm"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    return-void

    .line 62
    :cond_0
    sget-object v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "selected codec: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const-string/jumbo v2, "audio/mp4a-latm"

    const v3, 0xac44

    invoke-static {v2, v3, v6}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v1

    .line 65
    .local v1, "audioFormat":Landroid/media/MediaFormat;
    const-string/jumbo v2, "aac-profile"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 66
    const-string/jumbo v2, "channel-mask"

    const/16 v3, 0x10

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 67
    const-string/jumbo v2, "bitrate"

    const v3, 0xfa00

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    const-string/jumbo v2, "channel-count"

    invoke-virtual {v1, v2, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 69
    sget-object v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "format: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    const-string/jumbo v2, "audio/mp4a-latm"

    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 71
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2, v1, v5, v5, v6}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 72
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 73
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    if-eqz v2, :cond_1

    .line 74
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    invoke-interface {v2, p0}, Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;->onPrepared(Lcom/android/camera/module/encoder/MediaEncoder;)V

    .line 76
    :cond_1
    sget-object v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "prepare<<<"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    return-void
.end method

.method protected release()V
    .locals 2

    .prologue
    .line 115
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    .line 116
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mMediaCodecLock:Ljava/lang/Object;

    monitor-enter v0

    .line 117
    :try_start_0
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 119
    return-void

    .line 116
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method protected startRecording(J)Z
    .locals 7
    .param p1, "startOffset"    # J

    .prologue
    const/4 v5, 0x0

    .line 81
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;->startRecording(J)Z

    move-result v2

    .line 82
    .local v2, "succeed":Z
    if-nez v2, :cond_0

    .line 83
    return v5

    .line 86
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    if-nez v3, :cond_2

    .line 87
    invoke-direct {p0}, Lcom/android/camera/module/encoder/MediaAudioEncoder;->initAudioRecord()Landroid/media/AudioRecord;

    move-result-object v0

    .line 88
    .local v0, "audioRecord":Landroid/media/AudioRecord;
    if-nez v0, :cond_1

    .line 89
    sget-object v3, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "failed to initialize AudioRecord"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return v5

    .line 93
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 94
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v3

    const/4 v4, 0x3

    if-ne v4, v3, :cond_3

    .line 95
    new-instance v3, Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    invoke-direct {v3, p0, v0}, Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;-><init>(Lcom/android/camera/module/encoder/MediaAudioEncoder;Landroid/media/AudioRecord;)V

    iput-object v3, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    .line 96
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaAudioEncoder;->mAudioThread:Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;

    invoke-virtual {v3}, Lcom/android/camera/module/encoder/MediaAudioEncoder$AudioThread;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .end local v2    # "succeed":Z
    :goto_0
    if-nez v2, :cond_2

    if-eqz v0, :cond_2

    .line 105
    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 106
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 110
    .end local v0    # "audioRecord":Landroid/media/AudioRecord;
    :cond_2
    return v2

    .line 98
    .restart local v0    # "audioRecord":Landroid/media/AudioRecord;
    .restart local v2    # "succeed":Z
    :cond_3
    const/4 v2, 0x0

    .local v2, "succeed":Z
    goto :goto_0

    .line 100
    .local v2, "succeed":Z
    :catch_0
    move-exception v1

    .line 101
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v3, Lcom/android/camera/module/encoder/MediaAudioEncoder;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    const/4 v2, 0x0

    .local v2, "succeed":Z
    goto :goto_0
.end method
