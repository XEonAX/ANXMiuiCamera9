.class public Lcom/android/camera/lib/compatibility/related/v21/V21Utils;
.super Ljava/lang/Object;
.source "V21Utils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V
    .locals 0
    .param p0, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p1, "listener"    # Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 17
    invoke-virtual {p0, p1, p2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 18
    return-void
.end method

.method public static setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V
    .locals 0
    .param p0, "paint"    # Landroid/text/TextPaint;
    .param p1, "letterSpacing"    # F

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 22
    return-void
.end method
