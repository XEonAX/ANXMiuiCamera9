.class Lcom/android/camera/CameraPreferenceActivity$1;
.super Ljava/lang/Object;
.source "CameraPreferenceActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/CameraPreferenceActivity;->bringUpDoubleConfirmDlg(Lcom/android/camera/ui/PreviewListPreference;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/CameraPreferenceActivity;

.field final synthetic val$preference:Lcom/android/camera/ui/PreviewListPreference;

.field final synthetic val$snapItem:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/camera/CameraPreferenceActivity;Ljava/lang/String;Lcom/android/camera/ui/PreviewListPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/CameraPreferenceActivity;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/CameraPreferenceActivity$1;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    iput-object p2, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$snapItem:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$preference:Lcom/android/camera/ui/PreviewListPreference;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x0

    .line 88
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$1;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-static {v0, v1}, Lcom/android/camera/CameraPreferenceActivity;->-set0(Lcom/android/camera/CameraPreferenceActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 90
    const-string/jumbo v0, "pref_camera_snap_key"

    iget-object v1, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$snapItem:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$preference:Lcom/android/camera/ui/PreviewListPreference;

    iget-object v1, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$snapItem:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PreviewListPreference;->setValue(Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$1;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0}, Lcom/android/camera/CameraPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 93
    const-string/jumbo v1, "key_long_press_volume_down"

    .line 94
    iget-object v2, p0, Lcom/android/camera/CameraPreferenceActivity$1;->val$snapItem:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    const/4 v0, -0x2

    if-ne p2, v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$1;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-static {v0}, Lcom/android/camera/CameraPreferenceActivity;->-get0(Lcom/android/camera/CameraPreferenceActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 97
    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$1;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-static {v0, v1}, Lcom/android/camera/CameraPreferenceActivity;->-set0(Lcom/android/camera/CameraPreferenceActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    goto :goto_0
.end method
