package com.android.camera;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.view.MenuItem;
import android.widget.Toast;
import com.android.camera.Util.PackageInstallerListener;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.PriorityStorageBroadcastReceiver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.PreviewListPreference;
import java.util.ArrayList;
import java.util.List;
import miui.preference.PreferenceActivity;

public abstract class BasePreferenceActivity extends PreferenceActivity implements OnPreferenceChangeListener, OnPreferenceClickListener {
    private static final String TAG = BasePreferenceActivity.class.getSimpleName();
    private PackageInstallerListener mAppInstalledListener = new PackageInstallerListener() {
        public void onPackageInstalled(String packageName, boolean success) {
            if (success && TextUtils.equals(packageName, "com.xiaomi.scanner")) {
                final CheckBoxPreference scanQRCode = (CheckBoxPreference) BasePreferenceActivity.this.mPreferenceGroup.findPreference("pref_scan_qrcode_key");
                if (scanQRCode != null) {
                    BasePreferenceActivity.this.runOnUiThread(new Runnable() {
                        public void run() {
                            scanQRCode.setChecked(true);
                            BasePreferenceActivity.this.onPreferenceChange(scanQRCode, Boolean.TRUE);
                        }
                    });
                }
            }
        }
    };
    private Preference mDualCameraEnablePreference;
    private Preference mDualCameraSatEnablePreference;
    private Preference mFaceDetectionAutoHiddenPreference;
    private Preference mFaceDetectionPreference;
    private int mFromWhere;
    private boolean mHasReset;
    private int mLabOptionsHitCountDown;
    private Preference mMFnrSatEnablePreference;
    private Preference mParallelProcessEnablePreference;
    private Preference mPortraitWithFaceBeautyPreference;
    protected PreferenceScreen mPreferenceGroup;
    protected CameraSettingPreferences mPreferences;
    private Preference mSREnablePreference;

    protected abstract int getPreferenceXml();

    protected abstract void onSettingChanged(int i);

    public void onCreate(Bundle icicle) {
        super.onCreate(icicle);
        Util.updateCountryIso(this);
        this.mFromWhere = getIntent().getIntExtra("from_where", 0);
        this.mPreferences = CameraSettingPreferences.instance();
        CameraSettings.upgradeGlobalPreferences();
        Storage.initStorage(this);
        initializeActivity();
        if (getIntent().getBooleanExtra("StartActivityWhenLocked", false)) {
            getWindow().addFlags(524288);
        }
    }

    protected void onResume() {
        super.onResume();
        updateQRCodeEntry();
        if (CameraSettings.isLabOptionsVisible()) {
            this.mLabOptionsHitCountDown = -1;
        } else {
            this.mLabOptionsHitCountDown = 8;
        }
    }

    private void initializeActivity() {
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup != null) {
            this.mPreferenceGroup.removeAll();
        }
        addPreferencesFromResource(getPreferenceXml());
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup == null) {
            Log.e(TAG, "fail to init PreferenceGroup");
            finish();
        }
        this.mFaceDetectionPreference = this.mPreferenceGroup.findPreference("pref_camera_facedetection_key");
        this.mPortraitWithFaceBeautyPreference = this.mPreferenceGroup.findPreference("pref_camera_portrait_with_facebeauty_key");
        this.mFaceDetectionAutoHiddenPreference = this.mPreferenceGroup.findPreference("pref_camera_facedetection_auto_hidden_key");
        this.mDualCameraEnablePreference = this.mPreferenceGroup.findPreference("pref_camera_dual_enable_key");
        this.mDualCameraSatEnablePreference = this.mPreferenceGroup.findPreference("pref_camera_dual_sat_enable_key");
        this.mMFnrSatEnablePreference = this.mPreferenceGroup.findPreference("pref_camera_mfnr_sat_enable_key");
        this.mSREnablePreference = this.mPreferenceGroup.findPreference("pref_camera_sr_enable_key");
        this.mParallelProcessEnablePreference = this.mPreferenceGroup.findPreference("pref_camera_parallel_process_enable_key");
        registerListener();
        filterByCloud();
        filterByPreference();
        filterByFrom();
        filterByDeviceID();
        filterByIntent();
        filterGroup();
        updateEntries();
        updatePreferences(this.mPreferenceGroup, this.mPreferences);
        updateConflictPreference(null);
    }

    private void filterByPreference() {
        PreviewListPreference videoQuality = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_video_quality_key");
        if (videoQuality != null) {
            filterUnsupportedOptions(this.mPreferenceGroup, videoQuality, CameraSettings.getSupportedVideoQuality(CameraSettings.getCameraId()));
        }
        PreviewListPreference videoHfr = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_video_hfr_key");
        if (videoHfr != null) {
            filterUnsupportedOptions(this.mPreferenceGroup, videoHfr, CameraSettings.getSupportedHfrSettings(CameraSettings.getCameraId()));
        }
        String speed = DataRepository.dataItemRunning().getVideoSpeed();
        if (Device.IS_X9 && ("normal".equals(speed) ^ 1) != 0) {
            removePreference(this.mPreferenceGroup, "pref_camera_movie_solid_key");
        }
        if (!CameraSettings.isLabOptionsVisible()) {
            removePreference(this.mPreferenceGroup, "pref_camera_facedetection_key");
            removePreference(this.mPreferenceGroup, "pref_camera_portrait_with_facebeauty_key");
            removePreference(this.mPreferenceGroup, "pref_camera_facedetection_auto_hidden_key");
            removePreference(this.mPreferenceGroup, "pref_camera_dual_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_dual_sat_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_mfnr_sat_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_sr_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_parallel_process_enable_key");
        }
    }

    private void filterByCloud() {
        for (String key : DataRepository.dataCloudMgr().DataCloudFeature().getAllDisabledFeatures()) {
            removePreference(this.mPreferenceGroup, key);
        }
    }

    private void registerListener() {
        registerListener(this.mPreferenceGroup, this);
        Preference restore = this.mPreferenceGroup.findPreference("pref_restore");
        if (restore != null) {
            restore.setOnPreferenceClickListener(this);
        }
        Preference priorityStorage = this.mPreferenceGroup.findPreference("pref_priority_storage");
        if (priorityStorage != null) {
            priorityStorage.setOnPreferenceClickListener(this);
        }
        Preference faceDetection = this.mPreferenceGroup.findPreference("pref_camera_facedetection_key");
        if (faceDetection != null) {
            faceDetection.setOnPreferenceClickListener(this);
        }
        Preference scanQRCode = this.mPreferenceGroup.findPreference("pref_scan_qrcode_key");
        if (scanQRCode != null) {
            scanQRCode.setOnPreferenceClickListener(this);
        }
    }

    private void filterByFrom() {
        if (this.mFromWhere == 163 || this.mFromWhere == 165 || this.mFromWhere == 166 || this.mFromWhere == 167 || this.mFromWhere == 171) {
            removePreference(this.mPreferenceGroup, "category_camcorder_setting");
        } else if (this.mFromWhere == 161 || this.mFromWhere == 162 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 170) {
            removeNonVideoPreference();
        }
        if (this.mFromWhere == 161 || this.mFromWhere == 162 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 170 || this.mFromWhere == 166) {
            removeIncompatibleAdvancePreference();
        }
    }

    private void removeNonVideoPreference() {
        removePreference(this.mPreferenceGroup, "category_camera_setting");
    }

    private void removeIncompatibleAdvancePreference() {
        removePreference(this.mPreferenceGroup, "pref_qc_camera_contrast_key");
        removePreference(this.mPreferenceGroup, "pref_qc_camera_saturation_key");
        removePreference(this.mPreferenceGroup, "pref_qc_camera_sharpness_key");
    }

    private void filterByDeviceID() {
        if (!Device.isSupportedHFR()) {
            removePreference(this.mPreferenceGroup, "pref_video_hfr_key");
        }
        removePreference(this.mPreferenceGroup, "pref_camera_long_press_shutter_key");
        if (!Device.isSupportedMovieSolid()) {
            removePreference(this.mPreferenceGroup, "pref_camera_movie_solid_key");
        }
        if (!Device.isSupportedTimeWaterMark()) {
            removePreference(this.mPreferenceGroup, "pref_watermark_key");
        }
        if (!CameraSettings.isSupportedDualCameraWaterMark()) {
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark");
        }
        if (!Device.isSupportedMuteCameraSound()) {
            removePreference(this.mPreferenceGroup, "pref_camerasound_key");
        }
        if (!Device.isSupportedGPS()) {
            removePreference(this.mPreferenceGroup, "pref_camera_recordlocation_key");
        }
        if (Device.isPad() || (Device.IS_MI3TD && CameraSettings.isFrontCamera())) {
            removePreference(this.mPreferenceGroup, "pref_camera_picturesize_key");
        }
        if (!Storage.secondaryStorageMounted()) {
            removePreference(this.mPreferenceGroup, "pref_priority_storage");
        }
        if (!Device.isSupportedChromaFlash()) {
            removePreference(this.mPreferenceGroup, "pref_auto_chroma_flash_key");
        }
        if (!Device.isSupportedLongPressBurst()) {
            removePreference(this.mPreferenceGroup, "pref_camera_long_press_shutter_feature_key");
        }
        if (!Device.isSupportedObjectTrack()) {
            removePreference(this.mPreferenceGroup, "pref_capture_when_stable_key");
        }
        if (!Device.isSupportedAsdNight()) {
            removePreference(this.mPreferenceGroup, "pref_camera_asd_night_key");
        }
        if (!Device.isSupportedQuickSnap()) {
            removePreference(this.mPreferenceGroup, "pref_camera_snap_key");
        }
        if (!Device.isSupportGroupShot()) {
            removePreference(this.mPreferenceGroup, "pref_groupshot_with_primitive_picture_key");
        }
        if (!CameraSettings.isSupportedPortrait()) {
            removePreference(this.mPreferenceGroup, "pref_camera_portrait_with_facebeauty_key");
        }
        if (!(!Device.isSupportedOpticalZoom() ? Device.isSupportedPortrait() : true)) {
            removePreference(this.mPreferenceGroup, "pref_camera_dual_enable_key");
        }
        if (!Device.isSupportedOpticalZoom()) {
            removePreference(this.mPreferenceGroup, "pref_camera_dual_sat_enable_key");
        }
        if (!Device.isSupportSuperResolution()) {
            removePreference(this.mPreferenceGroup, "pref_camera_super_resolution_key");
        }
        if (!CameraSettings.isSupportParallelProcess()) {
            removePreference(this.mPreferenceGroup, "pref_camera_parallel_process_enable_key");
        }
        if (Device.isThirdDevice()) {
            removePreference(this.mPreferenceGroup, "pref_camera_facedetection_key");
            removePreference(this.mPreferenceGroup, "pref_camera_facedetection_auto_hidden_key");
            removePreference(this.mPreferenceGroup, "pref_camera_parallel_process_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_dual_enable_key");
            removePreference(this.mPreferenceGroup, "pref_camera_dual_sat_enable_key");
            removePreference(this.mPreferenceGroup, "pref_front_mirror_key");
            removePreference(this.mPreferenceGroup, "pref_qc_camera_sharpness_key");
            removePreference(this.mPreferenceGroup, "pref_qc_camera_contrast_key");
            removePreference(this.mPreferenceGroup, "pref_qc_camera_saturation_key");
            removePreference(this.mPreferenceGroup, "pref_camera_autoexposure_key");
        }
        if (!ProximitySensorLock.supported()) {
            removePreference(this.mPreferenceGroup, "pref_camera_proximity_lock_key");
        }
        if (!Device.isBackFingerSensor()) {
            removePreference(this.mPreferenceGroup, "pref_fingerprint_capture_key");
        }
    }

    public void filterUnsupportedOptions(PreferenceGroup group, PreviewListPreference pref, List<String> supported) {
        if (supported == null || supported.size() <= 1) {
            removePreference(group, pref.getKey());
            return;
        }
        pref.filterUnsupported(supported);
        if (pref.getEntries().length <= 1) {
            removePreference(group, pref.getKey());
        } else {
            resetIfInvalid(pref);
        }
    }

    private void resetIfInvalid(ListPreference pref) {
        if (pref.findIndexOfValue(pref.getValue()) == -1) {
            pref.setValueIndex(0);
        }
    }

    private void registerListener(PreferenceGroup group, OnPreferenceChangeListener l) {
        int total = group.getPreferenceCount();
        for (int i = 0; i < total; i++) {
            Preference child = group.getPreference(i);
            if (child instanceof PreferenceGroup) {
                registerListener((PreferenceGroup) child, l);
            } else {
                child.setOnPreferenceChangeListener(l);
            }
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        if (preference.getKey().equals("pref_restore")) {
            RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_restore_title), getString(R.string.confirm_restore_message), getString(17039370), new Runnable() {
                public void run() {
                    BasePreferenceActivity.this.restorePreferences();
                }
            }, getString(17039360), null);
            return true;
        }
        if ("pref_priority_storage".equals(preference.getKey())) {
            PriorityStorageBroadcastReceiver.setPriorityStorage(((CheckBoxPreference) preference).isChecked());
        } else if ("pref_scan_qrcode_key".equals(preference.getKey())) {
            if (this.mLabOptionsHitCountDown > 0) {
                this.mLabOptionsHitCountDown--;
                if (this.mLabOptionsHitCountDown == 0) {
                    Toast.makeText(this, R.string.camera_facedetection_sub_option_hint, 1).show();
                    CameraSettings.setLabOptionsVisible(true);
                    if (CameraSettings.isSupportedPortrait()) {
                        addPreference("category_advance_setting", this.mPortraitWithFaceBeautyPreference);
                    }
                    addPreference("category_advance_setting", this.mFaceDetectionPreference);
                    addPreference("category_advance_setting", this.mFaceDetectionAutoHiddenPreference);
                    if (Device.isSupportedOpticalZoom() || Device.isSupportedPortrait()) {
                        addPreference("category_advance_setting", this.mDualCameraEnablePreference);
                    }
                    if (Device.isSupportedOpticalZoom()) {
                        addPreference("category_advance_setting", this.mDualCameraSatEnablePreference);
                    }
                    if (CameraSettings.isSupportParallelProcess()) {
                        addPreference("category_advance_setting", this.mParallelProcessEnablePreference);
                    }
                    addPreference("category_advance_setting", this.mMFnrSatEnablePreference);
                    addPreference("category_advance_setting", this.mSREnablePreference);
                }
            }
            if (!CameraSettings.isQRCodeReceiverAvailable(this)) {
                RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_install_scanner_title), getString(R.string.confirm_install_scanner_message), getString(R.string.install_confirmed), new Runnable() {
                    public void run() {
                        BasePreferenceActivity.this.installQRCodeReceiver();
                    }
                }, getString(17039360), null);
                return true;
            }
        }
        return false;
    }

    private void installQRCodeReceiver() {
        new AsyncTask<Void, Void, Void>() {
            protected Void doInBackground(Void... params) {
                Log.v(BasePreferenceActivity.TAG, "install...");
                Util.installPackage(BasePreferenceActivity.this, "com.xiaomi.scanner", BasePreferenceActivity.this.mAppInstalledListener, false, true);
                return null;
            }
        }.execute(new Void[0]);
    }

    private void restorePreferences() {
        resetPreferences();
        resetSnapSetting();
        initializeActivity();
        PriorityStorageBroadcastReceiver.setPriorityStorage(getResources().getBoolean(R.bool.priority_storage));
        onSettingChanged(3);
    }

    private void resetPreferences() {
        this.mHasReset = true;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int intentType = dataItemGlobal.getIntentType();
        dataItemGlobal.resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(Camera2DataContainer.getInstance().getMainBackCameraId(), intentType)).resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(Camera2DataContainer.getInstance().getFrontCameraId(), intentType)).resetAll();
        DataRepository.dataItemRunning().resetAll();
        DataRepository.getInstance().backUp().clearBackUp();
    }

    private void resetSnapSetting() {
        String snapType = Secure.getString(getContentResolver(), "key_long_press_volume_down");
        if ("Street-snap-picture".equals(snapType) || "Street-snap-movie".equals(snapType)) {
            Secure.putString(getContentResolver(), "key_long_press_volume_down", "none");
        }
    }

    public boolean onPreferenceChange(Preference preference, Object newValue) {
        onSettingChanged(1);
        Editor editor = this.mPreferences.edit();
        String key = preference.getKey();
        if (newValue instanceof String) {
            editor.putString(key, (String) newValue);
        } else if (newValue instanceof Boolean) {
            editor.putBoolean(key, ((Boolean) newValue).booleanValue());
        } else if (newValue instanceof Integer) {
            editor.putInt(key, ((Integer) newValue).intValue());
        } else if (newValue instanceof Long) {
            editor.putLong(key, ((Long) newValue).longValue());
        } else if (newValue instanceof Float) {
            editor.putFloat(key, ((Float) newValue).floatValue());
        } else {
            throw new IllegalStateException("unhandled new value with type=" + newValue.getClass().getName());
        }
        editor.apply();
        CameraStatUtil.trackPreferenceChange(preference.getKey(), newValue);
        updateConflictPreference(preference);
        return true;
    }

    protected boolean removePreference(PreferenceGroup root, String key) {
        Preference child = root.findPreference(key);
        if (child != null && root.removePreference(child)) {
            return true;
        }
        int count = root.getPreferenceCount();
        for (int i = 0; i < count; i++) {
            child = root.getPreference(i);
            if ((child instanceof PreferenceGroup) && removePreference((PreferenceGroup) child, key)) {
                return true;
            }
        }
        return false;
    }

    protected boolean addPreference(String group, Preference preference) {
        Preference preferenceGroup = this.mPreferenceGroup.findPreference(group);
        if (!(preferenceGroup instanceof PreferenceGroup)) {
            return false;
        }
        ((PreferenceGroup) preferenceGroup).addPreference(preference);
        return true;
    }

    private void updateEntries() {
        PreviewListPreference pictureSize = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_camera_picturesize_key");
        PreviewListPreference antiBanding = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_camera_antibanding_key");
        CheckBoxPreference chromaFlash = (CheckBoxPreference) this.mPreferenceGroup.findPreference("pref_auto_chroma_flash_key");
        PreviewListPreference videoQuality = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_video_quality_key");
        PreviewListPreference snapType = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_camera_snap_key");
        if (pictureSize != null) {
            pictureSize.setEntries(PictureSizeManager.getEntries());
            pictureSize.setEntryValues(PictureSizeManager.getEntryValues());
            pictureSize.setDefaultValue(PictureSizeManager.getDefaultValue());
            pictureSize.setValue(PictureSizeManager.getDefaultValue());
        }
        if (antiBanding != null && Util.isAntibanding60()) {
            String value = getString(R.string.pref_camera_antibanding_entryvalue_60hz);
            antiBanding.setValue(value);
            antiBanding.setDefaultValue(value);
        }
        if (chromaFlash != null) {
            chromaFlash.setChecked(getResources().getBoolean(CameraSettings.getDefaultPreferenceId(R.bool.pref_camera_auto_chroma_flash_default)));
        }
        if (videoQuality != null) {
            String defaultVideoQuality = getString(CameraSettings.getDefaultPreferenceId(R.string.pref_video_quality_default));
            videoQuality.setDefaultValue(defaultVideoQuality);
            videoQuality.setValue(defaultVideoQuality);
        }
        if (snapType != null && Device.isSupportedQuickSnap()) {
            String defaultSnapType = getString(R.string.pref_camera_snap_default);
            snapType.setDefaultValue(defaultSnapType);
            snapType.setValue(defaultSnapType);
            String settingsSnapType = Secure.getString(getContentResolver(), "key_long_press_volume_down");
            if (System.getInt(getContentResolver(), "volumekey_wake_screen", 0) == 1 || "public_transportation_shortcuts".equals(settingsSnapType) || "none".equals(settingsSnapType)) {
                snapType.setValue(getString(R.string.pref_camera_snap_value_off));
                return;
            }
            String snapValue = DataRepository.dataItemGlobal().getString("pref_camera_snap_key", null);
            if (snapValue != null) {
                Secure.putString(getContentResolver(), "key_long_press_volume_down", CameraSettings.getMiuiSettingsKeyForStreetSnap(snapValue));
                DataRepository.dataItemGlobal().editor().remove("pref_camera_snap_key").apply();
                snapType.setValue(snapValue);
            } else if ("Street-snap-picture".equals(settingsSnapType)) {
                snapType.setValue(getString(R.string.pref_camera_snap_value_take_picture));
            } else if ("Street-snap-movie".equals(settingsSnapType)) {
                snapType.setValue(getString(R.string.pref_camera_snap_value_take_movie));
            }
        }
    }

    private void updateQRCodeEntry() {
        CheckBoxPreference scanQRCode = (CheckBoxPreference) this.mPreferenceGroup.findPreference("pref_scan_qrcode_key");
        if (scanQRCode != null && this.mPreferences.getBoolean("pref_scan_qrcode_key", scanQRCode.isChecked()) && (CameraSettings.isQRCodeReceiverAvailable(this) ^ 1) != 0) {
            Log.v(TAG, "disable QRCodeScan");
            Editor editor = this.mPreferences.edit();
            editor.putBoolean("pref_scan_qrcode_key", false);
            editor.apply();
            scanQRCode.setChecked(false);
        }
    }

    private void updatePreferences(PreferenceGroup group, SharedPreferences sp) {
        if (group != null) {
            int count = group.getPreferenceCount();
            for (int i = 0; i < count; i++) {
                Preference child = group.getPreference(i);
                if (child instanceof PreviewListPreference) {
                    PreviewListPreference list = (PreviewListPreference) child;
                    if ("pref_camera_picturesize_key".equals(list.getKey())) {
                        list.setValue(PictureSizeManager.getPictureSize(true).toString());
                    } else {
                        list.setValue(getFilterValue(list, sp));
                    }
                    child.setPersistent(false);
                } else if (child instanceof CheckBoxPreference) {
                    CheckBoxPreference checkBox = (CheckBoxPreference) child;
                    checkBox.setChecked(sp.getBoolean(checkBox.getKey(), checkBox.isChecked()));
                    child.setPersistent(false);
                } else if (child instanceof PreferenceGroup) {
                    updatePreferences((PreferenceGroup) child, sp);
                } else {
                    Log.v(TAG, "no need update preference for " + child.getKey());
                }
            }
        }
    }

    private String getFilterValue(PreviewListPreference list, SharedPreferences sp) {
        String defaultValue = list.getValue();
        if (sp == null) {
            return defaultValue;
        }
        String value = sp.getString(list.getKey(), defaultValue);
        if (!Util.isStringValueContained((Object) value, list.getEntryValues())) {
            value = defaultValue;
            Editor editor = sp.edit();
            editor.putString(list.getKey(), defaultValue);
            editor.apply();
        }
        return value;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() != 16908332) {
            return super.onOptionsItemSelected(item);
        }
        resetTimeOutFlag();
        finish();
        return true;
    }

    protected void filterByIntent() {
        ArrayList<String> removeKeys = getIntent().getStringArrayListExtra("remove_keys");
        if (removeKeys != null) {
            for (String key : removeKeys) {
                removePreference(this.mPreferenceGroup, key);
            }
        }
    }

    private void filterGroup() {
        filterGroupIfEmpty("category_device_setting");
        filterGroupIfEmpty("category_camcorder_setting");
        filterGroupIfEmpty("category_camera_setting");
        filterGroupIfEmpty("category_advance_setting");
    }

    private void filterGroupIfEmpty(String key) {
        Preference group = this.mPreferenceGroup.findPreference(key);
        if (group != null && (group instanceof PreferenceGroup) && ((PreferenceGroup) group).getPreferenceCount() == 0) {
            removePreference(this.mPreferenceGroup, key);
        }
    }

    protected void onRestart() {
        super.onRestart();
        finish();
    }

    private void updateConflictPreference(Preference preference) {
        if (Device.IS_X9 && CameraSettings.isFrontCamera() && CameraSettings.isMovieSolidOn() && 6 <= CameraSettings.getPreferVideoQuality()) {
            CheckBoxPreference movieSolid = (CheckBoxPreference) this.mPreferenceGroup.findPreference("pref_camera_movie_solid_key");
            PreviewListPreference videoQuality = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_video_quality_key");
            Editor editor;
            if (preference == null || !"pref_camera_movie_solid_key".equals(preference.getKey())) {
                editor = this.mPreferences.edit();
                editor.putBoolean("pref_camera_movie_solid_key", false);
                editor.apply();
                movieSolid.setChecked(false);
                return;
            }
            String defaultQuality = getString(CameraSettings.getDefaultPreferenceId(R.string.pref_video_quality_default));
            editor = this.mPreferences.edit();
            editor.putString("pref_video_quality_key", defaultQuality);
            editor.apply();
            videoQuality.setValue(defaultQuality);
        }
    }

    public void onBackPressed() {
        resetTimeOutFlag();
        super.onBackPressed();
    }

    private void resetTimeOutFlag() {
        if (!this.mHasReset) {
            DataRepository.dataItemGlobal().resetTimeOut();
        }
    }
}
