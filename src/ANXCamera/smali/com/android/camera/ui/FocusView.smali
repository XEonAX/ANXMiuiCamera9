.class public Lcom/android/camera/ui/FocusView;
.super Landroid/view/View;
.source "FocusView.java"

# interfaces
.implements Lcom/android/camera/ui/FocusIndicator;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/FocusView$1;,
        Lcom/android/camera/ui/FocusView$2;,
        Lcom/android/camera/ui/FocusView$CenterFlag;,
        Lcom/android/camera/ui/FocusView$CursorState;,
        Lcom/android/camera/ui/FocusView$ExposureViewListener;,
        Lcom/android/camera/ui/FocusView$ViewState;
    }
.end annotation


# static fields
.field private static final GAP_NUM:F

.field public static final MAX_SLIDE_DISTANCE:I

.field private static final TAG:Ljava/lang/String;

.field private static final TRIANGLE_BASE_DIS:I


# instance fields
.field private mActivity:Lcom/android/camera/Camera;

.field private mAdapter:Lcom/android/camera/ui/RollAdapter;

.field private mAdjustedDoneTime:J

.field private mBeingEvAdjusted:Z

.field private mBottomRelative:I

.field private mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

.field private mCaptureBitmap:Landroid/graphics/Bitmap;

.field private mCenterFlag:I

.field private mCenterX:I

.field private mCenterY:I

.field private mCurrentDistanceY:I

.field private mCurrentItem:I

.field private mCurrentMinusCircleCenter:I

.field private mCurrentMinusCircleRadius:F

.field private mCurrentMode:I

.field private mCurrentRadius:I

.field private mCurrentRayBottom:I

.field private mCurrentRayHeight:I

.field private mCurrentRayWidth:I

.field private mCurrentViewState:I

.field private mCursorState:I

.field private mDisplayRect:Landroid/graphics/Rect;

.field private mEVAnimationRatio:F

.field private mEVAnimationStartTime:J

.field private mEVCaptureRatio:F

.field private mEvValue:F

.field private mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

.field private mFailTime:J

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHandler:Landroid/os/Handler;

.field private mHeight:I

.field private mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsDown:Z

.field private mIsDraw:Z

.field private mIsEvAdjustable:Z

.field private mIsTouchFocus:Z

.field private mLastItem:I

.field private mLockBodyBitmap:Landroid/graphics/Bitmap;

.field private mLockHeadBitmap:Landroid/graphics/Bitmap;

.field private mRotation:I

.field private mScrollDistanceY:I

.field private mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private mStartTime:J

.field private mState:I

.field private mSuccessTime:J

.field private mWidth:I


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1()I
    .locals 1

    sget v0, Lcom/android/camera/ui/FocusView;->TRIANGLE_BASE_DIS:I

    return v0
.end method

.method static synthetic -get10(Lcom/android/camera/ui/FocusView;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationStartTime:J

    return-wide v0
.end method

.method static synthetic -get11(Lcom/android/camera/ui/FocusView;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    return v0
.end method

.method static synthetic -get12(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/FocusView$ExposureViewListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    return-object v0
.end method

.method static synthetic -get13(Lcom/android/camera/ui/FocusView;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    return v0
.end method

.method static synthetic -get14(Lcom/android/camera/ui/FocusView;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    return v0
.end method

.method static synthetic -get15(Lcom/android/camera/ui/FocusView;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsEvAdjustable:Z

    return v0
.end method

.method static synthetic -get16(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    return v0
.end method

.method static synthetic -get17(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/Camera;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mActivity:Lcom/android/camera/Camera;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    return v0
.end method

.method static synthetic -get6(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    return v0
.end method

.method static synthetic -get7(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    return v0
.end method

.method static synthetic -get8(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    return v0
.end method

.method static synthetic -get9(Lcom/android/camera/ui/FocusView;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/ui/FocusView;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/ui/FocusView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/ui/FocusView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    return p1
.end method

.method static synthetic -set3(Lcom/android/camera/ui/FocusView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    return p1
.end method

.method static synthetic -set4(Lcom/android/camera/ui/FocusView;F)F
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # F

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    return p1
.end method

.method static synthetic -set5(Lcom/android/camera/ui/FocusView;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    return p1
.end method

.method static synthetic -set6(Lcom/android/camera/ui/FocusView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mLastItem:I

    return p1
.end method

.method static synthetic -set7(Lcom/android/camera/ui/FocusView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/ui/FocusView;FFF)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "r"    # F

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/ui/FocusView;->isInCircle(FFF)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/ui/FocusView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->getItemByCoordinate()I

    move-result v0

    return v0
.end method

.method static synthetic -wrap2(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->calculateAttribute()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->removeMessages()V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetCenter()V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/camera/ui/FocusView;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "type"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/FocusView;->reset(I)V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/camera/ui/FocusView;IZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;
    .param p1, "index"    # I
    .param p2, "animated"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/FocusView;->setCurrentItem(IZ)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->setTouchDown()V

    return-void
.end method

.method static synthetic -wrap9(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/FocusView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->startAnimation()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 50
    const-class v0, Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    .line 74
    const-string/jumbo v0, "camera_exposure_compensation_steps_num"

    const/4 v1, 0x0

    .line 73
    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    .line 75
    const v0, 0x42dc999a    # 110.3f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    .line 76
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/FocusView;->TRIANGLE_BASE_DIS:I

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 251
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 90
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 104
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    .line 121
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 167
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 209
    new-instance v0, Lcom/android/camera/ui/FocusView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/FocusView$1;-><init>(Lcom/android/camera/ui/FocusView;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    .line 731
    new-instance v0, Lcom/android/camera/ui/FocusView$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/FocusView$2;-><init>(Lcom/android/camera/ui/FocusView;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    move-object v0, p1

    .line 252
    check-cast v0, Lcom/android/camera/Camera;

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mActivity:Lcom/android/camera/Camera;

    .line 254
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 256
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mSimpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 257
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, v2}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 259
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f020000

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mCaptureBitmap:Landroid/graphics/Bitmap;

    .line 261
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    invoke-direct {v0}, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    .line 262
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .line 263
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mCaptureBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V

    .line 265
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020100

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mLockHeadBitmap:Landroid/graphics/Bitmap;

    .line 266
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0200ff

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mLockBodyBitmap:Landroid/graphics/Bitmap;

    .line 267
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mLockHeadBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setLockIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 268
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 269
    return-void
.end method

.method private calculateAttribute()V
    .locals 10

    .prologue
    const/high16 v9, 0x40400000    # 3.0f

    const/high16 v8, 0x40a00000    # 5.0f

    const/high16 v7, 0x3f000000    # 0.5f

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v5, 0x40000000    # 2.0f

    .line 875
    const/4 v2, 0x0

    .line 876
    .local v2, "ratio":F
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    invoke-direct {p0, v3}, Lcom/android/camera/ui/FocusView;->getItemRatio(I)F

    move-result v0

    .line 877
    .local v0, "currentItemRatio":F
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mLastItem:I

    invoke-direct {p0, v3}, Lcom/android/camera/ui/FocusView;->getItemRatio(I)F

    move-result v1

    .line 879
    .local v1, "lastItemRatio":F
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    packed-switch v3, :pswitch_data_0

    .line 933
    :pswitch_0
    const/4 v3, 0x1

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 938
    :goto_0
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelResetCenter()V

    .line 940
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 941
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    .line 944
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->getCurrentAngle()I

    move-result v4

    int-to-float v4, v4

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentAngle:F

    .line 945
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    .line 946
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    .line 947
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    .line 950
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    .line 951
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    iput v4, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleRadius:F

    .line 952
    return-void

    .line 881
    :pswitch_1
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    cmpg-float v3, v3, v7

    if-gez v3, :cond_0

    .line 882
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float v2, v5, v3

    .line 883
    sub-float v3, v6, v1

    mul-float/2addr v3, v2

    add-float/2addr v3, v1

    mul-float/2addr v3, v5

    const/high16 v4, 0x40c00000    # 6.0f

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 884
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    const v4, 0x3f69fbe7    # 0.914f

    mul-float/2addr v4, v2

    add-float/2addr v4, v7

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 885
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    const v4, 0x3e4ccccd    # 0.2f

    mul-float/2addr v4, v2

    const v5, 0x3f4ccccd    # 0.8f

    add-float/2addr v4, v5

    mul-float/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 886
    const/4 v3, 0x4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0

    .line 888
    :cond_0
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    sub-float/2addr v3, v7

    mul-float v2, v5, v3

    .line 889
    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 890
    mul-float v3, v0, v2

    sub-float v4, v6, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v5

    add-float/2addr v3, v8

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 891
    mul-float v3, v0, v2

    sub-float v4, v6, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v9

    const/high16 v4, 0x40f00000    # 7.5f

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 892
    sub-float v3, v6, v2

    mul-float/2addr v3, v9

    add-float/2addr v3, v8

    mul-float v4, v5, v0

    mul-float/2addr v4, v2

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 893
    const/4 v3, 0x3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 897
    :pswitch_2
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    cmpg-float v3, v3, v7

    if-gtz v3, :cond_1

    .line 898
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float v2, v5, v3

    .line 899
    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 900
    sub-float v3, v6, v2

    mul-float/2addr v3, v1

    sub-float/2addr v3, v2

    mul-float/2addr v3, v5

    add-float/2addr v3, v8

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 901
    sub-float v3, v6, v2

    mul-float/2addr v3, v1

    sub-float/2addr v3, v2

    mul-float/2addr v3, v9

    const/high16 v4, 0x40f00000    # 7.5f

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 902
    mul-float v3, v9, v2

    add-float/2addr v3, v8

    mul-float v4, v5, v1

    sub-float v5, v6, v2

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 903
    const/4 v3, 0x3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 905
    :cond_1
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    sub-float/2addr v3, v7

    mul-float v2, v5, v3

    .line 906
    sub-float v3, v6, v0

    mul-float/2addr v3, v2

    mul-float/2addr v3, v5

    const/high16 v4, 0x41000000    # 8.0f

    sub-float v3, v4, v3

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 907
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    sub-float v4, v6, v2

    const v5, 0x3f69fbe7    # 0.914f

    mul-float/2addr v4, v5

    add-float/2addr v4, v7

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 908
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    sub-float v4, v6, v2

    const v5, 0x3e4ccccd    # 0.2f

    mul-float/2addr v4, v5

    const v5, 0x3f4ccccd    # 0.8f

    add-float/2addr v4, v5

    mul-float/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 909
    const/4 v3, 0x4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 913
    :pswitch_3
    move v2, v0

    .line 914
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v4, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v4}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 915
    mul-float v3, v5, v0

    const/high16 v4, 0x40c00000    # 6.0f

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 916
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    mul-float/2addr v3, v7

    float-to-int v3, v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleCenter:I

    .line 917
    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    int-to-float v3, v3

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentMinusCircleRadius:F

    .line 918
    const/4 v3, 0x4

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 920
    :cond_2
    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayWidth:I

    .line 921
    mul-float v3, v5, v0

    add-float/2addr v3, v8

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayHeight:I

    .line 922
    mul-float v3, v9, v0

    const/high16 v4, 0x40f00000    # 7.5f

    add-float/2addr v3, v4

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRayBottom:I

    .line 923
    mul-float v3, v5, v0

    add-float/2addr v3, v8

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentRadius:I

    .line 924
    const/4 v3, 0x3

    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 928
    :pswitch_4
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-eqz v3, :cond_3

    .line 929
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v3}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v3

    .line 928
    if-eqz v3, :cond_3

    .line 930
    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v3}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v3

    .line 928
    if-eqz v3, :cond_3

    .line 930
    const/4 v3, 0x2

    .line 928
    :goto_1
    iput v3, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto/16 :goto_0

    .line 930
    :cond_3
    const/4 v3, 0x1

    goto :goto_1

    .line 879
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private clearMessages()V
    .locals 2

    .prologue
    .line 661
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 662
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 663
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 664
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 665
    return-void
.end method

.method private getCurrentAngle()I
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/high16 v7, 0x43070000    # 135.0f

    const/high16 v6, 0x40000000    # 2.0f

    const/16 v5, 0x168

    const/4 v4, 0x0

    .line 955
    const/4 v0, 0x0

    .line 956
    .local v0, "degree":I
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    if-eq v2, v8, :cond_2

    .line 957
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_2

    .line 958
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v3}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 959
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v3}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int/lit16 v2, v2, 0x168

    iget-object v3, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v3}, Lcom/android/camera/ui/RollAdapter;->getCenterIndex()I

    move-result v3

    div-int v0, v2, v3

    .line 961
    :cond_0
    invoke-static {v0, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v2

    rsub-int v0, v2, 0x168

    .line 976
    :cond_1
    :goto_0
    return v0

    .line 962
    :cond_2
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 963
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    sub-int v1, v2, v3

    .line 964
    .local v1, "relativeDis":I
    sget v2, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    invoke-static {v1, v4, v2}, Lcom/android/camera/Util;->clamp(III)I

    move-result v1

    .line 965
    sget v2, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/lit8 v2, v2, 0x2

    if-lt v1, v2, :cond_3

    .line 966
    sget v2, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/lit8 v2, v2, 0x2

    sub-int v2, v1, v2

    mul-int/lit16 v2, v2, 0x168

    sget v3, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int/lit8 v3, v3, 0x2

    div-int v0, v2, v3

    .line 968
    :cond_3
    invoke-static {v0, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v2

    rsub-int v0, v2, 0x168

    goto :goto_0

    .line 969
    .end local v1    # "relativeDis":I
    :cond_4
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    if-ne v2, v8, :cond_5

    .line 970
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    mul-float/2addr v2, v6

    mul-float/2addr v2, v7

    float-to-int v0, v2

    .line 971
    const/16 v2, 0x87

    invoke-static {v0, v4, v2}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    goto :goto_0

    .line 972
    :cond_5
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_1

    .line 973
    iget v2, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationRatio:F

    const/high16 v3, 0x3f000000    # 0.5f

    sub-float/2addr v2, v3

    mul-float/2addr v2, v6

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v2, v3, v2

    mul-float/2addr v2, v7

    float-to-int v0, v2

    .line 974
    const/16 v2, 0x87

    invoke-static {v0, v4, v2}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    goto :goto_0
.end method

.method private getItemByCoordinate()I
    .locals 4

    .prologue
    .line 699
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    iget v3, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    sub-int/2addr v2, v3

    mul-int/2addr v1, v2

    sget v2, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    div-int v0, v1, v2

    .line 700
    .local v0, "item":I
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    .line 701
    return v0
.end method

.method private getItemRatio(I)F
    .locals 5
    .param p1, "item"    # I

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    const/high16 v3, 0x3f000000    # 0.5f

    .line 869
    int-to-float v1, p1

    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v2}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v2

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 870
    .local v0, "itemRatio":F
    cmpl-float v1, v0, v3

    if-ltz v1, :cond_0

    sub-float v1, v0, v3

    mul-float v0, v4, v1

    .line 871
    :goto_0
    return v0

    .line 870
    :cond_0
    mul-float/2addr v0, v4

    goto :goto_0
.end method

.method private initRect()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 531
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    .line 533
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    .line 534
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    .line 536
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    .line 537
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    .line 539
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/FocusView;->setPivotX(F)V

    .line 540
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/FocusView;->setPivotY(F)V

    .line 542
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .line 543
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->getLayoutDirection()I

    move-result v2

    if-ne v0, v2, :cond_0

    .line 544
    :goto_0
    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mDisplayRect:Landroid/graphics/Rect;

    .line 542
    invoke-virtual {v1, v0, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setRtlAndDisplayRect(ZLandroid/graphics/Rect;)V

    .line 545
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCenter(II)V

    .line 546
    return-void

    .line 543
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isInCircle(FFF)Z
    .locals 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "r"    # F

    .prologue
    .line 980
    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    int-to-float v4, v4

    sub-float v2, p1, v4

    .line 981
    .local v2, "dx":F
    iget v4, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    int-to-float v4, v4

    sub-float v3, p2, v4

    .line 982
    .local v3, "dy":F
    mul-float v4, v2, v2

    mul-float v5, v3, v3

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    .line 983
    .local v0, "distance":D
    float-to-double v4, p3

    cmpg-double v4, v0, v4

    if-gtz v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private isStableStart()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 642
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-nez v0, :cond_0

    .line 643
    return v1

    .line 645
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_1

    .line 646
    return v1

    .line 649
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isMeteringAreaOnly()Z

    move-result v0

    return v0
.end method

.method private processParameterIfNeeded(F)V
    .locals 2
    .param p1, "ratio"    # F

    .prologue
    .line 322
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_0

    .line 323
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    if-nez v0, :cond_0

    .line 324
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 327
    :cond_0
    return-void
.end method

.method private reload()V
    .locals 2

    .prologue
    .line 668
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v0, :cond_0

    .line 669
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-static {}, Lcom/android/camera/CameraSettings;->readExposure()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/ui/RollAdapter;->getItemIndexByValue(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 670
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 672
    :cond_0
    return-void
.end method

.method private removeMessages()V
    .locals 0

    .prologue
    .line 683
    return-void
.end method

.method private reset(I)V
    .locals 3
    .param p1, "type"    # I

    .prologue
    const/4 v2, 0x0

    .line 512
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-nez v0, :cond_0

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 513
    return-void

    .line 516
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 517
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 519
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mHeight:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/ui/FocusView;->setPosition(III)V

    .line 520
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 521
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 523
    iput-boolean v2, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 524
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->stopEvAdjust()V

    .line 526
    invoke-direct {p0, v2}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 527
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 528
    return-void
.end method

.method private resetCenter()V
    .locals 2

    .prologue
    .line 549
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCurrentViewState:I

    .line 550
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    .line 552
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_0

    .line 553
    return-void

    .line 557
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowAeAfLockIndicator()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 558
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 559
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 560
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 567
    :cond_1
    :goto_0
    return-void

    .line 561
    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 562
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v0

    .line 561
    if-eqz v0, :cond_1

    .line 563
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 564
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mIndicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iput v1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 565
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    goto :goto_0
.end method

.method private resetEvValue()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 690
    iput-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    .line 691
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    .line 692
    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 693
    iput v1, p0, Lcom/android/camera/ui/FocusView;->mScrollDistanceY:I

    .line 694
    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    .line 695
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->reset()V

    .line 696
    return-void
.end method

.method private setCurrentItem(IZ)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "animated"    # Z

    .prologue
    .line 705
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    if-eq p1, v1, :cond_1

    .line 706
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 707
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v1, :cond_0

    .line 709
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 710
    const/16 v2, 0xa9

    .line 709
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 711
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
    if-eqz v0, :cond_0

    .line 712
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v1, p1}, Lcom/android/camera/ui/RollAdapter;->getItemValue(I)I

    move-result v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->onEvChanged(II)V

    .line 715
    .end local v0    # "p":Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 717
    :cond_1
    return-void
.end method

.method private setDraw(Z)V
    .locals 1
    .param p1, "draw"    # Z

    .prologue
    .line 675
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eq v0, p1, :cond_0

    .line 676
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->reload()V

    .line 678
    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    .line 679
    return-void
.end method

.method private setTouchDown()V
    .locals 2

    .prologue
    .line 686
    sget v0, Lcom/android/camera/ui/FocusView;->MAX_SLIDE_DISTANCE:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mBottomRelative:I

    .line 687
    return-void
.end method

.method private showTipMessage(II)V
    .locals 3
    .param p1, "types"    # I
    .param p2, "tokenResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 999
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1000
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    if-nez v0, :cond_0

    .line 1001
    return-void

    .line 1003
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->isPortraitHintVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1004
    const/16 v1, 0x8

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->setPortraitHintVisible(I)V

    .line 1006
    :cond_1
    const/4 v1, 0x2

    invoke-interface {v0, p1, p2, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 1007
    return-void
.end method

.method private startAnimation()V
    .locals 3

    .prologue
    const/4 v2, 0x7

    .line 863
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mEVAnimationStartTime:J

    .line 864
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 865
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 866
    return-void
.end method

.method private stopEvAdjust()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 720
    iget-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-eqz v1, :cond_0

    .line 721
    iput-boolean v3, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    .line 723
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 724
    const/16 v2, 0xa9

    .line 723
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 725
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
    if-eqz v0, :cond_0

    .line 726
    const/4 v1, 0x2

    invoke-interface {v0, v3, v1}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->onEvChanged(II)V

    .line 729
    .end local v0    # "p":Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
    :cond_0
    return-void
.end method

.method private updateEV()V
    .locals 3

    .prologue
    .line 581
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRational()Landroid/util/Rational;

    move-result-object v0

    .line 583
    .local v0, "step":Landroid/util/Rational;
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    iget v2, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    invoke-interface {v1, v2}, Lcom/android/camera/ui/RollAdapter;->getItemValue(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/util/Rational;->floatValue()F

    move-result v2

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    .line 588
    :goto_0
    return-void

    .line 586
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 500
    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 501
    return-void
.end method

.method public clear(I)V
    .locals 3
    .param p1, "type"    # I

    .prologue
    .line 504
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "clear: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz v0, :cond_0

    .line 506
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 508
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 509
    return-void
.end method

.method public initialize(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V
    .locals 1
    .param p1, "exposureViewListener"    # Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 278
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->reset(I)V

    .line 279
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 274
    return-void
.end method

.method public isEvAdjusted()Z
    .locals 1

    .prologue
    .line 602
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    return v0
.end method

.method public isEvAdjustedTime()Z
    .locals 6

    .prologue
    .line 606
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-eqz v0, :cond_1

    .line 607
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-nez v0, :cond_0

    .line 608
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    const-wide/16 v4, 0x5dc

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 606
    :goto_0
    return v0

    .line 607
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 606
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 988
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 989
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz v0, :cond_0

    .line 990
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 991
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 993
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 994
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 996
    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 571
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-nez v0, :cond_0

    .line 572
    return-void

    .line 575
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz v0, :cond_1

    .line 576
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 578
    :cond_1
    return-void
.end method

.method public onViewTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x6

    const/4 v2, 0x1

    const/4 v6, 0x0

    .line 286
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    xor-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mState:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->isStableStart()Z

    move-result v1

    :goto_0
    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_2

    .line 287
    :cond_0
    return v6

    :cond_1
    move v1, v2

    .line 286
    goto :goto_0

    .line 290
    :cond_2
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 292
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 293
    .local v0, "oldDown":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v3, 0x5

    if-ne v1, v3, :cond_3

    .line 294
    iget-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    if-eqz v1, :cond_3

    .line 295
    iput-boolean v6, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 299
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eq v2, v1, :cond_4

    .line 300
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v3, 0x3

    if-ne v3, v1, :cond_6

    .line 301
    :cond_4
    iget-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mBeingEvAdjusted:Z

    if-eqz v1, :cond_5

    .line 302
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackEvAdjusted()V

    .line 303
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->stopEvAdjust()V

    .line 304
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/FocusView;->mAdjustedDoneTime:J

    .line 306
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v7}, Landroid/os/Handler;->removeMessages(I)V

    .line 307
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v7, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 313
    :cond_5
    iget-boolean v1, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eqz v1, :cond_6

    .line 314
    iput-boolean v6, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    .line 318
    :cond_6
    if-nez v0, :cond_7

    iget-boolean v2, p0, Lcom/android/camera/ui/FocusView;->mIsDown:Z

    :cond_7
    return v2
.end method

.method public reInit()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 340
    sget-object v5, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string/jumbo v6, "onCameraOpen>>"

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->initRect()V

    .line 345
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRange()Landroid/util/Range;

    move-result-object v4

    .line 348
    .local v4, "range1":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 349
    .local v3, "min":I
    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 350
    .local v2, "max":I
    if-eqz v2, :cond_0

    if-ne v2, v3, :cond_1

    .line 351
    :cond_0
    return-void

    .line 354
    :cond_1
    new-instance v6, Lcom/android/camera/ui/FloatSlideAdapter;

    sget v5, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    const/4 v7, 0x0

    cmpl-float v5, v5, v7

    if-nez v5, :cond_2

    const/high16 v5, 0x3f800000    # 1.0f

    :goto_0
    invoke-direct {v6, v3, v2, v5}, Lcom/android/camera/ui/FloatSlideAdapter;-><init>(IIF)V

    iput-object v6, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    .line 355
    sget-object v5, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onCameraOpen: adapter="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object v5, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    if-nez v5, :cond_3

    .line 357
    return-void

    .line 354
    :cond_2
    sub-int v5, v2, v3

    int-to-float v5, v5

    sget v7, Lcom/android/camera/ui/FocusView;->GAP_NUM:F

    div-float/2addr v5, v7

    goto :goto_0

    .line 360
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 362
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v5

    iput v5, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    .line 363
    iget v5, p0, Lcom/android/camera/ui/FocusView;->mCurrentMode:I

    packed-switch v5, :pswitch_data_0

    .line 365
    iget-object v5, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    .line 373
    :goto_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isEvAdjustable()Z

    move-result v5

    invoke-virtual {p0, v5}, Lcom/android/camera/ui/FocusView;->setEvAdjustable(Z)V

    .line 375
    invoke-static {}, Lcom/android/camera/CameraSettings;->readExposure()I

    move-result v0

    .line 376
    .local v0, "evValue":I
    iget-object v5, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/android/camera/ui/RollAdapter;->getItemIndexByValue(Ljava/lang/Object;)I

    move-result v1

    .line 377
    .local v1, "index":I
    if-gez v1, :cond_4

    .line 378
    iget-object v5, p0, Lcom/android/camera/ui/FocusView;->mAdapter:Lcom/android/camera/ui/RollAdapter;

    invoke-interface {v5}, Lcom/android/camera/ui/RollAdapter;->getMaxItem()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    .line 382
    :goto_2
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->updateEV()V

    .line 383
    return-void

    .line 369
    .end local v0    # "evValue":I
    .end local v1    # "index":I
    :pswitch_0
    iget-object v5, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v5, v8}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    goto :goto_1

    .line 380
    .restart local v0    # "evValue":I
    .restart local v1    # "index":I
    :cond_4
    iput v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentItem:I

    goto :goto_2

    .line 363
    nop

    :pswitch_data_0
    .packed-switch 0xa7
        :pswitch_0
    .end packed-switch
.end method

.method public releaseListener()V
    .locals 1

    .prologue
    .line 282
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .line 283
    return-void
.end method

.method public setEvAdjustable(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    const/16 v1, 0x8

    .line 591
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsEvAdjustable:Z

    .line 592
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 593
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->calculateAttribute()V

    .line 594
    iget-object v2, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v2, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvAdjustVisible(I)V

    .line 595
    if-nez p1, :cond_0

    .line 596
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setEvTextVisible(I)V

    .line 598
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 599
    return-void

    :cond_1
    move v0, v1

    .line 594
    goto :goto_0
.end method

.method public setFocusType(Z)V
    .locals 0
    .param p1, "isTouchFocus"    # Z

    .prologue
    .line 412
    iput-boolean p1, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    .line 413
    return-void
.end method

.method public setOrientation(IZ)V
    .locals 1
    .param p1, "orientation"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 402
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    if-eq v0, p1, :cond_0

    .line 403
    iput p1, p0, Lcom/android/camera/ui/FocusView;->mRotation:I

    .line 404
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setOrientation(I)V

    .line 405
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsDraw:Z

    if-eqz v0, :cond_0

    .line 406
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 409
    :cond_0
    return-void
.end method

.method public setPosition(III)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 612
    iput p2, p0, Lcom/android/camera/ui/FocusView;->mCenterX:I

    .line 613
    iput p3, p0, Lcom/android/camera/ui/FocusView;->mCenterY:I

    .line 615
    int-to-float v1, p2

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/FocusView;->setPivotX(F)V

    .line 616
    int-to-float v1, p3

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/FocusView;->setPivotY(F)V

    .line 617
    iget-object v1, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v1, p2, p3}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->setCenter(II)V

    .line 618
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->removeMessages()V

    .line 620
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mEvValue:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    .line 621
    packed-switch p1, :pswitch_data_0

    .line 636
    :cond_0
    :goto_0
    :pswitch_0
    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCurrentDistanceY:I

    if-eqz v1, :cond_1

    const/4 v1, 0x7

    if-eq p1, v1, :cond_1

    .line 637
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->resetEvValue()V

    .line 639
    :cond_1
    return-void

    .line 626
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 627
    const/16 v2, 0xa9

    .line 626
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;

    .line 628
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
    if-eqz v0, :cond_0

    .line 629
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;->resetEvValue()V

    goto :goto_0

    .line 621
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public showFail()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 486
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusFailAnimation()V

    .line 487
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "showFail"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    if-ne v0, v2, :cond_0

    .line 489
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 490
    invoke-direct {p0, v2}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 491
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 492
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mFailTime:J

    .line 493
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x320

    const/4 v1, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 494
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 496
    :cond_0
    return-void
.end method

.method public showStart()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 426
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "showStart"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 428
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 429
    iput v2, p0, Lcom/android/camera/ui/FocusView;->mCursorState:I

    .line 430
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mStartTime:J

    .line 432
    invoke-direct {p0, v2}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 435
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startTouchDownAnimation()V

    .line 437
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->isStableStart()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 438
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 439
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->showSuccess()V

    .line 447
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 448
    return-void

    .line 441
    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mEVCaptureRatio:F

    .line 442
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 443
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/FocusView;->processParameterIfNeeded(F)V

    .line 445
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method public showSuccess()V
    .locals 7

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 456
    sget-object v0, Lcom/android/camera/ui/FocusView;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "showSuccess"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    iget v0, p0, Lcom/android/camera/ui/FocusView;->mState:I

    if-ne v0, v4, :cond_0

    .line 459
    invoke-direct {p0}, Lcom/android/camera/ui/FocusView;->clearMessages()V

    .line 460
    invoke-direct {p0, v4}, Lcom/android/camera/ui/FocusView;->setDraw(Z)V

    .line 461
    iput v5, p0, Lcom/android/camera/ui/FocusView;->mState:I

    .line 462
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/FocusView;->mSuccessTime:J

    .line 463
    iget-boolean v0, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    if-nez v0, :cond_0

    .line 464
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v6, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 468
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    if-nez v0, :cond_1

    .line 469
    return-void

    .line 473
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowAeAfLockIndicator()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 474
    const/16 v0, 0x8

    const v1, 0x7f0f0193

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/FocusView;->showTipMessage(II)V

    .line 475
    iput v6, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    .line 481
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mCameraFocusAnimateDrawable:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    iget-boolean v2, p0, Lcom/android/camera/ui/FocusView;->mIsTouchFocus:Z

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusSuccessAnimation(IZ)V

    .line 482
    return-void

    .line 476
    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isShowCaptureButton()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/FocusView;->mExposureViewListener:Lcom/android/camera/ui/FocusView$ExposureViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/FocusView$ExposureViewListener;->isSupportFocusShoot()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 477
    iput v5, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0

    .line 479
    :cond_3
    iput v4, p0, Lcom/android/camera/ui/FocusView;->mCenterFlag:I

    goto :goto_0
.end method
