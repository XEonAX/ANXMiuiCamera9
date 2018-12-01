.class final enum Lcom/sensetime/stmobile/STCommon$ResultCode;
.super Ljava/lang/Enum;
.source "STCommon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sensetime/stmobile/STCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ResultCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/sensetime/stmobile/STCommon$ResultCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_ACTIVE_CODE_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_ACTIVE_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_AUTH_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_DELNOTFOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_FILE_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_FILE_NOT_FOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_GET_HOST_ERROR:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_GET_UDID_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_HANDLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_INVALIDARG:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_INVALID_APPID:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_INVALID_AUTH:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_INVALID_FILE_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_INVALID_PIXEL_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_LICENSE_IS_NOT_ACTIVABLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_NO_CAPABILITY:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_ONLINE_AUTH_CONNECT_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_ONLINE_AUTH_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_ONLINE_AUTH_TIMEOUT:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_OUTOFMEMORY:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_SOCKET_INIT_FAILED:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_SOCKET_NO_VERSION_TWO_POINT_TWO:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_E_UUID_MISMATCH:Lcom/sensetime/stmobile/STCommon$ResultCode;

.field public static final enum ST_OK:Lcom/sensetime/stmobile/STCommon$ResultCode;


# instance fields
.field private final resultCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 32
    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_OK"

    invoke-direct {v0, v1, v4, v4}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_OK:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_INVALIDARG"

    .line 33
    const/4 v2, -0x1

    .line 32
    invoke-direct {v0, v1, v5, v2}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 33
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALIDARG:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_HANDLE"

    .line 34
    const/4 v2, -0x2

    .line 33
    invoke-direct {v0, v1, v6, v2}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 34
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_HANDLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_OUTOFMEMORY"

    .line 35
    const/4 v2, -0x3

    .line 34
    invoke-direct {v0, v1, v7, v2}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 35
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_OUTOFMEMORY:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_FAIL"

    .line 36
    const/4 v2, -0x4

    .line 35
    invoke-direct {v0, v1, v8, v2}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 36
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_DELNOTFOUND"

    const/4 v2, 0x5

    .line 37
    const/4 v3, -0x5

    .line 36
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 37
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_DELNOTFOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_INVALID_PIXEL_FORMAT"

    const/4 v2, 0x6

    .line 38
    const/4 v3, -0x6

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 38
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_PIXEL_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_FILE_NOT_FOUND"

    const/4 v2, 0x7

    .line 39
    const/4 v3, -0x7

    .line 38
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 39
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FILE_NOT_FOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_INVALID_FILE_FORMAT"

    const/16 v2, 0x8

    .line 40
    const/4 v3, -0x8

    .line 39
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 40
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_FILE_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_FILE_EXPIRE"

    const/16 v2, 0x9

    .line 41
    const/16 v3, -0x9

    .line 40
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 41
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FILE_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_INVALID_AUTH"

    const/16 v2, 0xa

    .line 42
    const/16 v3, -0xd

    .line 41
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 42
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_AUTH:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_INVALID_APPID"

    const/16 v2, 0xb

    .line 43
    const/16 v3, -0xe

    .line 42
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 43
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_APPID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_AUTH_EXPIRE"

    const/16 v2, 0xc

    .line 44
    const/16 v3, -0xf

    .line 43
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 44
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_AUTH_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_UUID_MISMATCH"

    const/16 v2, 0xd

    .line 45
    const/16 v3, -0x10

    .line 44
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 45
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_UUID_MISMATCH:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_ONLINE_AUTH_CONNECT_FAIL"

    const/16 v2, 0xe

    .line 46
    const/16 v3, -0x11

    .line 45
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 46
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_CONNECT_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_ONLINE_AUTH_TIMEOUT"

    const/16 v2, 0xf

    .line 47
    const/16 v3, -0x12

    .line 46
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 47
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_TIMEOUT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_ONLINE_AUTH_INVALID"

    const/16 v2, 0x10

    .line 48
    const/16 v3, -0x13

    .line 47
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 48
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_LICENSE_IS_NOT_ACTIVABLE"

    const/16 v2, 0x11

    .line 49
    const/16 v3, -0x14

    .line 48
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 49
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_LICENSE_IS_NOT_ACTIVABLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_ACTIVE_FAIL"

    const/16 v2, 0x12

    .line 50
    const/16 v3, -0x15

    .line 49
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 50
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ACTIVE_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_ACTIVE_CODE_INVALID"

    const/16 v2, 0x13

    .line 51
    const/16 v3, -0x16

    .line 50
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 51
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ACTIVE_CODE_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_NO_CAPABILITY"

    const/16 v2, 0x14

    .line 52
    const/16 v3, -0x17

    .line 51
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 52
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_NO_CAPABILITY:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_GET_UDID_FAIL"

    const/16 v2, 0x15

    .line 53
    const/16 v3, -0x18

    .line 52
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 53
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_GET_UDID_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_SOCKET_INIT_FAILED"

    const/16 v2, 0x16

    .line 54
    const/16 v3, -0x19

    .line 53
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 54
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_SOCKET_INIT_FAILED:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_SOCKET_NO_VERSION_TWO_POINT_TWO"

    const/16 v2, 0x17

    .line 55
    const/16 v3, -0x1a

    .line 54
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 55
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_SOCKET_NO_VERSION_TWO_POINT_TWO:Lcom/sensetime/stmobile/STCommon$ResultCode;

    new-instance v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    const-string/jumbo v1, "ST_E_GET_HOST_ERROR"

    const/16 v2, 0x18

    .line 56
    const/16 v3, -0x1b

    .line 55
    invoke-direct {v0, v1, v2, v3}, Lcom/sensetime/stmobile/STCommon$ResultCode;-><init>(Ljava/lang/String;II)V

    .line 56
    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_GET_HOST_ERROR:Lcom/sensetime/stmobile/STCommon$ResultCode;

    .line 31
    const/16 v0, 0x19

    new-array v0, v0, [Lcom/sensetime/stmobile/STCommon$ResultCode;

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_OK:Lcom/sensetime/stmobile/STCommon$ResultCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALIDARG:Lcom/sensetime/stmobile/STCommon$ResultCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_HANDLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_OUTOFMEMORY:Lcom/sensetime/stmobile/STCommon$ResultCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_DELNOTFOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_PIXEL_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FILE_NOT_FOUND:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_FILE_FORMAT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_FILE_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_AUTH:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_INVALID_APPID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_AUTH_EXPIRE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_UUID_MISMATCH:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_CONNECT_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_TIMEOUT:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ONLINE_AUTH_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_LICENSE_IS_NOT_ACTIVABLE:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ACTIVE_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_ACTIVE_CODE_INVALID:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_NO_CAPABILITY:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_GET_UDID_FAIL:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_SOCKET_INIT_FAILED:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_SOCKET_NO_VERSION_TWO_POINT_TWO:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/sensetime/stmobile/STCommon$ResultCode;->ST_E_GET_HOST_ERROR:Lcom/sensetime/stmobile/STCommon$ResultCode;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sput-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->$VALUES:[Lcom/sensetime/stmobile/STCommon$ResultCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "resultCode"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 62
    iput p3, p0, Lcom/sensetime/stmobile/STCommon$ResultCode;->resultCode:I

    .line 63
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sensetime/stmobile/STCommon$ResultCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-class v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/sensetime/stmobile/STCommon$ResultCode;

    return-object v0
.end method

.method public static values()[Lcom/sensetime/stmobile/STCommon$ResultCode;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/sensetime/stmobile/STCommon$ResultCode;->$VALUES:[Lcom/sensetime/stmobile/STCommon$ResultCode;

    return-object v0
.end method


# virtual methods
.method public getResultCode()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/sensetime/stmobile/STCommon$ResultCode;->resultCode:I

    return v0
.end method
