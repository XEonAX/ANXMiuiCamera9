.class public Lcom/android/camera/Exif;
.super Ljava/lang/Object;
.source "Exif.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOrientation([B)I
    .locals 12
    .param p0, "jpeg"    # [B

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 27
    const/4 v9, 0x0

    return v9

    .line 30
    :cond_0
    const/4 v5, 0x0

    .line 31
    .local v5, "offset":I
    const/4 v2, 0x0

    .line 34
    .local v2, "length":I
    :cond_1
    :goto_0
    add-int/lit8 v9, v5, 0x3

    array-length v10, p0

    if-ge v9, v10, :cond_3

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .local v6, "offset":I
    aget-byte v9, p0, v5

    and-int/lit16 v9, v9, 0xff

    const/16 v10, 0xff

    if-ne v9, v10, :cond_2

    .line 35
    aget-byte v9, p0, v6

    and-int/lit16 v4, v9, 0xff

    .line 38
    .local v4, "marker":I
    const/16 v9, 0xff

    if-ne v4, v9, :cond_4

    move v5, v6

    .line 39
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto :goto_0

    .end local v4    # "marker":I
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_2
    move v5, v6

    .line 74
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    :cond_3
    :goto_1
    const/16 v9, 0x8

    if-le v2, v9, :cond_d

    .line 76
    const/4 v9, 0x4

    const/4 v10, 0x0

    invoke-static {p0, v5, v9, v10}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v8

    .line 77
    .local v8, "tag":I
    const v9, 0x49492a00    # 823968.0f

    if-eq v8, v9, :cond_8

    const v9, 0x4d4d002a    # 2.14958752E8f

    if-eq v8, v9, :cond_8

    .line 78
    const-string/jumbo v9, "CameraExif"

    const-string/jumbo v10, "Invalid byte order"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v9, 0x0

    return v9

    .line 41
    .end local v5    # "offset":I
    .end local v8    # "tag":I
    .restart local v4    # "marker":I
    .restart local v6    # "offset":I
    :cond_4
    add-int/lit8 v5, v6, 0x1

    .line 44
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    const/16 v9, 0xd8

    if-eq v4, v9, :cond_1

    const/4 v9, 0x1

    if-eq v4, v9, :cond_1

    .line 48
    const/16 v9, 0xd9

    if-eq v4, v9, :cond_3

    const/16 v9, 0xda

    if-eq v4, v9, :cond_3

    .line 53
    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static {p0, v5, v9, v10}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v2

    .line 54
    const/4 v9, 0x2

    if-lt v2, v9, :cond_5

    add-int v9, v5, v2

    array-length v10, p0

    if-le v9, v10, :cond_6

    .line 55
    :cond_5
    const-string/jumbo v9, "CameraExif"

    const-string/jumbo v10, "Invalid length"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const/4 v9, 0x0

    return v9

    .line 60
    :cond_6
    const/16 v9, 0xe1

    if-ne v4, v9, :cond_7

    const/16 v9, 0x8

    if-lt v2, v9, :cond_7

    .line 61
    add-int/lit8 v9, v5, 0x2

    const/4 v10, 0x4

    const/4 v11, 0x0

    invoke-static {p0, v9, v10, v11}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v9

    const v10, 0x45786966

    if-ne v9, v10, :cond_7

    .line 62
    add-int/lit8 v9, v5, 0x6

    const/4 v10, 0x2

    const/4 v11, 0x0

    invoke-static {p0, v9, v10, v11}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v9

    if-nez v9, :cond_7

    .line 63
    add-int/lit8 v5, v5, 0x8

    .line 64
    add-int/lit8 v2, v2, -0x8

    .line 65
    goto :goto_1

    .line 69
    :cond_7
    add-int/2addr v5, v2

    .line 70
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 81
    .end local v4    # "marker":I
    .restart local v8    # "tag":I
    :cond_8
    const v9, 0x49492a00    # 823968.0f

    if-ne v8, v9, :cond_a

    const/4 v3, 0x1

    .line 84
    .local v3, "littleEndian":Z
    :goto_2
    add-int/lit8 v9, v5, 0x4

    const/4 v10, 0x4

    invoke-static {p0, v9, v10, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v9

    add-int/lit8 v0, v9, 0x2

    .line 85
    .local v0, "count":I
    const/16 v9, 0xa

    if-lt v0, v9, :cond_9

    if-le v0, v2, :cond_b

    .line 86
    :cond_9
    const-string/jumbo v9, "CameraExif"

    const-string/jumbo v10, "Invalid offset"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const/4 v9, 0x0

    return v9

    .line 81
    .end local v0    # "count":I
    .end local v3    # "littleEndian":Z
    :cond_a
    const/4 v3, 0x0

    .restart local v3    # "littleEndian":Z
    goto :goto_2

    .line 89
    .restart local v0    # "count":I
    :cond_b
    add-int/2addr v5, v0

    .line 90
    sub-int/2addr v2, v0

    .line 93
    add-int/lit8 v9, v5, -0x2

    const/4 v10, 0x2

    invoke-static {p0, v9, v10, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v0

    move v1, v0

    .line 94
    .end local v0    # "count":I
    .local v1, "count":I
    :goto_3
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    if-lez v1, :cond_d

    const/16 v9, 0xc

    if-lt v2, v9, :cond_d

    .line 96
    const/4 v9, 0x2

    invoke-static {p0, v5, v9, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v8

    .line 97
    const/16 v9, 0x112

    if-ne v8, v9, :cond_c

    .line 99
    add-int/lit8 v9, v5, 0x8

    const/4 v10, 0x2

    invoke-static {p0, v9, v10, v3}, Lcom/android/camera/Exif;->pack([BIIZ)I

    move-result v7

    .line 100
    .local v7, "orientation":I
    packed-switch v7, :pswitch_data_0

    .line 110
    :pswitch_0
    const-string/jumbo v9, "CameraExif"

    const-string/jumbo v10, "Unsupported orientation"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v9, 0x0

    return v9

    .line 102
    :pswitch_1
    const/4 v9, 0x0

    return v9

    .line 104
    :pswitch_2
    const/16 v9, 0xb4

    return v9

    .line 106
    :pswitch_3
    const/16 v9, 0x5a

    return v9

    .line 108
    :pswitch_4
    const/16 v9, 0x10e

    return v9

    .line 113
    .end local v7    # "orientation":I
    :cond_c
    add-int/lit8 v5, v5, 0xc

    .line 114
    add-int/lit8 v2, v2, -0xc

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_3

    .line 118
    .end local v1    # "count":I
    .end local v3    # "littleEndian":Z
    .end local v8    # "tag":I
    :cond_d
    const-string/jumbo v9, "CameraExif"

    const-string/jumbo v10, "Orientation not found"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const/4 v9, 0x0

    return v9

    .line 100
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private static pack([BIIZ)I
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "littleEndian"    # Z

    .prologue
    .line 124
    const/4 v1, 0x1

    .line 125
    .local v1, "step":I
    if-eqz p3, :cond_0

    .line 126
    add-int/lit8 v3, p2, -0x1

    add-int/2addr p1, v3

    .line 127
    const/4 v1, -0x1

    .line 130
    :cond_0
    const/4 v2, 0x0

    .local v2, "value":I
    move v0, p2

    .line 131
    .end local p2    # "length":I
    .local v0, "length":I
    :goto_0
    add-int/lit8 p2, v0, -0x1

    .end local v0    # "length":I
    .restart local p2    # "length":I
    if-lez v0, :cond_1

    .line 132
    shl-int/lit8 v3, v2, 0x8

    aget-byte v4, p0, p1

    and-int/lit16 v4, v4, 0xff

    or-int v2, v3, v4

    .line 133
    add-int/2addr p1, v1

    move v0, p2

    .end local p2    # "length":I
    .restart local v0    # "length":I
    goto :goto_0

    .line 135
    .end local v0    # "length":I
    .restart local p2    # "length":I
    :cond_1
    return v2
.end method
