.class Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;
.super Ljava/lang/Object;
.source "FragmentCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;->requestPermissions(Landroid/app/Fragment;[Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;

.field final synthetic val$fragment:Landroid/app/Fragment;

.field final synthetic val$permissions:[Ljava/lang/String;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;[Ljava/lang/String;Landroid/app/Fragment;I)V
    .registers 5

    .prologue
    .line 49
    iput-object p1, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->this$0:Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;

    iput-object p2, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    iput-object p3, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    iput p4, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 52
    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    array-length v6, v6

    new-array v1, v6, [I

    .line 54
    .local v1, "grantResults":[I
    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    invoke-virtual {v6}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 55
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_1d

    .line 65
    const/4 v6, -0x1

    invoke-static {v1, v6}, Ljava/util/Arrays;->fill([II)V

    .line 68
    :cond_11
    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    check-cast v6, Landroid/support/v13/app/FragmentCompat$OnRequestPermissionsResultCallback;

    iget v7, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$requestCode:I

    iget-object v8, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    invoke-interface {v6, v7, v8, v1}, Landroid/support/v13/app/FragmentCompat$OnRequestPermissionsResultCallback;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 70
    return-void

    .line 56
    :cond_1d
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 57
    .local v3, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 59
    .local v4, "packageName":Ljava/lang/String;
    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    array-length v5, v6

    .line 60
    .local v5, "permissionCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_29
    if-ge v2, v5, :cond_11

    .line 61
    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    aget-object v6, v6, v2

    invoke-virtual {v3, v6, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    aput v6, v1, v2

    .line 60
    add-int/lit8 v2, v2, 0x1

    goto :goto_29
.end method
