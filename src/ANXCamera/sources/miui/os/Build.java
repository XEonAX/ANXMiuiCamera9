package miui.os;

import android.content.Context;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.miui.internal.cust.PrivateConfig;
import miui.util.FeatureParser;

public class Build extends android.os.Build {
    public static final boolean HAS_CUST_PARTITION = SystemProperties.getBoolean("ro.miui.has_cust_partition", false);
    public static final boolean IS_ALPHA_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_alpha");
    public static final boolean IS_CDMA;
    public static final boolean IS_CM_COOPERATION;
    public static final boolean IS_CM_CUSTOMIZATION;
    public static final boolean IS_CM_CUSTOMIZATION_TEST = "cm".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CTA_BUILD = "1".equals(SystemProperties.get("ro.miui.cta"));
    public static final boolean IS_CTS_BUILD = (SystemProperties.getBoolean("persist.sys.miui_optimization", "1".equals(SystemProperties.get("ro.miui.cts")) ^ 1) ^ 1);
    public static final boolean IS_CT_CUSTOMIZATION = "ct".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CT_CUSTOMIZATION_TEST = "ct".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CU_CUSTOMIZATION = "cu".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CU_CUSTOMIZATION_TEST = "cu".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_DEBUGGABLE;
    public static final boolean IS_DEVELOPMENT_VERSION;
    public static final boolean IS_FUNCTION_LIMITED = "1".equals(SystemProperties.get("persist.sys.func_limit_switch"));
    public static final boolean IS_GLOBAL_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_global");
    public static final boolean IS_HONGMI;
    public static final boolean IS_HONGMI2_TDSCDMA = "HM2013022".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE;
    public static final boolean IS_HONGMI_THREEX = "gucci".equals(DEVICE);
    public static final boolean IS_HONGMI_THREEX_CM;
    public static final boolean IS_HONGMI_THREEX_CT;
    public static final boolean IS_HONGMI_THREEX_CU;
    public static final boolean IS_HONGMI_THREE_LTE = "dior".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE_LTE_CM;
    public static final boolean IS_HONGMI_THREE_LTE_CU;
    public static final boolean IS_HONGMI_TWO;
    public static final boolean IS_HONGMI_TWOS_LTE_MTK = "HM2014501".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX;
    public static final boolean IS_HONGMI_TWOX_BR = "HM2014819".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_CM;
    public static final boolean IS_HONGMI_TWOX_CT;
    public static final boolean IS_HONGMI_TWOX_CU = "HM2014811".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_IN = "HM2014818".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_LC = "lte26007".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_SA = "HM2014817".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_A = "armani".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_S = (!"HM2014011".equals(DEVICE) ? "HM2014012".equals(DEVICE) : true);
    public static final boolean IS_INTERNATIONAL_BUILD = SystemProperties.get("ro.product.mod_device", "").contains("_global");
    public static final boolean IS_MI1S;
    public static final boolean IS_MI2A;
    public static final boolean IS_MIFIVE = "virgo".equals(DEVICE);
    public static final boolean IS_MIFOUR;
    public static final boolean IS_MIFOUR_CDMA;
    public static final boolean IS_MIFOUR_LTE_CM;
    public static final boolean IS_MIFOUR_LTE_CT;
    public static final boolean IS_MIFOUR_LTE_CU;
    public static final boolean IS_MIFOUR_LTE_INDIA;
    public static final boolean IS_MIFOUR_LTE_SEASA;
    public static final boolean IS_MIONE = (!"mione".equals(DEVICE) ? "mione_plus".equals(DEVICE) : true);
    public static final boolean IS_MIONE_CDMA;
    public static final boolean IS_MIPAD = "mocha".equals(DEVICE);
    public static final boolean IS_MITHREE;
    public static final boolean IS_MITHREE_CDMA;
    public static final boolean IS_MITHREE_TDSCDMA;
    public static final boolean IS_MITWO;
    public static final boolean IS_MITWO_CDMA;
    public static final boolean IS_MITWO_TDSCDMA;
    public static final boolean IS_N7 = "flo".equals(DEVICE);
    public static final boolean IS_OFFICIAL_VERSION;
    public static final boolean IS_PRIVATE_BUILD = PrivateConfig.IS_PRIVATE_BUILD;
    public static final boolean IS_PRO_DEVICE = SystemProperties.get("ro.miui.cust_device", "").endsWith("_pro");
    public static final boolean IS_STABLE_VERSION;
    public static final boolean IS_TABLET = isTablet();
    public static final boolean IS_TDS_CDMA;
    public static final boolean IS_XIAOMI;
    private static final String REGULAR_EXPRESSION_FOR_DEVELOPMENT = "\\d+.\\d+.\\d+(-internal)?";
    private static final String REGULAR_EXPRESSION_FOR_STABLE = "([A-Z]{3}|[A-Z]{7})\\d+.\\d+";
    public static final String USERDATA_IMAGE_VERSION_CODE = getUserdataImageVersionCode();
    public static final String USER_MODE = "persist.sys.user_mode";
    public static final int USER_MODE_ELDER = 1;
    public static final int USER_MODE_NORMAL = 0;

    protected Build() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    static {
        boolean z;
        boolean z2 = true;
        if ("MI 1S".equals(MODEL)) {
            z = true;
        } else {
            z = "MI 1SC".equals(MODEL);
        }
        IS_MI1S = z;
        if ("aries".equals(DEVICE) || "taurus".equals(DEVICE)) {
            z = true;
        } else {
            z = "taurus_td".equals(DEVICE);
        }
        IS_MITWO = z;
        if ("MI 2A".equals(MODEL)) {
            z = true;
        } else {
            z = "MI 2A TD".equals(MODEL);
        }
        IS_MI2A = z;
        z = !"pisces".equals(DEVICE) ? "cancro".equals(DEVICE) ? MODEL.startsWith("MI 3") : false : true;
        IS_MITHREE = z;
        if ("cancro".equals(DEVICE)) {
            z = MODEL.startsWith("MI 4");
        } else {
            z = false;
        }
        IS_MIFOUR = z;
        if (IS_MIONE || IS_MITWO || IS_MITHREE || IS_MIFOUR) {
            z = true;
        } else {
            z = IS_MIFIVE;
        }
        IS_XIAOMI = z;
        if ("HM2013022".equals(DEVICE) || "HM2013023".equals(DEVICE) || IS_HONGMI_TWO_A) {
            z = true;
        } else {
            z = IS_HONGMI_TWO_S;
        }
        IS_HONGMI_TWO = z;
        if ("lcsh92_wet_jb9".equals(DEVICE)) {
            z = true;
        } else {
            z = "lcsh92_wet_tdd".equals(DEVICE);
        }
        IS_HONGMI_THREE = z;
        if (IS_HONGMI_THREE_LTE) {
            z = "LTETD".equals(SystemProperties.get("ro.boot.modem"));
        } else {
            z = false;
        }
        IS_HONGMI_THREE_LTE_CM = z;
        if (IS_HONGMI_THREE_LTE) {
            z = "LTEW".equals(SystemProperties.get("ro.boot.modem"));
        } else {
            z = false;
        }
        IS_HONGMI_THREE_LTE_CU = z;
        if ("HM2014812".equals(DEVICE)) {
            z = true;
        } else {
            z = "HM2014821".equals(DEVICE);
        }
        IS_HONGMI_TWOX_CT = z;
        if ("HM2014813".equals(DEVICE)) {
            z = true;
        } else {
            z = "HM2014112".equals(DEVICE);
        }
        IS_HONGMI_TWOX_CM = z;
        z = (IS_HONGMI_TWOX_CU || IS_HONGMI_TWOX_CT || IS_HONGMI_TWOX_CM || IS_HONGMI_TWOX_IN || IS_HONGMI_TWOX_SA) ? true : IS_HONGMI_TWOX_BR;
        IS_HONGMI_TWOX = z;
        if (IS_HONGMI_THREEX) {
            z = "cm".equals(SystemProperties.get("persist.sys.modem"));
        } else {
            z = false;
        }
        IS_HONGMI_THREEX_CM = z;
        if (IS_HONGMI_THREEX) {
            z = "cu".equals(SystemProperties.get("persist.sys.modem"));
        } else {
            z = false;
        }
        IS_HONGMI_THREEX_CU = z;
        if (IS_HONGMI_THREEX) {
            z = "ct".equals(SystemProperties.get("persist.sys.modem"));
        } else {
            z = false;
        }
        IS_HONGMI_THREEX_CT = z;
        if (IS_HONGMI_TWO || IS_HONGMI_THREE || IS_HONGMI_TWOX || IS_HONGMI_THREE_LTE || IS_HONGMI_TWOX_LC || IS_HONGMI_TWOS_LTE_MTK) {
            z = true;
        } else {
            z = IS_HONGMI_THREEX;
        }
        IS_HONGMI = z;
        if (IS_MIONE) {
            z = hasMsm8660Property();
        } else {
            z = false;
        }
        IS_MIONE_CDMA = z;
        if (IS_MITWO) {
            z = "CDMA".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MITWO_CDMA = z;
        if (IS_MITHREE) {
            z = "MI 3C".equals(MODEL);
        } else {
            z = false;
        }
        IS_MITHREE_CDMA = z;
        if (IS_MIFOUR) {
            z = "CDMA".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_CDMA = z;
        if (IS_MITWO) {
            z = "TD".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MITWO_TDSCDMA = z;
        if (IS_MITHREE) {
            z = "TD".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MITHREE_TDSCDMA = z;
        if (IS_MIFOUR) {
            z = "LTE-CMCC".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_LTE_CM = z;
        if (IS_MIFOUR) {
            z = "LTE-CU".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_LTE_CU = z;
        if (IS_MIFOUR) {
            z = "LTE-CT".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_LTE_CT = z;
        if (IS_MIFOUR) {
            z = "LTE-India".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_LTE_INDIA = z;
        if (IS_MIFOUR) {
            z = "LTE-SEAsa".equals(SystemProperties.get("persist.radio.modem"));
        } else {
            z = false;
        }
        IS_MIFOUR_LTE_SEASA = z;
        if (IS_MIONE_CDMA || IS_MITWO_CDMA || IS_MITHREE_CDMA || IS_MIFOUR_CDMA) {
            z = true;
        } else {
            z = IS_MIFOUR_LTE_CT;
        }
        IS_CDMA = z;
        if (IS_MITHREE_TDSCDMA || IS_HONGMI2_TDSCDMA) {
            z = true;
        } else {
            z = IS_MITWO_TDSCDMA;
        }
        IS_TDS_CDMA = z;
        if (!"cm".equals(SystemProperties.get("ro.carrier.name"))) {
            z = false;
        } else if ("cn_chinamobile".equals(SystemProperties.get("ro.miui.cust_variant"))) {
            z = true;
        } else {
            z = "cn_cta".equals(SystemProperties.get("ro.miui.cust_variant"));
        }
        IS_CM_CUSTOMIZATION = z;
        if ("cm".equals(SystemProperties.get("ro.carrier.name"))) {
            z = "cn_cmcooperation".equals(SystemProperties.get("ro.miui.cust_variant"));
        } else {
            z = false;
        }
        IS_CM_COOPERATION = z;
        if (TextUtils.isEmpty(VERSION.INCREMENTAL)) {
            z = false;
        } else {
            z = VERSION.INCREMENTAL.matches(REGULAR_EXPRESSION_FOR_DEVELOPMENT);
        }
        IS_DEVELOPMENT_VERSION = z;
        if ("user".equals(TYPE)) {
            z = IS_DEVELOPMENT_VERSION ^ 1;
        } else {
            z = false;
        }
        IS_STABLE_VERSION = z;
        if (IS_DEVELOPMENT_VERSION) {
            z = true;
        } else {
            z = IS_STABLE_VERSION;
        }
        IS_OFFICIAL_VERSION = z;
        if (SystemProperties.getInt("ro.debuggable", 0) != 1) {
            z2 = false;
        }
        IS_DEBUGGABLE = z2;
    }

    public static String getRegion() {
        return SystemProperties.get("ro.miui.region", "CN");
    }

    public static boolean checkRegion(String region) {
        return getRegion().equalsIgnoreCase(region);
    }

    private static boolean hasMsm8660Property() {
        String soc = SystemProperties.get("ro.soc.name");
        return !"msm8660".equals(soc) ? "unkown".equals(soc) : true;
    }

    private static boolean isTablet() {
        return SystemProperties.get("ro.build.characteristics").contains("tablet");
    }

    public static boolean hasCameraFlash(Context context) {
        return FeatureParser.getBoolean("support_torch", true);
    }

    public static int getUserMode() {
        return SystemProperties.getInt(USER_MODE, 0);
    }

    public static void setUserMode(Context context, int mode) {
        SystemProperties.set(USER_MODE, Integer.toString(mode));
        MiuiPowerManager.reboot(false, null, false);
    }

    public static String getCustVariant() {
        if (IS_INTERNATIONAL_BUILD) {
            return SystemProperties.get("ro.miui.cust_variant", "hk");
        }
        return SystemProperties.get("ro.miui.cust_variant", "cn");
    }

    private static String getUserdataImageVersionCode() {
        if ("".equals(SystemProperties.get("ro.miui.userdata_version", ""))) {
            return "Unavailable";
        }
        String region;
        if (IS_INTERNATIONAL_BUILD) {
            region = "global";
        } else {
            region = "cn";
        }
        String carrier = SystemProperties.get("ro.carrier.name", "");
        if (!"".equals(carrier)) {
            carrier = "_" + carrier;
        }
        return String.format("%s(%s%s)", new Object[]{versionCodeProperty, region, carrier});
    }
}
