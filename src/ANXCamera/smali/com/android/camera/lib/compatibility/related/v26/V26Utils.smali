.class public Lcom/android/camera/lib/compatibility/related/v26/V26Utils;
.super Ljava/lang/Object;
.source "V26Utils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static allocGraphicBuffers()V
    .locals 5

    .prologue
    .line 24
    const/16 v1, 0x3200

    const/16 v2, 0xa00

    .line 25
    const/4 v3, 0x1

    .line 26
    const/16 v4, 0x33

    .line 24
    invoke-static {v1, v2, v3, v4}, Landroid/graphics/GraphicBuffer;->create(IIII)Landroid/graphics/GraphicBuffer;

    move-result-object v0

    .line 27
    .local v0, "buffer":Landroid/graphics/GraphicBuffer;
    invoke-virtual {v0}, Landroid/graphics/GraphicBuffer;->destroy()V

    .line 28
    return-void
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z
    .locals 5
    .param p0, "mediaRecorder"    # Landroid/media/MediaRecorder;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v2, 0x0

    .line 32
    .local v2, "succeed":Z
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_0

    .line 34
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 35
    .local v1, "file":Ljava/io/File;
    invoke-virtual {p0, v1}, Landroid/media/MediaRecorder;->setNextOutputFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    const/4 v2, 0x1

    .line 42
    .end local v1    # "file":Ljava/io/File;
    :cond_0
    :goto_0
    return v2

    .line 37
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v3, "V26Utils"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 47
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_ENABLE_ZSL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 49
    :cond_0
    return-void
.end method
