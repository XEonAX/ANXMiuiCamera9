.class public Lcom/android/camera/fragment/FragmentUtils;
.super Ljava/lang/Object;
.source "FragmentUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 2
    .param p0, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p1, "id"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "tag"    # Ljava/lang/String;

    .prologue
    .line 24
    if-nez p0, :cond_0

    .line 25
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 28
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {v1, p1, p2, p3}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 30
    :try_start_0
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :goto_0
    return-void

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0
.end method

.method public static removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z
    .locals 4
    .param p0, "manager"    # Landroid/support/v4/app/FragmentManager;
    .param p1, "TAG"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 68
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 69
    :cond_0
    return v3

    .line 71
    :cond_1
    invoke-virtual {p0, p1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 72
    .local v1, "fragment":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_2

    .line 73
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    .line 74
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 76
    :try_start_0
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :goto_0
    const/4 v3, 0x1

    return v3

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .line 83
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .end local v2    # "fragmentManager":Landroid/support/v4/app/FragmentTransaction;
    :cond_2
    return v3
.end method
