.class public Lcom/android/camera/module/encoder/MediaVideoEncoder;
.super Lcom/android/camera/module/encoder/MediaEncoder;
.source "MediaVideoEncoder.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field protected static sRecognizedFormats:[I


# instance fields
.field private mExtraFrames:I

.field private mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

.field private mRequestStopTime:J

.field private mSurface:Landroid/view/Surface;

.field private final mVideoHeight:I

.field private final mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    const-class v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    .line 233
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 234
    const v1, 0x7f000789

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 233
    sput-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;II)V
    .locals 8
    .param p1, "muxer"    # Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    .param p2, "listener"    # Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;
    .param p3, "videoWidth"    # I
    .param p4, "videoHeight"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;-><init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V

    .line 50
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v4, "init: videoSize=%dx%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iput p3, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    .line 52
    iput p4, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    .line 53
    move v1, p3

    .line 54
    .local v1, "previewWidth":I
    move v0, p4

    .line 55
    .local v0, "previewHeight":I
    if-le p3, p4, :cond_0

    .line 56
    move v1, p4

    .line 57
    move v0, p3

    .line 59
    :cond_0
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lcom/android/camera/module/encoder/RenderHandler;->createHandler(Ljava/lang/String;II)Lcom/android/camera/module/encoder/RenderHandler;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    .line 60
    return-void
.end method

.method private calcBitRate()I
    .locals 7

    .prologue
    .line 161
    iget v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    int-to-float v1, v1

    const/high16 v2, 0x40c80000    # 6.25f

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 162
    .local v0, "bitrate":I
    sget-object v1, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v3, "bitrate=%d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return v0
.end method

.method private static isRecognizedVideoFormat(I)Z
    .locals 3
    .param p0, "colorFormat"    # I

    .prologue
    .line 240
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    array-length v1, v2

    .line 241
    .local v1, "n":I
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 242
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    aget v2, v2, v0

    if-ne v2, p0, :cond_1

    .line 243
    const/4 v2, 0x1

    return v2

    .line 240
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "n":I
    goto :goto_0

    .line 241
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 246
    :cond_2
    const/4 v2, 0x0

    return v2
.end method

.method protected static final selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I
    .locals 8
    .param p0, "codecInfo"    # Landroid/media/MediaCodecInfo;
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x5

    .line 204
    sget-object v4, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "selectColorFormat>>>codec:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    const/4 v3, 0x0

    .line 208
    .local v3, "result":I
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setPriority(I)V

    .line 209
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 211
    .local v0, "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/Thread;->setPriority(I)V

    .line 214
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    array-length v4, v4

    if-ge v2, v4, :cond_0

    .line 215
    iget-object v4, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    aget v1, v4, v2

    .line 216
    .local v1, "colorFormat":I
    invoke-static {v1}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->isRecognizedVideoFormat(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 218
    move v3, v1

    .line 223
    .end local v1    # "colorFormat":I
    :cond_0
    sget-object v4, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "selectColorFormat<<<colorFormat="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    return v3

    .line 210
    .end local v0    # "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v2    # "i":I
    :catchall_0
    move-exception v4

    .line 211
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/Thread;->setPriority(I)V

    .line 210
    throw v4

    .line 214
    .restart local v0    # "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .restart local v1    # "colorFormat":I
    .restart local v2    # "i":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected static final selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 9
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 173
    sget-object v6, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "selectVideoCodec>>>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v4

    .line 177
    .local v4, "numCodecs":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_3

    .line 178
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 180
    .local v0, "codecInfo":Landroid/media/MediaCodecInfo;
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v6

    if-nez v6, :cond_1

    .line 177
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 184
    :cond_1
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "types":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    array-length v6, v5

    if-ge v3, v6, :cond_0

    .line 186
    aget-object v6, v5, v3

    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 187
    invoke-static {v0, p0}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I

    move-result v1

    .line 188
    .local v1, "format":I
    if-lez v1, :cond_2

    .line 189
    return-object v0

    .line 185
    .end local v1    # "format":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 194
    .end local v0    # "codecInfo":Landroid/media/MediaCodecInfo;
    .end local v3    # "j":I
    .end local v5    # "types":[Ljava/lang/String;
    :cond_3
    sget-object v6, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "selectVideoCodec<<<"

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    const/4 v6, 0x0

    return-object v6
.end method


# virtual methods
.method public frameAvailableSoon(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)Z
    .locals 6
    .param p1, "ext"    # Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .prologue
    .line 63
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->frameAvailableSoon()Z

    move-result v0

    .line 65
    .local v0, "draw":Z
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSkipFrame:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 66
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    invoke-virtual {v1, p1}, Lcom/android/camera/module/encoder/RenderHandler;->draw(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 67
    iget-wide v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRequestStopTime:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 68
    iget v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    .line 69
    iget v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    if-gtz v1, :cond_0

    .line 70
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    .line 74
    :cond_0
    return v0
.end method

.method protected prepare()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 79
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "prepare>>>"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mTrackIndex:I

    .line 81
    iput-boolean v4, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMuxerStarted:Z

    .line 82
    iput-boolean v4, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mIsEOS:Z

    .line 84
    const-string/jumbo v2, "video/avc"

    invoke-static {v2}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    move-result-object v1

    .line 85
    .local v1, "videoCodecInfo":Landroid/media/MediaCodecInfo;
    if-nez v1, :cond_0

    .line 86
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "no appropriate codec for video/avc"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void

    .line 89
    :cond_0
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "selected codec: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    const-string/jumbo v2, "video/avc"

    iget v3, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    iget v4, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    invoke-static {v2, v3, v4}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    .line 92
    .local v0, "format":Landroid/media/MediaFormat;
    const-string/jumbo v2, "color-format"

    .line 93
    const v3, 0x7f000789

    .line 92
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 94
    const-string/jumbo v2, "bitrate"

    invoke-direct {p0}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->calcBitRate()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 95
    const-string/jumbo v2, "frame-rate"

    const/16 v3, 0x19

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 96
    const-string/jumbo v2, "i-frame-interval"

    invoke-virtual {v0, v2, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 97
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "format: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const-string/jumbo v2, "video/avc"

    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 100
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2, v0, v5, v5, v6}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 103
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    .line 104
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 105
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    if-eqz v2, :cond_1

    .line 106
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    invoke-interface {v2, p0}, Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;->onPrepared(Lcom/android/camera/module/encoder/MediaEncoder;)V

    .line 108
    :cond_1
    sget-object v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "prepare<<<"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return-void
.end method

.method protected release()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 148
    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 151
    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    if-eqz v0, :cond_1

    .line 154
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/RenderHandler;->release()V

    .line 155
    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    .line 157
    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->release()V

    .line 158
    return-void
.end method

.method public setEglContext(Landroid/opengl/EGLContext;)V
    .locals 3
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;

    .prologue
    .line 112
    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "setEglContext"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Lcom/android/camera/module/encoder/RenderHandler;->setEglContext(Landroid/opengl/EGLContext;Ljava/lang/Object;Z)V

    .line 114
    return-void
.end method

.method protected signalEndOfInputStream()V
    .locals 2

    .prologue
    .line 251
    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "signalEndOfInputStream"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 253
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mIsEOS:Z

    .line 254
    return-void
.end method

.method protected startRecording(J)Z
    .locals 5
    .param p1, "startOffset"    # J

    .prologue
    .line 118
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;->startRecording(J)Z

    move-result v0

    .line 119
    .local v0, "succeed":Z
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRequestStopTime:J

    .line 120
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    .line 122
    return v0
.end method

.method protected stopRecording()V
    .locals 0

    .prologue
    .line 143
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    .line 144
    return-void
.end method
