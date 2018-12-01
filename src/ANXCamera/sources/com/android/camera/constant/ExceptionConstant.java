package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class ExceptionConstant {

    @Retention(RetentionPolicy.SOURCE)
    public @interface Exceptions {
    }

    public static final int transFromCamera2Error(int camera2Error) {
        switch (camera2Error) {
            case 1:
                return 230;
            case 2:
                return 230;
            case 3:
                return 227;
            case 4:
                return 230;
            case 5:
                return 230;
            default:
                return 230;
        }
    }
}
