package miui.os;

import android.os.Build.VERSION;
import android.os.SystemProperties;
import miui.util.FeatureParser;

public class DeviceFeature {
    public static final int BACKLIGHT_BIT = FeatureParser.getInteger("SUPPORT_NIGHT_LIGHT", 0);
    public static final boolean PERSIST_SCREEN_EFFECT = SystemProperties.getBoolean("sys.persist_screen_effect", false);
    public static final boolean SCREEN_EFFECT_CONFLICT;
    public static final boolean SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE;
    public static final boolean SUPPORT_DISPLAYFEATURE_HIDL = SystemProperties.getBoolean("sys.displayfeature_hidl", false);
    public static final boolean SUPPORT_NIGHT_LIGHT = FeatureParser.getBoolean("SUPPORT_NIGHT_LIGHT", false);
    public static final boolean SUPPORT_NIGHT_LIGHT_ADJ = FeatureParser.getBoolean("SUPPORT_NIGHT_LIGHT_ADJ", false);

    static {
        boolean z;
        boolean z2 = true;
        if (!FeatureParser.getBoolean("support_autobrightness_optimize", false) || VERSION.SDK_INT <= 23) {
            z = SystemProperties.getBoolean("sys.autobrightness_optimize", false);
        } else {
            z = true;
        }
        SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE = z;
        if (SystemProperties.getInt("ro.df.effect.conflict", 0) != 1) {
            z2 = false;
        }
        SCREEN_EFFECT_CONFLICT = z2;
    }
}
