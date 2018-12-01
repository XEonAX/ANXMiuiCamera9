.class public Lcom/android/camera/effect/renders/SnapshotEffectRender;
.super Ljava/lang/Object;
.source "SnapshotEffectRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;,
        Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;
    }
.end annotation


# static fields
.field private static final CONFIG_SPEC:[I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mDualCameraWaterMark:Landroid/graphics/Bitmap;

.field private mDualCameraWaterMarkPaddingXRatio:F

.field private mDualCameraWaterMarkPaddingYRatio:F

.field private mDualCameraWaterMarkSizeRatio:F

.field private mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field private mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field private mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

.field private mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mEglThread:Landroid/os/HandlerThread;

.field private mEglThreadBlockVar:Landroid/os/ConditionVariable;

.field private mExifNeeded:Z

.field private mImageSaver:Lcom/android/camera/storage/ImageSaver;

.field private mIsImageCaptureIntent:Z

.field private volatile mJpegQueueSize:I

.field private final mLock:Ljava/lang/Object;

.field private mQuality:I

.field private mRelease:Z

.field private mReleasePending:Z

.field private mTitleMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    return-object v0
.end method

.method static synthetic -get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object v0
.end method

.method static synthetic -get11(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/HandlerThread;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThread:Landroid/os/HandlerThread;

    return-object v0
.end method

.method static synthetic -get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method static synthetic -get13(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/storage/ImageSaver;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object v0
.end method

.method static synthetic -get14(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    return v0
.end method

.method static synthetic -get15(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get16(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mQuality:I

    return v0
.end method

.method static synthetic -get17(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mReleasePending:Z

    return v0
.end method

.method static synthetic -get18(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/util/Map;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mTitleMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMark:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkPaddingXRatio:F

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkPaddingYRatio:F

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkSizeRatio:F

    return v0
.end method

.method static synthetic -get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object v0
.end method

.method static synthetic -get8(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object v0
.end method

.method static synthetic -get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/ActivityBase;)Lcom/android/camera/ActivityBase;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Lcom/android/camera/ActivityBase;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Ljavax/microedition/khronos/egl/EGL10;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    return-object p1
.end method

.method static synthetic -set2(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object p1
.end method

.method static synthetic -set3(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Ljavax/microedition/khronos/egl/EGLContext;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p1
.end method

.method static synthetic -set4(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Ljavax/microedition/khronos/egl/EGLDisplay;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object p1
.end method

.method static synthetic -set5(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Ljavax/microedition/khronos/egl/EGLSurface;

    .prologue
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p1
.end method

.method static synthetic -set6(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    return p1
.end method

.method static synthetic -set7(Lcom/android/camera/effect/renders/SnapshotEffectRender;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mRelease:Z

    return p1
.end method

.method static synthetic -set8(Lcom/android/camera/effect/renders/SnapshotEffectRender;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mReleasePending:Z

    return p1
.end method

.method static synthetic -wrap0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 1
    .param p0, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p1, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;

    .prologue
    invoke-static {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->TAG:Ljava/lang/String;

    .line 81
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->CONFIG_SPEC:[I

    .line 49
    return-void

    .line 81
    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3038
    .end array-data
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;Z)V
    .locals 6
    .param p1, "activity"    # Lcom/android/camera/ActivityBase;
    .param p2, "isImageCaptureIntent"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    .line 54
    new-instance v1, Landroid/os/ConditionVariable;

    invoke-direct {v1}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    .line 55
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mTitleMap:Ljava/util/Map;

    .line 77
    iput-boolean v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mExifNeeded:Z

    .line 79
    const/16 v1, 0x61

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mQuality:I

    .line 88
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mLock:Ljava/lang/Object;

    .line 91
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    .line 92
    iput-boolean p2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mIsImageCaptureIntent:Z

    .line 93
    new-instance v1, Landroid/os/HandlerThread;

    const-string/jumbo v2, "SnapshotEffectProcessor"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThread:Landroid/os/HandlerThread;

    .line 94
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 95
    new-instance v1, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;-><init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    .line 96
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    invoke-virtual {v1, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->sendMessageSync(I)V

    .line 97
    iput-boolean v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mRelease:Z

    .line 99
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 101
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 102
    iput-boolean v5, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 106
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    .line 107
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMark:Landroid/graphics/Bitmap;

    .line 108
    const v1, 0x7f0900a3

    invoke-virtual {p0, v1, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->getResourceFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkSizeRatio:F

    .line 109
    const v1, 0x7f0900a4

    invoke-virtual {p0, v1, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->getResourceFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkPaddingXRatio:F

    .line 110
    const v1, 0x7f0900a5

    invoke-virtual {p0, v1, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->getResourceFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mDualCameraWaterMarkPaddingYRatio:F

    .line 112
    .end local v0    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_0
    return-void
.end method

.method private static chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 12
    .param p0, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p1, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;

    .prologue
    const/4 v4, 0x0

    .line 251
    const/4 v0, 0x1

    new-array v5, v0, [I

    .line 252
    .local v5, "numConfig":[I
    sget-object v2, Lcom/android/camera/effect/renders/SnapshotEffectRender;->CONFIG_SPEC:[I

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 253
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "eglChooseConfig failed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 256
    :cond_0
    aget v10, v5, v4

    .line 257
    .local v10, "numConfigs":I
    if-gtz v10, :cond_1

    .line 258
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "No configs match configSpec"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 261
    :cond_1
    new-array v9, v10, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 263
    .local v9, "configs":[Ljavax/microedition/khronos/egl/EGLConfig;
    sget-object v8, Lcom/android/camera/effect/renders/SnapshotEffectRender;->CONFIG_SPEC:[I

    move-object v6, p0

    move-object v7, p1

    move-object v11, v5

    .line 262
    invoke-interface/range {v6 .. v11}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 264
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "eglChooseConfig#2 failed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 267
    :cond_2
    aget-object v0, v9, v4

    return-object v0
.end method

.method public static final getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;
    .locals 2

    .prologue
    .line 115
    sget-boolean v1, Lcom/android/camera/Device;->IS_E10:Z

    if-eqz v1, :cond_0

    .line 116
    const-string/jumbo v1, "ro.boot.hwc"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "hwc":Ljava/lang/String;
    const-string/jumbo v1, "india"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    const-string/jumbo v1, "/vendor/etc/camera/dualcamera_india.png"

    return-object v1

    .line 122
    :cond_0
    const-string/jumbo v1, "/vendor/etc/camera/dualcamera.png"

    return-object v1
.end method

.method private processorThumAsync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V
    .locals 7
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mExifNeeded:Z

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 204
    return-void

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    .line 207
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 208
    iget-wide v2, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 209
    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 210
    iget v5, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    .line 211
    iget v6, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    .line 206
    invoke-static/range {v0 .. v6}, Lcom/android/camera/storage/Storage;->newImage(Landroid/content/Context;Ljava/lang/String;JIII)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    .line 212
    return-void
.end method

.method private processorThumSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)Z
    .locals 8
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mExifNeeded:Z

    if-eqz v0, :cond_1

    .line 216
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    invoke-static {v0}, Lcom/android/camera/Util;->getExif([B)Lcom/android/gallery3d/exif/ExifInterface;

    move-result-object v0

    iput-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 217
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 218
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->addAlgorithmComment(Ljava/lang/String;)Z

    .line 220
    :cond_0
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v7

    .line 221
    .local v7, "data":[B
    if-eqz v7, :cond_1

    .line 222
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 223
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 224
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 225
    const/4 v0, 0x1

    return v0

    .line 228
    .end local v7    # "data":[B
    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    .line 229
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 230
    iget-wide v2, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 231
    iget v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 232
    iget v5, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    .line 233
    iget v6, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    .line 228
    invoke-static/range {v0 .. v6}, Lcom/android/camera/storage/Storage;->newImage(Landroid/content/Context;Ljava/lang/String;JIII)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    .line 234
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getResourceFloat(IF)F
    .locals 5
    .param p1, "resId"    # I
    .param p2, "defaultValue"    # F

    .prologue
    .line 126
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 128
    .local v1, "value":Landroid/util/TypedValue;
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p1, v1, v3}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 129
    invoke-virtual {v1}, Landroid/util/TypedValue;->getFloat()F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/android/camera/effect/renders/SnapshotEffectRender;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Missing resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return p2
.end method

.method public prepareEffectRender(I)V
    .locals 3
    .param p1, "effect"    # I

    .prologue
    .line 734
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 735
    return-void
.end method

.method public processorJpegAsync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)Z
    .locals 9
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 153
    sget-object v4, Lcom/android/camera/effect/renders/SnapshotEffectRender;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "queueSize="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    const/4 v5, 0x7

    if-lt v4, v5, :cond_0

    .line 155
    sget-object v4, Lcom/android/camera/effect/renders/SnapshotEffectRender;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "queueSize is full, drop it "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    return v7

    .line 158
    :cond_0
    iget v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    if-nez v4, :cond_2

    const/4 v2, 0x1

    .line 159
    .local v2, "sync":Z
    :goto_0
    const/4 v1, 0x0

    .line 160
    .local v1, "isThumbnailProsessDone":Z
    if-eqz v2, :cond_3

    .line 161
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorThumSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)Z

    move-result v1

    .line 166
    .end local v1    # "isThumbnailProsessDone":Z
    :goto_1
    iget-boolean v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mIsImageCaptureIntent:Z

    if-nez v4, :cond_1

    if-eqz v2, :cond_1

    iget-boolean v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mExifNeeded:Z

    if-eqz v4, :cond_1

    if-eqz v1, :cond_1

    .line 167
    iget-boolean v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mNeedThumbnail:Z

    if-nez v4, :cond_4

    .line 168
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v4

    iget-object v5, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lcom/android/camera/ThumbnailUpdater;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    .line 179
    :cond_1
    :goto_2
    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 180
    :try_start_0
    iget v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mJpegQueueSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v5

    .line 182
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    invoke-virtual {v4, v8, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 183
    return v8

    .line 158
    .end local v2    # "sync":Z
    :cond_2
    const/4 v2, 0x0

    .restart local v2    # "sync":Z
    goto :goto_0

    .line 163
    .restart local v1    # "isThumbnailProsessDone":Z
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorThumAsync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V

    goto :goto_1

    .line 170
    .end local v1    # "isThumbnailProsessDone":Z
    :cond_4
    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v4}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 171
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-eqz v4, :cond_1

    .line 173
    iput-boolean v7, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mFinalImage:Z

    .line 174
    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    iget v5, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    invoke-static {v4, v0, v5, v7}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v3

    .line 175
    .local v3, "t":Lcom/android/camera/Thumbnail;
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v4

    invoke-virtual {v4, v3, v8, v8}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    goto :goto_2

    .line 179
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "t":Lcom/android/camera/Thumbnail;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method

.method public processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V
    .locals 4
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .prologue
    const/4 v1, 0x0

    .line 188
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 189
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mExifNeeded:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const/4 v3, 0x2

    invoke-virtual {v2, v3, v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 190
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 191
    return-void

    :cond_0
    move v0, v1

    .line 189
    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 243
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    iput-boolean v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mReleasePending:Z

    .line 248
    :goto_0
    return-void

    .line 246
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public setImageSaver(Lcom/android/camera/storage/ImageSaver;)V
    .locals 0
    .param p1, "imageSaver"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    .line 138
    return-void
.end method

.method public setQuality(I)V
    .locals 1
    .param p1, "quality"    # I

    .prologue
    .line 141
    if-ltz p1, :cond_0

    const/16 v0, 0x61

    if-gt p1, v0, :cond_0

    .line 142
    iput p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender;->mQuality:I

    .line 144
    :cond_0
    return-void
.end method
