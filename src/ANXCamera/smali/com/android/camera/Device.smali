.class public Lcom/android/camera/Device;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field public static final BUILD_DEVICE:Ljava/lang/String;

.field public static final IS_A1:Z

.field public static final IS_A10:Z

.field public static final IS_A12:Z

.field public static final IS_A13:Z

.field public static final IS_A1Pro:Z

.field public static final IS_A4:Z

.field public static final IS_A7:Z

.field public static final IS_A8:Z

.field public static final IS_A9:Z

.field public static final IS_B3:Z

.field public static final IS_B3_PRO:Z

.field public static final IS_B5:Z

.field public static final IS_B6:Z

.field public static final IS_B7:Z

.field public static final IS_C1:Z

.field public static final IS_C2:Z

.field public static final IS_C2Q:Z

.field public static final IS_C3A:Z

.field public static final IS_C5:Z

.field public static final IS_C6:Z

.field public static final IS_C8:Z

.field public static final IS_CM_TEST:Z

.field public static final IS_D2:Z

.field public static final IS_D3:Z

.field public static final IS_D4:Z

.field public static final IS_D5:Z

.field public static final IS_D5X:Z

.field public static final IS_D6S:Z

.field public static final IS_E1:Z

.field public static final IS_E10:Z

.field public static final IS_E2:Z

.field public static final IS_E7:Z

.field public static final IS_E7S:Z

.field public static final IS_E8:Z

.field public static final IS_H2XLTE:Z

.field public static final IS_H2X_LC:Z

.field public static final IS_H3C:Z

.field public static final IS_HM:Z

.field public static final IS_HM2:Z

.field public static final IS_HM2A:Z

.field public static final IS_HM2S:Z

.field public static final IS_HM2S_LTE:Z

.field public static final IS_HM3:Z

.field public static final IS_HM3A:Z

.field public static final IS_HM3B:Z

.field public static final IS_HM3LTE:Z

.field public static final IS_HM3X:Z

.field public static final IS_HM3Y:Z

.field public static final IS_HM3Z:Z

.field public static final IS_HONGMI:Z

.field public static final IS_MI2:Z

.field public static final IS_MI2A:Z

.field public static final IS_MI3:Z

.field public static final IS_MI3TD:Z

.field public static final IS_MI3W:Z

.field public static final IS_MI4:Z

.field public static final IS_NEXUS5:Z

.field public static final IS_PAD1:Z

.field public static final IS_STABLE:Z

.field public static final IS_X11:Z

.field public static final IS_X3TD:Z

.field public static final IS_X5:Z

.field public static final IS_X7:Z

.field public static final IS_X9:Z

.field public static final IS_XIAOMI:Z

.field public static final MODULE:Ljava/lang/String;

.field private static sFpNavEventNameList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 14
    sget-object v0, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    .line 22
    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/Device;->MODULE:Ljava/lang/String;

    .line 23
    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_MI2:Z

    .line 24
    sget-boolean v0, Lmiui/os/Build;->IS_MI2A:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_MI2A:Z

    .line 25
    const-string/jumbo v0, "pisces"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_MI3TD:Z

    .line 26
    const-string/jumbo v0, "cancro"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v3, "MI 3"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    sput-boolean v0, Lcom/android/camera/Device;->IS_MI3W:Z

    .line 27
    sget-boolean v0, Lcom/android/camera/Device;->IS_MI3W:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/android/camera/Device;->IS_MI3TD:Z

    :goto_1
    sput-boolean v0, Lcom/android/camera/Device;->IS_MI3:Z

    .line 28
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    xor-int/lit8 v0, v0, 0x1

    :goto_2
    sput-boolean v0, Lcom/android/camera/Device;->IS_HM:Z

    .line 29
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM2S:Z

    .line 30
    sget-boolean v0, Lcom/android/camera/Device;->IS_HM:Z

    if-nez v0, :cond_4

    sget-boolean v0, Lcom/android/camera/Device;->IS_HM2S:Z

    :goto_3
    sput-boolean v0, Lcom/android/camera/Device;->IS_HM2:Z

    .line 31
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM2S_LTE:Z

    .line 32
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM2A:Z

    .line 33
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3:Z

    .line 34
    const-string/jumbo v0, "gucci"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3X:Z

    .line 35
    const-string/jumbo v0, "hermes"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3Y:Z

    .line 36
    const-string/jumbo v0, "hennessy"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3Z:Z

    .line 37
    const-string/jumbo v0, "dior"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3LTE:Z

    .line 38
    const-string/jumbo v0, "kenzo"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3A:Z

    .line 39
    const-string/jumbo v0, "kate"

    sget-object v3, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HM3B:Z

    .line 40
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    const-string/jumbo v0, "HM2014816"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    :cond_0
    sput-boolean v2, Lcom/android/camera/Device;->IS_H2XLTE:Z

    .line 41
    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_H2X_LC:Z

    .line 42
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_MI4:Z

    .line 43
    sget-boolean v0, Lmiui/os/Build;->IS_MIPAD:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_PAD1:Z

    .line 44
    sget-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_X5:Z

    .line 45
    const-string/jumbo v0, "leo"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_X7:Z

    .line 46
    const-string/jumbo v0, "ferrari"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_X9:Z

    .line 47
    const-string/jumbo v0, "ido"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A9:Z

    .line 48
    const-string/jumbo v0, "aqua"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A10:Z

    .line 49
    const-string/jumbo v0, "gemini"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A1:Z

    .line 50
    const-string/jumbo v0, "gold"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A1Pro:Z

    .line 51
    const-string/jumbo v0, "capricorn"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A7:Z

    .line 52
    const-string/jumbo v0, "natrium"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_B7:Z

    .line 53
    const-string/jumbo v0, "lithium"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A8:Z

    .line 54
    const-string/jumbo v0, "scorpio"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A4:Z

    .line 55
    const-string/jumbo v0, "libra"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_X11:Z

    .line 56
    const-string/jumbo v0, "land"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A12:Z

    .line 57
    const-string/jumbo v0, "hydrogen"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_B3:Z

    .line 58
    const-string/jumbo v0, "helium"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_B3_PRO:Z

    .line 59
    const-string/jumbo v0, "omega"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_H3C:Z

    .line 60
    sget-object v0, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    const-string/jumbo v2, "nike"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_B6:Z

    .line 61
    sget-object v0, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    const-string/jumbo v2, "mark"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_B5:Z

    .line 62
    sget-object v0, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    const-string/jumbo v2, "prada"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C5:Z

    .line 63
    sget-object v0, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    const-string/jumbo v2, "mido"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C6:Z

    .line 64
    const-string/jumbo v0, "rolex"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C3A:Z

    .line 65
    const-string/jumbo v0, "sagit"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C1:Z

    .line 66
    const-string/jumbo v0, "centaur"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C2:Z

    .line 67
    const-string/jumbo v0, "achilles"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C2Q:Z

    .line 68
    const-string/jumbo v0, "jason"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_C8:Z

    .line 69
    const-string/jumbo v0, "tiffany"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D2:Z

    .line 70
    const-string/jumbo v0, "ulysse"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D3:Z

    .line 71
    const-string/jumbo v0, "oxygen"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D4:Z

    .line 72
    const-string/jumbo v0, "chiron"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D5:Z

    .line 73
    const-string/jumbo v0, "ugg"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D6S:Z

    .line 74
    const-string/jumbo v0, "vince"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E7:Z

    .line 75
    const-string/jumbo v0, "whyred"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E7S:Z

    .line 76
    const-string/jumbo v0, "beryllium"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E10:Z

    .line 77
    const-string/jumbo v0, "pisces"

    sget-object v2, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_X3TD:Z

    .line 78
    const-string/jumbo v0, "is_hongmi"

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_HONGMI:Z

    .line 79
    const-string/jumbo v0, "is_xiaomi"

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_XIAOMI:Z

    .line 80
    const-string/jumbo v0, "hammerhead"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_NEXUS5:Z

    .line 81
    const-string/jumbo v0, "santoni"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_A13:Z

    .line 82
    const-string/jumbo v0, "polaris"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_D5X:Z

    .line 83
    const-string/jumbo v0, "sirius"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E2:Z

    .line 84
    const-string/jumbo v0, "dipper"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E1:Z

    .line 85
    const-string/jumbo v0, "ursa"

    sget-object v1, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/Device;->IS_E8:Z

    .line 87
    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_STABLE:Z

    .line 88
    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    sput-boolean v0, Lcom/android/camera/Device;->IS_CM_TEST:Z

    .line 13
    return-void

    :cond_1
    move v0, v1

    .line 26
    goto/16 :goto_0

    :cond_2
    move v0, v2

    .line 27
    goto/16 :goto_1

    :cond_3
    move v0, v1

    .line 28
    goto/16 :goto_2

    :cond_4
    move v0, v2

    .line 30
    goto/16 :goto_3
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustScreenLight()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 174
    sget-boolean v1, Lcom/android/camera/Device;->IS_CM_TEST:Z

    if-nez v1, :cond_0

    const-string/jumbo v1, "support_camera_boost_brightness"

    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public static enableAlgorithmInFileSuffix()Z
    .locals 2

    .prologue
    .line 588
    const-string/jumbo v0, "enable_algorithm_in_file_suffix"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getFpNavEventNameList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 446
    sget-object v1, Lcom/android/camera/Device;->sFpNavEventNameList:Ljava/util/ArrayList;

    if-nez v1, :cond_0

    .line 447
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/android/camera/Device;->sFpNavEventNameList:Ljava/util/ArrayList;

    .line 448
    const-string/jumbo v1, "fp_nav_event_name_list"

    invoke-static {v1}, Lmiui/util/FeatureParser;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 449
    .local v0, "strArray":[Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 450
    sget-object v1, Lcom/android/camera/Device;->sFpNavEventNameList:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 453
    :cond_0
    sget-object v1, Lcom/android/camera/Device;->sFpNavEventNameList:Ljava/util/ArrayList;

    return-object v1
.end method

.method public static getHibernationTimeout()I
    .locals 2

    .prologue
    .line 341
    const-string/jumbo v0, "camera_hibernation_timeout_in_minutes"

    .line 342
    sget v1, Lcom/android/camera/AutoLockManager;->HIBERNATION_TIMEOUT:I

    .line 341
    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static is18x9RatioScreen()Z
    .locals 2

    .prologue
    .line 154
    const-string/jumbo v0, "is_18x9_ratio_screen"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isBackFingerSensor()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 526
    invoke-static {}, Lcom/android/camera/Device;->isFrontFingerSensor()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 527
    return v1

    .line 531
    :cond_0
    sget-boolean v0, Lcom/android/camera/Device;->IS_E8:Z

    if-eqz v0, :cond_1

    .line 532
    return v1

    .line 535
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->getFpNavEventNameList()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/Device;->getFpNavEventNameList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 536
    const/4 v0, 0x1

    return v0

    .line 539
    :cond_2
    return v1
.end method

.method public static isCameraSoundEnforced()Z
    .locals 3

    .prologue
    .line 125
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v1, :cond_1

    .line 126
    const-string/jumbo v1, "ro.miui.region"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "prop":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "KR"

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    return v1

    .line 130
    :cond_0
    const-string/jumbo v1, "KR"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    return v1

    .line 132
    .end local v0    # "prop":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public static isEffectWatermarkFilted()Z
    .locals 2

    .prologue
    .line 358
    const-string/jumbo v0, "is_camera_app_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFrontCameraAtBottom()Z
    .locals 1

    .prologue
    .line 491
    sget-boolean v0, Lcom/android/camera/Device;->IS_A8:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_D5:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_D5X:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isFrontFingerSensor()Z
    .locals 2

    .prologue
    .line 522
    const-string/jumbo v0, "front_fingerprint_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFrontVideoQualityShouldBe1080P()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 277
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2A:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_H2X_LC:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_MI3W:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_HM3:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_HM:Z

    if-nez v1, :cond_0

    .line 278
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2S:Z

    .line 277
    if-nez v1, :cond_0

    .line 278
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2S_LTE:Z

    .line 277
    if-nez v1, :cond_0

    .line 278
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI2:Z

    .line 277
    if-nez v1, :cond_0

    .line 278
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI2A:Z

    .line 277
    if-nez v1, :cond_0

    .line 278
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI3:Z

    .line 277
    if-nez v1, :cond_0

    .line 279
    const-string/jumbo v1, "is_front_video_quality_1080p"

    .line 278
    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 277
    :cond_0
    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isHFRVideoCaptureSupported()Z
    .locals 2

    .prologue
    .line 417
    const-string/jumbo v0, "is_hrf_video_capture_support"

    .line 418
    const/4 v1, 0x0

    .line 417
    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 418
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    .line 417
    :goto_0
    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isHalDoesCafWhenFlashOn()Z
    .locals 2

    .prologue
    .line 386
    const-string/jumbo v0, "is_hal_does_caf_when_flash_on"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isHoldBlurBackground()Z
    .locals 2

    .prologue
    .line 314
    const-string/jumbo v0, "is_camera_hold_blur_background"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isISPRotated()Z
    .locals 2

    .prologue
    .line 474
    const-string/jumbo v0, "is_camera_isp_rotated"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isIndiaBeautyFilter()Z
    .locals 2

    .prologue
    .line 495
    sget-boolean v0, Lcom/android/camera/Device;->IS_E7S:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_E10:Z

    if-eqz v0, :cond_1

    .line 496
    :cond_0
    const-string/jumbo v0, "india"

    const-string/jumbo v1, "ro.boot.hwc"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 498
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static isLegacyFaceBeauty()Z
    .locals 2

    .prologue
    .line 514
    const-string/jumbo v0, "is_legacy_face_beauty"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isLowPowerQRScan()Z
    .locals 2

    .prologue
    .line 346
    const-string/jumbo v0, "is_camera_lower_qrscan_frequency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMDPRender()Z
    .locals 1

    .prologue
    .line 354
    const/4 v0, 0x0

    return v0
.end method

.method public static isMTKPlatform()Z
    .locals 2

    .prologue
    .line 194
    const-string/jumbo v0, "mediatek"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lmiui/util/FeatureParser;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isNvPlatform()Z
    .locals 2

    .prologue
    .line 186
    const-string/jumbo v0, "nvidia"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lmiui/util/FeatureParser;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isPad()Z
    .locals 2

    .prologue
    .line 374
    const-string/jumbo v0, "is_pad"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isQcomPlatform()Z
    .locals 2

    .prologue
    .line 182
    const-string/jumbo v0, "qcom"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lmiui/util/FeatureParser;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isRGB888EGLPreferred()Z
    .locals 2

    .prologue
    .line 506
    const-string/jumbo v0, "is_rgb888_egl_prefer"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isResetToCCAFAfterCapture()Z
    .locals 1

    .prologue
    .line 202
    const/4 v0, 0x0

    return v0
.end method

.method public static isSubThreadFrameListener()Z
    .locals 2

    .prologue
    .line 350
    const-string/jumbo v0, "is_camera_preview_with_subthread_looper"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupport3DFaceBeauty()Z
    .locals 2

    .prologue
    .line 567
    const-string/jumbo v0, "support_3d_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportAiScene()Z
    .locals 2

    .prologue
    .line 245
    const-string/jumbo v0, "camera_supported_ai_scene"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportDynamicLightSpot()Z
    .locals 2

    .prologue
    .line 551
    const-string/jumbo v0, "support_camera_dynamic_light_spot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportFrontBeautyMFNR()Z
    .locals 2

    .prologue
    .line 559
    const-string/jumbo v0, "support_front_beauty_mfnr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportFrontFlash()Z
    .locals 2

    .prologue
    .line 510
    const-string/jumbo v0, "support_front_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportGradienter()Z
    .locals 2

    .prologue
    .line 337
    const-string/jumbo v0, "support_camera_gradienter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportGroupShot()Z
    .locals 2

    .prologue
    .line 465
    const-string/jumbo v0, "support_camera_groupshot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportLensDirtyDetect()Z
    .locals 2

    .prologue
    .line 579
    const-string/jumbo v0, "support_lens_dirty_detect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportMiFaceBeauty()Z
    .locals 2

    .prologue
    .line 571
    const-string/jumbo v0, "support_mi_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportNewFaceBeauty()Z
    .locals 1

    .prologue
    .line 575
    invoke-static {}, Lcom/android/camera/Device;->isSupport3DFaceBeauty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/Device;->isSupportMiFaceBeauty()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSupportPSensorPocketMode()Z
    .locals 2

    .prologue
    .line 502
    const-string/jumbo v0, "support_psensor_pocket_mode"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportParallelProcess()Z
    .locals 2

    .prologue
    .line 555
    const-string/jumbo v0, "support_parallel_process"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportScreenLight()Z
    .locals 2

    .prologue
    .line 547
    const-string/jumbo v0, "support_screen_light"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportSuperResolution()Z
    .locals 2

    .prologue
    .line 592
    const-string/jumbo v0, "support_super_resolution"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportVideoHFRMode()Z
    .locals 2

    .prologue
    .line 563
    const-string/jumbo v0, "support_video_hfr_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedASD()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 235
    const-string/jumbo v2, "camera_supported_asd"

    invoke-static {v2, v1}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 236
    .local v0, "asd":I
    and-int/lit8 v2, v0, 0xf

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isSupportedAgeDetection()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 145
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_0

    const-string/jumbo v1, "support_camera_age_detection"

    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public static isSupportedAoHDR()Z
    .locals 2

    .prologue
    .line 206
    const-string/jumbo v0, "support_camera_aohdr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedAsdFlash()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 230
    const-string/jumbo v2, "camera_supported_asd"

    invoke-static {v2, v1}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 231
    .local v0, "asd":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isSupportedAsdHdr()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 240
    const-string/jumbo v2, "camera_supported_asd"

    invoke-static {v2, v1}, Lmiui/util/FeatureParser;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 241
    .local v0, "asd":I
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isSupportedAsdNight()Z
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x0

    return v0
.end method

.method public static isSupportedChromaFlash()Z
    .locals 2

    .prologue
    .line 214
    const-string/jumbo v0, "support_chroma_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedEdgeTouch()Z
    .locals 2

    .prologue
    .line 362
    const-string/jumbo v0, "support_edge_handgrip"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedFastCapture()Z
    .locals 1

    .prologue
    .line 284
    const/4 v0, 0x0

    return v0
.end method

.method public static isSupportedFrontPortrait()Z
    .locals 2

    .prologue
    .line 438
    const-string/jumbo v0, "camera_is_support_portrait_front"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedGPS()Z
    .locals 2

    .prologue
    .line 149
    const-string/jumbo v0, "support_camera_record_location"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedHFR()Z
    .locals 2

    .prologue
    .line 210
    const-string/jumbo v0, "support_camera_hfr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedLongPressBurst()Z
    .locals 2

    .prologue
    .line 137
    const-string/jumbo v0, "support_camera_burst_shoot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedMagicMirror()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 390
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_0

    .line 391
    const-string/jumbo v1, "support_camera_magic_mirror"

    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 390
    :cond_0
    return v0
.end method

.method public static isSupportedManualFunction()Z
    .locals 2

    .prologue
    .line 265
    const-string/jumbo v0, "support_camera_manual_function"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedMovieSolid()Z
    .locals 2

    .prologue
    .line 101
    const-string/jumbo v0, "support_camera_movie_solid"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedMuteCameraSound()Z
    .locals 1

    .prologue
    .line 120
    invoke-static {}, Lcom/android/camera/Device;->isCameraSoundEnforced()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isSupportedNewStyleTimeWaterMark()Z
    .locals 2

    .prologue
    .line 162
    const-string/jumbo v0, "support_camera_new_style_time_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedObjectTrack()Z
    .locals 2

    .prologue
    .line 218
    const-string/jumbo v0, "support_object_track"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedOpticalZoom()Z
    .locals 2

    .prologue
    .line 430
    const-string/jumbo v0, "is_support_optical_zoom"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedPeakingMF()Z
    .locals 2

    .prologue
    .line 318
    const-string/jumbo v0, "support_camera_peaking_mf"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedPortrait()Z
    .locals 2

    .prologue
    .line 434
    const-string/jumbo v0, "is_support_portrait"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedQuickSnap()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 370
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_0

    const-string/jumbo v1, "support_camera_quick_snap"

    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public static isSupportedSecondaryStorage()Z
    .locals 2

    .prologue
    .line 198
    const-string/jumbo v0, "support_dual_sd_card"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedShaderEffect()Z
    .locals 2

    .prologue
    .line 114
    const-string/jumbo v0, "support_camera_shader_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedSkinBeautify()Z
    .locals 2

    .prologue
    .line 141
    const-string/jumbo v0, "support_camera_skin_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedStereo()Z
    .locals 2

    .prologue
    .line 426
    const-string/jumbo v0, "is_support_stereo"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedTiltShift()Z
    .locals 2

    .prologue
    .line 366
    const-string/jumbo v0, "support_camera_tilt_shift"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedTimeWaterMark()Z
    .locals 2

    .prologue
    .line 158
    const-string/jumbo v0, "support_camera_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedTorchCapture()Z
    .locals 2

    .prologue
    .line 288
    const-string/jumbo v0, "support_camera_torch_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedVideoPause()Z
    .locals 2

    .prologue
    .line 170
    const-string/jumbo v0, "support_camera_video_pause"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedVideoQuality4kUHD()Z
    .locals 2

    .prologue
    .line 222
    const-string/jumbo v0, "support_camera_4k_quality"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSurfaceSizeLimited()Z
    .locals 2

    .prologue
    .line 328
    const-string/jumbo v0, "is_surface_size_limit"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isThirdDevice()Z
    .locals 1

    .prologue
    .line 306
    sget-boolean v0, Lcom/android/camera/Device;->IS_XIAOMI:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_HONGMI:Z

    :goto_0
    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isVideoSnapshotSizeLimited()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 322
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2A:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_H2X_LC:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_MI3W:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_HM3:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/android/camera/Device;->IS_HM:Z

    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2S:Z

    .line 322
    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM2S_LTE:Z

    .line 322
    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI2:Z

    .line 322
    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI2A:Z

    .line 322
    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI3:Z

    .line 322
    if-nez v1, :cond_0

    .line 323
    sget-boolean v1, Lcom/android/camera/Device;->IS_MI4:Z

    .line 322
    if-nez v1, :cond_0

    .line 324
    const-string/jumbo v1, "is_video_snapshot_size_limit"

    .line 323
    invoke-static {v1, v0}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 322
    :cond_0
    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static supportNewBrightness()Z
    .locals 1

    .prologue
    .line 600
    sget-boolean v0, Lcom/android/camera/Device;->IS_E1:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_D5X:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static supportPictureWaterMark()Z
    .locals 2

    .prologue
    .line 596
    const-string/jumbo v0, "support_picture_watermark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
