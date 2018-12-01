.class public Lcom/android/camera/CameraAppImpl;
.super Lmiui/external/Application;
.source "CameraAppImpl.java"


# static fields
.field private static sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;


# instance fields
.field private sLaunched:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lmiui/external/Application;-><init>()V

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    .line 26
    return-void
.end method

.method public static getAndroidContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Lcom/android/camera/CameraApplicationDelegate;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addActivity(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 64
    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->addActivity(Landroid/app/Activity;)V

    .line 65
    return-void
.end method

.method public closeAllActivitiesBut(Landroid/app/Activity;)V
    .locals 1
    .param p1, "current"    # Landroid/app/Activity;

    .prologue
    .line 72
    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->closeAllActivitiesBut(Landroid/app/Activity;)V

    .line 73
    return-void
.end method

.method public isApplicationFirstLaunched()Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    if-eqz v0, :cond_0

    .line 81
    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    .line 82
    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 84
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    return v0
.end method

.method public onCreateApplicationDelegate()Lcom/android/camera/CameraApplicationDelegate;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Lcom/android/camera/CameraApplicationDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/CameraApplicationDelegate;-><init>(Lcom/android/camera/CameraAppImpl;)V

    sput-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    .line 35
    :cond_0
    invoke-static {}, Lcom/android/camera/CrashHandler;->getInstance()Lcom/android/camera/CrashHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/CrashHandler;->init(Lmiui/external/Application;)V

    .line 38
    invoke-static {p0}, Lcom/miui/filtersdk/BeautificationSDK;->init(Landroid/content/Context;)V

    .line 40
    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    return-object v0
.end method

.method public bridge synthetic onCreateApplicationDelegate()Lmiui/external/ApplicationDelegate;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/android/camera/CameraAppImpl;->onCreateApplicationDelegate()Lcom/android/camera/CameraApplicationDelegate;

    move-result-object v0

    return-object v0
.end method

.method public removeActivity(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 68
    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->removeActivity(Landroid/app/Activity;)V

    .line 69
    return-void
.end method
