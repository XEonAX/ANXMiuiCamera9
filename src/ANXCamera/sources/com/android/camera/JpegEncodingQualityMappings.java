package com.android.camera;

import android.support.v7.recyclerview.R;
import java.util.HashMap;

public class JpegEncodingQualityMappings {
    private static HashMap<String, Integer> sHashMap = new HashMap();

    static {
        sHashMap.put("low", Integer.valueOf(67));
        sHashMap.put("normal", Integer.valueOf(87));
        sHashMap.put("high", Integer.valueOf(CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.high_jpeg_quality)));
    }

    public static int getQualityNumber(String jpegQuality) {
        Integer quality = (Integer) sHashMap.get(jpegQuality);
        if (quality == null) {
            return 87;
        }
        return quality.intValue();
    }
}
