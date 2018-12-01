.class public Lmiui/os/Build;
.super Landroid/os/Build;
.source "Build.java"


# static fields
.field public static final HAS_CUST_PARTITION:Z

.field public static final IS_ALPHA_BUILD:Z

.field public static final IS_CDMA:Z

.field public static final IS_CM_COOPERATION:Z

.field public static final IS_CM_CUSTOMIZATION:Z

.field public static final IS_CM_CUSTOMIZATION_TEST:Z

.field public static final IS_CTA_BUILD:Z

.field public static final IS_CTS_BUILD:Z

.field public static final IS_CT_CUSTOMIZATION:Z

.field public static final IS_CT_CUSTOMIZATION_TEST:Z

.field public static final IS_CU_CUSTOMIZATION:Z

.field public static final IS_CU_CUSTOMIZATION_TEST:Z

.field public static final IS_DEBUGGABLE:Z

.field public static final IS_DEVELOPMENT_VERSION:Z

.field public static final IS_FUNCTION_LIMITED:Z

.field public static final IS_GLOBAL_BUILD:Z

.field public static final IS_HONGMI:Z

.field public static final IS_HONGMI2_TDSCDMA:Z

.field public static final IS_HONGMI_THREE:Z

.field public static final IS_HONGMI_THREEX:Z

.field public static final IS_HONGMI_THREEX_CM:Z

.field public static final IS_HONGMI_THREEX_CT:Z

.field public static final IS_HONGMI_THREEX_CU:Z

.field public static final IS_HONGMI_THREE_LTE:Z

.field public static final IS_HONGMI_THREE_LTE_CM:Z

.field public static final IS_HONGMI_THREE_LTE_CU:Z

.field public static final IS_HONGMI_TWO:Z

.field public static final IS_HONGMI_TWOS_LTE_MTK:Z

.field public static final IS_HONGMI_TWOX:Z

.field public static final IS_HONGMI_TWOX_BR:Z

.field public static final IS_HONGMI_TWOX_CM:Z

.field public static final IS_HONGMI_TWOX_CT:Z

.field public static final IS_HONGMI_TWOX_CU:Z

.field public static final IS_HONGMI_TWOX_IN:Z

.field public static final IS_HONGMI_TWOX_LC:Z

.field public static final IS_HONGMI_TWOX_SA:Z

.field public static final IS_HONGMI_TWO_A:Z

.field public static final IS_HONGMI_TWO_S:Z

.field public static final IS_INTERNATIONAL_BUILD:Z

.field public static final IS_MI1S:Z

.field public static final IS_MI2A:Z

.field public static final IS_MIFIVE:Z

.field public static final IS_MIFOUR:Z

.field public static final IS_MIFOUR_CDMA:Z

.field public static final IS_MIFOUR_LTE_CM:Z

.field public static final IS_MIFOUR_LTE_CT:Z

.field public static final IS_MIFOUR_LTE_CU:Z

.field public static final IS_MIFOUR_LTE_INDIA:Z

.field public static final IS_MIFOUR_LTE_SEASA:Z

.field public static final IS_MIONE:Z

.field public static final IS_MIONE_CDMA:Z

.field public static final IS_MIPAD:Z

.field public static final IS_MITHREE:Z

.field public static final IS_MITHREE_CDMA:Z

.field public static final IS_MITHREE_TDSCDMA:Z

.field public static final IS_MITWO:Z

.field public static final IS_MITWO_CDMA:Z

.field public static final IS_MITWO_TDSCDMA:Z

.field public static final IS_N7:Z

.field public static final IS_OFFICIAL_VERSION:Z

.field public static final IS_PRIVATE_BUILD:Z

.field public static final IS_PRO_DEVICE:Z

.field public static final IS_STABLE_VERSION:Z

.field public static final IS_TABLET:Z

.field public static final IS_TDS_CDMA:Z

.field public static final IS_XIAOMI:Z

.field private static final REGULAR_EXPRESSION_FOR_DEVELOPMENT:Ljava/lang/String; = "\\d+.\\d+.\\d+(-internal)?"

.field private static final REGULAR_EXPRESSION_FOR_STABLE:Ljava/lang/String; = "([A-Z]{3}|[A-Z]{7})\\d+.\\d+"

.field public static final USERDATA_IMAGE_VERSION_CODE:Ljava/lang/String;

.field public static final USER_MODE:Ljava/lang/String; = "persist.sys.user_mode"

.field public static final USER_MODE_ELDER:I = 0x1

.field public static final USER_MODE_NORMAL:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 41
    const-string/jumbo v0, "mione"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b2

    const-string/jumbo v0, "mione_plus"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_16
    sput-boolean v0, Lmiui/os/Build;->IS_MIONE:Z

    .line 44
    const-string/jumbo v0, "MI 1S"

    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b5

    const-string/jumbo v0, "MI 1SC"

    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_2c
    sput-boolean v0, Lmiui/os/Build;->IS_MI1S:Z

    .line 47
    const-string/jumbo v0, "aries"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b8

    const-string/jumbo v0, "taurus"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b8

    const-string/jumbo v0, "taurus_td"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_4d
    sput-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    .line 50
    const-string/jumbo v0, "MI 2A"

    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4bb

    const-string/jumbo v0, "MI 2A TD"

    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_63
    sput-boolean v0, Lmiui/os/Build;->IS_MI2A:Z

    .line 53
    const-string/jumbo v0, "pisces"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4be

    const-string/jumbo v0, "cancro"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c1

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v3, "MI 3"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    :goto_84
    sput-boolean v0, Lmiui/os/Build;->IS_MITHREE:Z

    .line 56
    const-string/jumbo v0, "cancro"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c4

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v3, "MI 4"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    :goto_9a
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    .line 59
    const-string/jumbo v0, "virgo"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    .line 62
    sget-boolean v0, Lmiui/os/Build;->IS_MIONE:Z

    if-nez v0, :cond_4c7

    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    if-nez v0, :cond_4c7

    sget-boolean v0, Lmiui/os/Build;->IS_MITHREE:Z

    if-nez v0, :cond_4c7

    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-nez v0, :cond_4c7

    sget-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    :goto_b9
    sput-boolean v0, Lmiui/os/Build;->IS_XIAOMI:Z

    .line 68
    const-string/jumbo v0, "mocha"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_MIPAD:Z

    .line 70
    const-string/jumbo v0, "flo"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_N7:Z

    .line 77
    const-string/jumbo v0, "armani"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    .line 80
    const-string/jumbo v0, "HM2014011"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4ca

    const-string/jumbo v0, "HM2014012"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_f0
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    .line 83
    const-string/jumbo v0, "HM2014501"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    .line 86
    const-string/jumbo v0, "HM2013022"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4cd

    const-string/jumbo v0, "HM2013023"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4cd

    .line 87
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    .line 86
    if-nez v0, :cond_4cd

    .line 87
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    .line 86
    :goto_119
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO:Z

    .line 90
    const-string/jumbo v0, "lcsh92_wet_jb9"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d0

    const-string/jumbo v0, "lcsh92_wet_tdd"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_12f
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    .line 93
    const-string/jumbo v0, "dior"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE:Z

    .line 96
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE:Z

    if-eqz v0, :cond_4d3

    const-string/jumbo v0, "LTETD"

    const-string/jumbo v3, "ro.boot.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_14e
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE_CM:Z

    .line 99
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE:Z

    if-eqz v0, :cond_4d6

    const-string/jumbo v0, "LTEW"

    const-string/jumbo v3, "ro.boot.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_162
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE_CU:Z

    .line 102
    const-string/jumbo v0, "HM2014811"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CU:Z

    .line 105
    const-string/jumbo v0, "HM2014812"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d9

    const-string/jumbo v0, "HM2014821"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_183
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CT:Z

    .line 108
    const-string/jumbo v0, "HM2014813"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4dc

    const-string/jumbo v0, "HM2014112"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_199
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CM:Z

    .line 111
    const-string/jumbo v0, "HM2014818"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_IN:Z

    .line 114
    const-string/jumbo v0, "HM2014817"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_SA:Z

    .line 117
    const-string/jumbo v0, "HM2014819"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_BR:Z

    .line 120
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CU:Z

    if-nez v0, :cond_4df

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CT:Z

    if-nez v0, :cond_4df

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_CM:Z

    if-nez v0, :cond_4df

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_IN:Z

    if-nez v0, :cond_4df

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_SA:Z

    if-nez v0, :cond_4df

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_BR:Z

    :goto_1d2
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    .line 123
    const-string/jumbo v0, "lte26007"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    .line 126
    const-string/jumbo v0, "gucci"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX:Z

    .line 129
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX:Z

    if-eqz v0, :cond_4e2

    const-string/jumbo v0, "cm"

    const-string/jumbo v3, "persist.sys.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_1fc
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX_CM:Z

    .line 132
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX:Z

    if-eqz v0, :cond_4e5

    const-string/jumbo v0, "cu"

    const-string/jumbo v3, "persist.sys.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_210
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX_CU:Z

    .line 135
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX:Z

    if-eqz v0, :cond_4e8

    const-string/jumbo v0, "ct"

    const-string/jumbo v3, "persist.sys.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_224
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX_CT:Z

    .line 139
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE_LTE:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    if-nez v0, :cond_4eb

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREEX:Z

    :goto_240
    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI:Z

    .line 146
    sget-boolean v0, Lmiui/os/Build;->IS_MIONE:Z

    if-eqz v0, :cond_4ee

    invoke-static {}, Lmiui/os/Build;->hasMsm8660Property()Z

    move-result v0

    :goto_24a
    sput-boolean v0, Lmiui/os/Build;->IS_MIONE_CDMA:Z

    .line 149
    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    if-eqz v0, :cond_4f1

    const-string/jumbo v0, "CDMA"

    .line 150
    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 149
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_25e
    sput-boolean v0, Lmiui/os/Build;->IS_MITWO_CDMA:Z

    .line 153
    sget-boolean v0, Lmiui/os/Build;->IS_MITHREE:Z

    if-eqz v0, :cond_4f4

    const-string/jumbo v0, "MI 3C"

    sget-object v3, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_26d
    sput-boolean v0, Lmiui/os/Build;->IS_MITHREE_CDMA:Z

    .line 156
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_4f7

    const-string/jumbo v0, "CDMA"

    .line 157
    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 156
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_281
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_CDMA:Z

    .line 160
    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    if-eqz v0, :cond_4fa

    const-string/jumbo v0, "TD"

    .line 161
    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 160
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_295
    sput-boolean v0, Lmiui/os/Build;->IS_MITWO_TDSCDMA:Z

    .line 164
    sget-boolean v0, Lmiui/os/Build;->IS_MITHREE:Z

    if-eqz v0, :cond_4fd

    const-string/jumbo v0, "TD"

    .line 165
    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 164
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_2a9
    sput-boolean v0, Lmiui/os/Build;->IS_MITHREE_TDSCDMA:Z

    .line 168
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_500

    .line 169
    const-string/jumbo v0, "LTE-CMCC"

    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 168
    :goto_2bd
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_CM:Z

    .line 172
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_503

    .line 173
    const-string/jumbo v0, "LTE-CU"

    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 172
    :goto_2d1
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_CU:Z

    .line 176
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_506

    .line 177
    const-string/jumbo v0, "LTE-CT"

    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 176
    :goto_2e5
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_CT:Z

    .line 180
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_509

    .line 181
    const-string/jumbo v0, "LTE-India"

    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 180
    :goto_2f9
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_INDIA:Z

    .line 184
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_50c

    .line 185
    const-string/jumbo v0, "LTE-SEAsa"

    const-string/jumbo v3, "persist.radio.modem"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 184
    :goto_30d
    sput-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_SEASA:Z

    .line 188
    const-string/jumbo v0, "HM2013022"

    sget-object v3, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_HONGMI2_TDSCDMA:Z

    .line 191
    sget-boolean v0, Lmiui/os/Build;->IS_MIONE_CDMA:Z

    if-nez v0, :cond_50f

    sget-boolean v0, Lmiui/os/Build;->IS_MITWO_CDMA:Z

    if-nez v0, :cond_50f

    sget-boolean v0, Lmiui/os/Build;->IS_MITHREE_CDMA:Z

    if-nez v0, :cond_50f

    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR_CDMA:Z

    if-nez v0, :cond_50f

    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR_LTE_CT:Z

    :goto_32c
    sput-boolean v0, Lmiui/os/Build;->IS_CDMA:Z

    .line 194
    sget-boolean v0, Lmiui/os/Build;->IS_MITHREE_TDSCDMA:Z

    if-nez v0, :cond_512

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI2_TDSCDMA:Z

    if-nez v0, :cond_512

    sget-boolean v0, Lmiui/os/Build;->IS_MITWO_TDSCDMA:Z

    :goto_338
    sput-boolean v0, Lmiui/os/Build;->IS_TDS_CDMA:Z

    .line 197
    const-string/jumbo v0, "cu"

    .line 198
    const-string/jumbo v3, "ro.carrier.name"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 197
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CU_CUSTOMIZATION:Z

    .line 201
    const-string/jumbo v0, "cm"

    .line 202
    const-string/jumbo v3, "ro.carrier.name"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 201
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_518

    .line 202
    const-string/jumbo v0, "cn_chinamobile"

    .line 203
    const-string/jumbo v3, "ro.miui.cust_variant"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 202
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_515

    .line 203
    const-string/jumbo v0, "cn_cta"

    .line 204
    const-string/jumbo v3, "ro.miui.cust_variant"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 203
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 201
    :goto_378
    sput-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION:Z

    .line 207
    const-string/jumbo v0, "cm"

    .line 208
    const-string/jumbo v3, "ro.carrier.name"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 207
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51b

    .line 208
    const-string/jumbo v0, "cn_cmcooperation"

    .line 209
    const-string/jumbo v3, "ro.miui.cust_variant"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 208
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 207
    :goto_398
    sput-boolean v0, Lmiui/os/Build;->IS_CM_COOPERATION:Z

    .line 212
    const-string/jumbo v0, "ct"

    .line 213
    const-string/jumbo v3, "ro.carrier.name"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 212
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CT_CUSTOMIZATION:Z

    .line 217
    sget-object v0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_51e

    .line 218
    sget-object v0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    const-string/jumbo v3, "\\d+.\\d+.\\d+(-internal)?"

    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    .line 216
    :goto_3bb
    sput-boolean v0, Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z

    .line 221
    const-string/jumbo v0, "user"

    sget-object v3, Lmiui/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_521

    .line 222
    sget-boolean v0, Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z

    xor-int/lit8 v0, v0, 0x1

    .line 221
    :goto_3cc
    sput-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    .line 225
    sget-boolean v0, Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z

    if-nez v0, :cond_524

    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    :goto_3d4
    sput-boolean v0, Lmiui/os/Build;->IS_OFFICIAL_VERSION:Z

    .line 228
    const-string/jumbo v0, "ro.product.mod_device"

    const-string/jumbo v3, ""

    invoke-static {v0, v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v3, "_alpha"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_ALPHA_BUILD:Z

    .line 234
    const-string/jumbo v0, "persist.sys.miui_optimization"

    const-string/jumbo v3, "1"

    .line 235
    const-string/jumbo v4, "ro.miui.cts"

    invoke-static {v4}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 234
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Lmiui/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lmiui/os/Build;->IS_CTS_BUILD:Z

    .line 238
    const-string/jumbo v0, "1"

    .line 239
    const-string/jumbo v3, "ro.miui.cta"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 238
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CTA_BUILD:Z

    .line 242
    sget-boolean v0, Lcom/miui/internal/cust/PrivateConfig;->IS_PRIVATE_BUILD:Z

    sput-boolean v0, Lmiui/os/Build;->IS_PRIVATE_BUILD:Z

    .line 245
    const-string/jumbo v0, "cm"

    .line 246
    const-string/jumbo v3, "ro.cust.test"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 245
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    .line 249
    const-string/jumbo v0, "cu"

    .line 250
    const-string/jumbo v3, "ro.cust.test"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 249
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CU_CUSTOMIZATION_TEST:Z

    .line 253
    const-string/jumbo v0, "ct"

    .line 254
    const-string/jumbo v3, "ro.cust.test"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 253
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_CT_CUSTOMIZATION_TEST:Z

    .line 257
    const-string/jumbo v0, "1"

    .line 258
    const-string/jumbo v3, "persist.sys.func_limit_switch"

    invoke-static {v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 257
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_FUNCTION_LIMITED:Z

    .line 291
    const-string/jumbo v0, "ro.product.mod_device"

    const-string/jumbo v3, ""

    invoke-static {v0, v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v3, "_global"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    .line 294
    const-string/jumbo v0, "ro.product.mod_device"

    const-string/jumbo v3, ""

    invoke-static {v0, v3}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v3, "_global"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z

    .line 299
    invoke-static {}, Lmiui/os/Build;->isTablet()Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_TABLET:Z

    .line 346
    invoke-static {}, Lmiui/os/Build;->getUserdataImageVersionCode()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmiui/os/Build;->USERDATA_IMAGE_VERSION_CODE:Ljava/lang/String;

    .line 380
    const-string/jumbo v0, "ro.debuggable"

    invoke-static {v0, v2}, Lmiui/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_527

    .line 379
    :goto_493
    sput-boolean v1, Lmiui/os/Build;->IS_DEBUGGABLE:Z

    .line 386
    const-string/jumbo v0, "ro.miui.has_cust_partition"

    .line 385
    invoke-static {v0, v2}, Lmiui/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->HAS_CUST_PARTITION:Z

    .line 392
    const-string/jumbo v0, "ro.miui.cust_device"

    const-string/jumbo v1, ""

    .line 391
    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 392
    const-string/jumbo v1, "_pro"

    .line 391
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lmiui/os/Build;->IS_PRO_DEVICE:Z

    .line 20
    return-void

    :cond_4b2
    move v0, v1

    .line 41
    goto/16 :goto_16

    :cond_4b5
    move v0, v1

    .line 44
    goto/16 :goto_2c

    :cond_4b8
    move v0, v1

    .line 47
    goto/16 :goto_4d

    :cond_4bb
    move v0, v1

    .line 50
    goto/16 :goto_63

    :cond_4be
    move v0, v1

    .line 53
    goto/16 :goto_84

    :cond_4c1
    move v0, v2

    goto/16 :goto_84

    :cond_4c4
    move v0, v2

    .line 56
    goto/16 :goto_9a

    :cond_4c7
    move v0, v1

    .line 62
    goto/16 :goto_b9

    :cond_4ca
    move v0, v1

    .line 80
    goto/16 :goto_f0

    :cond_4cd
    move v0, v1

    .line 86
    goto/16 :goto_119

    :cond_4d0
    move v0, v1

    .line 90
    goto/16 :goto_12f

    :cond_4d3
    move v0, v2

    .line 96
    goto/16 :goto_14e

    :cond_4d6
    move v0, v2

    .line 99
    goto/16 :goto_162

    :cond_4d9
    move v0, v1

    .line 105
    goto/16 :goto_183

    :cond_4dc
    move v0, v1

    .line 108
    goto/16 :goto_199

    :cond_4df
    move v0, v1

    .line 120
    goto/16 :goto_1d2

    :cond_4e2
    move v0, v2

    .line 129
    goto/16 :goto_1fc

    :cond_4e5
    move v0, v2

    .line 132
    goto/16 :goto_210

    :cond_4e8
    move v0, v2

    .line 135
    goto/16 :goto_224

    :cond_4eb
    move v0, v1

    .line 139
    goto/16 :goto_240

    :cond_4ee
    move v0, v2

    .line 146
    goto/16 :goto_24a

    :cond_4f1
    move v0, v2

    .line 149
    goto/16 :goto_25e

    :cond_4f4
    move v0, v2

    .line 153
    goto/16 :goto_26d

    :cond_4f7
    move v0, v2

    .line 156
    goto/16 :goto_281

    :cond_4fa
    move v0, v2

    .line 160
    goto/16 :goto_295

    :cond_4fd
    move v0, v2

    .line 164
    goto/16 :goto_2a9

    :cond_500
    move v0, v2

    .line 168
    goto/16 :goto_2bd

    :cond_503
    move v0, v2

    .line 172
    goto/16 :goto_2d1

    :cond_506
    move v0, v2

    .line 176
    goto/16 :goto_2e5

    :cond_509
    move v0, v2

    .line 180
    goto/16 :goto_2f9

    :cond_50c
    move v0, v2

    .line 184
    goto/16 :goto_30d

    :cond_50f
    move v0, v1

    .line 191
    goto/16 :goto_32c

    :cond_512
    move v0, v1

    .line 194
    goto/16 :goto_338

    :cond_515
    move v0, v1

    .line 202
    goto/16 :goto_378

    :cond_518
    move v0, v2

    .line 201
    goto/16 :goto_378

    :cond_51b
    move v0, v2

    .line 207
    goto/16 :goto_398

    :cond_51e
    move v0, v2

    .line 217
    goto/16 :goto_3bb

    :cond_521
    move v0, v2

    .line 221
    goto/16 :goto_3cc

    :cond_524
    move v0, v1

    .line 225
    goto/16 :goto_3d4

    :cond_527
    move v1, v2

    .line 380
    goto/16 :goto_493
.end method

.method protected constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/os/Build;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/InstantiationException;

    const-string/jumbo v1, "Cannot instantiate utility class"

    invoke-direct {v0, v1}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkRegion(Ljava/lang/String;)Z
    .registers 2
    .param p0, "region"    # Ljava/lang/String;

    .prologue
    .line 287
    invoke-static {}, Lmiui/os/Build;->getRegion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static getCustVariant()Ljava/lang/String;
    .registers 2

    .prologue
    .line 338
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v0, :cond_f

    .line 339
    const-string/jumbo v0, "ro.miui.cust_variant"

    const-string/jumbo v1, "cn"

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 341
    :cond_f
    const-string/jumbo v0, "ro.miui.cust_variant"

    const-string/jumbo v1, "hk"

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRegion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 273
    const-string/jumbo v0, "ro.miui.region"

    const-string/jumbo v1, "CN"

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserMode()I
    .registers 2

    .prologue
    .line 327
    const-string/jumbo v0, "persist.sys.user_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private static getUserdataImageVersionCode()Ljava/lang/String;
    .registers 6

    .prologue
    .line 356
    const-string/jumbo v3, "ro.miui.userdata_version"

    const-string/jumbo v4, ""

    invoke-static {v3, v4}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 357
    .local v2, "versionCodeProperty":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 358
    const-string/jumbo v3, "Unavailable"

    return-object v3

    .line 362
    :cond_17
    sget-boolean v3, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v3, :cond_59

    .line 363
    const-string/jumbo v1, "global"

    .line 368
    .local v1, "region":Ljava/lang/String;
    :goto_1e
    const-string/jumbo v3, "ro.carrier.name"

    const-string/jumbo v4, ""

    invoke-static {v3, v4}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 369
    .local v0, "carrier":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_45

    .line 370
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 373
    :cond_45
    const-string/jumbo v3, "%s(%s%s)"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    const/4 v5, 0x2

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 365
    .end local v0    # "carrier":Ljava/lang/String;
    .end local v1    # "region":Ljava/lang/String;
    :cond_59
    const-string/jumbo v1, "cn"

    .restart local v1    # "region":Ljava/lang/String;
    goto :goto_1e
.end method

.method public static hasCameraFlash(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 313
    const-string/jumbo v0, "support_torch"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static hasMsm8660Property()Z
    .registers 2

    .prologue
    .line 303
    const-string/jumbo v1, "ro.soc.name"

    invoke-static {v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "soc":Ljava/lang/String;
    const-string/jumbo v1, "msm8660"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const-string/jumbo v1, "unkown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x1

    goto :goto_17
.end method

.method private static isTablet()Z
    .registers 2

    .prologue
    .line 309
    const-string/jumbo v0, "ro.build.characteristics"

    invoke-static {v0}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "tablet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static setUserMode(Landroid/content/Context;I)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mode"    # I

    .prologue
    const/4 v2, 0x0

    .line 332
    const-string/jumbo v0, "persist.sys.user_mode"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    const/4 v0, 0x0

    invoke-static {v2, v0, v2}, Lmiui/os/MiuiPowerManager;->reboot(ZLjava/lang/String;Z)V

    .line 334
    return-void
.end method
