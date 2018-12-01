.class public Lcom/android/camera/fragment/CtaNoticeFragment$CTA;
.super Ljava/lang/Object;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/CtaNoticeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CTA"
.end annotation


# static fields
.field private static sCanConnectToNetworkTemp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canConnectNetwork()Z
    .locals 2

    .prologue
    .line 35
    sget-boolean v1, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    if-eqz v1, :cond_0

    .line 36
    const/4 v1, 0x1

    return v1

    .line 38
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 39
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCTACanCollect()Z

    move-result v1

    return v1
.end method

.method public static setCanConnectNetwork(Z)V
    .locals 3
    .param p0, "remindNever"    # Z

    .prologue
    const/4 v2, 0x1

    .line 45
    if-eqz p0, :cond_0

    .line 46
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 47
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCTACanCollect(Z)V

    .line 52
    .end local v0    # "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    :goto_0
    return-void

    .line 50
    :cond_0
    sput-boolean v2, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    goto :goto_0
.end method
