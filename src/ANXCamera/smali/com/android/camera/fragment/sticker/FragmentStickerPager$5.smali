.class Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;
.super Ljava/lang/Object;
.source "FragmentStickerPager.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentStickerPager;->loadData()V
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
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 6
    .param p1, "response"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 133
    aget-object v0, p1, v5

    check-cast v0, Ljava/util/List;

    .line 134
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/sticker/StickerInfo;>;"
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v1, v0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-wrap2(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 135
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-static {v1, v0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-wrap1(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 136
    const-string/jumbo v2, "FragmentStickerPager"

    const-string/jumbo v3, "getStickerList %d "

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v1, -0x1

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    return-void

    .line 136
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_0
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "errorCode"    # Lcom/android/camera/network/net/base/ErrorCode;
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "responseData"    # Ljava/lang/Object;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;->this$0:Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->-wrap1(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V

    .line 142
    const-string/jumbo v0, "FragmentStickerPager"

    const-string/jumbo v1, "errorCode %d msg:%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p1, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    return-void
.end method
