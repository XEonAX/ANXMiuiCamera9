.class public Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyDualZoom.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0
    .param p1, "dataItemRunning"    # Lcom/android/camera/data/data/runing/DataItemRunning;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 19
    return-void
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 33
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 23
    const v0, 0x7f0f0170

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 28
    const-string/jumbo v0, "pref_camera_zoom_dual_key"

    return-object v0
.end method
