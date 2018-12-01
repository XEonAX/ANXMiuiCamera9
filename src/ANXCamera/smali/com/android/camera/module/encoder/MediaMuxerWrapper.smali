.class public Lcom/android/camera/module/encoder/MediaMuxerWrapper;
.super Ljava/lang/Object;
.source "MediaMuxerWrapper.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

.field private mEncoderCount:I

.field private mIsStarted:Z

.field private final mMediaMuxer:Landroid/media/MediaMuxer;

.field private mStartedCount:I

.field private mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Landroid/media/MediaMuxer;

    invoke-direct {v0, p1, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 46
    iput v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 47
    iput v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    .line 48
    iput-boolean v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 49
    return-void
.end method


# virtual methods
.method addEncoder(Lcom/android/camera/module/encoder/MediaEncoder;)V
    .locals 4
    .param p1, "encoder"    # Lcom/android/camera/module/encoder/MediaEncoder;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 122
    instance-of v0, p1, Lcom/android/camera/module/encoder/MediaVideoEncoder;

    if-eqz v0, :cond_1

    .line 123
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_0

    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "video encoder already added!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_0
    iput-object p1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    .line 135
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_4

    move v0, v1

    :goto_1
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v3, :cond_5

    :goto_2
    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 136
    return-void

    .line 127
    :cond_1
    instance-of v0, p1, Lcom/android/camera/module/encoder/MediaAudioEncoder;

    if-eqz v0, :cond_3

    .line 128
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_2

    .line 129
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "audio encoder already added!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_2
    iput-object p1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    goto :goto_0

    .line 133
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "unsupported encoder!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    move v0, v2

    .line 135
    goto :goto_1

    :cond_5
    move v1, v2

    goto :goto_2
.end method

.method declared-synchronized addTrack(Landroid/media/MediaFormat;)I
    .locals 4
    .param p1, "format"    # Landroid/media/MediaFormat;

    .prologue
    monitor-enter p0

    .line 181
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z

    if-eqz v1, :cond_0

    .line 182
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "muxer already started"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 184
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    .line 185
    .local v0, "trackIndex":I
    sget-object v1, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "addTrack: trackNum="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " trackIndex="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " format="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 186
    return v0
.end method

.method public declared-synchronized isStarted()Z
    .locals 1

    .prologue
    monitor-enter p0

    .line 105
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public join()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 92
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "join>>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->join()V

    .line 95
    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_1

    .line 98
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->join()V

    .line 99
    iput-object v2, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    .line 101
    :cond_1
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "join<<<"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    return-void
.end method

.method public prepare()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->prepare()V

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_1

    .line 56
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->prepare()V

    .line 58
    :cond_1
    return-void
.end method

.method public setOrientationHint(I)V
    .locals 1
    .param p1, "degrees"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0, p1}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 110
    return-void
.end method

.method declared-synchronized start()Z
    .locals 3

    .prologue
    monitor-enter p0

    .line 145
    :try_start_0
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "start: startedCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    .line 147
    iget v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    iget v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    if-ne v0, v1, :cond_0

    .line 148
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 150
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->notifyAll()V

    .line 151
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "MediaMuxer started"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public startRecording(J)Z
    .locals 5
    .param p1, "startOffset"    # J

    .prologue
    .line 67
    sget-object v1, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startRecording: offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const/4 v0, 0x1

    .line 69
    .local v0, "succeed":Z
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v1, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;->startRecording(J)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 68
    const/4 v0, 0x1

    .line 72
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v1, :cond_1

    .line 73
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v1, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;->startRecording(J)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 76
    :cond_1
    :goto_1
    return v0

    .line 70
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 73
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method declared-synchronized stop()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    monitor-enter p0

    .line 161
    :try_start_0
    sget-object v1, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "stop: startedCount="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    .line 163
    iget v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mEncoderCount:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    if-gtz v1, :cond_0

    .line 164
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V

    .line 165
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V

    .line 166
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 167
    sget-object v1, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "MediaMuxer stopped"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_0
    iget v1, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gtz v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public stopRecording()V
    .locals 2

    .prologue
    .line 80
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopRecording>>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    if-eqz v0, :cond_1

    .line 86
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaEncoder;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    .line 88
    :cond_1
    sget-object v0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopRecording<<<"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    return-void
.end method

.method declared-synchronized writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 1
    .param p1, "trackIndex"    # I
    .param p2, "byteBuf"    # Ljava/nio/ByteBuffer;
    .param p3, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .prologue
    monitor-enter p0

    .line 199
    :try_start_0
    iget v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mStartedCount:I

    if-lez v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 202
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
