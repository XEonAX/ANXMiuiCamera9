.class public Lcom/android/camera/constant/AutoFocus;
.super Ljava/lang/Object;
.source "AutoFocus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AutoFocus$FocusMode;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToFocusMode(Ljava/lang/String;)I
    .locals 2
    .param p0, "mode"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 51
    const-string/jumbo v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    const/4 v0, 0x1

    return v0

    .line 51
    :cond_0
    const-string/jumbo v0, "macro"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    const/4 v0, 0x2

    return v0

    .line 51
    :cond_1
    const-string/jumbo v0, "continuous-video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    const/4 v0, 0x3

    return v0

    .line 51
    :cond_2
    const-string/jumbo v0, "continuous-picture"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 59
    const/4 v0, 0x4

    return v0

    .line 51
    :cond_3
    const-string/jumbo v0, "edof"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 61
    const/4 v0, 0x5

    return v0

    .line 51
    :cond_4
    const-string/jumbo v0, "manual"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 63
    return v1

    .line 65
    :cond_5
    return v1
.end method

.method public static convertToLegacyFocusModes([I)Ljava/util/List;
    .locals 5
    .param p0, "modes"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .local v1, "modeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    array-length v3, p0

    :goto_0
    if-ge v2, v3, :cond_0

    aget v0, p0, v2

    .line 23
    .local v0, "mode":I
    packed-switch v0, :pswitch_data_0

    .line 22
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 25
    :pswitch_0
    const-string/jumbo v4, "manual"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 28
    :pswitch_1
    const-string/jumbo v4, "auto"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 31
    :pswitch_2
    const-string/jumbo v4, "macro"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 34
    :pswitch_3
    const-string/jumbo v4, "continuous-video"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 37
    :pswitch_4
    const-string/jumbo v4, "continuous-picture"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 40
    :pswitch_5
    const-string/jumbo v4, "edof"

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 47
    .end local v0    # "mode":I
    :cond_0
    return-object v1

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
