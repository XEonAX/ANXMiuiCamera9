.class public Lcom/android/camera/ui/V6GestureRecognizer;
.super Ljava/lang/Object;
.source "V6GestureRecognizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;,
        Lcom/android/camera/ui/V6GestureRecognizer$MyEdgeGestureListener;,
        Lcom/android/camera/ui/V6GestureRecognizer$MyGestureListener;,
        Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;
    }
.end annotation


# static fields
.field private static sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;


# instance fields
.field private final MIN_DETECT_DISTANCE:I

.field private final mActivity:Lcom/android/camera/Camera;

.field private final mCameraGestureDetector:Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;

.field private mCurrentModule:Lcom/android/camera/module/Module;

.field private mDistanceX:F

.field private mDistanceY:F

.field private mEdgeGesture:I

.field private final mEdgeGestureDetector:Lcom/android/camera/ui/EdgeGestureDetector;

.field private mGesture:I

.field private final mGestureDetector:Landroid/view/GestureDetector;

.field private mInScaling:Z

.field private final mScaleDetector:Landroid/view/ScaleGestureDetector;

.field private mScaleDetectorEnable:Z

.field private mScrollDirection:I

.field private mScrolled:Z

.field private mTouchDown:Z


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/V6GestureRecognizer;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->MIN_DETECT_DISTANCE:I

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/Camera;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCurrentModule:Lcom/android/camera/module/Module;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/ui/V6GestureRecognizer;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceX:F

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/ui/V6GestureRecognizer;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceY:F

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/ui/V6GestureRecognizer;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    return v0
.end method

.method static synthetic -get6(Lcom/android/camera/ui/V6GestureRecognizer;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mInScaling:Z

    return v0
.end method

.method static synthetic -get7(Lcom/android/camera/ui/V6GestureRecognizer;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrollDirection:I

    return v0
.end method

.method static synthetic -get8(Lcom/android/camera/ui/V6GestureRecognizer;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrolled:Z

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/ui/V6GestureRecognizer;F)F
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "-value"    # F

    .prologue
    iput p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceX:F

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/ui/V6GestureRecognizer;F)F
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "-value"    # F

    .prologue
    iput p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceY:F

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/ui/V6GestureRecognizer;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    return p1
.end method

.method static synthetic -set3(Lcom/android/camera/ui/V6GestureRecognizer;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrollDirection:I

    return p1
.end method

.method static synthetic -set4(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrolled:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/ui/V6GestureRecognizer;IIII)Landroid/graphics/Point;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "e1x"    # I
    .param p2, "e1y"    # I
    .param p3, "e2x"    # I
    .param p4, "e2y"    # I

    .prologue
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/ui/V6GestureRecognizer;->getMoveVector(IIII)Landroid/graphics/Point;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;
    .param p1, "isEdge"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->couldNotifyGesture(Z)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap2(Lcom/android/camera/ui/V6GestureRecognizer;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isCurrentModuleAlive()Z

    move-result v0

    return v0
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 4
    .param p1, "activity"    # Lcom/android/camera/ActivityBase;

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    .line 38
    iput v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mEdgeGesture:I

    .line 52
    iput-boolean v3, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetectorEnable:Z

    move-object v0, p1

    .line 59
    check-cast v0, Lcom/android/camera/Camera;

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    .line 60
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    .line 61
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    .line 60
    mul-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->MIN_DETECT_DISTANCE:I

    .line 62
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/android/camera/ui/V6GestureRecognizer$MyGestureListener;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/V6GestureRecognizer$MyGestureListener;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;Lcom/android/camera/ui/V6GestureRecognizer$MyGestureListener;)V

    invoke-direct {v0, p1, v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;Z)V

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGestureDetector:Landroid/view/GestureDetector;

    .line 63
    new-instance v0, Lcom/android/camera/ui/EdgeGestureDetector;

    new-instance v1, Lcom/android/camera/ui/V6GestureRecognizer$MyEdgeGestureListener;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/V6GestureRecognizer$MyEdgeGestureListener;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;Lcom/android/camera/ui/V6GestureRecognizer$MyEdgeGestureListener;)V

    invoke-direct {v0, v1}, Lcom/android/camera/ui/EdgeGestureDetector;-><init>(Lcom/android/camera/ui/EdgeGestureDetector$EdgeGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mEdgeGestureDetector:Lcom/android/camera/ui/EdgeGestureDetector;

    .line 64
    new-instance v0, Landroid/view/ScaleGestureDetector;

    new-instance v1, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;Lcom/android/camera/ui/V6GestureRecognizer$MyScaleListener;)V

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    .line 65
    new-instance v0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;-><init>(Lcom/android/camera/ui/V6GestureRecognizer;)V

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCameraGestureDetector:Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;

    .line 66
    return-void
.end method

.method private checkControlView(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x0

    .line 163
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa6

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 164
    .local v1, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v1, :cond_0

    .line 165
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEffectViewVisible()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 166
    const v2, 0x7f0a0092

    invoke-interface {v1, v2, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->onViewTouchEvent(ILandroid/view/MotionEvent;)Z

    .line 167
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEffectViewMoved()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 168
    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isGestureDetecting()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    iget v2, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    add-int/lit8 v2, v2, 0x6

    iput v2, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    .line 195
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isGestureDetecting()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    return v2

    .line 172
    :cond_1
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEffectViewMoved()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getCurrentGesture()I

    move-result v2

    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    .line 175
    invoke-virtual {p0, v4}, Lcom/android/camera/ui/V6GestureRecognizer;->setGesture(I)V

    .line 179
    :cond_2
    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isIndicatorVisible(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 180
    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEvAdjusted(Z)Z

    move-result v0

    .line 181
    .local v0, "adjustEv":Z
    const v2, 0x7f0a008f

    invoke-interface {v1, v2, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->onViewTouchEvent(ILandroid/view/MotionEvent;)Z

    .line 182
    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEvAdjusted(Z)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 183
    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isGestureDetecting()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 184
    iget v2, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    add-int/lit8 v2, v2, 0x7

    iput v2, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    goto :goto_0

    .line 186
    :cond_3
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getCurrentGesture()I

    move-result v2

    const/4 v3, 0x7

    if-ne v2, v3, :cond_0

    .line 189
    invoke-virtual {p0, v4}, Lcom/android/camera/ui/V6GestureRecognizer;->setGesture(I)V

    goto :goto_0
.end method

.method private couldNotifyGesture(Z)Z
    .locals 1
    .param p1, "isEdge"    # Z

    .prologue
    .line 264
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->isGestureDetecting(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isCurrentModuleAlive()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;
    .locals 2
    .param p0, "activity"    # Lcom/android/camera/ActivityBase;

    .prologue
    const-class v1, Lcom/android/camera/ui/V6GestureRecognizer;

    monitor-enter v1

    .line 69
    :try_start_0
    sget-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    iget-object v0, v0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    if-eq p0, v0, :cond_1

    .line 70
    :cond_0
    new-instance v0, Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/V6GestureRecognizer;-><init>(Lcom/android/camera/ActivityBase;)V

    sput-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    .line 72
    :cond_1
    sget-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getMoveVector(IIII)Landroid/graphics/Point;
    .locals 2
    .param p1, "e1x"    # I
    .param p2, "e1y"    # I
    .param p3, "e2x"    # I
    .param p4, "e2y"    # I

    .prologue
    .line 257
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 258
    .local v0, "vector":Landroid/graphics/Point;
    sub-int v1, p1, p3

    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 259
    sub-int v1, p2, p4

    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 260
    return-object v0
.end method

.method private isCurrentModuleAlive()Z
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isDeparted()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isGestureDetecting(Z)Z
    .locals 2
    .param p1, "isEdge"    # Z

    .prologue
    const/4 v1, 0x0

    .line 387
    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mEdgeGesture:I

    :goto_0
    rem-int/lit8 v0, v0, 0x64

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public static onDestroy(Lcom/android/camera/ActivityBase;)V
    .locals 2
    .param p0, "activity"    # Lcom/android/camera/ActivityBase;

    .prologue
    const/4 v1, 0x0

    .line 474
    sget-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    if-eqz v0, :cond_0

    .line 475
    sget-object v0, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    iget-object v0, v0, Lcom/android/camera/ui/V6GestureRecognizer;->mActivity:Lcom/android/camera/Camera;

    if-ne v0, p0, :cond_0

    .line 476
    sput-object v1, Lcom/android/camera/ui/V6GestureRecognizer;->sV6GestureRecognizer:Lcom/android/camera/ui/V6GestureRecognizer;

    .line 478
    :cond_0
    return-void
.end method


# virtual methods
.method public getCurrentGesture()I
    .locals 1

    .prologue
    .line 399
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    rem-int/lit8 v0, v0, 0x64

    return v0
.end method

.method public getGestureOrientation()I
    .locals 1

    .prologue
    .line 395
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    div-int/lit8 v0, v0, 0x64

    mul-int/lit8 v0, v0, 0x64

    return v0
.end method

.method public isGestureDetecting()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 391
    iget v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    rem-int/lit8 v1, v1, 0x64

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onEdgeTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 76
    const-string/jumbo v0, "CameraGestureRecognizer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onEdgeTouchEvent mGesture="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " maskAction="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mEdgeGestureDetector:Lcom/android/camera/ui/EdgeGestureDetector;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/EdgeGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)V

    .line 78
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 98
    const-string/jumbo v1, "CameraGestureRecognizer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onTouchEvent mGesture="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-nez v1, :cond_0

    .line 103
    iput v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    .line 114
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-nez v1, :cond_7

    .line 115
    iput-boolean v6, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mTouchDown:Z

    .line 116
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mInScaling:Z

    .line 124
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_3

    .line 125
    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrolled:Z

    .line 126
    iput v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrollDirection:I

    .line 127
    iput v5, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceX:F

    .line 128
    iput v5, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceY:F

    .line 131
    :cond_3
    const-string/jumbo v1, "CameraGestureRecognizer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "set to detector mScaleDetectorEnable = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetectorEnable:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-boolean v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetectorEnable:Z

    if-eqz v1, :cond_a

    .line 133
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 134
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 135
    iput-boolean v6, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mInScaling:Z

    .line 142
    :cond_4
    :goto_1
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCameraGestureDetector:Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)V

    .line 144
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->checkControlView(Landroid/view/MotionEvent;)Z

    .line 146
    iget-object v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 148
    invoke-virtual {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->isGestureDetecting()Z

    move-result v1

    xor-int/lit8 v0, v1, 0x1

    .line 149
    .local v0, "result":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eq v1, v6, :cond_5

    .line 150
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v7, :cond_6

    .line 151
    :cond_5
    iput v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    .line 152
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mInScaling:Z

    .line 153
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrolled:Z

    .line 154
    iput v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScrollDirection:I

    .line 155
    iput v5, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceX:F

    .line 156
    iput v5, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mDistanceY:F

    .line 158
    :cond_6
    return v0

    .line 117
    .end local v0    # "result":Z
    :cond_7
    iget-boolean v1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mTouchDown:Z

    if-nez v1, :cond_8

    .line 118
    return v4

    .line 119
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eq v1, v7, :cond_9

    .line 120
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-ne v1, v6, :cond_1

    .line 121
    :cond_9
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mTouchDown:Z

    goto/16 :goto_0

    .line 138
    :cond_a
    iput-boolean v4, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mInScaling:Z

    goto :goto_1
.end method

.method public setCurrentModule(Lcom/android/camera/module/Module;)V
    .locals 0
    .param p1, "currentModule"    # Lcom/android/camera/module/Module;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 84
    return-void
.end method

.method public setGesture(I)V
    .locals 1
    .param p1, "gesture"    # I

    .prologue
    .line 199
    iget v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    div-int/lit8 v0, v0, 0x64

    mul-int/lit8 v0, v0, 0x64

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mGesture:I

    .line 200
    return-void
.end method

.method public setScaleDetectorEnable(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lcom/android/camera/ui/V6GestureRecognizer;->mScaleDetectorEnable:Z

    .line 88
    return-void
.end method
