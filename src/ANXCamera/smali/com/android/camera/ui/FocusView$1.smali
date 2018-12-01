.class Lcom/android/camera/ui/FocusView$1;
.super Landroid/os/Handler;
.source "FocusView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/FocusView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/FocusView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/FocusView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/FocusView;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    .line 209
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 211
    invoke-static {}, Lcom/android/camera/ui/FocusView;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "msg="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v6, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, " "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v2

    if-eqz v2, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-get3(Lcom/android/camera/ui/FocusView;)Lcom/android/camera/ui/RollAdapter;

    move-result-object v2

    if-nez v2, :cond_1

    .line 213
    return-void

    :cond_0
    move v2, v4

    .line 211
    goto :goto_0

    .line 216
    :cond_1
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 247
    :goto_1
    return-void

    .line 218
    :pswitch_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-get10(Lcom/android/camera/ui/FocusView;)J

    move-result-wide v8

    sub-long v0, v6, v8

    .line 219
    .local v0, "duration":J
    const-wide/16 v6, 0x208

    cmp-long v2, v0, v6

    if-ltz v2, :cond_2

    .line 220
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2, v3}, Lcom/android/camera/ui/FocusView;->-set2(Lcom/android/camera/ui/FocusView;I)I

    .line 221
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2, v4}, Lcom/android/camera/ui/FocusView;->-set3(Lcom/android/camera/ui/FocusView;I)I

    .line 222
    return-void

    .line 224
    :cond_2
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    long-to-float v3, v0

    const/high16 v4, 0x43fa0000    # 500.0f

    div-float/2addr v3, v4

    invoke-static {v2, v3}, Lcom/android/camera/ui/FocusView;->-set4(Lcom/android/camera/ui/FocusView;F)F

    .line 225
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-wrap2(Lcom/android/camera/ui/FocusView;)V

    .line 226
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v2}, Lcom/android/camera/ui/FocusView;->invalidate()V

    .line 227
    const-wide/16 v2, 0x14

    const/4 v4, 0x7

    invoke-virtual {p0, v4, v2, v3}, Lcom/android/camera/ui/FocusView$1;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1

    .line 231
    .end local v0    # "duration":J
    :pswitch_1
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-wrap5(Lcom/android/camera/ui/FocusView;)V

    goto :goto_1

    .line 236
    :pswitch_2
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-get14(Lcom/android/camera/ui/FocusView;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-get13(Lcom/android/camera/ui/FocusView;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 237
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    invoke-static {v2}, Lcom/android/camera/ui/FocusView;->-wrap3(Lcom/android/camera/ui/FocusView;)V

    .line 238
    const-wide/16 v2, 0x32

    const/4 v4, 0x5

    invoke-virtual {p0, v4, v2, v3}, Lcom/android/camera/ui/FocusView$1;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1

    .line 240
    :cond_3
    iget-object v2, p0, Lcom/android/camera/ui/FocusView$1;->this$0:Lcom/android/camera/ui/FocusView;

    const/4 v3, 0x6

    invoke-static {v2, v3}, Lcom/android/camera/ui/FocusView;->-wrap6(Lcom/android/camera/ui/FocusView;I)V

    goto :goto_1

    .line 216
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
