package com.android.camera.lib.compatibility.related.v23;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.storage.DiskInfo;
import android.os.storage.StorageManager;
import android.os.storage.VolumeInfo;
import android.telecom.TelecomManager;
import android.util.Log;
import java.io.File;
import java.util.List;

@TargetApi(23)
public class V23Utils {
    public static final boolean isInVideoCall(Context context) {
        Log.d("TelecomManagerProxy-v23", "isInVideoCall: start");
        if (VERSION.SDK_INT >= 21) {
            TelecomManager telecomManager = (TelecomManager) context.getSystemService("telecom");
            if (telecomManager != null) {
                return telecomManager.isInCall();
            }
        }
        return false;
    }

    public static String getSdcardPath(Context context) {
        VolumeInfo sdcardVolume = null;
        if (VERSION.SDK_INT >= 23) {
            List<VolumeInfo> volumeInfoList = ((StorageManager) context.getSystemService("storage")).getVolumes();
            if (volumeInfoList != null) {
                for (VolumeInfo volumeInfo : volumeInfoList) {
                    if (volumeInfo.getType() == 0 && volumeInfo.isMountedWritable()) {
                        DiskInfo diskInfo = volumeInfo.getDisk();
                        Log.d("TelecomManagerProxy-v23", "getSdcardPath: diskInfo = " + diskInfo);
                        if (diskInfo != null && diskInfo.isSd()) {
                            sdcardVolume = volumeInfo;
                            break;
                        }
                    }
                }
            }
        }
        Log.d("TelecomManagerProxy-v23", "getSdcardPath: sdcardVolume = " + sdcardVolume);
        if (sdcardVolume == null) {
            return null;
        }
        File file = sdcardVolume.getPath();
        String sdcardPath = file == null ? null : file.getPath();
        Log.v("TelecomManagerProxy-v23", "getSdcardPath sd=" + sdcardPath);
        return sdcardPath;
    }
}
