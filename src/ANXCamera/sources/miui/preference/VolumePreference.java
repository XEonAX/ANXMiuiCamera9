package miui.preference;

import android.app.Dialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.preference.Preference.BaseSavedState;
import android.preference.PreferenceManager;
import android.preference.PreferenceManager.OnActivityStopListener;
import android.provider.Settings.System;
import android.support.v4.view.MotionEventCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.miui.internal.R;
import miui.reflect.Field;
import miui.reflect.Method;

public class VolumePreference extends SeekBarDialogPreference implements OnActivityStopListener, OnKeyListener {
    private static final String TAG = "VolumePreference";
    private static final Method ix = Method.of(PreferenceManager.class, "registerOnActivityStopListener", "(Landroid/preference/PreferenceManager$OnActivityStopListener;)V");
    private static final Method iy = Method.of(PreferenceManager.class, "unregisterOnActivityStopListener", "(Landroid/preference/PreferenceManager$OnActivityStopListener;)V");
    private static final int iz = eu();
    private SeekBarVolumizer iA;
    private int iB;

    private static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        VolumeStore iC = new VolumeStore();

        public SavedState(Parcel parcel) {
            super(parcel);
            this.iC.volume = parcel.readInt();
            this.iC.originalVolume = parcel.readInt();
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.iC.volume);
            parcel.writeInt(this.iC.originalVolume);
        }

        VolumeStore ev() {
            return this.iC;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }
    }

    public class SeekBarVolumizer implements OnSeekBarChangeListener, Callback {
        private static final int iD = 1000;
        private static final int iE = 0;
        private static final int iF = 1;
        private static final int iG = 2;
        private AudioManager iH;
        private Handler iI;
        private int iJ;
        private int iK;
        private Ringtone iL;
        private SeekBar iM;
        private int iN;
        private int iO;
        private ContentObserver iP;
        private Context mContext;

        public SeekBarVolumizer(VolumePreference volumePreference, Context context, SeekBar seekBar, int i) {
            this(context, seekBar, i, null);
        }

        public SeekBarVolumizer(Context context, SeekBar seekBar, int i, Uri uri) {
            this.iJ = -1;
            this.iO = -1;
            this.iP = new ContentObserver(this.iI) {
                public void onChange(boolean z) {
                    super.onChange(z);
                    if (SeekBarVolumizer.this.iM != null && SeekBarVolumizer.this.iH != null) {
                        SeekBarVolumizer.this.iM.setProgress(SeekBarVolumizer.this.iH.getStreamVolume(SeekBarVolumizer.this.iN));
                    }
                }
            };
            this.mContext = context;
            this.iH = (AudioManager) context.getSystemService("audio");
            this.iN = i;
            this.iM = seekBar;
            HandlerThread handlerThread = new HandlerThread("VolumePreference.CallbackHandler");
            handlerThread.start();
            this.iI = new Handler(handlerThread.getLooper(), this);
            ew(seekBar, uri);
        }

        private void ew(SeekBar seekBar, Uri uri) {
            seekBar.setMax(this.iH.getStreamMaxVolume(this.iN));
            this.iK = this.iH.getStreamVolume(this.iN);
            seekBar.setProgress(this.iK);
            seekBar.setOnSeekBarChangeListener(this);
            this.mContext.getContentResolver().registerContentObserver(System.getUriFor(System.VOLUME_SETTINGS[this.iN]), false, this.iP);
            if (uri == null) {
                if (this.iN == 2) {
                    uri = System.DEFAULT_RINGTONE_URI;
                } else if (this.iN == 5) {
                    uri = System.DEFAULT_NOTIFICATION_URI;
                } else {
                    uri = System.DEFAULT_ALARM_ALERT_URI;
                }
            }
            this.iL = RingtoneManager.getRingtone(this.mContext, uri);
            if (this.iL != null) {
                this.iL.setStreamType(this.iN);
            }
        }

        public boolean handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    this.iH.setStreamVolume(this.iN, this.iJ, 0);
                    break;
                case 1:
                    ex();
                    break;
                case 2:
                    ey();
                    break;
                default:
                    Log.e(VolumePreference.TAG, "invalid SeekBarVolumizer message: " + message.what);
                    break;
            }
            return true;
        }

        private void eA() {
            this.iI.removeMessages(1);
            this.iI.sendMessageDelayed(this.iI.obtainMessage(1), (long) (isSamplePlaying() ? iD : 0));
        }

        private void ex() {
            if (!isSamplePlaying()) {
                VolumePreference.this.onSampleStarting(this);
                if (this.iL != null) {
                    this.iL.play();
                }
            }
        }

        private void eB() {
            this.iI.removeMessages(1);
            this.iI.removeMessages(2);
            this.iI.sendMessage(this.iI.obtainMessage(2));
        }

        private void ey() {
            if (this.iL != null) {
                this.iL.stop();
            }
        }

        public void stop() {
            eB();
            this.mContext.getContentResolver().unregisterContentObserver(this.iP);
            this.iM.setOnSeekBarChangeListener(null);
        }

        public void revertVolume() {
            this.iH.setStreamVolume(this.iN, this.iK, 0);
        }

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            if (z) {
                ez(i);
            }
        }

        void ez(int i) {
            this.iJ = i;
            this.iI.removeMessages(0);
            this.iI.sendMessage(this.iI.obtainMessage(0));
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            eA();
        }

        public boolean isSamplePlaying() {
            return this.iL != null ? this.iL.isPlaying() : false;
        }

        public void startSample() {
            eA();
        }

        public void stopSample() {
            eB();
        }

        public SeekBar getSeekBar() {
            return this.iM;
        }

        public void changeVolumeBy(int i) {
            this.iM.incrementProgressBy(i);
            ez(this.iM.getProgress());
            eA();
            this.iO = -1;
        }

        public void muteVolume() {
            if (this.iO != -1) {
                this.iM.setProgress(this.iO);
                ez(this.iO);
                eA();
                this.iO = -1;
                return;
            }
            this.iO = this.iM.getProgress();
            this.iM.setProgress(0);
            eB();
            ez(0);
        }

        public void onSaveInstanceState(VolumeStore volumeStore) {
            if (this.iJ >= 0) {
                volumeStore.volume = this.iJ;
                volumeStore.originalVolume = this.iK;
            }
        }

        public void onRestoreInstanceState(VolumeStore volumeStore) {
            if (volumeStore.volume != -1) {
                this.iK = volumeStore.originalVolume;
                this.iJ = volumeStore.volume;
                ez(this.iJ);
            }
        }
    }

    public static class VolumeStore {
        public int originalVolume = -1;
        public int volume = -1;
    }

    private static int eu() {
        try {
            return Field.of("android.R.styleable", "VolumePreference_streamType", "I").getInt(null);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public VolumePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.VolumePreference, 0, 0);
        this.iB = obtainStyledAttributes.getInt(iz, 0);
        obtainStyledAttributes.recycle();
    }

    public void setStreamType(int i) {
        this.iB = i;
    }

    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        this.iA = new SeekBarVolumizer(this, getContext(), (SeekBar) view.findViewById(R.id.seekbar), this.iB);
        ix.invoke(PreferenceManager.class, getPreferenceManager(), new Object[]{this});
        view.setOnKeyListener(this);
        view.setFocusableInTouchMode(true);
        view.requestFocus();
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (this.iA == null) {
            return true;
        }
        boolean z = keyEvent.getAction() == 0;
        switch (i) {
            case MotionEventCompat.AXIS_DISTANCE /*24*/:
                if (z) {
                    this.iA.changeVolumeBy(1);
                }
                return true;
            case MotionEventCompat.AXIS_TILT /*25*/:
                if (z) {
                    this.iA.changeVolumeBy(-1);
                }
                return true;
            case 164:
                if (z) {
                    this.iA.muteVolume();
                }
                return true;
            default:
                return false;
        }
    }

    protected void onDialogClosed(boolean z) {
        super.onDialogClosed(z);
        if (!(z || this.iA == null)) {
            this.iA.revertVolume();
        }
        et();
    }

    public void onActivityStop() {
        if (this.iA != null) {
            this.iA.eB();
        }
    }

    private void et() {
        iy.invoke(PreferenceManager.class, getPreferenceManager(), new Object[]{this});
        if (this.iA != null) {
            Dialog dialog = getDialog();
            if (dialog != null && dialog.isShowing()) {
                View findViewById = dialog.getWindow().getDecorView().findViewById(R.id.seekbar);
                if (findViewById != null) {
                    findViewById.setOnKeyListener(null);
                }
                this.iA.revertVolume();
            }
            this.iA.stop();
            this.iA = null;
        }
    }

    protected void onSampleStarting(SeekBarVolumizer seekBarVolumizer) {
        if (this.iA != null && seekBarVolumizer != this.iA) {
            this.iA.stopSample();
        }
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable onSaveInstanceState = super.onSaveInstanceState();
        if (isPersistent()) {
            return onSaveInstanceState;
        }
        Parcelable savedState = new SavedState(onSaveInstanceState);
        if (this.iA != null) {
            this.iA.onSaveInstanceState(savedState.ev());
        }
        return savedState;
    }

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable == null || (parcelable.getClass().equals(SavedState.class) ^ 1) != 0) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.iA != null) {
            this.iA.onRestoreInstanceState(savedState.ev());
        }
    }
}
