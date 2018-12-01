.class Lcom/android/camera/ActivityBase$ActivityHandler;
.super Landroid/os/Handler;
.source "ActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityHandler"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera/ActivityBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1
    .param p1, "activity"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 113
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 114
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase$ActivityHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 115
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 119
    iget-object v2, p0, Lcom/android/camera/ActivityBase$ActivityHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 120
    .local v0, "activity":Lcom/android/camera/ActivityBase;
    if-nez v0, :cond_0

    .line 121
    return-void

    .line 123
    :cond_0
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 164
    :cond_1
    :goto_0
    return-void

    .line 125
    :sswitch_0
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v2

    if-nez v2, :cond_1

    .line 126
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/android/camera/ActivityBase;->showDebugInfo(Ljava/lang/String;)V

    goto :goto_0

    .line 132
    :sswitch_1
    const-string/jumbo v2, "ActivityBase"

    const-string/jumbo v3, "handleMessage:  set mIsFinishInKeyguard = true;"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/android/camera/ActivityBase;->-set0(Lcom/android/camera/ActivityBase;Z)Z

    goto :goto_0

    .line 138
    :sswitch_2
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 139
    .local v1, "exception":I
    const-string/jumbo v2, "ActivityBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "msg = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 154
    :pswitch_1
    invoke-static {v0}, Lcom/android/camera/Util;->isInVideoCall(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 155
    const v2, 0x7f0f018c

    .line 153
    :goto_1
    invoke-static {v0, v2}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    .line 159
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->showErrorDialog()V

    goto :goto_0

    .line 145
    :pswitch_2
    const v2, 0x7f0f0007

    invoke-static {v0, v2}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    .line 146
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->showErrorDialog()V

    goto :goto_0

    .line 156
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->updateOpenCameraFailTimes()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    .line 157
    const v2, 0x7f0f0006

    goto :goto_1

    .line 158
    :cond_3
    const v2, 0x7f0f0005

    goto :goto_1

    .line 123
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0xa -> :sswitch_2
    .end sparse-switch

    .line 140
    :pswitch_data_0
    .packed-switch 0xe2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
