package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class AutoFocus {

    @Retention(RetentionPolicy.SOURCE)
    public @interface FocusMode {
    }

    public static List<String> convertToLegacyFocusModes(int[] modes) {
        List<String> modeList = new ArrayList();
        for (int mode : modes) {
            switch (mode) {
                case 0:
                    modeList.add("manual");
                    break;
                case 1:
                    modeList.add("auto");
                    break;
                case 2:
                    modeList.add("macro");
                    break;
                case 3:
                    modeList.add("continuous-video");
                    break;
                case 4:
                    modeList.add("continuous-picture");
                    break;
                case 5:
                    modeList.add("edof");
                    break;
                default:
                    break;
            }
        }
        return modeList;
    }

    public static int convertToFocusMode(String mode) {
        if (mode.equals("auto")) {
            return 1;
        }
        if (mode.equals("macro")) {
            return 2;
        }
        if (mode.equals("continuous-video")) {
            return 3;
        }
        if (mode.equals("continuous-picture")) {
            return 4;
        }
        if (mode.equals("edof")) {
            return 5;
        }
        return mode.equals("manual") ? 0 : 0;
    }
}
