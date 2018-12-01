package com.android.camera;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.SoundPool;
import android.media.SoundPool.Builder;
import android.media.SoundPool.OnLoadCompleteListener;
import com.android.camera.log.Log;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.IOException;

public class MiuiCameraSound implements Consumer<Integer> {
    private static final String[] SOUND_FILES = new String[]{"camera_click_v9.mp3", "camera_focus_v9.mp3", "video_record_start_v9.ogg", "video_record_end_v9.ogg", "camera_fast_burst_v9.ogg", "sound_shuter_delay_bee.ogg", "/system/media/audio/ui/NumberPickerValueChange.ogg", "audio_capture.ogg"};
    private final AssetManager mAssetManager;
    private final AudioManager mAudioManager;
    private Disposable mDisposable;
    private FlowableEmitter<Integer> mFlowableEmitter;
    private long mLastPlayTime = 0;
    private OnLoadCompleteListener mLoadCompleteListener = new OnLoadCompleteListener() {
        public void onLoadComplete(SoundPool soundPool, int sampleId, int status) {
            if (status != 0) {
                Log.e("MiuiCameraSound", "Unable to load sound for playback (status: " + status + ")");
            } else if (MiuiCameraSound.this.mSoundIdToPlay == sampleId) {
                soundPool.play(sampleId, 1.0f, 1.0f, 0, 0, 1.0f);
                MiuiCameraSound.this.mSoundIdToPlay = -1;
            }
        }
    };
    private int mSoundIdToPlay;
    private int[] mSoundIds;
    private SoundPool mSoundPool;

    public MiuiCameraSound(Context context) {
        int i;
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
        this.mAssetManager = context.getAssets();
        Builder soundBuilder = new Builder();
        soundBuilder.setMaxStreams(1);
        AudioAttributes.Builder builder = new AudioAttributes.Builder();
        if (Device.isSupportedMuteCameraSound()) {
            i = 1;
        } else {
            i = 7;
        }
        soundBuilder.setAudioAttributes(builder.setInternalLegacyStreamType(i).build());
        this.mSoundPool = soundBuilder.build();
        this.mSoundPool.setOnLoadCompleteListener(this.mLoadCompleteListener);
        this.mSoundIds = new int[SOUND_FILES.length];
        for (int i2 = 0; i2 < this.mSoundIds.length; i2++) {
            this.mSoundIds[i2] = -1;
        }
        this.mSoundIdToPlay = -1;
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> e) throws Exception {
                MiuiCameraSound.this.mFlowableEmitter = e;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.io()).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer integer) throws Exception {
                Log.e("MiuiCameraSound", "play sound too fast: " + integer.toString());
            }
        }).subscribe((Consumer) this);
    }

    public synchronized void load(int soundName) {
        if (soundName >= 0) {
            if (soundName < SOUND_FILES.length) {
                if (this.mSoundIds[soundName] == -1) {
                    if (SOUND_FILES[soundName].startsWith("/")) {
                        this.mSoundIds[soundName] = this.mSoundPool.load(SOUND_FILES[soundName], 1);
                    } else {
                        this.mSoundIds[soundName] = loadFromAsset(soundName);
                    }
                }
            }
        }
        throw new RuntimeException("Unknown sound requested: " + soundName);
    }

    private int loadFromAsset(int soundName) {
        int soundId = -1;
        AssetFileDescriptor afd = null;
        try {
            afd = this.mAssetManager.openFd(SOUND_FILES[soundName]);
            soundId = this.mSoundPool.load(afd, 1);
            if (afd != null) {
                try {
                    afd.close();
                } catch (IOException e) {
                    Log.e("MiuiCameraSound", "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e.printStackTrace();
                }
            }
        } catch (IOException e2) {
            e2.printStackTrace();
            if (afd != null) {
                try {
                    afd.close();
                } catch (IOException e22) {
                    Log.e("MiuiCameraSound", "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e22.printStackTrace();
                }
            }
        } catch (Throwable th) {
            if (afd != null) {
                try {
                    afd.close();
                } catch (IOException e222) {
                    Log.e("MiuiCameraSound", "IOException occurs when closing Camera Sound AssetFileDescriptor.");
                    e222.printStackTrace();
                }
            }
        }
        return soundId;
    }

    private synchronized void play(int soundName, int times) {
        if (soundName >= 0) {
            if (soundName < SOUND_FILES.length) {
                if (this.mSoundIds[soundName] == -1) {
                    if (SOUND_FILES[soundName].startsWith("/")) {
                        this.mSoundIdToPlay = this.mSoundPool.load(SOUND_FILES[soundName], 1);
                    } else {
                        this.mSoundIdToPlay = loadFromAsset(soundName);
                    }
                    this.mSoundIds[soundName] = this.mSoundIdToPlay;
                } else {
                    this.mSoundPool.play(this.mSoundIds[soundName], 1.0f, 1.0f, 0, times - 1, 1.0f);
                    this.mLastPlayTime = System.currentTimeMillis();
                }
            }
        }
        throw new RuntimeException("Unknown sound requested: " + soundName);
    }

    public void release() {
        if (!(this.mDisposable == null || (this.mDisposable.isDisposed() ^ 1) == 0)) {
            this.mDisposable.dispose();
        }
        if (this.mSoundPool != null) {
            this.mSoundPool.release();
            this.mSoundPool = null;
        }
    }

    private void playSound(int soundId, int times) {
        if (!Device.isSupportedMuteCameraSound() || this.mAudioManager.getRingerMode() == 2) {
            play(soundId, times);
        }
    }

    public void playSound(int soundId) {
        if (!this.mFlowableEmitter.isCancelled()) {
            this.mFlowableEmitter.onNext(Integer.valueOf(soundId));
        }
    }

    public void accept(@NonNull Integer soundId) throws Exception {
        playSound(soundId.intValue(), 1);
    }
}
