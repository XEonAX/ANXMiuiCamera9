.class public Lcom/android/gallery3d/exif/ExifInterface;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# static fields
.field public static final DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

.field protected static final TAG:Ljava/lang/String;

.field public static final TAG_ALGORITHM_COMMENT:I

.field public static final TAG_APERTURE_VALUE:I

.field public static final TAG_ARTIST:I

.field public static final TAG_BITS_PER_SAMPLE:I

.field public static final TAG_BRIGHTNESS_VALUE:I

.field public static final TAG_CFA_PATTERN:I

.field public static final TAG_COLOR_SPACE:I

.field public static final TAG_COMPONENTS_CONFIGURATION:I

.field public static final TAG_COMPRESSED_BITS_PER_PIXEL:I

.field public static final TAG_COMPRESSION:I

.field public static final TAG_CONTRAST:I

.field public static final TAG_COPYRIGHT:I

.field public static final TAG_CUSTOM_RENDERED:I

.field public static final TAG_DATE_TIME:I

.field public static final TAG_DATE_TIME_DIGITIZED:I

.field public static final TAG_DATE_TIME_ORIGINAL:I

.field public static final TAG_DEPTH_MAP_BLUR_LEVEL:I

.field public static final TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

.field public static final TAG_DEPTH_MAP_FOCUS_POINT:I

.field public static final TAG_DEPTH_MAP_TIME_WATER_MARK:I

.field public static final TAG_DEVICE_SETTING_DESCRIPTION:I

.field public static final TAG_DIGITAL_ZOOM_RATIO:I

.field public static final TAG_EXIF_IFD:I

.field public static final TAG_EXIF_VERSION:I

.field public static final TAG_EXPOSURE_BIAS_VALUE:I

.field public static final TAG_EXPOSURE_INDEX:I

.field public static final TAG_EXPOSURE_MODE:I

.field public static final TAG_EXPOSURE_PROGRAM:I

.field public static final TAG_EXPOSURE_TIME:I

.field public static final TAG_FILE_SOURCE:I

.field public static final TAG_FLASH:I

.field public static final TAG_FLASHPIX_VERSION:I

.field public static final TAG_FLASH_ENERGY:I

.field public static final TAG_FOCAL_LENGTH:I

.field public static final TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

.field public static final TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

.field public static final TAG_FOCAL_PLANE_X_RESOLUTION:I

.field public static final TAG_FOCAL_PLANE_Y_RESOLUTION:I

.field public static final TAG_F_NUMBER:I

.field public static final TAG_GAIN_CONTROL:I

.field public static final TAG_GPS_ALTITUDE:I

.field public static final TAG_GPS_ALTITUDE_REF:I

.field public static final TAG_GPS_AREA_INFORMATION:I

.field public static final TAG_GPS_DATE_STAMP:I

.field public static final TAG_GPS_DEST_BEARING:I

.field public static final TAG_GPS_DEST_BEARING_REF:I

.field public static final TAG_GPS_DEST_DISTANCE:I

.field public static final TAG_GPS_DEST_DISTANCE_REF:I

.field public static final TAG_GPS_DEST_LATITUDE:I

.field public static final TAG_GPS_DEST_LATITUDE_REF:I

.field public static final TAG_GPS_DEST_LONGITUDE:I

.field public static final TAG_GPS_DEST_LONGITUDE_REF:I

.field public static final TAG_GPS_DIFFERENTIAL:I

.field public static final TAG_GPS_DOP:I

.field public static final TAG_GPS_IFD:I

.field public static final TAG_GPS_IMG_DIRECTION:I

.field public static final TAG_GPS_IMG_DIRECTION_REF:I

.field public static final TAG_GPS_LATITUDE:I

.field public static final TAG_GPS_LATITUDE_REF:I

.field public static final TAG_GPS_LONGITUDE:I

.field public static final TAG_GPS_LONGITUDE_REF:I

.field public static final TAG_GPS_MAP_DATUM:I

.field public static final TAG_GPS_MEASURE_MODE:I

.field public static final TAG_GPS_PROCESSING_METHOD:I

.field public static final TAG_GPS_SATTELLITES:I

.field public static final TAG_GPS_SPEED:I

.field public static final TAG_GPS_SPEED_REF:I

.field public static final TAG_GPS_STATUS:I

.field public static final TAG_GPS_TIME_STAMP:I

.field public static final TAG_GPS_TRACK:I

.field public static final TAG_GPS_TRACK_REF:I

.field public static final TAG_GPS_VERSION_ID:I

.field public static final TAG_IMAGE_DESCRIPTION:I

.field public static final TAG_IMAGE_LENGTH:I

.field public static final TAG_IMAGE_UNIQUE_ID:I

.field public static final TAG_IMAGE_WIDTH:I

.field public static final TAG_INTEROPERABILITY_IFD:I

.field public static final TAG_INTEROPERABILITY_INDEX:I

.field public static final TAG_ISO_SPEED_RATINGS:I

.field public static final TAG_JPEG_INTERCHANGE_FORMAT:I

.field public static final TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

.field public static final TAG_LIGHT_SOURCE:I

.field public static final TAG_MAKE:I

.field public static final TAG_MAKER_NOTE:I

.field public static final TAG_MAX_APERTURE_VALUE:I

.field public static final TAG_METERING_MODE:I

.field public static final TAG_MODEL:I

.field public static final TAG_OECF:I

.field public static final TAG_ORIENTATION:I

.field public static final TAG_PARALLEL_PROCESS_COMMENT:I

.field public static final TAG_PHOTOMETRIC_INTERPRETATION:I

.field public static final TAG_PIXEL_X_DIMENSION:I

.field public static final TAG_PIXEL_Y_DIMENSION:I

.field public static final TAG_PLANAR_CONFIGURATION:I

.field public static final TAG_PRIMARY_CHROMATICITIES:I

.field public static final TAG_REFERENCE_BLACK_WHITE:I

.field public static final TAG_RELATED_SOUND_FILE:I

.field public static final TAG_RESOLUTION_UNIT:I

.field public static final TAG_ROWS_PER_STRIP:I

.field public static final TAG_SAMPLES_PER_PIXEL:I

.field public static final TAG_SATURATION:I

.field public static final TAG_SCENE_CAPTURE_TYPE:I

.field public static final TAG_SCENE_TYPE:I

.field public static final TAG_SENSING_METHOD:I

.field public static final TAG_SHARPNESS:I

.field public static final TAG_SHUTTER_SPEED_VALUE:I

.field public static final TAG_SOFTWARE:I

.field public static final TAG_SPATIAL_FREQUENCY_RESPONSE:I

.field public static final TAG_SPECTRAL_SENSITIVITY:I

.field public static final TAG_STRIP_BYTE_COUNTS:I

.field public static final TAG_STRIP_OFFSETS:I

.field public static final TAG_SUBJECT_AREA:I

.field public static final TAG_SUBJECT_DISTANCE:I

.field public static final TAG_SUBJECT_DISTANCE_RANGE:I

.field public static final TAG_SUBJECT_LOCATION:I

.field public static final TAG_SUB_SEC_TIME:I

.field public static final TAG_SUB_SEC_TIME_DIGITIZED:I

.field public static final TAG_SUB_SEC_TIME_ORIGINAL:I

.field public static final TAG_TRANSFER_FUNCTION:I

.field public static final TAG_USER_COMMENT:I

.field public static final TAG_WHITE_BALANCE:I

.field public static final TAG_WHITE_POINT:I

.field public static final TAG_X_RESOLUTION:I

.field public static final TAG_Y_CB_CR_COEFFICIENTS:I

.field public static final TAG_Y_CB_CR_POSITIONING:I

.field public static final TAG_Y_CB_CR_SUB_SAMPLING:I

.field public static final TAG_Y_RESOLUTION:I

.field protected static sBannedDefines:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field private static sOffsetTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mData:Lcom/android/gallery3d/exif/ExifData;

.field private final mDateTimeStampFormat:Ljava/text/DateFormat;

.field private final mGPSDateStampFormat:Ljava/text/DateFormat;

.field private final mGPSTimeStampCalendar:Ljava/util/Calendar;

.field private mTagInfo:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x4

    const/4 v1, 0x2

    .line 68
    const-class v0, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    .line 77
    const/16 v0, 0x100

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    .line 78
    const/16 v0, 0x101

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    .line 79
    const/16 v0, 0x102

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BITS_PER_SAMPLE:I

    .line 80
    const/16 v0, 0x103

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSION:I

    .line 81
    const/16 v0, 0x106

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PHOTOMETRIC_INTERPRETATION:I

    .line 82
    const/16 v0, 0x10e

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_DESCRIPTION:I

    .line 83
    const/16 v0, 0x10f

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    .line 84
    const/16 v0, 0x110

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MODEL:I

    .line 85
    const/16 v0, 0x111

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    .line 86
    const/16 v0, 0x112

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    .line 87
    const/16 v0, 0x115

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SAMPLES_PER_PIXEL:I

    .line 88
    const/16 v0, 0x116

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ROWS_PER_STRIP:I

    .line 89
    const/16 v0, 0x117

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    .line 90
    const/16 v0, 0x11a

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_X_RESOLUTION:I

    .line 91
    const/16 v0, 0x11b

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_RESOLUTION:I

    .line 92
    const/16 v0, 0x11c

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PLANAR_CONFIGURATION:I

    .line 93
    const/16 v0, 0x128

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RESOLUTION_UNIT:I

    .line 94
    const/16 v0, 0x12d

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_TRANSFER_FUNCTION:I

    .line 95
    const/16 v0, 0x131

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SOFTWARE:I

    .line 96
    const/16 v0, 0x132

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME:I

    .line 97
    const/16 v0, 0x13b

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ARTIST:I

    .line 98
    const/16 v0, 0x13e

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_POINT:I

    .line 99
    const/16 v0, 0x13f

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PRIMARY_CHROMATICITIES:I

    .line 100
    const/16 v0, 0x211

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_COEFFICIENTS:I

    .line 101
    const/16 v0, 0x212

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_SUB_SAMPLING:I

    .line 102
    const/16 v0, 0x213

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_POSITIONING:I

    .line 103
    const/16 v0, 0x214

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_REFERENCE_BLACK_WHITE:I

    .line 104
    const/16 v0, -0x7d68

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COPYRIGHT:I

    .line 105
    const/16 v0, -0x7897

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    .line 106
    const/16 v0, -0x77db

    invoke-static {v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    .line 108
    const/16 v0, 0x201

    invoke-static {v4, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    .line 109
    const/16 v0, 0x202

    invoke-static {v4, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    .line 111
    const/16 v0, -0x7d66

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_TIME:I

    .line 112
    const/16 v0, -0x7d63

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_F_NUMBER:I

    .line 113
    const/16 v0, -0x77de

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_PROGRAM:I

    .line 114
    const/16 v0, -0x77dc

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPECTRAL_SENSITIVITY:I

    .line 115
    const/16 v0, -0x77d9

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ISO_SPEED_RATINGS:I

    .line 116
    const/16 v0, -0x77d8

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_OECF:I

    .line 117
    const/16 v0, -0x7000

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_VERSION:I

    .line 118
    const/16 v0, -0x6ffd

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_ORIGINAL:I

    .line 119
    const/16 v0, -0x6ffc

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_DIGITIZED:I

    .line 120
    const/16 v0, -0x6eff

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPONENTS_CONFIGURATION:I

    .line 121
    const/16 v0, -0x6efe

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSED_BITS_PER_PIXEL:I

    .line 122
    const/16 v0, -0x6dff

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHUTTER_SPEED_VALUE:I

    .line 123
    const/16 v0, -0x6dfe

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_APERTURE_VALUE:I

    .line 124
    const/16 v0, -0x6dfd

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BRIGHTNESS_VALUE:I

    .line 125
    const/16 v0, -0x6dfc

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_BIAS_VALUE:I

    .line 126
    const/16 v0, -0x6dfb

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAX_APERTURE_VALUE:I

    .line 127
    const/16 v0, -0x6dfa

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE:I

    .line 128
    const/16 v0, -0x6df9

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_METERING_MODE:I

    .line 129
    const/16 v0, -0x6df8

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_LIGHT_SOURCE:I

    .line 130
    const/16 v0, -0x6df7

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH:I

    .line 131
    const/16 v0, -0x6df6

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH:I

    .line 132
    const/16 v0, -0x6dec

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_AREA:I

    .line 133
    const/16 v0, -0x6d84

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKER_NOTE:I

    .line 134
    const/16 v0, -0x6d7a

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    .line 135
    const/16 v0, -0x6d70

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME:I

    .line 136
    const/16 v0, -0x6d6f

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_ORIGINAL:I

    .line 137
    const/16 v0, -0x6d6e

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_DIGITIZED:I

    .line 138
    const/16 v0, -0x6000

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASHPIX_VERSION:I

    .line 139
    const/16 v0, -0x5fff

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COLOR_SPACE:I

    .line 140
    const/16 v0, -0x5ffe

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_X_DIMENSION:I

    .line 141
    const/16 v0, -0x5ffd

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_Y_DIMENSION:I

    .line 142
    const/16 v0, -0x5ffc

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RELATED_SOUND_FILE:I

    .line 143
    const/16 v0, -0x5ffb

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    .line 144
    const/16 v0, -0x5df5

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH_ENERGY:I

    .line 145
    const/16 v0, -0x5df4

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPATIAL_FREQUENCY_RESPONSE:I

    .line 146
    const/16 v0, -0x5df2

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_X_RESOLUTION:I

    .line 147
    const/16 v0, -0x5df1

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_Y_RESOLUTION:I

    .line 148
    const/16 v0, -0x5df0

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

    .line 149
    const/16 v0, -0x5dec

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_LOCATION:I

    .line 150
    const/16 v0, -0x5deb

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_INDEX:I

    .line 151
    const/16 v0, -0x5de9

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SENSING_METHOD:I

    .line 152
    const/16 v0, -0x5d00

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FILE_SOURCE:I

    .line 153
    const/16 v0, -0x5cff

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_TYPE:I

    .line 154
    const/16 v0, -0x5cfe

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CFA_PATTERN:I

    .line 155
    const/16 v0, -0x5bff

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CUSTOM_RENDERED:I

    .line 156
    const/16 v0, -0x5bfe

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_MODE:I

    .line 157
    const/16 v0, -0x5bfd

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_BALANCE:I

    .line 158
    const/16 v0, -0x5bfc

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DIGITAL_ZOOM_RATIO:I

    .line 159
    const/16 v0, -0x5bfb

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

    .line 160
    const/16 v0, -0x5bfa

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_CAPTURE_TYPE:I

    .line 161
    const/16 v0, -0x5bf9

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GAIN_CONTROL:I

    .line 162
    const/16 v0, -0x5bf8

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CONTRAST:I

    .line 163
    const/16 v0, -0x5bf7

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SATURATION:I

    .line 164
    const/16 v0, -0x5bf6

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHARPNESS:I

    .line 165
    const/16 v0, -0x5bf5

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEVICE_SETTING_DESCRIPTION:I

    .line 166
    const/16 v0, -0x5bf4

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE_RANGE:I

    .line 167
    const/16 v0, -0x5be0

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_UNIQUE_ID:I

    .line 168
    const/16 v0, -0x7778

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    .line 170
    const/16 v0, -0x7777

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    .line 171
    const/16 v0, -0x7770

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    .line 172
    const/16 v0, -0x776f

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    .line 173
    const/16 v0, -0x776e

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    .line 174
    const/16 v0, -0x776d

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    .line 177
    invoke-static {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_VERSION_ID:I

    .line 178
    invoke-static {v2, v4}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    .line 179
    invoke-static {v2, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    .line 180
    invoke-static {v2, v5}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    .line 181
    invoke-static {v2, v2}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    .line 182
    const/4 v0, 0x5

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE_REF:I

    .line 183
    const/4 v0, 0x6

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE:I

    .line 184
    const/4 v0, 0x7

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TIME_STAMP:I

    .line 185
    const/16 v0, 0x8

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SATTELLITES:I

    .line 186
    const/16 v0, 0x9

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_STATUS:I

    .line 187
    const/16 v0, 0xa

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MEASURE_MODE:I

    .line 188
    const/16 v0, 0xb

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DOP:I

    .line 189
    const/16 v0, 0xc

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED_REF:I

    .line 190
    const/16 v0, 0xd

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED:I

    .line 191
    const/16 v0, 0xe

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK_REF:I

    .line 192
    const/16 v0, 0xf

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK:I

    .line 193
    const/16 v0, 0x10

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION_REF:I

    .line 194
    const/16 v0, 0x11

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION:I

    .line 195
    const/16 v0, 0x12

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MAP_DATUM:I

    .line 196
    const/16 v0, 0x13

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE_REF:I

    .line 197
    const/16 v0, 0x14

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE:I

    .line 198
    const/16 v0, 0x15

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LONGITUDE_REF:I

    .line 199
    const/16 v0, 0x16

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LONGITUDE:I

    .line 200
    const/16 v0, 0x17

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING_REF:I

    .line 201
    const/16 v0, 0x18

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING:I

    .line 202
    const/16 v0, 0x19

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE_REF:I

    .line 203
    const/16 v0, 0x1a

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE:I

    .line 204
    const/16 v0, 0x1b

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_PROCESSING_METHOD:I

    .line 205
    const/16 v0, 0x1c

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_AREA_INFORMATION:I

    .line 206
    const/16 v0, 0x1d

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DATE_STAMP:I

    .line 207
    const/16 v0, 0x1e

    invoke-static {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DIFFERENTIAL:I

    .line 209
    invoke-static {v5, v4}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_INDEX:I

    .line 215
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    .line 218
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 219
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 220
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 221
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 222
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v0, Ljava/util/HashSet;

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    .line 231
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    const/4 v1, -0x1

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 232
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 233
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sBannedDefines:Ljava/util/HashSet;

    sget v1, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 603
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v0, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 67
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 605
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 602
    new-instance v0, Lcom/android/gallery3d/exif/ExifData;

    sget-object v1, Lcom/android/gallery3d/exif/ExifInterface;->DEFAULT_BYTE_ORDER:Ljava/nio/ByteOrder;

    invoke-direct {v0, v1}, Lcom/android/gallery3d/exif/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    .line 1876
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy:MM:dd kk:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mDateTimeStampFormat:Ljava/text/DateFormat;

    .line 1877
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy:MM:dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSDateStampFormat:Ljava/text/DateFormat;

    .line 1879
    const-string/jumbo v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 1878
    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSTimeStampCalendar:Ljava/util/Calendar;

    .line 1989
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    .line 606
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mGPSDateStampFormat:Ljava/text/DateFormat;

    const-string/jumbo v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 607
    return-void
.end method

.method private addExifTag(ILjava/lang/Object;)Z
    .locals 2
    .param p1, "tag"    # I
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 1764
    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v0

    .line 1765
    .local v0, "t":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v0, :cond_0

    .line 1766
    const/4 v1, 0x0

    return v1

    .line 1768
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 1769
    const/4 v1, 0x1

    return v1
.end method

.method public static defineTag(IS)I
    .locals 2
    .param p0, "ifdId"    # I
    .param p1, "tagId"    # S

    .prologue
    .line 240
    const v0, 0xffff

    and-int/2addr v0, p1

    shl-int/lit8 v1, p0, 0x10

    or-int/2addr v0, v1

    return v0
.end method

.method protected static getAllowedIfdFlagsFromInfo(I)I
    .locals 1
    .param p0, "info"    # I

    .prologue
    .line 2160
    ushr-int/lit8 v0, p0, 0x18

    return v0
.end method

.method protected static getComponentCountFromInfo(I)I
    .locals 1
    .param p0, "info"    # I

    .prologue
    .line 2217
    const v0, 0xffff

    and-int/2addr v0, p0

    return v0
.end method

.method protected static getFlagsFromAllowedIfds([I)I
    .locals 8
    .param p0, "allowedIfds"    # [I

    .prologue
    const/4 v5, 0x0

    .line 2196
    if-eqz p0, :cond_0

    array-length v4, p0

    if-nez v4, :cond_1

    .line 2197
    :cond_0
    return v5

    .line 2199
    :cond_1
    const/4 v0, 0x0

    .line 2200
    .local v0, "flags":I
    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v2

    .line 2201
    .local v2, "ifds":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v4, 0x5

    if-ge v1, v4, :cond_4

    .line 2202
    array-length v6, p0

    move v4, v5

    :goto_1
    if-ge v4, v6, :cond_2

    aget v3, p0, v4

    .line 2203
    .local v3, "j":I
    aget v7, v2, v1

    if-ne v7, v3, :cond_3

    .line 2204
    const/4 v4, 0x1

    shl-int/2addr v4, v1

    or-int/2addr v0, v4

    .line 2201
    .end local v3    # "j":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2202
    .restart local v3    # "j":I
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2209
    .end local v3    # "j":I
    :cond_4
    return v0
.end method

.method public static getTrueIfd(I)I
    .locals 1
    .param p0, "tag"    # I

    .prologue
    .line 255
    ushr-int/lit8 v0, p0, 0x10

    return v0
.end method

.method public static getTrueTagKey(I)S
    .locals 1
    .param p0, "tag"    # I

    .prologue
    .line 248
    int-to-short v0, p0

    return v0
.end method

.method protected static getTypeFromInfo(I)S
    .locals 1
    .param p0, "info"    # I

    .prologue
    .line 2213
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method private initTagInfo()V
    .locals 13

    .prologue
    .line 2009
    const/4 v10, 0x0

    const/4 v11, 0x1

    .line 2008
    filled-new-array {v10, v11}, [I

    move-result-object v5

    .line 2011
    .local v5, "ifdAllowedIfds":[I
    invoke-static {v5}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v10

    shl-int/lit8 v6, v10, 0x18

    .line 2012
    .local v6, "ifdFlags":I
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2013
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2014
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2015
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BITS_PER_SAMPLE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x3

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2016
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2017
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PHOTOMETRIC_INTERPRETATION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2018
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2019
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SAMPLES_PER_PIXEL:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2020
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PLANAR_CONFIGURATION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2021
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_SUB_SAMPLING:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2022
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_POSITIONING:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2023
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_X_RESOLUTION:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2024
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_RESOLUTION:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2025
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RESOLUTION_UNIT:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2026
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2027
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ROWS_PER_STRIP:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2028
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2029
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_TRANSFER_FUNCTION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v6

    or-int/lit16 v12, v12, 0x300

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2030
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_POINT:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2031
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PRIMARY_CHROMATICITIES:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x6

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2032
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_Y_CB_CR_COEFFICIENTS:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x3

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2033
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_REFERENCE_BLACK_WHITE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x6

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2034
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x14

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2035
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_DESCRIPTION:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2036
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKE:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2037
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MODEL:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2038
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SOFTWARE:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2039
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ARTIST:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2040
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COPYRIGHT:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2041
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2042
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v6

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2044
    const/4 v10, 0x1

    new-array v4, v10, [I

    .line 2045
    const/4 v10, 0x1

    const/4 v11, 0x0

    aput v10, v4, v11

    .line 2047
    .local v4, "ifd1AllowedIfds":[I
    invoke-static {v4}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v10

    shl-int/lit8 v7, v10, 0x18

    .line 2048
    .local v7, "ifdFlags1":I
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v7

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2049
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v7

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2051
    const/4 v10, 0x1

    new-array v0, v10, [I

    .line 2052
    const/4 v10, 0x2

    const/4 v11, 0x0

    aput v10, v0, v11

    .line 2054
    .local v0, "exifAllowedIfds":[I
    invoke-static {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v10

    shl-int/lit8 v1, v10, 0x18

    .line 2055
    .local v1, "exifFlags":I
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_VERSION:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x4

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2056
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASHPIX_VERSION:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x4

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2057
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COLOR_SPACE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2058
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPONENTS_CONFIGURATION:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x4

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2059
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_COMPRESSED_BITS_PER_PIXEL:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2060
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_X_DIMENSION:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2061
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PIXEL_Y_DIMENSION:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2062
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAKER_NOTE:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2063
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2064
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_RELATED_SOUND_FILE:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0xd

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2065
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_ORIGINAL:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x14

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2066
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DATE_TIME_DIGITIZED:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x14

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2067
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2068
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_ORIGINAL:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2069
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUB_SEC_TIME_DIGITIZED:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2070
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_IMAGE_UNIQUE_ID:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x21

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2071
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_TIME:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2072
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_F_NUMBER:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2073
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_PROGRAM:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2074
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPECTRAL_SENSITIVITY:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2075
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ISO_SPEED_RATINGS:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2076
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_OECF:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2077
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHUTTER_SPEED_VALUE:I

    const/high16 v12, 0xa0000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2078
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_APERTURE_VALUE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2079
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_BRIGHTNESS_VALUE:I

    const/high16 v12, 0xa0000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2080
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_BIAS_VALUE:I

    const/high16 v12, 0xa0000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2081
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_MAX_APERTURE_VALUE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2082
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2083
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_METERING_MODE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2084
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_LIGHT_SOURCE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2085
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2086
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2087
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_AREA:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2088
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FLASH_ENERGY:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2089
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SPATIAL_FREQUENCY_RESPONSE:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2090
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_X_RESOLUTION:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2091
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_Y_RESOLUTION:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2092
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_PLANE_RESOLUTION_UNIT:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2093
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_LOCATION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2094
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_INDEX:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2095
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SENSING_METHOD:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2096
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FILE_SOURCE:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2097
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_TYPE:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2098
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CFA_PATTERN:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2099
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CUSTOM_RENDERED:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2100
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXPOSURE_MODE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2101
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_WHITE_BALANCE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2102
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DIGITAL_ZOOM_RATIO:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2103
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_FOCAL_LENGTH_IN_35_MM_FILE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2104
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SCENE_CAPTURE_TYPE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2105
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GAIN_CONTROL:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2106
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_CONTRAST:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2107
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SATURATION:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2108
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SHARPNESS:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2109
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEVICE_SETTING_DESCRIPTION:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2110
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_SUBJECT_DISTANCE_RANGE:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2111
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    const/high16 v12, 0x40000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2112
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2113
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2114
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2115
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    const/high16 v12, 0x10000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2116
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    const/high16 v12, 0x10000

    or-int/2addr v12, v1

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2118
    const/4 v10, 0x1

    new-array v2, v10, [I

    .line 2119
    const/4 v10, 0x4

    const/4 v11, 0x0

    aput v10, v2, v11

    .line 2121
    .local v2, "gpsAllowedIfds":[I
    invoke-static {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v10

    shl-int/lit8 v3, v10, 0x18

    .line 2122
    .local v3, "gpsFlags":I
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_VERSION_ID:I

    const/high16 v12, 0x10000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x4

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2123
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2124
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2125
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LATITUDE:I

    const/high16 v12, 0xa0000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x3

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2126
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_LONGITUDE:I

    const/high16 v12, 0xa0000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x3

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2127
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE_REF:I

    const/high16 v12, 0x10000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2128
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_ALTITUDE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2129
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TIME_STAMP:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x3

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2130
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SATTELLITES:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2131
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_STATUS:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2132
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MEASURE_MODE:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2133
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DOP:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2134
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2135
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_SPEED:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2136
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2137
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_TRACK:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2138
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2139
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IMG_DIRECTION:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2140
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_MAP_DATUM:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2141
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2142
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_LATITUDE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2143
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2144
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_BEARING:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2145
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE_REF:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2146
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DEST_DISTANCE:I

    const/high16 v12, 0x50000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2147
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_PROCESSING_METHOD:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2148
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_AREA_INFORMATION:I

    const/high16 v12, 0x70000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2149
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DATE_STAMP:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0xb

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2150
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_DIFFERENTIAL:I

    const/high16 v12, 0x30000

    or-int/2addr v12, v3

    or-int/lit8 v12, v12, 0xb

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2152
    const/4 v10, 0x1

    new-array v8, v10, [I

    .line 2153
    const/4 v10, 0x3

    const/4 v11, 0x0

    aput v10, v8, v11

    .line 2155
    .local v8, "interopAllowedIfds":[I
    invoke-static {v8}, Lcom/android/gallery3d/exif/ExifInterface;->getFlagsFromAllowedIfds([I)I

    move-result v10

    shl-int/lit8 v9, v10, 0x18

    .line 2156
    .local v9, "interopFlags":I
    iget-object v10, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    sget v11, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_INDEX:I

    const/high16 v12, 0x20000

    or-int/2addr v12, v9

    or-int/lit8 v12, v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->put(II)V

    .line 2157
    return-void
.end method

.method protected static isIfdAllowed(II)Z
    .locals 5
    .param p0, "info"    # I
    .param p1, "ifd"    # I

    .prologue
    const/4 v4, 0x1

    .line 2185
    invoke-static {}, Lcom/android/gallery3d/exif/IfdData;->getIfds()[I

    move-result-object v2

    .line 2186
    .local v2, "ifds":[I
    invoke-static {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getAllowedIfdFlagsFromInfo(I)I

    move-result v1

    .line 2187
    .local v1, "ifdFlags":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 2188
    aget v3, v2, v0

    if-ne p1, v3, :cond_0

    shr-int v3, v1, v0

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v4, :cond_0

    .line 2189
    return v4

    .line 2187
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2192
    :cond_1
    const/4 v3, 0x0

    return v3
.end method

.method protected static isOffsetTag(S)Z
    .locals 2
    .param p0, "tag"    # S

    .prologue
    .line 1376
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->sOffsetTags:Ljava/util/HashSet;

    invoke-static {p0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addAlgorithmComment(Ljava/lang/String;)Z
    .locals 3
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 1739
    sget-object v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "addAlgorithmComment:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1740
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_ALGORITHM_COMMENT:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addDepthMapBlurLevel(I)Z
    .locals 2
    .param p1, "level"    # I

    .prologue
    .line 1752
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addDepthMapFocusPoint(Landroid/graphics/Point;)Z
    .locals 2
    .param p1, "point"    # Landroid/graphics/Point;

    .prologue
    .line 1748
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_FOCUS_POINT:I

    invoke-virtual {p1}, Landroid/graphics/Point;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addDulCameraWaterMark([B)Z
    .locals 1
    .param p1, "waterMarkArray"    # [B

    .prologue
    .line 1756
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_DULCAMERA_WATER_MARK:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addParallelProcessComment(Ljava/lang/String;)Z
    .locals 1
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 1744
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_PARALLEL_PROCESS_COMMENT:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addTimeWaterMark([B)Z
    .locals 1
    .param p1, "waterMarkArray"    # [B

    .prologue
    .line 1760
    sget v0, Lcom/android/gallery3d/exif/ExifInterface;->TAG_DEPTH_MAP_TIME_WATER_MARK:I

    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifInterface;->addExifTag(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public buildTag(IILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 8
    .param p1, "tagId"    # I
    .param p2, "ifdId"    # I
    .param p3, "val"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 1391
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    .line 1392
    .local v6, "info":I
    if-eqz v6, :cond_0

    if-nez p3, :cond_1

    .line 1393
    :cond_0
    return-object v7

    .line 1395
    :cond_1
    invoke-static {v6}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result v2

    .line 1396
    .local v2, "type":S
    invoke-static {v6}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result v3

    .line 1397
    .local v3, "definedCount":I
    if-eqz v3, :cond_2

    const/4 v5, 0x1

    .line 1398
    .local v5, "hasDefinedCount":Z
    :goto_0
    invoke-static {v6, p2}, Lcom/android/gallery3d/exif/ExifInterface;->isIfdAllowed(II)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1399
    return-object v7

    .line 1397
    .end local v5    # "hasDefinedCount":Z
    :cond_2
    const/4 v5, 0x0

    .restart local v5    # "hasDefinedCount":Z
    goto :goto_0

    .line 1401
    :cond_3
    new-instance v0, Lcom/android/gallery3d/exif/ExifTag;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/gallery3d/exif/ExifTag;-><init>(SSIIZ)V

    .line 1402
    .local v0, "t":Lcom/android/gallery3d/exif/ExifTag;
    invoke-virtual {v0, p3}, Lcom/android/gallery3d/exif/ExifTag;->setValue(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 1403
    return-object v7

    .line 1405
    :cond_4
    return-object v0
.end method

.method public buildTag(ILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 2
    .param p1, "tagId"    # I
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 1416
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueIfd(I)I

    move-result v0

    .line 1417
    .local v0, "ifdId":I
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->buildTag(IILjava/lang/Object;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    return-object v1
.end method

.method protected buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;
    .locals 7
    .param p1, "tagId"    # I

    .prologue
    .line 1421
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    .line 1422
    .local v6, "info":I
    if-nez v6, :cond_0

    .line 1423
    const/4 v1, 0x0

    return-object v1

    .line 1425
    :cond_0
    invoke-static {v6}, Lcom/android/gallery3d/exif/ExifInterface;->getTypeFromInfo(I)S

    move-result v2

    .line 1426
    .local v2, "type":S
    invoke-static {v6}, Lcom/android/gallery3d/exif/ExifInterface;->getComponentCountFromInfo(I)I

    move-result v3

    .line 1427
    .local v3, "definedCount":I
    if-eqz v3, :cond_1

    const/4 v5, 0x1

    .line 1428
    .local v5, "hasDefinedCount":Z
    :goto_0
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueIfd(I)I

    move-result v4

    .line 1429
    .local v4, "ifdId":I
    new-instance v0, Lcom/android/gallery3d/exif/ExifTag;

    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v1

    invoke-direct/range {v0 .. v5}, Lcom/android/gallery3d/exif/ExifTag;-><init>(SSIIZ)V

    .line 1430
    .local v0, "t":Lcom/android/gallery3d/exif/ExifTag;
    return-object v0

    .line 1427
    .end local v0    # "t":Lcom/android/gallery3d/exif/ExifTag;
    .end local v4    # "ifdId":I
    .end local v5    # "hasDefinedCount":Z
    :cond_1
    const/4 v5, 0x0

    .restart local v5    # "hasDefinedCount":Z
    goto :goto_0
.end method

.method public getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 3
    .param p1, "outStream"    # Ljava/io/OutputStream;

    .prologue
    .line 854
    if-nez p1, :cond_0

    .line 855
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Argument is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 857
    :cond_0
    new-instance v0, Lcom/android/gallery3d/exif/ExifOutputStream;

    invoke-direct {v0, p1, p0}, Lcom/android/gallery3d/exif/ExifOutputStream;-><init>(Ljava/io/OutputStream;Lcom/android/gallery3d/exif/ExifInterface;)V

    .line 858
    .local v0, "eos":Lcom/android/gallery3d/exif/ExifOutputStream;
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifOutputStream;->setExifData(Lcom/android/gallery3d/exif/ExifData;)V

    .line 859
    return-object v0
.end method

.method protected getTagInfo()Landroid/util/SparseIntArray;
    .locals 1

    .prologue
    .line 1992
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    if-nez v0, :cond_0

    .line 1993
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    .line 1994
    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifInterface;->initTagInfo()V

    .line 1996
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mTagInfo:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method public getThumbnailBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 1648
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1649
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v0

    .line 1650
    .local v0, "thumb":[B
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1

    .line 1651
    .end local v0    # "thumb":[B
    :cond_0
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    move-result v1

    .line 1654
    const/4 v1, 0x0

    return-object v1
.end method

.method public getThumbnailBytes()[B
    .locals 1

    .prologue
    .line 1665
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1666
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v0

    return-object v0

    .line 1667
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    move-result v0

    .line 1670
    const/4 v0, 0x0

    return-object v0
.end method

.method public readExif(Ljava/io/InputStream;)V
    .locals 5
    .param p1, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 628
    if-nez p1, :cond_0

    .line 629
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Argument is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 631
    :cond_0
    const/4 v0, 0x0

    .line 633
    .local v0, "d":Lcom/android/gallery3d/exif/ExifData;
    :try_start_0
    new-instance v2, Lcom/android/gallery3d/exif/ExifReader;

    invoke-direct {v2, p0}, Lcom/android/gallery3d/exif/ExifReader;-><init>(Lcom/android/gallery3d/exif/ExifInterface;)V

    invoke-virtual {v2, p1}, Lcom/android/gallery3d/exif/ExifReader;->read(Ljava/io/InputStream;)Lcom/android/gallery3d/exif/ExifData;
    :try_end_0
    .catch Lcom/android/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 637
    .local v0, "d":Lcom/android/gallery3d/exif/ExifData;
    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    .line 638
    return-void

    .line 634
    .local v0, "d":Lcom/android/gallery3d/exif/ExifData;
    :catch_0
    move-exception v1

    .line 635
    .local v1, "e":Lcom/android/gallery3d/exif/ExifInvalidFormatException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid exif format : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public readExif([B)V
    .locals 1
    .param p1, "jpeg"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 617
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif(Ljava/io/InputStream;)V

    .line 618
    return-void
.end method

.method public setCompressedThumbnail(Landroid/graphics/Bitmap;)Z
    .locals 3
    .param p1, "thumb"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1724
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1725
    .local v0, "thumbnail":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1726
    const/4 v1, 0x0

    return v1

    .line 1728
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->setCompressedThumbnail([B)Z

    move-result v1

    return v1
.end method

.method public setCompressedThumbnail([B)Z
    .locals 1
    .param p1, "thumb"    # [B

    .prologue
    .line 1711
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifData;->clearThumbnailAndStrips()V

    .line 1712
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->setCompressedThumbnail([B)V

    .line 1713
    const/4 v0, 0x1

    return v0
.end method

.method public setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 1
    .param p1, "tag"    # Lcom/android/gallery3d/exif/ExifTag;

    .prologue
    .line 1476
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifInterface;->mData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/ExifData;->addTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v0

    return-object v0
.end method

.method public writeExif(Landroid/graphics/Bitmap;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "bmap"    # Landroid/graphics/Bitmap;
    .param p2, "exifOutStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 709
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 710
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Argument is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 712
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    .line 713
    .local v0, "s":Ljava/io/OutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 714
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 715
    return-void
.end method

.method public writeExif([BLjava/io/OutputStream;)V
    .locals 3
    .param p1, "jpeg"    # [B
    .param p2, "exifOutStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 692
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Argument is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 694
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    .line 695
    .local v0, "s":Ljava/io/OutputStream;
    array-length v1, p1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 696
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 697
    return-void
.end method
