.class public Lcom/android/camera/ui/ScreenHint;
.super Ljava/lang/Object;
.source "ScreenHint.java"


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private mStorageHint:Lcom/android/camera/OnScreenHint;

.field private mStorageSpace:J

.field private mSystemChoiceDialog:Landroid/app/AlertDialog;


# direct methods
.method static synthetic -wrap0(Lcom/android/camera/ui/ScreenHint;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/ScreenHint;
    .param p1, "recorded"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ScreenHint;->recordLocation(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    .line 27
    return-void
.end method

.method private recordLocation(Z)V
    .locals 2
    .param p1, "recorded"    # Z

    .prologue
    .line 71
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 72
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_camera_recordlocation_key"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 73
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 74
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 75
    return-void
.end method


# virtual methods
.method public cancelHint()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    invoke-virtual {v0}, Lcom/android/camera/OnScreenHint;->cancel()V

    .line 66
    iput-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    .line 68
    :cond_0
    return-void
.end method

.method public dismissSystemChoiceDialog()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 159
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 161
    iput-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    .line 163
    :cond_0
    return-void
.end method

.method public isScreenHintVisible()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 60
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    invoke-virtual {v1}, Lcom/android/camera/OnScreenHint;->getHintViewVisibility()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public recordFirstUse(Z)V
    .locals 3
    .param p1, "state"    # Z

    .prologue
    .line 151
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 152
    .local v1, "globalPref":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 153
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v2, "pref_camera_first_use_hint_shown_key"

    invoke-interface {v0, v2, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 154
    const-string/jumbo v2, "pref_camera_confirm_location_shown_key"

    invoke-interface {v0, v2, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 155
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 156
    return-void
.end method

.method public showFirstUseHint()V
    .locals 11

    .prologue
    .line 85
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    return-void

    .line 89
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v9

    .line 91
    .local v9, "globalPref":Lcom/android/camera/data/data/global/DataItemGlobal;
    const-string/jumbo v0, "pref_camera_first_use_hint_shown_key"

    const/4 v1, 0x1

    invoke-virtual {v9, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 92
    .local v8, "firstLocation":Z
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLocationPermissions()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    .end local v8    # "firstLocation":Z
    :goto_0
    if-nez v8, :cond_2

    .line 103
    return-void

    .line 98
    .restart local v8    # "firstLocation":Z
    :cond_1
    const/4 v8, 0x0

    .local v8, "firstLocation":Z
    goto :goto_0

    .line 106
    .end local v8    # "firstLocation":Z
    :cond_2
    const-string/jumbo v0, "pref_camera_recordlocation_key"

    invoke-virtual {v9, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->contains(Ljava/lang/String;)Z

    move-result v7

    .line 107
    .local v7, "containsRecordLocation":Z
    invoke-static {}, Lcom/android/camera/Device;->isSupportedGPS()Z

    move-result v0

    if-eqz v0, :cond_3

    xor-int/lit8 v0, v7, 0x1

    if-eqz v0, :cond_3

    if-eqz v8, :cond_3

    .line 108
    new-instance v5, Lcom/android/camera/ui/ScreenHint$1;

    invoke-direct {v5, p0}, Lcom/android/camera/ui/ScreenHint$1;-><init>(Lcom/android/camera/ui/ScreenHint;)V

    .line 117
    .local v5, "save":Ljava/lang/Runnable;
    new-instance v6, Lcom/android/camera/ui/ScreenHint$2;

    invoke-direct {v6, p0}, Lcom/android/camera/ui/ScreenHint$2;-><init>(Lcom/android/camera/ui/ScreenHint;)V

    .line 127
    .local v6, "no_save":Ljava/lang/Runnable;
    iget-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    .line 128
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f0010

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 129
    iget-object v2, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v3, 0x7f0f0011

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 130
    iget-object v3, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v4, 0x7f0f0012

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 131
    iget-object v4, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v10, 0x7f0f0013

    invoke-virtual {v4, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 126
    invoke-static/range {v0 .. v6}, Lcom/android/camera/RotateDialogController;->showSystemChoiceDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/ScreenHint;->mSystemChoiceDialog:Landroid/app/AlertDialog;

    .line 133
    .end local v5    # "save":Ljava/lang/Runnable;
    .end local v6    # "no_save":Ljava/lang/Runnable;
    :cond_3
    return-void
.end method

.method public updateHint()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 30
    invoke-static {}, Lcom/android/camera/storage/Storage;->switchStoragePathIfNeeded()V

    .line 31
    invoke-static {}, Lcom/android/camera/storage/Storage;->getAvailableSpace()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/ui/ScreenHint;->mStorageSpace:J

    .line 32
    const/4 v0, 0x0

    .line 33
    .local v0, "message":Ljava/lang/String;
    iget-wide v2, p0, Lcom/android/camera/ui/ScreenHint;->mStorageSpace:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    .line 34
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f000a

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 46
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v0, :cond_7

    .line 47
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    if-nez v1, :cond_6

    .line 48
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/android/camera/OnScreenHint;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;)Lcom/android/camera/OnScreenHint;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    .line 52
    :goto_1
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    invoke-virtual {v1}, Lcom/android/camera/OnScreenHint;->show()V

    .line 57
    :cond_1
    :goto_2
    return-void

    .line 35
    .restart local v0    # "message":Ljava/lang/String;
    :cond_2
    iget-wide v2, p0, Lcom/android/camera/ui/ScreenHint;->mStorageSpace:J

    const-wide/16 v4, -0x2

    cmp-long v1, v2, v4

    if-nez v1, :cond_3

    .line 36
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f000c

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "message":Ljava/lang/String;
    goto :goto_0

    .line 37
    .local v0, "message":Ljava/lang/String;
    :cond_3
    iget-wide v2, p0, Lcom/android/camera/ui/ScreenHint;->mStorageSpace:J

    const-wide/16 v4, -0x3

    cmp-long v1, v2, v4

    if-nez v1, :cond_4

    .line 38
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f000d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "message":Ljava/lang/String;
    goto :goto_0

    .line 39
    .local v0, "message":Ljava/lang/String;
    :cond_4
    iget-wide v2, p0, Lcom/android/camera/ui/ScreenHint;->mStorageSpace:J

    const-wide/32 v4, 0x3200000

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 40
    invoke-static {}, Lcom/android/camera/storage/Storage;->isPhoneStoragePriority()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 41
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f00b7

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "message":Ljava/lang/String;
    goto :goto_0

    .line 43
    .local v0, "message":Ljava/lang/String;
    :cond_5
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0f00b8

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .local v0, "message":Ljava/lang/String;
    goto :goto_0

    .line 50
    .end local v0    # "message":Ljava/lang/String;
    :cond_6
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    invoke-virtual {v1, v0}, Lcom/android/camera/OnScreenHint;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 53
    :cond_7
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    if-eqz v1, :cond_1

    .line 54
    iget-object v1, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    invoke-virtual {v1}, Lcom/android/camera/OnScreenHint;->cancel()V

    .line 55
    iput-object v6, p0, Lcom/android/camera/ui/ScreenHint;->mStorageHint:Lcom/android/camera/OnScreenHint;

    goto :goto_2
.end method
