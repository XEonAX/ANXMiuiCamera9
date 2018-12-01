.class public final Lcom/android/camera/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# static fields
.field public static final CameraPreference:[I

.field public static final IconIndicator:[I

.field public static final IconListPreference:[I

.field public static final ListPreference:[I

.field public static final PreviewListPreference:[I

.field public static final RecyclerView:[I

.field public static final ToggleSwitch:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const v3, 0x7f01000a

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2151
    new-array v0, v6, [I

    .line 2152
    const v1, 0x7f010004

    aput v1, v0, v5

    .line 2151
    sput-object v0, Lcom/android/camera/R$styleable;->CameraPreference:[I

    .line 2181
    const v0, 0x7f01000b

    .line 2180
    filled-new-array {v3, v0}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/R$styleable;->IconIndicator:[I

    .line 2220
    const v0, 0x7f01000c

    const v1, 0x7f01000d

    const v2, 0x7f01000e

    .line 2219
    filled-new-array {v3, v0, v1, v2}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/R$styleable;->IconListPreference:[I

    .line 2283
    const v0, 0x7f010005

    const v1, 0x7f010006

    const v2, 0x7f010007

    const v3, 0x7f010008

    .line 2284
    const v4, 0x7f010009

    .line 2282
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/R$styleable;->ListPreference:[I

    .line 2355
    new-array v0, v6, [I

    .line 2356
    const v1, 0x7f01000f

    aput v1, v0, v5

    .line 2355
    sput-object v0, Lcom/android/camera/R$styleable;->PreviewListPreference:[I

    .line 2387
    const v0, 0x10100c4

    const/high16 v1, 0x7f010000

    const v2, 0x7f010001

    const v3, 0x7f010002

    .line 2388
    const v4, 0x7f010003

    .line 2386
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/R$styleable;->RecyclerView:[I

    .line 2502
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/R$styleable;->ToggleSwitch:[I

    .line 2140
    return-void

    .line 2502
    :array_0
    .array-data 4
        0x7f010010
        0x7f010011
        0x7f010012
        0x7f010013
        0x7f010014
        0x7f010015
        0x7f010016
        0x7f010017
        0x7f010018
        0x7f010019
        0x7f01001a
        0x7f01001b
        0x7f01001c
        0x7f01001d
        0x7f01001e
        0x7f01001f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
