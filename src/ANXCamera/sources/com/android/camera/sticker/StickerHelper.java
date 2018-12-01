package com.android.camera.sticker;

import android.content.Context;
import android.support.v7.recyclerview.R;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class StickerHelper {
    private static StickerHelper mInstance;
    public static String[] sStickLocal = new String[]{"rabbiteating.zip", "bunny.zip"};
    private static boolean sStickerEnable = false;
    private Context mContext;

    public static StickerHelper getInstance() {
        if (mInstance == null) {
            synchronized (StickerHelper.class) {
                if (mInstance == null) {
                    mInstance = new StickerHelper();
                }
            }
        }
        return mInstance;
    }

    private StickerHelper() {
    }

    public List<StickerInfo> getLocalStick() {
        List<StickerInfo> stickerInfos = new ArrayList();
        StickerInfo empty = new StickerInfo(null, R.drawable.icon_sticker_none);
        StickerInfo rabbit = new StickerInfo(getStickerPath(sStickLocal[0]), R.drawable.icon_sticker1);
        StickerInfo bunny = new StickerInfo(getStickerPath(sStickLocal[1]), R.drawable.icon_sticker2);
        stickerInfos.add(empty);
        stickerInfos.add(rabbit);
        stickerInfos.add(bunny);
        return stickerInfos;
    }

    public String getTrackModelPath() {
        return getModelPath() + File.separator + "face_track_3.3.0.model";
    }

    public String getStickerPath(String s) {
        return getStickerPath() + File.separator + s;
    }

    public String getStickerPath(long id) {
        return getStickerPath() + File.separator + Long.toString(id);
    }

    public String getModelPath() {
        File dataDir = this.mContext.getFilesDir();
        if (dataDir != null) {
            return dataDir.getAbsolutePath() + File.separator + "sticker_model";
        }
        return null;
    }

    public String getStickerPath() {
        return this.mContext.getExternalFilesDir("sticker_res").getAbsolutePath();
    }
}
