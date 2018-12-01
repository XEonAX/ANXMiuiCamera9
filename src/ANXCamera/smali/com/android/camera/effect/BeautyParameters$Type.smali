.class public final enum Lcom/android/camera/effect/BeautyParameters$Type;
.super Ljava/lang/Enum;
.source "BeautyParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/BeautyParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/camera/effect/BeautyParameters$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

.field public static final enum WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 23
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "WHITEN_STRENGTH"

    invoke-direct {v0, v1, v3}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 24
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "SHRINK_FACE_RATIO"

    invoke-direct {v0, v1, v4}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 25
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "ENLARGE_EYE_RATIO"

    invoke-direct {v0, v1, v5}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 26
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "SMOOTH_STRENGTH"

    invoke-direct {v0, v1, v6}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 27
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "NOSE_RATIO"

    invoke-direct {v0, v1, v7}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 28
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "RISORIUS_RATIO"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 29
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "LIPS_RATIO"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 30
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "CHIN_RATIO"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 31
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "NECK_RATIO"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 32
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "SMILE_RATIO"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 33
    new-instance v0, Lcom/android/camera/effect/BeautyParameters$Type;

    const-string/jumbo v1, "SLIM_NOSE_RATIO"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/BeautyParameters$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 22
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/android/camera/effect/BeautyParameters$Type;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v7

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->$VALUES:[Lcom/android/camera/effect/BeautyParameters$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/camera/effect/BeautyParameters$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0
.end method

.method public static values()[Lcom/android/camera/effect/BeautyParameters$Type;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->$VALUES:[Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0
.end method
