.class public Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawJPEGAttribute.java"


# instance fields
.field public mAlgorithmName:Ljava/lang/String;

.field public mApplyWaterMark:Z

.field public mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

.field public mData:[B

.field public mDate:J

.field public mEffectIndex:I

.field public mExif:Lcom/android/gallery3d/exif/ExifInterface;

.field public mFinalImage:Z

.field public mHeight:I

.field public mJpegOrientation:I

.field public mLoc:Landroid/location/Location;

.field public mMirror:Z

.field public mNeedThumbnail:Z

.field public mOrientation:I

.field public mPreviewHeight:I

.field public mPreviewWidth:I

.field public mShootRotation:F

.field public mTitle:Ljava/lang/String;

.field public mUri:Landroid/net/Uri;

.field public mWidth:I


# direct methods
.method public constructor <init>([BZIIIIILcom/android/camera/effect/EffectController$EffectRectAttribute;Landroid/location/Location;Ljava/lang/String;JIIFZLjava/lang/String;Z)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "needThumbnail"    # Z
    .param p3, "previewW"    # I
    .param p4, "previewH"    # I
    .param p5, "w"    # I
    .param p6, "h"    # I
    .param p7, "effectIndex"    # I
    .param p8, "attribute"    # Lcom/android/camera/effect/EffectController$EffectRectAttribute;
    .param p9, "loc"    # Landroid/location/Location;
    .param p10, "title"    # Ljava/lang/String;
    .param p11, "date"    # J
    .param p13, "orientation"    # I
    .param p14, "jpegOrientation"    # I
    .param p15, "shootRotation"    # F
    .param p16, "mirror"    # Z
    .param p17, "algorithmName"    # Ljava/lang/String;
    .param p18, "applyWaterMark"    # Z

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 32
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    .line 54
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    .line 55
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    .line 56
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 57
    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 58
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 59
    iput-boolean p2, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mNeedThumbnail:Z

    .line 60
    iput-wide p11, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 61
    iput p7, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    .line 62
    iput-object p8, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .line 63
    iput-object p9, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    .line 64
    iput-object p10, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 65
    move/from16 v0, p13

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mOrientation:I

    .line 66
    move/from16 v0, p14

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 67
    move/from16 v0, p15

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mShootRotation:F

    .line 68
    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mMirror:Z

    .line 69
    const/16 v1, 0x9

    iput v1, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTarget:I

    .line 70
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mFinalImage:Z

    .line 71
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    .line 72
    move/from16 v0, p18

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    .line 73
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 77
    invoke-super {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->finalize()V

    .line 78
    return-void
.end method
