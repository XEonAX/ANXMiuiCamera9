.class public Lcom/android/camera/SensorStateManager;
.super Ljava/lang/Object;
.source "SensorStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/SensorStateManager$1;,
        Lcom/android/camera/SensorStateManager$2;,
        Lcom/android/camera/SensorStateManager$3;,
        Lcom/android/camera/SensorStateManager$MainHandler;,
        Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;,
        Lcom/android/camera/SensorStateManager$SensorStateListener;
    }
.end annotation


# static fields
.field private static final CAPTURE_POSTURE_DEGREE:I

.field private static final GYROSCOPE_MOVING_THRESHOLD:D

.field private static final GYROSCOPE_STABLE_THRESHOLD:D


# instance fields
.field private final mAccelerometerSensor:Landroid/hardware/Sensor;

.field private mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

.field private mAccelerometerTimeStamp:J

.field private mAngleSpeed:[D

.field private mAngleSpeedIndex:I

.field private mAngleTotal:D

.field private mCapturePosture:I

.field private mEdgeTouchEnabled:Z

.field private mFocusSensorEnabled:Z

.field private mGradienterEnabled:Z

.field private final mGyroscope:Landroid/hardware/Sensor;

.field private mGyroscopeListener:Landroid/hardware/SensorEventListener;

.field private mGyroscopeTimeStamp:J

.field private mHandler:Landroid/os/Handler;

.field private mIsLying:Z

.field private mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

.field private final mLinearAccelerometer:Landroid/hardware/Sensor;

.field private mOrientation:F

.field private final mOrientationSensor:Landroid/hardware/Sensor;

.field private mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

.field private mRate:I

.field private mRotationFlagEnabled:Z

.field private mSensorListenerThread:Landroid/os/HandlerThread;

.field private final mSensorManager:Landroid/hardware/SensorManager;

.field private mSensorRegister:I

.field private mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field private mThreadHandler:Landroid/os/Handler;


# direct methods
.method static synthetic -get0()I
    .locals 1

    sget v0, Lcom/android/camera/SensorStateManager;->CAPTURE_POSTURE_DEGREE:I

    return v0
.end method

.method static synthetic -get1()D
    .locals 2

    sget-wide v0, Lcom/android/camera/SensorStateManager;->GYROSCOPE_MOVING_THRESHOLD:D

    return-wide v0
.end method

.method static synthetic -get2(Lcom/android/camera/SensorStateManager;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    return-wide v0
.end method

.method static synthetic -get3(Lcom/android/camera/SensorStateManager;)[D
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/SensorStateManager;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/SensorStateManager;)D
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-wide v0
.end method

.method static synthetic -get6(Lcom/android/camera/SensorStateManager;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    return-wide v0
.end method

.method static synthetic -get7(Lcom/android/camera/SensorStateManager;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return v0
.end method

.method static synthetic -get8(Lcom/android/camera/SensorStateManager;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    return v0
.end method

.method static synthetic -get9(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/SensorStateManager;J)J
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # J

    .prologue
    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    return-wide p1
.end method

.method static synthetic -set1(Lcom/android/camera/SensorStateManager;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/SensorStateManager;D)D
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # D

    .prologue
    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    return-wide p1
.end method

.method static synthetic -set3(Lcom/android/camera/SensorStateManager;J)J
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # J

    .prologue
    iput-wide p1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    return-wide p1
.end method

.method static synthetic -set4(Lcom/android/camera/SensorStateManager;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return p1
.end method

.method static synthetic -set5(Lcom/android/camera/SensorStateManager;F)F
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "-value"    # F

    .prologue
    iput p1, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/SensorStateManager;F)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "degree"    # F

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->normalizeDegree(F)F

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/SensorStateManager;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "posture"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/SensorStateManager;->changeCapturePosture(I)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/SensorStateManager;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->deviceBecomeStable()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/SensorStateManager;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/SensorStateManager;->deviceBeginMoving()V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/SensorStateManager;D)V
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "a"    # D

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/SensorStateManager;->deviceKeepMoving(D)V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera/SensorStateManager;IZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/SensorStateManager;
    .param p1, "sensor"    # I
    .param p2, "enable"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/high16 v2, 0x41200000    # 10.0f

    .line 31
    const-string/jumbo v0, "camera_stable_threshold"

    const/16 v1, 0x9

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v2

    float-to-double v0, v0

    sput-wide v0, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    .line 32
    const-string/jumbo v0, "camera_moving_threshold"

    const/16 v1, 0xf

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v2

    float-to-double v0, v0

    sput-wide v0, Lcom/android/camera/SensorStateManager;->GYROSCOPE_MOVING_THRESHOLD:D

    .line 47
    const-string/jumbo v0, "capture_degree"

    const/16 v1, 0x2d

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/camera/SensorStateManager;->CAPTURE_POSTURE_DEGREE:I

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mOrientation:F

    .line 53
    iput-boolean v4, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    .line 54
    iput v4, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    .line 64
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    .line 65
    const/4 v0, 0x5

    new-array v0, v0, [D

    .line 66
    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    aput-wide v2, v0, v4

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    aput-wide v2, v0, v5

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    const/4 v1, 0x2

    aput-wide v2, v0, v1

    .line 67
    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    aput-wide v2, v0, v6

    sget-wide v2, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    aput-wide v2, v0, v7

    .line 65
    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    .line 70
    iput-wide v8, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerTimeStamp:J

    .line 71
    iput-wide v8, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeTimeStamp:J

    .line 306
    new-instance v0, Lcom/android/camera/SensorStateManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/SensorStateManager$1;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    .line 347
    new-instance v0, Lcom/android/camera/SensorStateManager$2;

    invoke-direct {v0, p0}, Lcom/android/camera/SensorStateManager$2;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    .line 424
    new-instance v0, Lcom/android/camera/SensorStateManager$3;

    invoke-direct {v0, p0}, Lcom/android/camera/SensorStateManager$3;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    .line 97
    const-string/jumbo v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 98
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerometer:Landroid/hardware/Sensor;

    .line 99
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v7}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mGyroscope:Landroid/hardware/Sensor;

    .line 100
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v6}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    .line 101
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensor:Landroid/hardware/Sensor;

    .line 102
    new-instance v0, Lcom/android/camera/SensorStateManager$MainHandler;

    invoke-direct {v0, p0, p2}, Lcom/android/camera/SensorStateManager$MainHandler;-><init>(Lcom/android/camera/SensorStateManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    .line 104
    const/16 v0, 0x7530

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    .line 105
    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->canDetectOrientation()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    new-instance v0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;-><init>(Lcom/android/camera/SensorStateManager;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    .line 109
    :cond_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "SensorListenerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    .line 110
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 111
    return-void
.end method

.method private changeCapturePosture(I)V
    .locals 1
    .param p1, "posture"    # I

    .prologue
    .line 559
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    if-eq v0, p1, :cond_0

    .line 560
    iput p1, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    .line 561
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    if-eqz v0, :cond_0

    .line 562
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->notifyDevicePostureChanged()V

    .line 565
    :cond_0
    return-void
.end method

.method private deviceBecomeStable()V
    .locals 1

    .prologue
    .line 524
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    .line 525
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceBecomeStable()V

    .line 527
    :cond_0
    return-void
.end method

.method private deviceBeginMoving()V
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceBeginMoving()V

    .line 520
    return-void
.end method

.method private deviceKeepMoving(D)V
    .locals 1
    .param p1, "a"    # D

    .prologue
    .line 535
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    .line 536
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceKeepMoving(D)V

    .line 538
    :cond_0
    return-void
.end method

.method private filterUnregisterSensor(I)I
    .locals 1
    .param p1, "sensor"    # I

    .prologue
    .line 155
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-eqz v0, :cond_0

    .line 156
    and-int/lit8 v0, p1, -0x3

    and-int/lit8 p1, v0, -0x5

    .line 158
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-eqz v0, :cond_1

    .line 159
    and-int/lit8 p1, p1, -0x5

    .line 161
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_2

    .line 162
    and-int/lit8 v0, p1, -0x2

    and-int/lit8 p1, v0, -0x3

    .line 164
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eqz v0, :cond_3

    .line 165
    and-int/lit8 v0, p1, -0x9

    and-int/lit8 p1, v0, -0x5

    .line 167
    :cond_3
    return p1
.end method

.method private isContains(II)Z
    .locals 1
    .param p1, "total"    # I
    .param p2, "special"    # I

    .prologue
    .line 276
    and-int v0, p1, p2

    if-ne v0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isPartialContains(II)Z
    .locals 2
    .param p1, "total"    # I
    .param p2, "special"    # I

    .prologue
    const/4 v0, 0x0

    .line 280
    and-int v1, p1, p2

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private normalizeDegree(F)F
    .locals 2
    .param p1, "degree"    # F

    .prologue
    const/high16 v1, 0x43b40000    # 360.0f

    .line 493
    :goto_0
    cmpl-float v0, p1, v1

    if-ltz v0, :cond_0

    .line 494
    sub-float/2addr p1, v1

    goto :goto_0

    .line 496
    :cond_0
    :goto_1
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 497
    add-float/2addr p1, v1

    goto :goto_1

    .line 499
    :cond_1
    return p1
.end method

.method private update(IZ)V
    .locals 1
    .param p1, "sensor"    # I
    .param p2, "enable"    # Z

    .prologue
    .line 187
    if-nez p2, :cond_1

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/SensorStateManager;->isPartialContains(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 188
    invoke-virtual {p0, p1}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    if-eqz p2, :cond_0

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p0, p1}, Lcom/android/camera/SensorStateManager;->register(I)V

    goto :goto_0
.end method


# virtual methods
.method public canDetectOrientation()Z
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCapturePosture()I
    .locals 1

    .prologue
    .line 515
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mCapturePosture:I

    return v0
.end method

.method public isDeviceLying()Z
    .locals 1

    .prologue
    .line 510
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    return v0
.end method

.method public isStable()Z
    .locals 14

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 289
    iget v10, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    if-ltz v10, :cond_2

    .line 290
    const-wide/16 v6, 0x0

    .line 291
    .local v6, "total":D
    iget-object v11, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v12, v11

    move v10, v9

    :goto_0
    if-ge v10, v12, :cond_0

    aget-wide v4, v11, v10

    .line 292
    .local v4, "speed":D
    add-double/2addr v6, v4

    .line 291
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 294
    .end local v4    # "speed":D
    :cond_0
    iget-object v10, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v10, v10

    int-to-double v10, v10

    div-double v0, v6, v10

    .line 295
    .local v0, "avgSpeed":D
    iget-object v10, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    iget v11, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    iget-object v12, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeed:[D

    array-length v12, v12

    add-int/lit8 v12, v12, -0x1

    invoke-static {v11, v9, v12}, Lcom/android/camera/Util;->clamp(III)I

    move-result v11

    aget-wide v2, v10, v11

    .line 296
    .local v2, "lastSpeed":D
    const-string/jumbo v10, "SensorStateManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "isStable mAngleSpeed="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " lastSpeed="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 297
    const-string/jumbo v12, " threshold="

    .line 296
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 297
    sget-wide v12, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    .line 296
    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    sget-wide v10, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    cmpg-double v10, v0, v10

    if-gtz v10, :cond_1

    sget-wide v10, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    cmpg-double v10, v2, v10

    if-gtz v10, :cond_1

    :goto_1
    return v8

    :cond_1
    move v8, v9

    goto :goto_1

    .line 300
    .end local v0    # "avgSpeed":D
    .end local v2    # "lastSpeed":D
    .end local v6    # "total":D
    :cond_2
    const-string/jumbo v9, "SensorStateManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "isStable return true for mAngleSpeedIndex="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lcom/android/camera/SensorStateManager;->mAngleSpeedIndex:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 301
    const-string/jumbo v11, " threshold="

    .line 300
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 301
    sget-wide v12, Lcom/android/camera/SensorStateManager;->GYROSCOPE_STABLE_THRESHOLD:D

    .line 300
    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    return v8
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 569
    return-void
.end method

.method public register()V
    .locals 2

    .prologue
    .line 195
    const/4 v0, 0x0

    .line 196
    .local v0, "sensor":I
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v1, :cond_0

    .line 197
    const/4 v1, 0x1

    or-int/lit8 v0, v1, 0x2

    .line 199
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-eqz v1, :cond_1

    .line 200
    or-int/lit8 v1, v0, 0x2

    or-int/lit8 v0, v1, 0x4

    .line 202
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eqz v1, :cond_2

    .line 203
    or-int/lit8 v1, v0, 0x8

    or-int/lit8 v0, v1, 0x4

    .line 205
    :cond_2
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mRotationFlagEnabled:Z

    if-eqz v1, :cond_3

    .line 206
    or-int/lit8 v0, v0, 0x4

    .line 208
    :cond_3
    invoke-virtual {p0, v0}, Lcom/android/camera/SensorStateManager;->register(I)V

    .line 209
    return-void
.end method

.method public register(I)V
    .locals 7
    .param p1, "sensor"    # I

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x4

    const/4 v4, 0x1

    const/4 v3, 0x2

    .line 212
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-nez v0, :cond_5

    .line 213
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 214
    const/16 v0, 0xc

    invoke-direct {p0, p1, v0}, Lcom/android/camera/SensorStateManager;->isPartialContains(II)Z

    move-result v0

    .line 213
    if-eqz v0, :cond_0

    .line 215
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mSensorListenerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    .line 218
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_1

    .line 219
    or-int/lit8 v0, p1, 0x1

    or-int/lit8 p1, v0, 0x2

    .line 220
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 222
    :cond_1
    invoke-direct {p0, p1, v3}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v3}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 223
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mGyroscope:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 224
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 226
    :cond_2
    invoke-direct {p0, p1, v4}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v4}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    .line 227
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerometer:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 228
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 230
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->canDetectOrientation()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, p1, v5}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v5}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    .line 231
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensor:Landroid/hardware/Sensor;

    iget v3, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v4, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 232
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 234
    :cond_4
    invoke-direct {p0, p1, v6}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v6}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_5

    .line 235
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensor:Landroid/hardware/Sensor;

    iget v3, p0, Lcom/android/camera/SensorStateManager;->mRate:I

    iget-object v4, p0, Lcom/android/camera/SensorStateManager;->mThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 236
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 239
    :cond_5
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 285
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/SensorStateManager;->mAngleTotal:D

    .line 286
    return-void
.end method

.method public setFocusSensorEnabled(Z)V
    .locals 6
    .param p1, "enable"    # Z

    .prologue
    const/4 v4, 0x2

    .line 118
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eq v1, p1, :cond_1

    .line 119
    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    .line 120
    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 121
    const/4 v0, 0x3

    .line 122
    .local v0, "sensor":I
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-nez v1, :cond_0

    .line 123
    invoke-direct {p0, v0}, Lcom/android/camera/SensorStateManager;->filterUnregisterSensor(I)I

    move-result v0

    .line 125
    :cond_0
    iget-object v2, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    .line 126
    iget-object v3, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    .line 127
    const-wide/16 v4, 0x3e8

    .line 125
    invoke-virtual {v2, v1, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 129
    .end local v0    # "sensor":I
    :cond_1
    return-void

    .line 126
    .restart local v0    # "sensor":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setGradienterEnabled(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 132
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-eq v1, p1, :cond_1

    .line 133
    iput-boolean p1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    .line 134
    const/16 v0, 0xc

    .line 135
    .local v0, "sensor":I
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    if-nez v1, :cond_0

    .line 136
    invoke-direct {p0, v0}, Lcom/android/camera/SensorStateManager;->filterUnregisterSensor(I)I

    move-result v0

    .line 138
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/SensorStateManager;->mGradienterEnabled:Z

    invoke-direct {p0, v0, v1}, Lcom/android/camera/SensorStateManager;->update(IZ)V

    .line 140
    .end local v0    # "sensor":I
    :cond_1
    return-void
.end method

.method public setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V
    .locals 0
    .param p1, "l"    # Lcom/android/camera/SensorStateManager$SensorStateListener;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/camera/SensorStateManager;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    .line 115
    return-void
.end method

.method public unregister(I)V
    .locals 6
    .param p1, "sensor"    # I

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x4

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x2

    .line 242
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    if-eqz v0, :cond_6

    .line 243
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xf

    if-ne p1, v0, :cond_2

    .line 245
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mFocusSensorEnabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 246
    or-int/lit8 p1, p1, 0x1

    .line 247
    iget-boolean v0, p0, Lcom/android/camera/SensorStateManager;->mEdgeTouchEnabled:Z

    if-nez v0, :cond_1

    .line 248
    or-int/lit8 p1, p1, 0x2

    .line 251
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 252
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 254
    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 255
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mGyroscopeListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 256
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 258
    :cond_3
    invoke-direct {p0, p1, v3}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v3}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 259
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mLinearAccelerationListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 260
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 262
    :cond_4
    invoke-direct {p0, p1, v4}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v4}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 263
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mOrientationSensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 264
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 265
    iput-boolean v2, p0, Lcom/android/camera/SensorStateManager;->mIsLying:Z

    .line 266
    invoke-direct {p0, v2}, Lcom/android/camera/SensorStateManager;->changeCapturePosture(I)V

    .line 268
    :cond_5
    invoke-direct {p0, p1, v5}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    invoke-direct {p0, v0, v5}, Lcom/android/camera/SensorStateManager;->isContains(II)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 269
    iget-object v0, p0, Lcom/android/camera/SensorStateManager;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager;->mAccelerometerSensorEventListenerImpl:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 270
    iget v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/android/camera/SensorStateManager;->mSensorRegister:I

    .line 273
    :cond_6
    return-void
.end method
