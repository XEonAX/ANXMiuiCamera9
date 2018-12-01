package com.android.camera.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.support.v7.recyclerview.R;
import com.android.camera.Device;
import com.android.camera.LocationManager;
import com.android.camera.OnScreenHint;
import com.android.camera.RotateDialogController;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.permission.PermissionManager;
import com.android.camera.storage.Storage;

public class ScreenHint {
    private final Activity mActivity;
    private OnScreenHint mStorageHint;
    private long mStorageSpace;
    private AlertDialog mSystemChoiceDialog;

    public ScreenHint(Activity activity) {
        this.mActivity = activity;
    }

    public void updateHint() {
        Storage.switchStoragePathIfNeeded();
        this.mStorageSpace = Storage.getAvailableSpace();
        CharSequence message = null;
        if (this.mStorageSpace == -1) {
            message = this.mActivity.getString(R.string.no_storage);
        } else if (this.mStorageSpace == -2) {
            message = this.mActivity.getString(R.string.preparing_sd);
        } else if (this.mStorageSpace == -3) {
            message = this.mActivity.getString(R.string.access_sd_fail);
        } else if (this.mStorageSpace < 52428800) {
            if (Storage.isPhoneStoragePriority()) {
                message = this.mActivity.getString(R.string.spaceIsLow_content_primary_storage_priority);
            } else {
                message = this.mActivity.getString(R.string.spaceIsLow_content_external_storage_priority);
            }
        }
        if (message != null) {
            if (this.mStorageHint == null) {
                this.mStorageHint = OnScreenHint.makeText(this.mActivity, message);
            } else {
                this.mStorageHint.setText(message);
            }
            this.mStorageHint.show();
        } else if (this.mStorageHint != null) {
            this.mStorageHint.cancel();
            this.mStorageHint = null;
        }
    }

    public boolean isScreenHintVisible() {
        return this.mStorageHint != null && this.mStorageHint.getHintViewVisibility() == 0;
    }

    public void cancelHint() {
        if (this.mStorageHint != null) {
            this.mStorageHint.cancel();
            this.mStorageHint = null;
        }
    }

    private void recordLocation(boolean recorded) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean("pref_camera_recordlocation_key", recorded);
        editor.apply();
        LocationManager.instance().recordLocation(recorded);
    }

    public void showFirstUseHint() {
        if (this.mSystemChoiceDialog == null || !this.mSystemChoiceDialog.isShowing()) {
            DataItemGlobal globalPref = DataRepository.dataItemGlobal();
            boolean firstLocation = globalPref.getBoolean("pref_camera_first_use_hint_shown_key", true);
            if (!PermissionManager.checkCameraLocationPermissions()) {
                firstLocation = false;
            }
            if (firstLocation) {
                boolean containsRecordLocation = globalPref.contains("pref_camera_recordlocation_key");
                if (Device.isSupportedGPS() && (containsRecordLocation ^ 1) != 0 && firstLocation) {
                    this.mSystemChoiceDialog = RotateDialogController.showSystemChoiceDialog(this.mActivity, this.mActivity.getString(R.string.confirm_location_title), this.mActivity.getString(R.string.confirm_location_message), this.mActivity.getString(R.string.confirm_location_alert), this.mActivity.getString(R.string.start_capture), new Runnable() {
                        public void run() {
                            ScreenHint.this.recordLocation(true);
                            ScreenHint.this.recordFirstUse(false);
                            ScreenHint.this.dismissSystemChoiceDialog();
                        }
                    }, new Runnable() {
                        public void run() {
                            ScreenHint.this.recordLocation(false);
                            ScreenHint.this.recordFirstUse(false);
                            ScreenHint.this.dismissSystemChoiceDialog();
                        }
                    });
                }
            }
        }
    }

    public void recordFirstUse(boolean state) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean("pref_camera_first_use_hint_shown_key", state);
        editor.putBoolean("pref_camera_confirm_location_shown_key", state);
        editor.apply();
    }

    public void dismissSystemChoiceDialog() {
        if (this.mSystemChoiceDialog != null) {
            this.mSystemChoiceDialog.dismiss();
            this.mSystemChoiceDialog = null;
        }
    }
}
