.class public Lcom/android/camera/CameraPreferenceActivity;
.super Lcom/android/camera/BasePreferenceActivity;
.source "CameraPreferenceActivity.java"


# instance fields
.field private mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;


# direct methods
.method static synthetic -get0(Lcom/android/camera/CameraPreferenceActivity;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/CameraPreferenceActivity;

    .prologue
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/CameraPreferenceActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/CameraPreferenceActivity;
    .param p1, "-value"    # Landroid/app/AlertDialog;

    .prologue
    iput-object p1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/android/camera/BasePreferenceActivity;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    .line 16
    return-void
.end method

.method private bringUpDoubleConfirmDlg(Lcom/android/camera/ui/PreviewListPreference;Ljava/lang/String;)V
    .locals 3
    .param p1, "preference"    # Lcom/android/camera/ui/PreviewListPreference;
    .param p2, "snapItem"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 83
    return-void

    .line 86
    :cond_0
    new-instance v0, Lcom/android/camera/CameraPreferenceActivity$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/android/camera/CameraPreferenceActivity$1;-><init>(Lcom/android/camera/CameraPreferenceActivity;Ljava/lang/String;Lcom/android/camera/ui/PreviewListPreference;)V

    .line 102
    .local v0, "listener":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 103
    const v2, 0x7f0f0187

    .line 102
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 104
    const v2, 0x7f0f0188

    .line 102
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 105
    const v2, 0x7f0f0189

    .line 102
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 106
    const v2, 0x7f0f018a

    .line 102
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 107
    const/4 v2, 0x0

    .line 102
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    .line 108
    iget-object v1, p0, Lcom/android/camera/CameraPreferenceActivity;->mDoubleConfirmActionChooseDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 109
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Lcom/android/camera/Device;->isFrontCameraAtBottom()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    return-void

    .line 72
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->setRequestedOrientation(I)V

    .line 77
    :goto_0
    return-void

    .line 75
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method protected getPreferenceXml()I
    .locals 1

    .prologue
    .line 21
    const/high16 v0, 0x7f070000

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, ":miui:starting_window_label"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const v1, 0x7f0f0039

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(I)V

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->changeRequestOrientation()V

    .line 66
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 31
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_snap_key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p2, :cond_3

    .line 33
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 34
    const-string/jumbo v1, "volumekey_wake_screen"

    .line 33
    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v4, :cond_0

    .line 35
    const v0, 0x7f0f0162

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 37
    return v3

    .line 39
    :cond_0
    const v0, 0x7f0f015f

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 40
    const v0, 0x7f0f0160

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 41
    :cond_1
    const-string/jumbo v0, "public_transportation_shortcuts"

    .line 42
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 43
    const-string/jumbo v2, "key_long_press_volume_down"

    .line 42
    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 44
    check-cast p1, Lcom/android/camera/ui/PreviewListPreference;

    .end local p1    # "preference":Landroid/preference/Preference;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lcom/android/camera/CameraPreferenceActivity;->bringUpDoubleConfirmDlg(Lcom/android/camera/ui/PreviewListPreference;Ljava/lang/String;)V

    .line 45
    return v3

    .line 48
    .restart local p1    # "preference":Landroid/preference/Preference;
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 49
    const-string/jumbo v2, "key_long_press_volume_down"

    move-object v0, p2

    .line 50
    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 51
    const-string/jumbo v0, "pref_camera_snap_key"

    invoke-static {v0, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    return v4

    .line 54
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected onSettingChanged(I)V
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 26
    sget-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/ChangeManager;->request(I)V

    .line 27
    return-void
.end method
