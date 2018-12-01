.class public abstract Lcom/android/camera/module/encoder/MediaEncoder;
.super Ljava/lang/Object;
.source "MediaEncoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field protected mFirstFrameTime:J

.field private mFrame:I

.field protected volatile mIsCapturing:Z

.field protected mIsEOS:Z

.field protected mIsReady:Z

.field protected final mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

.field protected mMediaCodec:Landroid/media/MediaCodec;

.field protected mMuxerStarted:Z

.field private mRequestDrain:I

.field protected volatile mRequestStop:Z

.field protected mSkipFrame:Z

.field protected final mSync:Ljava/lang/Object;

.field protected mThread:Ljava/lang/Thread;

.field protected mTrackIndex:I

.field protected final mWeakMuxer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera/module/encoder/MediaMuxerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private prevOutputPTSUs:J


# direct methods
.method public constructor <init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V
    .locals 4
    .param p1, "muxer"    # Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    .param p2, "listener"    # Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    .line 436
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->prevOutputPTSUs:J

    .line 101
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    .line 102
    invoke-virtual {p1, p0}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->addEncoder(Lcom/android/camera/module/encoder/MediaEncoder;)V

    .line 103
    iput-object p2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    .line 104
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    .line 105
    iget-object v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v2

    .line 107
    :try_start_0
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 108
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsReady:Z

    .line 110
    new-instance v1, Ljava/lang/Thread;

    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mThread:Ljava/lang/Thread;

    .line 111
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 112
    iget-boolean v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 114
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    monitor-exit v2

    .line 120
    return-void

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method protected drain()V
    .locals 12

    .prologue
    .line 319
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 320
    .local v7, "muxer":Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    if-nez v7, :cond_0

    .line 321
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "muxer is unexpectedly null"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    return-void

    .line 324
    :cond_0
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-nez v8, :cond_1

    .line 325
    return-void

    .line 327
    :cond_1
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v8}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 329
    .local v3, "encoderOutputBuffers":[Ljava/nio/ByteBuffer;
    const/4 v0, 0x0

    .line 332
    .local v0, "count":I
    :cond_2
    :goto_0
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    if-eqz v8, :cond_4

    .line 333
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSkipFrame:Z

    if-eqz v8, :cond_3

    .line 334
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mFirstFrameTime:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_5

    const/4 v8, 0x1

    :goto_1
    iput-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSkipFrame:Z

    .line 337
    :cond_3
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v9, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v10, 0x2710

    invoke-virtual {v8, v9, v10, v11}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v4

    .line 338
    .local v4, "encoderStatus":I
    const/4 v8, -0x1

    if-ne v4, v8, :cond_6

    .line 340
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsEOS:Z

    if-nez v8, :cond_2

    .line 341
    add-int/lit8 v0, v0, 0x1

    const/4 v8, 0x5

    if-le v0, v8, :cond_2

    .line 431
    .end local v4    # "encoderStatus":I
    :cond_4
    :goto_2
    return-void

    .line 334
    :cond_5
    const/4 v8, 0x0

    goto :goto_1

    .line 345
    .restart local v4    # "encoderStatus":I
    :cond_6
    const/4 v8, -0x3

    if-ne v4, v8, :cond_7

    .line 346
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "INFO_OUTPUT_BUFFERS_CHANGED"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v8}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v3

    goto :goto_0

    .line 349
    :cond_7
    const/4 v8, -0x2

    if-ne v4, v8, :cond_b

    .line 350
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "INFO_OUTPUT_FORMAT_CHANGED"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMuxerStarted:Z

    if-eqz v8, :cond_8

    .line 356
    new-instance v8, Ljava/lang/RuntimeException;

    const-string/jumbo v9, "format changed twice"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 360
    :cond_8
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v8}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v5

    .line 361
    .local v5, "format":Landroid/media/MediaFormat;
    invoke-virtual {v7, v5}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->addTrack(Landroid/media/MediaFormat;)I

    move-result v8

    iput v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mTrackIndex:I

    .line 363
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v8

    .line 364
    :try_start_0
    iget-boolean v6, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v6, "localRequestStop":Z
    monitor-exit v8

    .line 366
    if-nez v6, :cond_2

    .line 367
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMuxerStarted:Z

    .line 368
    invoke-virtual {v7}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->start()Z

    move-result v8

    if-nez v8, :cond_2

    .line 370
    monitor-enter v7

    .line 371
    :cond_9
    :try_start_1
    invoke-virtual {v7}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->isStarted()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v8

    if-nez v8, :cond_a

    .line 373
    const-wide/16 v8, 0x64

    :try_start_2
    invoke-virtual {v7, v8, v9}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->wait(J)V

    .line 374
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v8, :cond_9

    :goto_3
    monitor-exit v7

    goto :goto_2

    .line 363
    .end local v6    # "localRequestStop":Z
    :catchall_0
    move-exception v9

    monitor-exit v8

    throw v9

    .restart local v6    # "localRequestStop":Z
    :cond_a
    monitor-exit v7

    goto/16 :goto_0

    .line 370
    :catchall_1
    move-exception v8

    monitor-exit v7

    throw v8

    .line 383
    .end local v5    # "format":Landroid/media/MediaFormat;
    .end local v6    # "localRequestStop":Z
    :cond_b
    if-gez v4, :cond_c

    .line 385
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "drain: unexpected status: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 387
    :cond_c
    aget-object v2, v3, v4

    .line 388
    .local v2, "encodedData":Ljava/nio/ByteBuffer;
    if-nez v2, :cond_d

    .line 390
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "encoderOutputBuffer "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " was null"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 392
    :cond_d
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v8, v8, 0x2

    if-eqz v8, :cond_e

    .line 397
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "drain: BUFFER_FLAG_CODEC_CONFIG"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const/4 v9, 0x0

    iput v9, v8, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 401
    :cond_e
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v8, :cond_f

    .line 403
    const/4 v0, 0x0

    .line 404
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMuxerStarted:Z

    if-eqz v8, :cond_f

    .line 406
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v8

    .line 407
    :try_start_3
    iget-boolean v6, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .restart local v6    # "localRequestStop":Z
    monitor-exit v8

    .line 409
    if-nez v6, :cond_f

    .line 410
    iget-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSkipFrame:Z

    if-nez v8, :cond_f

    .line 412
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->getPTSUs()J

    move-result-wide v10

    iput-wide v10, v8, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 413
    iget v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mTrackIndex:I

    iget-object v9, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v7, v8, v2, v9}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 414
    iget v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mFrame:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mFrame:I

    .line 417
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v8, v8, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->prevOutputPTSUs:J

    .line 423
    .end local v6    # "localRequestStop":Z
    :cond_f
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/4 v9, 0x0

    invoke-virtual {v8, v4, v9}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 424
    iget-object v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v8, v8, 0x4

    if-eqz v8, :cond_2

    .line 426
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    goto/16 :goto_2

    .line 406
    :catchall_2
    move-exception v9

    monitor-exit v8

    throw v9

    .line 377
    .end local v2    # "encodedData":Ljava/nio/ByteBuffer;
    .restart local v5    # "format":Landroid/media/MediaFormat;
    .restart local v6    # "localRequestStop":Z
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/InterruptedException;
    goto/16 :goto_3
.end method

.method protected encode(Ljava/nio/ByteBuffer;IJ)V
    .locals 9
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "length"    # I
    .param p3, "presentationTimeUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 282
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    if-nez v0, :cond_0

    .line 283
    return-void

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 286
    .local v8, "inputBuffers":[Ljava/nio/ByteBuffer;
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    if-eqz v0, :cond_2

    .line 287
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const-wide/16 v4, 0x2710

    invoke-virtual {v0, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v1

    .line 288
    .local v1, "inputBufferIndex":I
    if-ltz v1, :cond_4

    .line 289
    aget-object v7, v8, v1

    .line 290
    .local v7, "inputBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 291
    if-eqz p1, :cond_1

    .line 292
    invoke-virtual {v7, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 294
    :cond_1
    if-gtz p2, :cond_3

    .line 296
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsEOS:Z

    .line 297
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "send BUFFER_FLAG_END_OF_STREAM"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 299
    const/4 v6, 0x4

    move v3, v2

    move-wide v4, p3

    .line 298
    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 311
    .end local v1    # "inputBufferIndex":I
    .end local v7    # "inputBuffer":Ljava/nio/ByteBuffer;
    :cond_2
    :goto_1
    return-void

    .line 301
    .restart local v1    # "inputBufferIndex":I
    .restart local v7    # "inputBuffer":Ljava/nio/ByteBuffer;
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    move v3, p2

    move-wide v4, p3

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    goto :goto_1

    .line 305
    .end local v7    # "inputBuffer":Ljava/nio/ByteBuffer;
    :cond_4
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public frameAvailableSoon()Z
    .locals 4

    .prologue
    .line 128
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v1

    .line 129
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    if-eqz v0, :cond_1

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "frameAvailableSoon: requestStop="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    const/4 v0, 0x0

    monitor-exit v1

    return v0

    .line 133
    :cond_1
    :try_start_1
    iget v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I

    .line 134
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    .line 136
    const/4 v0, 0x1

    return v0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected getPTSUs()J
    .locals 6

    .prologue
    .line 444
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long v0, v2, v4

    .line 446
    .local v0, "result":J
    iget-wide v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->prevOutputPTSUs:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 447
    iget-wide v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->prevOutputPTSUs:J

    sub-long/2addr v2, v0

    add-long/2addr v0, v2

    .line 449
    :cond_0
    return-wide v0
.end method

.method join()V
    .locals 3

    .prologue
    .line 224
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 226
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V

    .line 227
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mThread:Ljava/lang/Thread;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 228
    :catch_0
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/InterruptedException;
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method abstract prepare()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected release()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 241
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-eqz v3, :cond_0

    .line 243
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 244
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 245
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 251
    .local v2, "muxerStopped":Z
    iget-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mMuxerStarted:Z

    if-eqz v3, :cond_1

    .line 252
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mWeakMuxer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 253
    :goto_1
    if-eqz v1, :cond_1

    .line 255
    :try_start_1
    invoke-virtual {v1}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->stop()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    .line 262
    .end local v2    # "muxerStopped":Z
    :cond_1
    :goto_2
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    .line 263
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    if-eqz v3, :cond_2

    .line 264
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    invoke-interface {v3, p0, v2}, Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;->onStopped(Lcom/android/camera/module/encoder/MediaEncoder;Z)V

    .line 266
    :cond_2
    iput-object v5, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 267
    return-void

    .line 246
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "failed releasing MediaCodec"

    invoke-static {v3, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 252
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "muxerStopped":Z
    :cond_3
    const/4 v1, 0x0

    .local v1, "muxer":Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    goto :goto_1

    .line 256
    .end local v1    # "muxer":Lcom/android/camera/module/encoder/MediaMuxerWrapper;
    :catch_1
    move-exception v0

    .line 257
    .restart local v0    # "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "failed stopping muxer"

    invoke-static {v3, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 258
    const/4 v2, 0x1

    goto :goto_2
.end method

.method public run()V
    .locals 6

    .prologue
    .line 144
    iget-object v4, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v4

    .line 145
    const/4 v3, 0x0

    :try_start_0
    iput-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    .line 146
    const/4 v3, 0x0

    iput v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I

    .line 147
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsReady:Z

    .line 148
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    monitor-exit v4

    .line 153
    :goto_1
    iget-object v4, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v4

    .line 154
    :try_start_1
    iget-boolean v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    .line 155
    .local v2, "localRequestStop":Z
    iget v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I

    if-lez v3, :cond_2

    const/4 v1, 0x1

    .line 156
    .local v1, "localRequestDrain":Z
    :goto_2
    if-eqz v1, :cond_1

    .line 157
    iget v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestDrain:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1
    monitor-exit v4

    .line 160
    if-eqz v2, :cond_3

    .line 161
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->drain()V

    .line 163
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->signalEndOfInputStream()V

    .line 165
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->drain()V

    .line 167
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->release()V

    .line 185
    :goto_3
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "encoder thread exiting"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    iget-object v4, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v4

    .line 187
    const/4 v3, 0x1

    :try_start_2
    iput-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    .line 188
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    monitor-exit v4

    .line 190
    return-void

    .line 144
    .end local v1    # "localRequestDrain":Z
    .end local v2    # "localRequestStop":Z
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 155
    .restart local v2    # "localRequestStop":Z
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "localRequestDrain":Z
    goto :goto_2

    .line 153
    .end local v1    # "localRequestDrain":Z
    .end local v2    # "localRequestStop":Z
    :catchall_1
    move-exception v3

    monitor-exit v4

    throw v3

    .line 170
    .restart local v1    # "localRequestDrain":Z
    .restart local v2    # "localRequestStop":Z
    :cond_3
    if-eqz v1, :cond_4

    .line 171
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->drain()V

    goto :goto_1

    .line 173
    :cond_4
    iget-object v4, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v4

    .line 174
    :try_start_3
    iget-boolean v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-nez v3, :cond_0

    .line 176
    :try_start_4
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_5
    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit v4

    goto :goto_3

    .line 173
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_2
    move-exception v3

    monitor-exit v4

    throw v3

    .line 186
    :catchall_3
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method protected signalEndOfInputStream()V
    .locals 4

    .prologue
    .line 270
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "signalEndOfInputStream"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    invoke-virtual {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->getPTSUs()J

    move-result-wide v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v0, v1}, Lcom/android/camera/module/encoder/MediaEncoder;->encode(Ljava/nio/ByteBuffer;IJ)V

    .line 272
    return-void
.end method

.method startRecording(J)Z
    .locals 5
    .param p1, "startOffset"    # J

    .prologue
    const/4 v4, 0x1

    .line 196
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v1

    .line 198
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, p1

    iput-wide v2, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mFirstFrameTime:J

    .line 199
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSkipFrame:Z

    .line 200
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mFrame:I

    .line 201
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    .line 203
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 205
    return v4

    .line 197
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method stopRecording()V
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    monitor-enter v1

    .line 214
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mIsCapturing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    monitor-exit v1

    .line 215
    return-void

    .line 217
    :cond_1
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSkipFrame:Z

    .line 218
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mRequestStop:Z

    .line 219
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaEncoder;->mSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    .line 221
    return-void

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
