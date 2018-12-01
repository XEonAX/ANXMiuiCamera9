package com.android.camera.module.encoder;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import com.android.camera.log.Log;
import java.io.IOException;
import java.nio.ByteBuffer;

public class MediaMuxerWrapper {
    private static final String TAG = MediaMuxerWrapper.class.getSimpleName();
    private MediaEncoder mAudioEncoder;
    private int mEncoderCount = 0;
    private boolean mIsStarted = false;
    private final MediaMuxer mMediaMuxer;
    private int mStartedCount = 0;
    private MediaEncoder mVideoEncoder;

    public MediaMuxerWrapper(String path) throws IOException {
        this.mMediaMuxer = new MediaMuxer(path, 0);
    }

    public void prepare() throws IOException {
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.prepare();
        }
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.prepare();
        }
    }

    public boolean startRecording(long startOffset) {
        Log.d(TAG, "startRecording: offset=" + startOffset);
        boolean succeed = true;
        if (this.mVideoEncoder != null) {
            succeed = this.mVideoEncoder.startRecording(startOffset);
        }
        if (this.mAudioEncoder == null || this.mAudioEncoder.startRecording(startOffset)) {
            return succeed;
        }
        return false;
    }

    public void stopRecording() {
        Log.d(TAG, "stopRecording>>>");
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.stopRecording();
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.stopRecording();
        }
        Log.d(TAG, "stopRecording<<<");
    }

    public void join() {
        Log.d(TAG, "join>>>");
        if (this.mAudioEncoder != null) {
            this.mAudioEncoder.join();
            this.mAudioEncoder = null;
        }
        if (this.mVideoEncoder != null) {
            this.mVideoEncoder.join();
            this.mVideoEncoder = null;
        }
        Log.d(TAG, "join<<<");
    }

    public synchronized boolean isStarted() {
        return this.mIsStarted;
    }

    public void setOrientationHint(int degrees) {
        this.mMediaMuxer.setOrientationHint(degrees);
    }

    void addEncoder(MediaEncoder encoder) {
        int i;
        int i2 = 1;
        if (encoder instanceof MediaVideoEncoder) {
            if (this.mVideoEncoder != null) {
                throw new IllegalArgumentException("video encoder already added!");
            }
            this.mVideoEncoder = encoder;
        } else if (!(encoder instanceof MediaAudioEncoder)) {
            throw new IllegalArgumentException("unsupported encoder!");
        } else if (this.mAudioEncoder != null) {
            throw new IllegalArgumentException("audio encoder already added!");
        } else {
            this.mAudioEncoder = encoder;
        }
        if (this.mVideoEncoder != null) {
            i = 1;
        } else {
            i = 0;
        }
        if (this.mAudioEncoder == null) {
            i2 = 0;
        }
        this.mEncoderCount = i + i2;
    }

    synchronized boolean start() {
        Log.d(TAG, "start: startedCount=" + this.mStartedCount);
        this.mStartedCount++;
        if (this.mEncoderCount > 0 && this.mStartedCount == this.mEncoderCount) {
            this.mMediaMuxer.start();
            this.mIsStarted = true;
            notifyAll();
            Log.d(TAG, "MediaMuxer started");
        }
        return this.mIsStarted;
    }

    synchronized boolean stop() {
        boolean z = false;
        synchronized (this) {
            Log.d(TAG, "stop: startedCount=" + this.mStartedCount);
            this.mStartedCount--;
            if (this.mEncoderCount > 0 && this.mStartedCount <= 0) {
                this.mMediaMuxer.stop();
                this.mMediaMuxer.release();
                this.mIsStarted = false;
                Log.v(TAG, "MediaMuxer stopped");
            }
            if (this.mStartedCount <= 0) {
                z = true;
            }
        }
        return z;
    }

    synchronized int addTrack(MediaFormat format) {
        int trackIndex;
        if (this.mIsStarted) {
            throw new IllegalStateException("muxer already started");
        }
        trackIndex = this.mMediaMuxer.addTrack(format);
        Log.v(TAG, "addTrack: trackNum=" + this.mEncoderCount + " trackIndex=" + trackIndex + " format=" + format);
        return trackIndex;
    }

    synchronized void writeSampleData(int trackIndex, ByteBuffer byteBuf, BufferInfo bufferInfo) {
        if (this.mStartedCount > 0) {
            this.mMediaMuxer.writeSampleData(trackIndex, byteBuf, bufferInfo);
        }
    }
}
