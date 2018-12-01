.class public Lcom/android/camera/constant/ExceptionConstant;
.super Ljava/lang/Object;
.source "ExceptionConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/ExceptionConstant$Exceptions;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final transFromCamera2Error(I)I
    .locals 1
    .param p0, "camera2Error"    # I

    .prologue
    const/16 v0, 0xe6

    .line 49
    packed-switch p0, :pswitch_data_0

    .line 68
    return v0

    .line 51
    :pswitch_0
    return v0

    .line 55
    :pswitch_1
    return v0

    .line 58
    :pswitch_2
    const/16 v0, 0xe3

    return v0

    .line 61
    :pswitch_3
    return v0

    .line 65
    :pswitch_4
    return v0

    .line 49
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
