package com.android.camera;

import java.util.ArrayList;
import java.util.List;

public class PictureSizeManager {
    private static String sDefaultValue = "4x3";
    private static final ArrayList<String> sEntryValues = new ArrayList();
    private static final ArrayList<CameraSize> sPictureList = new ArrayList();

    static {
        sEntryValues.add("4x3");
        sEntryValues.add("16x9");
        if (Device.is18x9RatioScreen()) {
            sEntryValues.add("18x9");
        }
    }

    public static String[] getEntries() {
        if (Device.is18x9RatioScreen()) {
            return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3), CameraSettings.getString(R.string.pref_camera_picturesize_entry_16_9), CameraSettings.getString(R.string.pref_camera_picturesize_entry_18_9)};
        }
        return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3), CameraSettings.getString(R.string.pref_camera_picturesize_entry_16_9)};
    }

    public static String[] getEntryValues() {
        String[] result = new String[sEntryValues.size()];
        sEntryValues.toArray(result);
        return result;
    }

    public static String getDefaultValue() {
        return sDefaultValue;
    }

    public static CameraSize getPictureSize(boolean settingOnly) {
        return new CameraSize(CameraSettings.getPictureSize(getDefaultValue()));
    }

    public static CameraSize getBestPictureSize() {
        CameraSize candidate = getPictureSize(false);
        CameraSize desire = null;
        if (candidate.isAspectRatio16_9()) {
            desire = _findMaxRatio16_9(sPictureList);
        } else if (candidate.isAspectRatio4_3()) {
            desire = _findMaxRatio4_3(sPictureList);
        } else if (candidate.isAspectRatio1_1()) {
            desire = _findMaxRatio1_1(sPictureList);
        } else if (candidate.isAspectRatio18_9()) {
            desire = _findMaxRatio18_9(sPictureList);
        }
        if (desire == null || desire.isEmpty()) {
            return new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height);
        }
        return desire;
    }

    public static CameraSize getBestPanoPictureSize() {
        CameraSize desire;
        if (CameraSettings.isAspectRatio4_3(Util.sWindowWidth, Util.sWindowHeight)) {
            desire = _findMaxRatio4_3(sPictureList);
        } else if (CameraSettings.isAspectRatio18_9(Util.sWindowWidth, Util.sWindowHeight)) {
            desire = _findMaxRatio18_9(sPictureList);
            if (desire == null || desire.isEmpty()) {
                desire = _findMaxRatio16_9(sPictureList);
            }
        } else {
            desire = _findMaxRatio16_9(sPictureList);
        }
        if (desire == null || desire.isEmpty()) {
            return new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height);
        }
        return desire;
    }

    public static void initialize(List<CameraSize> supported, int limit) {
        sPictureList.clear();
        if (supported == null || supported.size() == 0) {
            throw new IllegalArgumentException("The supported picture size list return from hal is null!");
        }
        initSensorRatio(supported);
        if (limit != 0) {
            ArrayList<CameraSize> list = new ArrayList();
            for (CameraSize size : supported) {
                if (size.area() <= limit) {
                    list.add(size);
                }
            }
            supported = list;
        }
        CameraSize size4_3 = _findMaxRatio4_3(supported);
        if (size4_3 != null) {
            sPictureList.add(size4_3);
        }
        CameraSize size1_1 = _findMaxRatio1_1(supported);
        if (size1_1 != null) {
            sPictureList.add(size1_1);
        }
        CameraSize size16_9 = _findMaxRatio16_9(supported);
        if (size16_9 != null) {
            sPictureList.add(size16_9);
        }
        CameraSize size18_9 = _findMaxRatio18_9(supported);
        if (size18_9 != null) {
            sPictureList.add(size18_9);
        }
        if (sPictureList.size() == 0) {
            throw new IllegalArgumentException("Not find the desire picture sizes!");
        }
    }

    private static CameraSize _findMaxRatio4_3(List<CameraSize> supported) {
        int maxWidth = 0;
        int maxHeight = 0;
        for (CameraSize size : supported) {
            if (size.isAspectRatio4_3() && size.area() > maxWidth * maxHeight) {
                maxWidth = size.getWidth();
                maxHeight = size.getHeight();
            }
        }
        return maxWidth != 0 ? new CameraSize(maxWidth, maxHeight) : new CameraSize();
    }

    private static CameraSize _findMaxRatio1_1(List<CameraSize> supported) {
        int maxWidth = 0;
        int maxHeight = 0;
        for (CameraSize size : supported) {
            if (size.isAspectRatio1_1() && size.area() > maxWidth * maxHeight) {
                maxWidth = size.getWidth();
                maxHeight = size.getHeight();
            }
        }
        return maxWidth != 0 ? new CameraSize(maxWidth, maxHeight) : new CameraSize();
    }

    private static CameraSize _findMaxRatio16_9(List<CameraSize> supported) {
        int maxWidth = 0;
        int maxHeight = 0;
        for (CameraSize size : supported) {
            if (size.isAspectRatio16_9() && size.area() > maxWidth * maxHeight) {
                maxWidth = size.getWidth();
                maxHeight = size.getHeight();
            }
        }
        return maxWidth != 0 ? new CameraSize(maxWidth, maxHeight) : new CameraSize();
    }

    private static CameraSize _findMaxRatio18_9(List<CameraSize> supported) {
        int maxWidth = 0;
        int maxHeight = 0;
        for (CameraSize size : supported) {
            if (size.isAspectRatio18_9() && size.area() > maxWidth * maxHeight) {
                maxWidth = size.getWidth();
                maxHeight = size.getHeight();
            }
        }
        return maxWidth != 0 ? new CameraSize(maxWidth, maxHeight) : new CameraSize();
    }

    private static void initSensorRatio(List<CameraSize> supported) {
        if (Device.IS_X9 || Device.IS_A8) {
            sDefaultValue = "16x9";
            return;
        }
        int maxIndex = -1;
        int maxValue = 0;
        CameraSize pictureSize = new CameraSize();
        for (int i = 0; i < supported.size(); i++) {
            pictureSize.parseSize((CameraSize) supported.get(i));
            if (maxValue < pictureSize.area()) {
                maxIndex = i;
                maxValue = pictureSize.area();
            }
        }
        pictureSize.parseSize((CameraSize) supported.get(maxIndex));
        if (pictureSize.isAspectRatio4_3()) {
            sDefaultValue = "4x3";
        } else {
            sDefaultValue = "16x9";
        }
    }
}
