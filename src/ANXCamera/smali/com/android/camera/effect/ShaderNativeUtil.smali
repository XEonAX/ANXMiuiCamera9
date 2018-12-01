.class public Lcom/android/camera/effect/ShaderNativeUtil;
.super Ljava/lang/Object;
.source "ShaderNativeUtil.java"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    :try_start_0
    const-string/jumbo v1, "CameraEffectJNI"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 15
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 16
    .restart local v0    # "e":Ljava/lang/Throwable;
    const-string/jumbo v1, "ShaderNativeUtil"

    const-string/jumbo v2, "ShaderNativeUtil load CameraEffectJNI.so failed."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native getJpegPicture(IIIII)[B
.end method

.method public static getPicture(IIIII)[B
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "quality"    # I

    .prologue
    .line 33
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegPicture(IIIII)[B

    move-result-object v0

    return-object v0
.end method

.method private static native initJpegTexture([BII)[I
.end method

.method public static initTexture([BII)[I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "texId"    # I
    .param p2, "downScale"    # I

    .prologue
    .line 25
    invoke-static {p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->initJpegTexture([BII)[I

    move-result-object v0

    return-object v0
.end method
