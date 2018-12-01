.class Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;
.super Ljava/lang/Object;
.source "FragmentStickerPager.java"

# interfaces
.implements Lcom/android/camera/fragment/sticker/BaseSelectAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentStickerPager;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/android/camera/fragment/sticker/BaseSelectAdapter$BaseSelectHolder;IZ)Z
    .locals 11
    .param p1, "holder"    # Lcom/android/camera/fragment/sticker/BaseSelectAdapter$BaseSelectHolder;
    .param p2, "position"    # I
    .param p3, "isChanged"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 72
    iget-object v7, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v7}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-get0(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/fragment/sticker/StickerAdapter;

    move-result-object v7

    invoke-virtual {v7, p2}, Lcom/android/camera/fragment/sticker/StickerAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/sticker/StickerInfo;

    .line 73
    .local v0, "data":Lcom/android/camera/sticker/StickerInfo;
    invoke-virtual {v0}, Lcom/android/camera/sticker/StickerInfo;->getDownloadState()I

    move-result v5

    .line 74
    .local v5, "state":I
    if-eq v5, v8, :cond_0

    const/4 v7, 0x3

    if-ne v5, v7, :cond_4

    .line 75
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/sticker/StickerInfo;->getSrcPath()Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "srcPath":Ljava/lang/String;
    iget-object v7, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v7, v4}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-wrap0(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/lang/String;)V

    .line 77
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/android/camera/effect/EffectController;->setCurrentSticker(Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v10

    if-nez p2, :cond_3

    move v7, v8

    :goto_0
    invoke-virtual {v10, v7}, Lcom/android/camera/effect/EffectController;->enableMakeup(Z)V

    .line 80
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v7

    .line 81
    const/16 v9, 0xb2

    .line 80
    invoke-virtual {v7, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    .line 82
    .local v3, "p":Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;
    if-eqz v3, :cond_1

    .line 83
    invoke-interface {v3, v4}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->onStickerChanged(Ljava/lang/String;)V

    .line 86
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/sticker/StickerInfo;->getFilterId()I

    move-result v1

    .line 87
    .local v1, "filterId":I
    sget v7, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v1, v7, :cond_2

    .line 89
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v7

    const/16 v9, 0xa5

    invoke-virtual {v7, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 90
    .local v2, "filterProtocol":Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
    if-eqz v2, :cond_2

    .line 91
    invoke-interface {v2, v8, v1}, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;->onFilterChanged(II)V

    .line 94
    .end local v2    # "filterProtocol":Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
    :cond_2
    return v8

    .end local v1    # "filterId":I
    .end local v3    # "p":Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;
    :cond_3
    move v7, v9

    .line 78
    goto :goto_0

    .line 95
    .end local v4    # "srcPath":Ljava/lang/String;
    :cond_4
    if-eqz v5, :cond_5

    const/4 v7, 0x4

    if-ne v5, v7, :cond_7

    .line 96
    :cond_5
    iget-object v7, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-virtual {v7}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v7

    invoke-static {v7}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;)Z

    move-result v7

    if-eqz v7, :cond_6

    move-object v6, p1

    .line 97
    check-cast v6, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;

    .line 98
    .local v6, "stickerHolder":Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;
    iget-object v7, v6, Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;->mDownloadView:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-virtual {v7}, Lcom/android/camera/fragment/sticker/download/DownloadView;->startDownload()V

    .line 99
    const/4 v7, 0x2

    iput v7, v0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    .line 100
    invoke-static {}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;

    move-result-object v8

    iget-object v7, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v7}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-get3(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/camera/network/resource/Resource;

    iget-object v10, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v10}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-get1(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/network/resource/DownloadHelper;

    move-result-object v10

    invoke-virtual {v8, v7, v10}, Lcom/android/camera/network/resource/ResourceDownloadManager;->download(Lcom/android/camera/network/resource/Resource;Lcom/android/camera/network/resource/DownloadHelper;)V

    .line 102
    .end local v6    # "stickerHolder":Lcom/android/camera/fragment/sticker/StickerAdapter$StickerHolder;
    :cond_6
    return v9

    .line 104
    :cond_7
    return v9
.end method
