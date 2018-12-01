.class public Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;
.super Ljava/lang/Object;
.source "CompatibilityUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static allocGraphicBuffers()V
    .locals 0

    .prologue
    .line 61
    invoke-static {}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->allocGraphicBuffers()V

    .line 62
    return-void
.end method

.method public static getSdcardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->getSdcardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final isInMultiWindowMode(Landroid/app/Activity;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 31
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method

.method public static isInVideoCall(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->isInVideoCall(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0
    .param p0, "mediaRecorder"    # Landroid/media/MediaRecorder;

    .prologue
    .line 49
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 50
    return-void
.end method

.method public static resumeMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0
    .param p0, "mediaRecorder"    # Landroid/media/MediaRecorder;

    .prologue
    .line 53
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 54
    return-void
.end method

.method public static setBrightnessRampRate(Landroid/os/IPowerManager;I)V
    .locals 0
    .param p0, "pm"    # Landroid/os/IPowerManager;
    .param p1, "rate"    # I

    .prologue
    .line 73
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/screenlight/ScreenLightUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 74
    return-void
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z
    .locals 1
    .param p0, "mediaRecorder"    # Landroid/media/MediaRecorder;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V
    .locals 0
    .param p0, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p1, "listener"    # Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 45
    invoke-static {p0, p1, p2}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 46
    return-void
.end method

.method public static setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V
    .locals 0
    .param p0, "paint"    # Landroid/text/TextPaint;
    .param p1, "letterSpacing"    # F

    .prologue
    .line 57
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V

    .line 58
    return-void
.end method

.method public static setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 0
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 69
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 70
    return-void
.end method
