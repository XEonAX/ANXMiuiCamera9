.class Lcom/android/camera/BasePreferenceActivity$4;
.super Landroid/os/AsyncTask;
.source "BasePreferenceActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/BasePreferenceActivity;->installQRCodeReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/BasePreferenceActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/BasePreferenceActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/BasePreferenceActivity;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    .line 445
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 446
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity$4;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 448
    invoke-static {}, Lcom/android/camera/BasePreferenceActivity;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "install..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    iget-object v0, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    .line 450
    const-string/jumbo v1, "com.xiaomi.scanner"

    .line 451
    iget-object v2, p0, Lcom/android/camera/BasePreferenceActivity$4;->this$0:Lcom/android/camera/BasePreferenceActivity;

    invoke-static {v2}, Lcom/android/camera/BasePreferenceActivity;->-get1(Lcom/android/camera/BasePreferenceActivity;)Lcom/android/camera/Util$PackageInstallerListener;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 449
    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/camera/Util;->installPackage(Landroid/content/Context;Ljava/lang/String;Lcom/android/camera/Util$PackageInstallerListener;ZZ)V

    .line 452
    const/4 v0, 0x0

    return-object v0
.end method
