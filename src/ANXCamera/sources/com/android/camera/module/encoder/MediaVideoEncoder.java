package com.android.camera.module.encoder;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.opengl.EGLContext;
import android.view.Surface;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import java.io.IOException;
import java.util.Locale;

public class MediaVideoEncoder extends MediaEncoder {
    private static final String TAG = MediaVideoEncoder.class.getSimpleName();
    protected static int[] sRecognizedFormats = new int[]{2130708361};
    private int mExtraFrames;
    private RenderHandler mRenderHandler;
    private long mRequestStopTime;
    private Surface mSurface;
    private final int mVideoHeight;
    private final int mVideoWidth;

    public MediaVideoEncoder(MediaMuxerWrapper muxer, MediaEncoderListener listener, int videoWidth, int videoHeight) {
        super(muxer, listener);
        Log.d(TAG, String.format(Locale.ENGLISH, "init: videoSize=%dx%d", new Object[]{Integer.valueOf(videoWidth), Integer.valueOf(videoHeight)}));
        this.mVideoWidth = videoWidth;
        this.mVideoHeight = videoHeight;
        int previewWidth = videoWidth;
        int previewHeight = videoHeight;
        if (videoWidth > videoHeight) {
            previewWidth = videoHeight;
            previewHeight = videoWidth;
        }
        this.mRenderHandler = RenderHandler.createHandler(TAG, previewWidth, previewHeight);
    }

    public boolean frameAvailableSoon(DrawExtTexAttribute ext) {
        boolean draw = super.frameAvailableSoon();
        if (draw && (this.mSkipFrame ^ 1) != 0) {
            this.mRenderHandler.draw(ext);
            if (this.mRequestStopTime > 0) {
                this.mExtraFrames--;
                if (this.mExtraFrames <= 0) {
                    super.stopRecording();
                }
            }
        }
        return draw;
    }

    protected void prepare() throws IOException {
        Log.v(TAG, "prepare>>>");
        this.mTrackIndex = -1;
        this.mMuxerStarted = false;
        this.mIsEOS = false;
        MediaCodecInfo videoCodecInfo = selectVideoCodec("video/avc");
        if (videoCodecInfo == null) {
            Log.e(TAG, "no appropriate codec for video/avc");
            return;
        }
        Log.d(TAG, "selected codec: " + videoCodecInfo.getName());
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", this.mVideoWidth, this.mVideoHeight);
        format.setInteger("color-format", 2130708361);
        format.setInteger("bitrate", calcBitRate());
        format.setInteger("frame-rate", 25);
        format.setInteger("i-frame-interval", 1);
        Log.d(TAG, "format: " + format);
        this.mMediaCodec = MediaCodec.createEncoderByType("video/avc");
        this.mMediaCodec.configure(format, null, null, 1);
        this.mSurface = this.mMediaCodec.createInputSurface();
        this.mMediaCodec.start();
        if (this.mListener != null) {
            this.mListener.onPrepared(this);
        }
        Log.v(TAG, "prepare<<<");
    }

    public void setEglContext(EGLContext sharedContext) {
        Log.d(TAG, "setEglContext");
        this.mRenderHandler.setEglContext(sharedContext, this.mSurface, true);
    }

    protected boolean startRecording(long startOffset) {
        boolean succeed = super.startRecording(startOffset);
        this.mRequestStopTime = -1;
        this.mExtraFrames = 0;
        return succeed;
    }

    protected void stopRecording() {
        super.stopRecording();
    }

    protected void release() {
        Log.d(TAG, "release");
        if (this.mSurface != null) {
            this.mSurface.release();
            this.mSurface = null;
        }
        if (this.mRenderHandler != null) {
            this.mRenderHandler.release();
            this.mRenderHandler = null;
        }
        super.release();
    }

    private int calcBitRate() {
        int bitrate = (int) ((((float) this.mVideoWidth) * 6.25f) * ((float) this.mVideoHeight));
        Log.d(TAG, String.format(Locale.ENGLISH, "bitrate=%d", new Object[]{Integer.valueOf(bitrate)}));
        return bitrate;
    }

    protected static final MediaCodecInfo selectVideoCodec(String mimeType) {
        Log.v(TAG, "selectVideoCodec>>>" + mimeType);
        int numCodecs = MediaCodecList.getCodecCount();
        for (int i = 0; i < numCodecs; i++) {
            MediaCodecInfo codecInfo = MediaCodecList.getCodecInfoAt(i);
            if (codecInfo.isEncoder()) {
                String[] types = codecInfo.getSupportedTypes();
                for (String equalsIgnoreCase : types) {
                    if (equalsIgnoreCase.equalsIgnoreCase(mimeType) && selectColorFormat(codecInfo, mimeType) > 0) {
                        return codecInfo;
                    }
                }
                continue;
            }
        }
        Log.v(TAG, "selectVideoCodec<<<");
        return null;
    }

    protected static final int selectColorFormat(MediaCodecInfo codecInfo, String mimeType) {
        Log.v(TAG, "selectColorFormat>>>codec:" + codecInfo.getName() + "/" + mimeType);
        int result = 0;
        try {
            Thread.currentThread().setPriority(10);
            CodecCapabilities caps = codecInfo.getCapabilitiesForType(mimeType);
            for (int colorFormat : caps.colorFormats) {
                if (isRecognizedVideoFormat(colorFormat)) {
                    result = colorFormat;
                    break;
                }
            }
            Log.v(TAG, "selectColorFormat<<<colorFormat=" + Integer.toHexString(result));
            return result;
        } finally {
            Thread.currentThread().setPriority(5);
        }
    }

    private static boolean isRecognizedVideoFormat(int colorFormat) {
        int n = sRecognizedFormats != null ? sRecognizedFormats.length : 0;
        for (int i = 0; i < n; i++) {
            if (sRecognizedFormats[i] == colorFormat) {
                return true;
            }
        }
        return false;
    }

    protected void signalEndOfInputStream() {
        Log.d(TAG, "signalEndOfInputStream");
        this.mMediaCodec.signalEndOfInputStream();
        this.mIsEOS = true;
    }
}
