.class public Lcom/android/gallery3d/exif/ExifTag;
.super Ljava/lang/Object;
.source "ExifTag.java"


# static fields
.field private static final TIME_FORMAT:Ljava/text/SimpleDateFormat;

.field private static final TYPE_TO_SIZE_MAP:[I

.field private static US_ASCII:Ljava/nio/charset/Charset;


# instance fields
.field private mComponentCountActual:I

.field private final mDataType:S

.field private mHasDefinedDefaultComponentCount:Z

.field private mIfd:I

.field private mOffset:I

.field private final mTagId:S

.field private mValue:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x2

    const/4 v3, 0x4

    const/4 v2, 0x1

    .line 71
    const-string/jumbo v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/android/gallery3d/exif/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    .line 72
    const/16 v0, 0xb

    new-array v0, v0, [I

    sput-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    .line 79
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v2, v0, v2

    .line 80
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v2, v0, v4

    .line 81
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x3

    aput v4, v0, v1

    .line 82
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v3, v0, v3

    .line 83
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x5

    aput v5, v0, v1

    .line 84
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x7

    aput v2, v0, v1

    .line 85
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/16 v1, 0x9

    aput v3, v0, v1

    .line 86
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/16 v1, 0xa

    aput v5, v0, v1

    .line 106
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy:MM:dd kk:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/gallery3d/exif/ExifTag;->TIME_FORMAT:Ljava/text/SimpleDateFormat;

    .line 32
    return-void
.end method

.method constructor <init>(SSIIZ)V
    .locals 1
    .param p1, "tagId"    # S
    .param p2, "type"    # S
    .param p3, "componentCount"    # I
    .param p4, "ifd"    # I
    .param p5, "hasDefinedComponentCount"    # Z

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-short p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mTagId:S

    .line 131
    iput-short p2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    .line 132
    iput p3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 133
    iput-boolean p5, p0, Lcom/android/gallery3d/exif/ExifTag;->mHasDefinedDefaultComponentCount:Z

    .line 134
    iput p4, p0, Lcom/android/gallery3d/exif/ExifTag;->mIfd:I

    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 136
    return-void
.end method

.method private checkBadComponentCount(I)Z
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 888
    iget-boolean v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mHasDefinedDefaultComponentCount:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    if-eq v0, p1, :cond_0

    .line 889
    const/4 v0, 0x1

    return v0

    .line 891
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private checkOverflowForRational([Lcom/android/gallery3d/exif/Rational;)Z
    .locals 10
    .param p1, "value"    # [Lcom/android/gallery3d/exif/Rational;

    .prologue
    const-wide/32 v8, 0x7fffffff

    const-wide/32 v6, -0x80000000

    const/4 v2, 0x0

    .line 956
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v0, p1, v1

    .line 957
    .local v0, "v":Lcom/android/gallery3d/exif/Rational;
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 960
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 958
    :cond_1
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_0

    .line 959
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_0

    .line 956
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 963
    .end local v0    # "v":Lcom/android/gallery3d/exif/Rational;
    :cond_2
    return v2
.end method

.method private checkOverflowForUnsignedLong([I)Z
    .locals 4
    .param p1, "value"    # [I

    .prologue
    const/4 v2, 0x0

    .line 936
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_1

    aget v0, p1, v1

    .line 937
    .local v0, "v":I
    if-gez v0, :cond_0

    .line 938
    const/4 v1, 0x1

    return v1

    .line 936
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 941
    .end local v0    # "v":I
    :cond_1
    return v2
.end method

.method private checkOverflowForUnsignedLong([J)Z
    .locals 8
    .param p1, "value"    # [J

    .prologue
    const/4 v3, 0x0

    .line 927
    array-length v4, p1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_2

    aget-wide v0, p1, v2

    .line 928
    .local v0, "v":J
    const-wide/16 v6, 0x0

    cmp-long v5, v0, v6

    if-ltz v5, :cond_0

    const-wide v6, 0xffffffffL

    cmp-long v5, v0, v6

    if-lez v5, :cond_1

    .line 929
    :cond_0
    const/4 v2, 0x1

    return v2

    .line 927
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 932
    .end local v0    # "v":J
    :cond_2
    return v3
.end method

.method private checkOverflowForUnsignedRational([Lcom/android/gallery3d/exif/Rational;)Z
    .locals 10
    .param p1, "value"    # [Lcom/android/gallery3d/exif/Rational;

    .prologue
    const-wide v8, 0xffffffffL

    const-wide/16 v6, 0x0

    const/4 v2, 0x0

    .line 945
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v0, p1, v1

    .line 946
    .local v0, "v":Lcom/android/gallery3d/exif/Rational;
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 949
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 947
    :cond_1
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_0

    .line 948
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_0

    .line 945
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 952
    .end local v0    # "v":Lcom/android/gallery3d/exif/Rational;
    :cond_2
    return v2
.end method

.method private checkOverflowForUnsignedShort([I)Z
    .locals 5
    .param p1, "value"    # [I

    .prologue
    const/4 v2, 0x0

    .line 918
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_2

    aget v0, p1, v1

    .line 919
    .local v0, "v":I
    const v4, 0xffff

    if-gt v0, v4, :cond_0

    if-gez v0, :cond_1

    .line 920
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 918
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 923
    .end local v0    # "v":I
    :cond_2
    return v2
.end method

.method private static convertTypeToString(S)Ljava/lang/String;
    .locals 1
    .param p0, "type"    # S

    .prologue
    .line 895
    packed-switch p0, :pswitch_data_0

    .line 913
    :pswitch_0
    const-string/jumbo v0, ""

    return-object v0

    .line 897
    :pswitch_1
    const-string/jumbo v0, "UNSIGNED_BYTE"

    return-object v0

    .line 899
    :pswitch_2
    const-string/jumbo v0, "ASCII"

    return-object v0

    .line 901
    :pswitch_3
    const-string/jumbo v0, "UNSIGNED_SHORT"

    return-object v0

    .line 903
    :pswitch_4
    const-string/jumbo v0, "UNSIGNED_LONG"

    return-object v0

    .line 905
    :pswitch_5
    const-string/jumbo v0, "UNSIGNED_RATIONAL"

    return-object v0

    .line 907
    :pswitch_6
    const-string/jumbo v0, "UNDEFINED"

    return-object v0

    .line 909
    :pswitch_7
    const-string/jumbo v0, "LONG"

    return-object v0

    .line 911
    :pswitch_8
    const-string/jumbo v0, "RATIONAL"

    return-object v0

    .line 895
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public static getElementSize(S)I
    .locals 1
    .param p0, "type"    # S

    .prologue
    .line 151
    sget-object v0, Lcom/android/gallery3d/exif/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aget v0, v0, p0

    return v0
.end method

.method public static isValidIfd(I)Z
    .locals 3
    .param p0, "ifdId"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 112
    if-eqz p0, :cond_0

    if-ne p0, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    .line 113
    :cond_1
    const/4 v2, 0x2

    if-eq p0, v2, :cond_0

    const/4 v2, 0x3

    if-eq p0, v2, :cond_0

    .line 114
    const/4 v2, 0x4

    if-eq p0, v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public static isValidType(S)Z
    .locals 2
    .param p0, "type"    # S

    .prologue
    const/4 v0, 0x1

    .line 121
    if-eq p0, v0, :cond_0

    const/4 v1, 0x2

    if-ne p0, v1, :cond_1

    :cond_0
    :goto_0
    return v0

    .line 122
    :cond_1
    const/4 v1, 0x3

    if-eq p0, v1, :cond_0

    const/4 v1, 0x4

    if-eq p0, v1, :cond_0

    .line 123
    const/4 v1, 0x5

    if-eq p0, v1, :cond_0

    const/4 v1, 0x7

    if-eq p0, v1, :cond_0

    .line 124
    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa

    if-eq p0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 968
    if-nez p1, :cond_0

    .line 969
    return v1

    .line 971
    :cond_0
    instance-of v2, p1, Lcom/android/gallery3d/exif/ExifTag;

    if-eqz v2, :cond_c

    move-object v0, p1

    .line 972
    check-cast v0, Lcom/android/gallery3d/exif/ExifTag;

    .line 973
    .local v0, "tag":Lcom/android/gallery3d/exif/ExifTag;
    iget-short v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mTagId:S

    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mTagId:S

    if-ne v2, v3, :cond_1

    .line 974
    iget v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    iget v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    if-eq v2, v3, :cond_2

    .line 976
    :cond_1
    return v1

    .line 975
    :cond_2
    iget-short v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v2, v3, :cond_1

    .line 978
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    if-eqz v2, :cond_a

    .line 979
    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v2, :cond_3

    .line 980
    return v1

    .line 981
    :cond_3
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [J

    if-eqz v2, :cond_5

    .line 982
    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [J

    if-nez v2, :cond_4

    .line 983
    return v1

    .line 985
    :cond_4
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [J

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v1

    return v1

    .line 986
    :cond_5
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [Lcom/android/gallery3d/exif/Rational;

    if-eqz v2, :cond_7

    .line 987
    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [Lcom/android/gallery3d/exif/Rational;

    if-nez v2, :cond_6

    .line 988
    return v1

    .line 990
    :cond_6
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Lcom/android/gallery3d/exif/Rational;

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [Lcom/android/gallery3d/exif/Rational;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 991
    :cond_7
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [B

    if-eqz v2, :cond_9

    .line 992
    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [B

    if-nez v2, :cond_8

    .line 993
    return v1

    .line 995
    :cond_8
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    return v1

    .line 997
    :cond_9
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 1000
    :cond_a
    iget-object v2, v0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v2, :cond_b

    const/4 v1, 0x1

    :cond_b
    return v1

    .line 1003
    .end local v0    # "tag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_c
    return v1
.end method

.method public forceGetValueAsString()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 753
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 754
    const-string/jumbo v1, ""

    return-object v1

    .line 755
    :cond_0
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [B

    if-eqz v1, :cond_2

    .line 756
    iget-short v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 757
    new-instance v2, Ljava/lang/String;

    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    sget-object v3, Lcom/android/gallery3d/exif/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v2

    .line 759
    :cond_1
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 761
    :cond_2
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [J

    if-eqz v1, :cond_4

    .line 762
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    array-length v1, v1

    if-ne v1, v3, :cond_3

    .line 763
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    aget-wide v2, v1, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 765
    :cond_3
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    invoke-static {v1}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 767
    :cond_4
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [Ljava/lang/Object;

    if-eqz v1, :cond_7

    .line 768
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    array-length v1, v1

    if-ne v1, v3, :cond_6

    .line 769
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    aget-object v0, v1, v2

    .line 770
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_5

    .line 771
    const-string/jumbo v1, ""

    return-object v1

    .line 773
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 776
    .end local v0    # "val":Ljava/lang/Object;
    :cond_6
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 779
    :cond_7
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected forceSetComponentCount(I)V
    .locals 0
    .param p1, "count"    # I

    .prologue
    .line 215
    iput p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 216
    return-void
.end method

.method protected getBytes([B)V
    .locals 2
    .param p1, "buf"    # [B

    .prologue
    .line 842
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/gallery3d/exif/ExifTag;->getBytes([BII)V

    .line 843
    return-void
.end method

.method protected getBytes([BII)V
    .locals 3
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 856
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 857
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot get BYTE value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 858
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    invoke-static {v2}, Lcom/android/gallery3d/exif/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    .line 857
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 860
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 861
    iget v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    if-le p3, v1, :cond_1

    iget p3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 860
    .end local p3    # "length":I
    :cond_1
    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 862
    return-void
.end method

.method public getComponentCount()I
    .locals 1

    .prologue
    .line 207
    iget v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    return v0
.end method

.method public getDataSize()I
    .locals 2

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v1

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifTag;->getElementSize(S)I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public getDataType()S
    .locals 1

    .prologue
    .line 191
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    return v0
.end method

.method public getIfd()I
    .locals 1

    .prologue
    .line 164
    iget v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mIfd:I

    return v0
.end method

.method protected getOffset()I
    .locals 1

    .prologue
    .line 869
    iget v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mOffset:I

    return v0
.end method

.method protected getRational(I)Lcom/android/gallery3d/exif/Rational;
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 831
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 832
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot get RATIONAL value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 833
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    invoke-static {v2}, Lcom/android/gallery3d/exif/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    .line 832
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 835
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [Lcom/android/gallery3d/exif/Rational;

    aget-object v0, v0, p1

    return-object v0
.end method

.method protected getStringByte()[B
    .locals 1

    .prologue
    .line 821
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [B

    return-object v0
.end method

.method public getTagId()S
    .locals 1

    .prologue
    .line 175
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mTagId:S

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    return-object v0
.end method

.method protected getValueAt(I)J
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 794
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v0, v0, [J

    if-eqz v0, :cond_0

    .line 795
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [J

    aget-wide v0, v0, p1

    return-wide v0

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v0, v0, [B

    if-eqz v0, :cond_1

    .line 797
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [B

    aget-byte v0, v0, p1

    int-to-long v0, v0

    return-wide v0

    .line 799
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot get integer value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 800
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    invoke-static {v2}, Lcom/android/gallery3d/exif/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    .line 799
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected hasDefinedCount()Z
    .locals 1

    .prologue
    .line 884
    iget-boolean v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mHasDefinedDefaultComponentCount:Z

    return v0
.end method

.method public hasValue()Z
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setHasDefinedCount(Z)V
    .locals 0
    .param p1, "d"    # Z

    .prologue
    .line 880
    iput-boolean p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mHasDefinedDefaultComponentCount:Z

    .line 881
    return-void
.end method

.method protected setIfd(I)V
    .locals 0
    .param p1, "ifdId"    # I

    .prologue
    .line 168
    iput p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mIfd:I

    .line 169
    return-void
.end method

.method protected setOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .prologue
    .line 876
    iput p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mOffset:I

    .line 877
    return-void
.end method

.method public setValue(B)Z
    .locals 2
    .param p1, "value"    # B

    .prologue
    .line 447
    const/4 v0, 0x1

    new-array v0, v0, [B

    .line 448
    const/4 v1, 0x0

    aput-byte p1, v0, v1

    .line 447
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->setValue([B)Z

    move-result v0

    return v0
.end method

.method public setValue(I)Z
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 272
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 273
    const/4 v1, 0x0

    aput p1, v0, v1

    .line 272
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->setValue([I)Z

    move-result v0

    return v0
.end method

.method public setValue(J)Z
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 309
    const/4 v0, 0x1

    new-array v0, v0, [J

    .line 310
    const/4 v1, 0x0

    aput-wide p1, v0, v1

    .line 309
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->setValue([J)Z

    move-result v0

    return v0
.end method

.method public setValue(Lcom/android/gallery3d/exif/Rational;)Z
    .locals 2
    .param p1, "value"    # Lcom/android/gallery3d/exif/Rational;

    .prologue
    .line 400
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/android/gallery3d/exif/Rational;

    .line 401
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 400
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->setValue([Lcom/android/gallery3d/exif/Rational;)Z

    move-result v0

    return v0
.end method

.method public setValue(Ljava/lang/Object;)Z
    .locals 11
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const v10, 0xffff

    const/4 v9, 0x0

    .line 463
    if-nez p1, :cond_0

    .line 464
    return v9

    .line 465
    :cond_0
    instance-of v8, p1, Ljava/lang/Short;

    if-eqz v8, :cond_1

    .line 466
    check-cast p1, Ljava/lang/Short;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v8

    and-int/2addr v8, v10

    invoke-virtual {p0, v8}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    move-result v8

    return v8

    .line 467
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v8, p1, Ljava/lang/String;

    if-eqz v8, :cond_2

    .line 468
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue(Ljava/lang/String;)Z

    move-result v8

    return v8

    .line 469
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v8, p1, [I

    if-eqz v8, :cond_3

    .line 470
    check-cast p1, [I

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue([I)Z

    move-result v8

    return v8

    .line 471
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_3
    instance-of v8, p1, [J

    if-eqz v8, :cond_4

    .line 472
    check-cast p1, [J

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue([J)Z

    move-result v8

    return v8

    .line 473
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v8, p1, Lcom/android/gallery3d/exif/Rational;

    if-eqz v8, :cond_5

    .line 474
    check-cast p1, Lcom/android/gallery3d/exif/Rational;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue(Lcom/android/gallery3d/exif/Rational;)Z

    move-result v8

    return v8

    .line 475
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_5
    instance-of v8, p1, [Lcom/android/gallery3d/exif/Rational;

    if-eqz v8, :cond_6

    .line 476
    check-cast p1, [Lcom/android/gallery3d/exif/Rational;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue([Lcom/android/gallery3d/exif/Rational;)Z

    move-result v8

    return v8

    .line 477
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    instance-of v8, p1, [B

    if-eqz v8, :cond_7

    .line 478
    check-cast p1, [B

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->setValue([B)Z

    move-result v8

    return v8

    .line 479
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v8, p1, Ljava/lang/Integer;

    if-eqz v8, :cond_8

    .line 480
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    move-result v8

    return v8

    .line 481
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_8
    instance-of v8, p1, Ljava/lang/Long;

    if-eqz v8, :cond_9

    .line 482
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {p0, v8, v9}, Lcom/android/gallery3d/exif/ExifTag;->setValue(J)Z

    move-result v8

    return v8

    .line 483
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v8, p1, Ljava/lang/Byte;

    if-eqz v8, :cond_a

    .line 484
    check-cast p1, Ljava/lang/Byte;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v8

    invoke-virtual {p0, v8}, Lcom/android/gallery3d/exif/ExifTag;->setValue(B)Z

    move-result v8

    return v8

    .line 485
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v8, p1, [Ljava/lang/Short;

    if-eqz v8, :cond_d

    move-object v3, p1

    .line 487
    check-cast v3, [Ljava/lang/Short;

    .line 488
    .local v3, "arr":[Ljava/lang/Short;
    array-length v8, v3

    new-array v5, v8, [I

    .line 489
    .local v5, "fin":[I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v8, v3

    if-ge v7, v8, :cond_c

    .line 490
    aget-object v8, v3, v7

    if-nez v8, :cond_b

    move v8, v9

    :goto_1
    aput v8, v5, v7

    .line 489
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 490
    :cond_b
    aget-object v8, v3, v7

    invoke-virtual {v8}, Ljava/lang/Short;->shortValue()S

    move-result v8

    and-int/2addr v8, v10

    goto :goto_1

    .line 492
    :cond_c
    invoke-virtual {p0, v5}, Lcom/android/gallery3d/exif/ExifTag;->setValue([I)Z

    move-result v8

    return v8

    .line 493
    .end local v3    # "arr":[Ljava/lang/Short;
    .end local v5    # "fin":[I
    .end local v7    # "i":I
    :cond_d
    instance-of v8, p1, [Ljava/lang/Integer;

    if-eqz v8, :cond_10

    move-object v1, p1

    .line 495
    check-cast v1, [Ljava/lang/Integer;

    .line 496
    .local v1, "arr":[Ljava/lang/Integer;
    array-length v8, v1

    new-array v5, v8, [I

    .line 497
    .restart local v5    # "fin":[I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    array-length v8, v1

    if-ge v7, v8, :cond_f

    .line 498
    aget-object v8, v1, v7

    if-nez v8, :cond_e

    move v8, v9

    :goto_3
    aput v8, v5, v7

    .line 497
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 498
    :cond_e
    aget-object v8, v1, v7

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_3

    .line 500
    :cond_f
    invoke-virtual {p0, v5}, Lcom/android/gallery3d/exif/ExifTag;->setValue([I)Z

    move-result v8

    return v8

    .line 501
    .end local v1    # "arr":[Ljava/lang/Integer;
    .end local v5    # "fin":[I
    .end local v7    # "i":I
    :cond_10
    instance-of v8, p1, [Ljava/lang/Long;

    if-eqz v8, :cond_13

    move-object v2, p1

    .line 503
    check-cast v2, [Ljava/lang/Long;

    .line 504
    .local v2, "arr":[Ljava/lang/Long;
    array-length v8, v2

    new-array v6, v8, [J

    .line 505
    .local v6, "fin":[J
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_4
    array-length v8, v2

    if-ge v7, v8, :cond_12

    .line 506
    aget-object v8, v2, v7

    if-nez v8, :cond_11

    const-wide/16 v8, 0x0

    :goto_5
    aput-wide v8, v6, v7

    .line 505
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 506
    :cond_11
    aget-object v8, v2, v7

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    goto :goto_5

    .line 508
    :cond_12
    invoke-virtual {p0, v6}, Lcom/android/gallery3d/exif/ExifTag;->setValue([J)Z

    move-result v8

    return v8

    .line 509
    .end local v2    # "arr":[Ljava/lang/Long;
    .end local v6    # "fin":[J
    .end local v7    # "i":I
    :cond_13
    instance-of v8, p1, [Ljava/lang/Byte;

    if-eqz v8, :cond_16

    move-object v0, p1

    .line 511
    check-cast v0, [Ljava/lang/Byte;

    .line 512
    .local v0, "arr":[Ljava/lang/Byte;
    array-length v8, v0

    new-array v4, v8, [B

    .line 513
    .local v4, "fin":[B
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_6
    array-length v8, v0

    if-ge v7, v8, :cond_15

    .line 514
    aget-object v8, v0, v7

    if-nez v8, :cond_14

    move v8, v9

    :goto_7
    aput-byte v8, v4, v7

    .line 513
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 514
    :cond_14
    aget-object v8, v0, v7

    invoke-virtual {v8}, Ljava/lang/Byte;->byteValue()B

    move-result v8

    goto :goto_7

    .line 516
    :cond_15
    invoke-virtual {p0, v4}, Lcom/android/gallery3d/exif/ExifTag;->setValue([B)Z

    move-result v8

    return v8

    .line 518
    .end local v0    # "arr":[Ljava/lang/Byte;
    .end local v4    # "fin":[B
    .end local v7    # "i":I
    :cond_16
    return v9
.end method

.method public setValue(Ljava/lang/String;)Z
    .locals 8
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 329
    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v3, v6, :cond_0

    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v3, v7, :cond_0

    .line 330
    return v4

    .line 333
    :cond_0
    sget-object v3, Lcom/android/gallery3d/exif/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 334
    .local v0, "buf":[B
    move-object v2, v0

    .line 335
    .local v2, "finalBuf":[B
    array-length v3, v0

    if-lez v3, :cond_2

    .line 336
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-byte v3, v0, v3

    if-eqz v3, :cond_1

    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v3, v7, :cond_1

    .line 339
    array-length v3, v0

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    .line 340
    iget v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 345
    :cond_1
    :goto_0
    array-length v1, v2

    .line 346
    .local v1, "count":I
    invoke-direct {p0, v1}, Lcom/android/gallery3d/exif/ExifTag;->checkBadComponentCount(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 347
    return v4

    .line 342
    .end local v1    # "count":I
    :cond_2
    iget-short v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v3, v6, :cond_1

    iget v3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    if-ne v3, v5, :cond_1

    .line 343
    new-array v2, v5, [B

    .end local v2    # "finalBuf":[B
    aput-byte v4, v2, v4

    .restart local v2    # "finalBuf":[B
    goto :goto_0

    .line 349
    .restart local v1    # "count":I
    :cond_3
    iput v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 350
    iput-object v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 351
    return v5
.end method

.method public setValue([B)Z
    .locals 2
    .param p1, "value"    # [B

    .prologue
    .line 433
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/gallery3d/exif/ExifTag;->setValue([BII)Z

    move-result v0

    return v0
.end method

.method public setValue([BII)Z
    .locals 4
    .param p1, "value"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 417
    invoke-direct {p0, p3}, Lcom/android/gallery3d/exif/ExifTag;->checkBadComponentCount(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 418
    return v2

    .line 420
    :cond_0
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v0, v3, :cond_1

    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v1, 0x7

    if-eq v0, v1, :cond_1

    .line 421
    return v2

    .line 423
    :cond_1
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 424
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 425
    iput p3, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 426
    return v3
.end method

.method public setValue([I)Z
    .locals 7
    .param p1, "value"    # [I

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 238
    array-length v2, p1

    invoke-direct {p0, v2}, Lcom/android/gallery3d/exif/ExifTag;->checkBadComponentCount(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 239
    return v4

    .line 241
    :cond_0
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v2, v5, :cond_1

    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/16 v3, 0x9

    if-eq v2, v3, :cond_1

    .line 242
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v2, v6, :cond_1

    .line 243
    return v4

    .line 245
    :cond_1
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v2, v5, :cond_2

    invoke-direct {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->checkOverflowForUnsignedShort([I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 246
    return v4

    .line 247
    :cond_2
    iget-short v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v2, v6, :cond_3

    invoke-direct {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->checkOverflowForUnsignedLong([I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 248
    return v4

    .line 251
    :cond_3
    array-length v2, p1

    new-array v0, v2, [J

    .line 252
    .local v0, "data":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_4

    .line 253
    aget v2, p1, v1

    int-to-long v2, v2

    aput-wide v2, v0, v1

    .line 252
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 255
    :cond_4
    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 256
    array-length v2, p1

    iput v2, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 257
    const/4 v2, 0x1

    return v2
.end method

.method public setValue([J)Z
    .locals 3
    .param p1, "value"    # [J

    .prologue
    const/4 v2, 0x0

    .line 288
    array-length v0, p1

    invoke-direct {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->checkBadComponentCount(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    .line 289
    :cond_0
    return v2

    .line 291
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->checkOverflowForUnsignedLong([J)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 292
    return v2

    .line 294
    :cond_2
    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 295
    array-length v0, p1

    iput v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 296
    const/4 v0, 0x1

    return v0
.end method

.method public setValue([Lcom/android/gallery3d/exif/Rational;)Z
    .locals 4
    .param p1, "value"    # [Lcom/android/gallery3d/exif/Rational;

    .prologue
    const/16 v3, 0xa

    const/4 v2, 0x5

    const/4 v1, 0x0

    .line 369
    array-length v0, p1

    invoke-direct {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->checkBadComponentCount(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    return v1

    .line 372
    :cond_0
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v0, v2, :cond_1

    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-eq v0, v3, :cond_1

    .line 373
    return v1

    .line 375
    :cond_1
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v0, v2, :cond_2

    invoke-direct {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->checkOverflowForUnsignedRational([Lcom/android/gallery3d/exif/Rational;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 376
    return v1

    .line 377
    :cond_2
    iget-short v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    if-ne v0, v3, :cond_3

    invoke-direct {p0, p1}, Lcom/android/gallery3d/exif/ExifTag;->checkOverflowForRational([Lcom/android/gallery3d/exif/Rational;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 378
    return v1

    .line 381
    :cond_3
    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifTag;->mValue:Ljava/lang/Object;

    .line 382
    array-length v0, p1

    iput v0, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 383
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 1008
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v2, "tag id: %04X\n"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-short v4, p0, Lcom/android/gallery3d/exif/ExifTag;->mTagId:S

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "ifd id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mIfd:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\ntype: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1009
    iget-short v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mDataType:S

    invoke-static {v1}, Lcom/android/gallery3d/exif/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v1

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1009
    const-string/jumbo v1, "\ncount: "

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1009
    iget v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mComponentCountActual:I

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1010
    const-string/jumbo v1, "\noffset: "

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1010
    iget v1, p0, Lcom/android/gallery3d/exif/ExifTag;->mOffset:I

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1010
    const-string/jumbo v1, "\nvalue: "

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1010
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->forceGetValueAsString()Ljava/lang/String;

    move-result-object v1

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1010
    const-string/jumbo v1, "\n"

    .line 1008
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
