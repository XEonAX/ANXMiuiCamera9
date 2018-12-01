.class public Lcom/android/camera/data/cloud/DataCloudItemGlobal;
.super Lcom/android/camera/data/cloud/DataCloudItemBase;
.source "DataCloudItemGlobal.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudItemBase;-><init>()V

    return-void
.end method


# virtual methods
.method public provideKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    const-string/jumbo v0, "cloud_global"

    return-object v0
.end method
