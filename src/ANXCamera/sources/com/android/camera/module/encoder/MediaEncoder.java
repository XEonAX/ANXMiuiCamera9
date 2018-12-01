package com.android.camera.module.encoder;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import com.android.camera.log.Log;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;

public abstract class MediaEncoder implements Runnable {
    private final String TAG;
    private BufferInfo mBufferInfo;
    protected long mFirstFrameTime;
    private int mFrame;
    protected volatile boolean mIsCapturing;
    protected boolean mIsEOS;
    protected boolean mIsReady;
    protected final MediaEncoderListener mListener;
    protected MediaCodec mMediaCodec;
    protected boolean mMuxerStarted;
    private int mRequestDrain;
    protected volatile boolean mRequestStop;
    protected boolean mSkipFrame;
    protected final Object mSync = new Object();
    protected Thread mThread;
    protected int mTrackIndex;
    protected final WeakReference<MediaMuxerWrapper> mWeakMuxer;
    private long prevOutputPTSUs = 0;

    public interface MediaEncoderListener {
        void onPrepared(MediaEncoder mediaEncoder);

        void onStopped(MediaEncoder mediaEncoder, boolean z);
    }

    abstract void prepare() throws IOException;

    public MediaEncoder(MediaMuxerWrapper muxer, MediaEncoderListener listener) {
        this.mWeakMuxer = new WeakReference(muxer);
        muxer.addEncoder(this);
        this.mListener = listener;
        this.TAG = getClass().getSimpleName();
        synchronized (this.mSync) {
            this.mBufferInfo = new BufferInfo();
            this.mIsReady = false;
            this.mThread = new Thread(this, getClass().getSimpleName());
            this.mThread.start();
            if (!this.mIsReady) {
                try {
                    this.mSync.wait();
                } catch (InterruptedException e) {
                    Log.e(this.TAG, e.getMessage(), e);
                }
            }
        }
        return;
    }

    public boolean frameAvailableSoon() {
        synchronized (this.mSync) {
            if (!this.mIsCapturing || this.mRequestStop) {
                Log.w(this.TAG, "frameAvailableSoon: requestStop=" + this.mRequestStop);
                return false;
            }
            this.mRequestDrain++;
            this.mSync.notifyAll();
            return true;
        }
    }

    /* JADX WARNING: Missing block: B:33:0x0054, code:
            r4 = r6.mSync;
     */
    /* JADX WARNING: Missing block: B:34:0x0056, code:
            monitor-enter(r4);
     */
    /* JADX WARNING: Missing block: B:37:0x0059, code:
            if (r6.mRequestStop != false) goto L_0x0011;
     */
    /* JADX WARNING: Missing block: B:39:?, code:
            r6.mSync.wait();
     */
    /* JADX WARNING: Missing block: B:41:0x0061, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:43:?, code:
            com.android.camera.log.Log.e(r6.TAG, r0.getMessage());
     */
    public void run() {
        /*
        r6 = this;
        r4 = r6.mSync;
        monitor-enter(r4);
        r3 = 0;
        r6.mRequestStop = r3;	 Catch:{ all -> 0x0046 }
        r3 = 0;
        r6.mRequestDrain = r3;	 Catch:{ all -> 0x0046 }
        r3 = 1;
        r6.mIsReady = r3;	 Catch:{ all -> 0x0046 }
        r3 = r6.mSync;	 Catch:{ all -> 0x0046 }
        r3.notify();	 Catch:{ all -> 0x0046 }
    L_0x0011:
        monitor-exit(r4);
    L_0x0012:
        r4 = r6.mSync;
        monitor-enter(r4);
        r2 = r6.mRequestStop;	 Catch:{ all -> 0x004b }
        r3 = r6.mRequestDrain;	 Catch:{ all -> 0x004b }
        if (r3 <= 0) goto L_0x0049;
    L_0x001b:
        r1 = 1;
    L_0x001c:
        if (r1 == 0) goto L_0x0024;
    L_0x001e:
        r3 = r6.mRequestDrain;	 Catch:{ all -> 0x004b }
        r3 = r3 + -1;
        r6.mRequestDrain = r3;	 Catch:{ all -> 0x004b }
    L_0x0024:
        monitor-exit(r4);
        if (r2 == 0) goto L_0x004e;
    L_0x0027:
        r6.drain();
        r6.signalEndOfInputStream();
        r6.drain();
        r6.release();
    L_0x0033:
        r3 = r6.TAG;
        r4 = "encoder thread exiting";
        com.android.camera.log.Log.d(r3, r4);
        r4 = r6.mSync;
        monitor-enter(r4);
        r3 = 1;
        r6.mRequestStop = r3;	 Catch:{ all -> 0x0070 }
        r3 = 0;
        r6.mIsCapturing = r3;	 Catch:{ all -> 0x0070 }
        monitor-exit(r4);
        return;
    L_0x0046:
        r3 = move-exception;
        monitor-exit(r4);
        throw r3;
    L_0x0049:
        r1 = 0;
        goto L_0x001c;
    L_0x004b:
        r3 = move-exception;
        monitor-exit(r4);
        throw r3;
    L_0x004e:
        if (r1 == 0) goto L_0x0054;
    L_0x0050:
        r6.drain();
        goto L_0x0012;
    L_0x0054:
        r4 = r6.mSync;
        monitor-enter(r4);
        r3 = r6.mRequestStop;	 Catch:{ all -> 0x006d }
        if (r3 != 0) goto L_0x0011;
    L_0x005b:
        r3 = r6.mSync;	 Catch:{ InterruptedException -> 0x0061 }
        r3.wait();	 Catch:{ InterruptedException -> 0x0061 }
        goto L_0x0011;
    L_0x0061:
        r0 = move-exception;
        r3 = r6.TAG;	 Catch:{ all -> 0x006d }
        r5 = r0.getMessage();	 Catch:{ all -> 0x006d }
        com.android.camera.log.Log.e(r3, r5);	 Catch:{ all -> 0x006d }
        monitor-exit(r4);
        goto L_0x0033;
    L_0x006d:
        r3 = move-exception;
        monitor-exit(r4);
        throw r3;
    L_0x0070:
        r3 = move-exception;
        monitor-exit(r4);
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.MediaEncoder.run():void");
    }

    boolean startRecording(long startOffset) {
        Log.d(this.TAG, "startRecording");
        synchronized (this.mSync) {
            this.mFirstFrameTime = System.currentTimeMillis() + startOffset;
            this.mSkipFrame = true;
            this.mFrame = 0;
            this.mIsCapturing = true;
            this.mRequestStop = false;
            this.mSync.notifyAll();
        }
        return true;
    }

    /* JADX WARNING: Missing block: B:8:0x0014, code:
            return;
     */
    void stopRecording() {
        /*
        r2 = this;
        r0 = r2.TAG;
        r1 = "stopRecording";
        com.android.camera.log.Log.d(r0, r1);
        r1 = r2.mSync;
        monitor-enter(r1);
        r0 = r2.mIsCapturing;	 Catch:{ all -> 0x0022 }
        if (r0 == 0) goto L_0x0013;
    L_0x000f:
        r0 = r2.mRequestStop;	 Catch:{ all -> 0x0022 }
        if (r0 == 0) goto L_0x0015;
    L_0x0013:
        monitor-exit(r1);
        return;
    L_0x0015:
        r0 = 0;
        r2.mSkipFrame = r0;	 Catch:{ all -> 0x0022 }
        r0 = 1;
        r2.mRequestStop = r0;	 Catch:{ all -> 0x0022 }
        r0 = r2.mSync;	 Catch:{ all -> 0x0022 }
        r0.notifyAll();	 Catch:{ all -> 0x0022 }
        monitor-exit(r1);
        return;
    L_0x0022:
        r0 = move-exception;
        monitor-exit(r1);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.MediaEncoder.stopRecording():void");
    }

    void join() {
        if (this.mThread != null) {
            try {
                this.mThread.join();
                this.mThread = null;
            } catch (InterruptedException e) {
                Log.e(this.TAG, e.getMessage());
            }
        }
    }

    protected void release() {
        if (this.mMediaCodec != null) {
            try {
                this.mMediaCodec.stop();
                this.mMediaCodec.release();
                this.mMediaCodec = null;
            } catch (Exception e) {
                Log.e(this.TAG, "failed releasing MediaCodec", e);
            }
        }
        boolean muxerStopped = false;
        if (this.mMuxerStarted) {
            MediaMuxerWrapper muxer = this.mWeakMuxer != null ? (MediaMuxerWrapper) this.mWeakMuxer.get() : null;
            if (muxer != null) {
                try {
                    muxerStopped = muxer.stop();
                } catch (Exception e2) {
                    Log.e(this.TAG, "failed stopping muxer", e2);
                    muxerStopped = true;
                }
            }
        }
        this.mIsCapturing = false;
        if (this.mListener != null) {
            this.mListener.onStopped(this, muxerStopped);
        }
        this.mBufferInfo = null;
    }

    protected void signalEndOfInputStream() {
        Log.d(this.TAG, "signalEndOfInputStream");
        encode(null, 0, getPTSUs());
    }

    protected void encode(ByteBuffer buffer, int length, long presentationTimeUs) {
        if (this.mIsCapturing) {
            ByteBuffer[] inputBuffers = this.mMediaCodec.getInputBuffers();
            while (this.mIsCapturing) {
                int inputBufferIndex = this.mMediaCodec.dequeueInputBuffer(10000);
                if (inputBufferIndex >= 0) {
                    ByteBuffer inputBuffer = inputBuffers[inputBufferIndex];
                    inputBuffer.clear();
                    if (buffer != null) {
                        inputBuffer.put(buffer);
                    }
                    if (length <= 0) {
                        this.mIsEOS = true;
                        Log.d(this.TAG, "send BUFFER_FLAG_END_OF_STREAM");
                        this.mMediaCodec.queueInputBuffer(inputBufferIndex, 0, 0, presentationTimeUs, 4);
                    } else {
                        this.mMediaCodec.queueInputBuffer(inputBufferIndex, 0, length, presentationTimeUs, 0);
                    }
                }
            }
        }
    }

    protected void drain() {
        MediaMuxerWrapper muxer = (MediaMuxerWrapper) this.mWeakMuxer.get();
        if (muxer == null) {
            Log.w(this.TAG, "muxer is unexpectedly null");
            return;
        } else if (this.mMediaCodec != null) {
            ByteBuffer[] encoderOutputBuffers = this.mMediaCodec.getOutputBuffers();
            int count = 0;
            loop0:
            while (this.mIsCapturing) {
                if (this.mSkipFrame) {
                    this.mSkipFrame = System.currentTimeMillis() < this.mFirstFrameTime;
                }
                int encoderStatus = this.mMediaCodec.dequeueOutputBuffer(this.mBufferInfo, 10000);
                boolean localRequestStop;
                if (encoderStatus == -1) {
                    if (this.mIsEOS) {
                        continue;
                    } else {
                        count++;
                        if (count > 5) {
                            break;
                        }
                    }
                } else if (encoderStatus == -3) {
                    Log.d(this.TAG, "INFO_OUTPUT_BUFFERS_CHANGED");
                    encoderOutputBuffers = this.mMediaCodec.getOutputBuffers();
                } else if (encoderStatus == -2) {
                    Log.d(this.TAG, "INFO_OUTPUT_FORMAT_CHANGED");
                    if (this.mMuxerStarted) {
                        throw new RuntimeException("format changed twice");
                    }
                    this.mTrackIndex = muxer.addTrack(this.mMediaCodec.getOutputFormat());
                    synchronized (this.mSync) {
                        localRequestStop = this.mRequestStop;
                    }
                    if (localRequestStop) {
                        continue;
                    } else {
                        this.mMuxerStarted = true;
                        if (muxer.start()) {
                            continue;
                        } else {
                            synchronized (muxer) {
                                while (!muxer.isStarted()) {
                                    try {
                                        muxer.wait(100);
                                        if (this.mRequestStop) {
                                        }
                                    } catch (InterruptedException e) {
                                    }
                                }
                            }
                        }
                    }
                } else if (encoderStatus < 0) {
                    Log.w(this.TAG, "drain: unexpected status: " + encoderStatus);
                } else {
                    ByteBuffer encodedData = encoderOutputBuffers[encoderStatus];
                    if (encodedData == null) {
                        throw new RuntimeException("encoderOutputBuffer " + encoderStatus + " was null");
                    }
                    if ((this.mBufferInfo.flags & 2) != 0) {
                        Log.d(this.TAG, "drain: BUFFER_FLAG_CODEC_CONFIG");
                        this.mBufferInfo.size = 0;
                    }
                    if (this.mBufferInfo.size != 0) {
                        count = 0;
                        if (this.mMuxerStarted) {
                            synchronized (this.mSync) {
                                localRequestStop = this.mRequestStop;
                            }
                            if (!(localRequestStop || this.mSkipFrame)) {
                                this.mBufferInfo.presentationTimeUs = getPTSUs();
                                muxer.writeSampleData(this.mTrackIndex, encodedData, this.mBufferInfo);
                                this.mFrame++;
                                this.prevOutputPTSUs = this.mBufferInfo.presentationTimeUs;
                            }
                        }
                    }
                    this.mMediaCodec.releaseOutputBuffer(encoderStatus, false);
                    if ((this.mBufferInfo.flags & 4) != 0) {
                        this.mIsCapturing = false;
                        break;
                    }
                }
            }
        } else {
            return;
        }
    }

    protected long getPTSUs() {
        long result = System.nanoTime() / 1000;
        if (result < this.prevOutputPTSUs) {
            return result + (this.prevOutputPTSUs - result);
        }
        return result;
    }
}
