.class final Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;
.super Ljava/lang/Object;
.source "DataProviderMgr.java"

# interfaces
.implements Lcom/android/camera/data/provider/DataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/provider/DataProviderMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DataProviderImpl"
.end annotation


# instance fields
.field private mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

.field private mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

.field private mDataItemConfigs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera/data/data/config/DataItemConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mDataItemFeature:Lcom/android/camera/data/data/feature/DataItemFeature;

.field private mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

.field final synthetic this$0:Lcom/android/camera/data/provider/DataProviderMgr;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/provider/DataProviderMgr;Lcom/android/camera/data/cloud/DataCloud$CloudManager;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera/data/provider/DataProviderMgr;
    .param p2, "dataCloudManager"    # Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->this$0:Lcom/android/camera/data/provider/DataProviderMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    .line 33
    new-instance v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-direct {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 34
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-interface {p2}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->provideDataCloudGlobal()Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V

    .line 35
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    .line 36
    new-instance v0, Lcom/android/camera/data/data/runing/DataItemRunning;

    invoke-direct {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    .line 37
    new-instance v0, Lcom/android/camera/data/data/feature/DataItemFeature;

    invoke-direct {v0}, Lcom/android/camera/data/data/feature/DataItemFeature;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemFeature:Lcom/android/camera/data/data/feature/DataItemFeature;

    .line 38
    return-void
.end method


# virtual methods
.method public dataConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 2

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataConfig(I)Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 3
    .param p1, "cameraId"    # I
    .param p2, "intentType"    # I

    .prologue
    .line 42
    invoke-static {p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result v1

    .line 43
    .local v1, "localId":I
    iget-object v2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 44
    .local v0, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .end local v0    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-direct {v0, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;-><init>(II)V

    .line 46
    .restart local v0    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    iget-object v2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    invoke-interface {v2, p1}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V

    .line 47
    iget-object v2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 49
    :cond_0
    return-object v0
.end method

.method public bridge synthetic dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dataConfig(I)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(I)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataFeature()Lcom/android/camera/data/data/feature/DataItemFeature;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemFeature:Lcom/android/camera/data/data/feature/DataItemFeature;

    return-object v0
.end method

.method public bridge synthetic dataFeature()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataFeature()Lcom/android/camera/data/data/feature/DataItemFeature;

    move-result-object v0

    return-object v0
.end method

.method public dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    return-object v0
.end method

.method public bridge synthetic dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    return-object v0
.end method

.method public dataNormalConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 2

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dataNormalConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataNormalConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataRunning()Lcom/android/camera/data/data/runing/DataItemRunning;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    return-object v0
.end method

.method public bridge synthetic dataRunning()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    return-object v0
.end method
