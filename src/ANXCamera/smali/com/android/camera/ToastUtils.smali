.class public Lcom/android/camera/ToastUtils;
.super Ljava/lang/Object;
.source "ToastUtils.java"


# static fields
.field private static oldMsg:Ljava/lang/String;

.field private static oneTime:J

.field protected static toast:Landroid/widget/Toast;

.field private static twoTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    .line 14
    sput-wide v2, Lcom/android/camera/ToastUtils;->oneTime:J

    .line 15
    sput-wide v2, Lcom/android/camera/ToastUtils;->twoTime:J

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showToast(Landroid/content/Context;I)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resID"    # I

    .prologue
    .line 22
    const/4 v0, 0x0

    .line 23
    .local v0, "res":Landroid/content/res/Resources;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .local v0, "res":Landroid/content/res/Resources;
    if-eqz v0, :cond_0

    .line 24
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/ToastUtils;->showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    .line 26
    .end local v0    # "res":Landroid/content/res/Resources;
    :cond_0
    return-void
.end method

.method public static showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V
    .locals 8
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "activity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    if-nez v3, :cond_1

    .line 30
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 31
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 33
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, p1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    sput-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    .line 34
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    const/16 v4, 0x11

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Landroid/widget/Toast;->setGravity(III)V

    .line 35
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/android/camera/ToastUtils;->oneTime:J
    :try_end_0
    .catch Landroid/view/InflateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v0    # "context":Landroid/content/Context;
    :cond_0
    :goto_0
    sget-wide v4, Lcom/android/camera/ToastUtils;->twoTime:J

    sput-wide v4, Lcom/android/camera/ToastUtils;->oneTime:J

    .line 56
    return-void

    .line 39
    .restart local v0    # "context":Landroid/content/Context;
    :catch_0
    move-exception v2

    .line 40
    .local v2, "e1":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 37
    .end local v2    # "e1":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 38
    .local v1, "e":Landroid/view/InflateException;
    invoke-virtual {v1}, Landroid/view/InflateException;->printStackTrace()V

    goto :goto_0

    .line 44
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "e":Landroid/view/InflateException;
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/android/camera/ToastUtils;->twoTime:J

    .line 45
    if-eqz p1, :cond_2

    sget-object v3, Lcom/android/camera/ToastUtils;->oldMsg:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 46
    sget-wide v4, Lcom/android/camera/ToastUtils;->twoTime:J

    sget-wide v6, Lcom/android/camera/ToastUtils;->oneTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 47
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 50
    :cond_2
    sput-object p1, Lcom/android/camera/ToastUtils;->oldMsg:Ljava/lang/String;

    .line 51
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    invoke-virtual {v3, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 52
    sget-object v3, Lcom/android/camera/ToastUtils;->toast:Landroid/widget/Toast;

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
