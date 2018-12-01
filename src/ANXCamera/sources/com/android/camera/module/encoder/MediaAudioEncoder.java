package com.android.camera.module.encoder;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import java.io.IOException;

public class MediaAudioEncoder extends MediaEncoder {
    private static final int[] AUDIO_SOURCES = new int[]{1, 0, 5};
    private static final String TAG = MediaAudioEncoder.class.getSimpleName();
    private AudioThread mAudioThread = null;
    protected final Object mMediaCodecLock = new Object();

    private class AudioThread extends Thread {
        private AudioRecord audioRecord;

        public AudioThread(AudioRecord record) {
            this.audioRecord = record;
        }

        /* JADX WARNING: Missing block: B:13:0x0027, code:
            r6.this$0.frameAvailableSoon();
     */
        /* JADX WARNING: Missing block: B:15:?, code:
            r6.audioRecord.stop();
     */
        /* JADX WARNING: Missing block: B:20:0x0042, code:
            r0.clear();
            r1 = r6.audioRecord.read(r0, 1024);
     */
        /* JADX WARNING: Missing block: B:21:0x004d, code:
            if (r1 <= 0) goto L_0x001b;
     */
        /* JADX WARNING: Missing block: B:22:0x004f, code:
            r0.position(r1);
            r0.flip();
            r3 = r6.this$0.mMediaCodecLock;
     */
        /* JADX WARNING: Missing block: B:23:0x0059, code:
            monitor-enter(r3);
     */
        /* JADX WARNING: Missing block: B:26:0x005e, code:
            if (r6.this$0.mSkipFrame != false) goto L_0x006b;
     */
        /* JADX WARNING: Missing block: B:27:0x0060, code:
            r6.this$0.encode(r0, r1, r6.this$0.getPTSUs());
     */
        /* JADX WARNING: Missing block: B:29:?, code:
            monitor-exit(r3);
     */
        /* JADX WARNING: Missing block: B:30:0x006c, code:
            r6.this$0.frameAvailableSoon();
     */
        public void run() {
            /*
            r6 = this;
            r2 = -19;
            android.os.Process.setThreadPriority(r2);
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0079 }
            r2 = r2.mIsCapturing;	 Catch:{ all -> 0x0079 }
            if (r2 == 0) goto L_0x0031;
        L_0x000b:
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.TAG;	 Catch:{ all -> 0x0079 }
            r3 = "audioThread>>>";
            com.android.camera.log.Log.d(r2, r3);	 Catch:{ all -> 0x0079 }
            r2 = 1024; // 0x400 float:1.435E-42 double:5.06E-321;
            r0 = java.nio.ByteBuffer.allocateDirect(r2);	 Catch:{ all -> 0x0079 }
        L_0x001b:
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0072 }
            r3 = r2.mSync;	 Catch:{ all -> 0x0072 }
            monitor-enter(r3);	 Catch:{ all -> 0x0072 }
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0080 }
            r2 = r2.mRequestStop;	 Catch:{ all -> 0x0080 }
            if (r2 == 0) goto L_0x0041;
        L_0x0026:
            monitor-exit(r3);	 Catch:{ all -> 0x0072 }
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0072 }
            r2.frameAvailableSoon();	 Catch:{ all -> 0x0072 }
            r2 = r6.audioRecord;	 Catch:{ all -> 0x0079 }
            r2.stop();	 Catch:{ all -> 0x0079 }
        L_0x0031:
            r2 = r6.audioRecord;
            r2.release();
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.TAG;
            r3 = "audioThread<<<";
            com.android.camera.log.Log.d(r2, r3);
            return;
        L_0x0041:
            monitor-exit(r3);	 Catch:{ all -> 0x0072 }
            r0.clear();	 Catch:{ all -> 0x0072 }
            r2 = r6.audioRecord;	 Catch:{ all -> 0x0072 }
            r3 = 1024; // 0x400 float:1.435E-42 double:5.06E-321;
            r1 = r2.read(r0, r3);	 Catch:{ all -> 0x0072 }
            if (r1 <= 0) goto L_0x001b;
        L_0x004f:
            r0.position(r1);	 Catch:{ all -> 0x0072 }
            r0.flip();	 Catch:{ all -> 0x0072 }
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0072 }
            r3 = r2.mMediaCodecLock;	 Catch:{ all -> 0x0072 }
            monitor-enter(r3);	 Catch:{ all -> 0x0072 }
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0083 }
            r2 = r2.mSkipFrame;	 Catch:{ all -> 0x0083 }
            if (r2 != 0) goto L_0x006b;
        L_0x0060:
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0083 }
            r4 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0083 }
            r4 = r4.getPTSUs();	 Catch:{ all -> 0x0083 }
            r2.encode(r0, r1, r4);	 Catch:{ all -> 0x0083 }
        L_0x006b:
            monitor-exit(r3);	 Catch:{ all -> 0x0072 }
            r2 = com.android.camera.module.encoder.MediaAudioEncoder.this;	 Catch:{ all -> 0x0072 }
            r2.frameAvailableSoon();	 Catch:{ all -> 0x0072 }
            goto L_0x001b;
        L_0x0072:
            r2 = move-exception;
            r3 = r6.audioRecord;	 Catch:{ all -> 0x0079 }
            r3.stop();	 Catch:{ all -> 0x0079 }
            throw r2;	 Catch:{ all -> 0x0079 }
        L_0x0079:
            r2 = move-exception;
            r3 = r6.audioRecord;
            r3.release();
            throw r2;
        L_0x0080:
            r2 = move-exception;
            monitor-exit(r3);	 Catch:{ all -> 0x0072 }
            throw r2;	 Catch:{ all -> 0x0072 }
        L_0x0083:
            r2 = move-exception;
            monitor-exit(r3);	 Catch:{ all -> 0x0072 }
            throw r2;	 Catch:{ all -> 0x0072 }
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.MediaAudioEncoder.AudioThread.run():void");
        }
    }

    public MediaAudioEncoder(MediaMuxerWrapper muxer, MediaEncoderListener listener) {
        super(muxer, listener);
    }

    protected void prepare() throws IOException {
        Log.v(TAG, "prepare>>>");
        this.mTrackIndex = -1;
        this.mMuxerStarted = false;
        this.mIsEOS = false;
        MediaCodecInfo audioCodecInfo = selectAudioCodec("audio/mp4a-latm");
        if (audioCodecInfo == null) {
            Log.e(TAG, "no appropriate codec for audio/mp4a-latm");
            return;
        }
        Log.d(TAG, "selected codec: " + audioCodecInfo.getName());
        MediaFormat audioFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", 44100, 1);
        audioFormat.setInteger("aac-profile", 2);
        audioFormat.setInteger("channel-mask", 16);
        audioFormat.setInteger("bitrate", 64000);
        audioFormat.setInteger("channel-count", 1);
        Log.d(TAG, "format: " + audioFormat);
        this.mMediaCodec = MediaCodec.createEncoderByType("audio/mp4a-latm");
        this.mMediaCodec.configure(audioFormat, null, null, 1);
        this.mMediaCodec.start();
        if (this.mListener != null) {
            this.mListener.onPrepared(this);
        }
        Log.v(TAG, "prepare<<<");
    }

    protected boolean startRecording(long startOffset) {
        boolean succeed = super.startRecording(startOffset);
        if (!succeed) {
            return false;
        }
        if (this.mAudioThread == null) {
            AudioRecord audioRecord = initAudioRecord();
            if (audioRecord == null) {
                Log.e(TAG, "failed to initialize AudioRecord");
                return false;
            }
            try {
                audioRecord.startRecording();
                if (3 == audioRecord.getRecordingState()) {
                    this.mAudioThread = new AudioThread(audioRecord);
                    this.mAudioThread.start();
                } else {
                    succeed = false;
                }
            } catch (IllegalStateException e) {
                Log.e(TAG, e.getMessage(), e);
                succeed = false;
            }
            if (!(succeed || audioRecord == null)) {
                audioRecord.stop();
                audioRecord.release();
            }
        }
        return succeed;
    }

    protected void release() {
        this.mAudioThread = null;
        synchronized (this.mMediaCodecLock) {
            super.release();
        }
    }

    private AudioRecord initAudioRecord() {
        int minBufferSize = AudioRecord.getMinBufferSize(44100, 16, 2);
        int bufferSize = 25600;
        if (25600 < minBufferSize) {
            bufferSize = (((minBufferSize / 1024) + 1) * 1024) * 2;
        }
        AudioRecord audioRecord = null;
        for (int source : AUDIO_SOURCES) {
            audioRecord = new AudioRecord(source, 44100, 16, 2, bufferSize);
            if (audioRecord.getState() != 1) {
                audioRecord.release();
                audioRecord = null;
            }
            if (audioRecord != null) {
                break;
            }
        }
        return audioRecord;
    }

    private static MediaCodecInfo selectAudioCodec(String mimeType) {
        int numCodecs = MediaCodecList.getCodecCount();
        for (int i = 0; i < numCodecs; i++) {
            MediaCodecInfo codecInfo = MediaCodecList.getCodecInfoAt(i);
            if (codecInfo.isEncoder()) {
                String[] types = codecInfo.getSupportedTypes();
                for (String equalsIgnoreCase : types) {
                    if (equalsIgnoreCase.equalsIgnoreCase(mimeType)) {
                        return codecInfo;
                    }
                }
                continue;
            }
        }
        return null;
    }
}
