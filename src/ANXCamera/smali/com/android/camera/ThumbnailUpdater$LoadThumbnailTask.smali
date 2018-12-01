.class Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;
.super Landroid/os/AsyncTask;
.source "ThumbnailUpdater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ThumbnailUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadThumbnailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/android/camera/Thumbnail;",
        ">;"
    }
.end annotation


# instance fields
.field private mLookAtCache:Z

.field final synthetic this$0:Lcom/android/camera/ThumbnailUpdater;


# direct methods
.method public constructor <init>(Lcom/android/camera/ThumbnailUpdater;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ThumbnailUpdater;
    .param p2, "lookAtCache"    # Z

    .prologue
    .line 89
    iput-object p1, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 90
    iput-boolean p2, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->mLookAtCache:Z

    .line 91
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/android/camera/Thumbnail;
    .locals 11
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 95
    const/4 v3, 0x0

    .line 96
    .local v3, "t":Lcom/android/camera/Thumbnail;
    invoke-virtual {p0}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 97
    return-object v8

    .line 100
    :cond_0
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get2(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 101
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get2(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/Thumbnail;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 102
    .local v4, "thumbnailUri":Landroid/net/Uri;
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get1(Lcom/android/camera/ThumbnailUpdater;)Landroid/content/ContentResolver;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 103
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get1(Lcom/android/camera/ThumbnailUpdater;)Landroid/content/ContentResolver;

    move-result-object v6

    invoke-static {v6}, Lcom/android/camera/Thumbnail;->getLastThumbnailUri(Landroid/content/ContentResolver;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 102
    if-eqz v6, :cond_1

    .line 104
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get2(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v6

    return-object v6

    .line 106
    :cond_1
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    .line 107
    .local v1, "module":Lcom/android/camera/module/Module;
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->shouldReleaseLater()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 108
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get2(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/Thumbnail;

    move-result-object v6

    return-object v6

    .line 114
    .end local v1    # "module":Lcom/android/camera/module/Module;
    .end local v4    # "thumbnailUri":Landroid/net/Uri;
    :cond_2
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v6

    if-nez v6, :cond_3

    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_4

    .line 115
    :cond_3
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->getSecureUriList()Ljava/util/ArrayList;

    move-result-object v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->getSecureUriList()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 116
    :cond_4
    iget-boolean v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->mLookAtCache:Z

    .line 114
    if-eqz v6, :cond_5

    .line 117
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->getFilesDir()Ljava/io/File;

    move-result-object v6

    .line 118
    iget-object v7, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v7}, Lcom/android/camera/ThumbnailUpdater;->-get1(Lcom/android/camera/ThumbnailUpdater;)Landroid/content/ContentResolver;

    move-result-object v7

    .line 117
    invoke-static {v6, v7}, Lcom/android/camera/Thumbnail;->getLastThumbnailFromFile(Ljava/io/File;Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail;

    move-result-object v3

    .line 121
    .end local v3    # "t":Lcom/android/camera/Thumbnail;
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 122
    return-object v8

    .line 125
    :cond_6
    const/4 v5, 0x0

    .line 126
    .local v5, "uri":Landroid/net/Uri;
    if-eqz v3, :cond_7

    .line 127
    invoke-virtual {v3}, Lcom/android/camera/Thumbnail;->getUri()Landroid/net/Uri;

    move-result-object v5

    .line 129
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_7
    new-array v2, v10, [Lcom/android/camera/Thumbnail;

    .line 131
    .local v2, "result":[Lcom/android/camera/Thumbnail;
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v6

    if-nez v6, :cond_8

    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_8

    .line 134
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get1(Lcom/android/camera/ThumbnailUpdater;)Landroid/content/ContentResolver;

    move-result-object v6

    .line 133
    invoke-static {v6, v2, v5}, Lcom/android/camera/Thumbnail;->getLastThumbnailFromContentResolver(Landroid/content/ContentResolver;[Lcom/android/camera/Thumbnail;Landroid/net/Uri;)I

    move-result v0

    .line 139
    .local v0, "code":I
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 150
    return-object v8

    .line 137
    .end local v0    # "code":I
    :cond_8
    iget-object v6, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v6}, Lcom/android/camera/ThumbnailUpdater;->-get1(Lcom/android/camera/ThumbnailUpdater;)Landroid/content/ContentResolver;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    invoke-static {v7}, Lcom/android/camera/ThumbnailUpdater;->-get0(Lcom/android/camera/ThumbnailUpdater;)Lcom/android/camera/ActivityBase;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/ActivityBase;->getSecureUriList()Ljava/util/ArrayList;

    move-result-object v7

    .line 136
    invoke-static {v6, v2, v7, v5}, Lcom/android/camera/Thumbnail;->getLastThumbnailFromUriList(Landroid/content/ContentResolver;[Lcom/android/camera/Thumbnail;Ljava/util/ArrayList;Landroid/net/Uri;)I

    move-result v0

    .restart local v0    # "code":I
    goto :goto_0

    .line 141
    :pswitch_0
    return-object v3

    .line 143
    :pswitch_1
    return-object v8

    .line 145
    :pswitch_2
    aget-object v6, v2, v9

    return-object v6

    .line 147
    :pswitch_3
    invoke-virtual {p0, v10}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->cancel(Z)Z

    .line 148
    return-object v8

    .line 139
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 93
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->doInBackground([Ljava/lang/Void;)Lcom/android/camera/Thumbnail;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/android/camera/Thumbnail;)V
    .locals 3
    .param p1, "thumbnail"    # Lcom/android/camera/Thumbnail;

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    return-void

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->this$0:Lcom/android/camera/ThumbnailUpdater;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 160
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 153
    check-cast p1, Lcom/android/camera/Thumbnail;

    invoke-virtual {p0, p1}, Lcom/android/camera/ThumbnailUpdater$LoadThumbnailTask;->onPostExecute(Lcom/android/camera/Thumbnail;)V

    return-void
.end method
