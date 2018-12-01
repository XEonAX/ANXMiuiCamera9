.class public Lcom/android/camera/MutexModeManager;
.super Ljava/lang/Object;
.source "MutexModeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/MutexModeManager$MutexCallBack;,
        Lcom/android/camera/MutexModeManager$MutexMode;
    }
.end annotation


# instance fields
.field private mCurrentMutexMode:I

.field private mIsMandatory:Z

.field private mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;


# direct methods
.method public constructor <init>(Lcom/android/camera/MutexModeManager$MutexCallBack;)V
    .locals 1
    .param p1, "mutexCallBack"    # Lcom/android/camera/MutexModeManager$MutexCallBack;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 44
    iput-object p1, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    .line 45
    return-void
.end method

.method private enter(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 198
    if-nez p1, :cond_0

    .line 199
    return-void

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    if-nez v0, :cond_1

    .line 203
    return-void

    .line 206
    :cond_1
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-ne v0, p1, :cond_2

    .line 207
    return-void

    .line 210
    :cond_2
    iput p1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 212
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    invoke-interface {v0, p1}, Lcom/android/camera/MutexModeManager$MutexCallBack;->enterMutexMode(I)V

    .line 213
    return-void
.end method

.method private exit(I)V
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x0

    .line 184
    if-nez p1, :cond_0

    .line 185
    return-void

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    if-nez v0, :cond_1

    .line 189
    return-void

    .line 192
    :cond_1
    iput v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    .line 194
    iget-object v0, p0, Lcom/android/camera/MutexModeManager;->mMutexCallBack:Lcom/android/camera/MutexModeManager$MutexCallBack;

    invoke-interface {v0, p1}, Lcom/android/camera/MutexModeManager$MutexCallBack;->exitMutexMode(I)V

    .line 195
    return-void
.end method

.method private switchMutexMode(II)V
    .locals 0
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 216
    if-eq p1, p2, :cond_0

    .line 217
    invoke-direct {p0, p1}, Lcom/android/camera/MutexModeManager;->exit(I)V

    .line 218
    invoke-direct {p0, p2}, Lcom/android/camera/MutexModeManager;->enter(I)V

    .line 220
    :cond_0
    return-void
.end method


# virtual methods
.method public clearMandatoryFlag()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 54
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    packed-switch v0, :pswitch_data_0

    .line 157
    :pswitch_0
    const-string/jumbo v0, ""

    return-object v0

    .line 150
    :pswitch_1
    const-string/jumbo v0, "AO_HDR"

    return-object v0

    .line 153
    :pswitch_2
    const-string/jumbo v0, "HDR"

    return-object v0

    .line 155
    :pswitch_3
    const-string/jumbo v0, "HHT"

    return-object v0

    .line 148
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getMutexMode()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    return v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 2

    .prologue
    .line 162
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 163
    const-string/jumbo v0, "_RAW"

    return-object v0

    .line 165
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->enableAlgorithmInFileSuffix()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    packed-switch v0, :pswitch_data_0

    .line 175
    :pswitch_0
    const-string/jumbo v0, ""

    return-object v0

    .line 168
    :pswitch_1
    const-string/jumbo v0, "_AO_HDR"

    return-object v0

    .line 171
    :pswitch_2
    const-string/jumbo v0, "_HDR"

    return-object v0

    .line 173
    :pswitch_3
    const-string/jumbo v0, "_HHT"

    return-object v0

    .line 178
    :cond_1
    const-string/jumbo v0, ""

    return-object v0

    .line 166
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public isBurstShoot()Z
    .locals 2

    .prologue
    .line 126
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isHandNight()Z
    .locals 2

    .prologue
    .line 136
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isHdr()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 112
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 113
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-ne v1, v0, :cond_1

    .line 112
    :cond_0
    :goto_0
    return v0

    .line 114
    :cond_1
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMorphoHdr()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 104
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNormal()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 96
    iget v1, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isSceneHdr()Z
    .locals 2

    .prologue
    .line 118
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuperResolution()Z
    .locals 2

    .prologue
    .line 144
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSupportedFlashOn()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 81
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eqz v2, :cond_0

    .line 82
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_1

    .line 81
    :cond_0
    :goto_0
    return v0

    .line 83
    :cond_1
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public isSupportedTorch()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 87
    invoke-static {}, Lcom/android/camera/Device;->isSupportedTorchCapture()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 88
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    if-eqz v2, :cond_0

    .line 89
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v0

    .line 90
    :cond_1
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v3, 0x7

    if-eq v2, v3, :cond_0

    .line 91
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v3, 0x9

    if-eq v2, v3, :cond_0

    .line 92
    iget v2, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/16 v3, 0xa

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v1

    .line 87
    goto :goto_0
.end method

.method public isUbiFocus()Z
    .locals 2

    .prologue
    .line 108
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public resetMutexMode()V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 70
    iput-boolean v1, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 71
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 72
    return-void
.end method

.method public setMutexMode(I)V
    .locals 1
    .param p1, "mode"    # I
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 64
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 65
    return-void
.end method

.method public setMutexModeMandatory(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/MutexModeManager;->mIsMandatory:Z

    .line 49
    iget v0, p0, Lcom/android/camera/MutexModeManager;->mCurrentMutexMode:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/MutexModeManager;->switchMutexMode(II)V

    .line 50
    return-void
.end method
