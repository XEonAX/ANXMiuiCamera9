.class Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/storage/ImageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoSaveRequest"
.end annotation


# instance fields
.field private mContentValues:Landroid/content/ContentValues;

.field private mContext:Lcom/android/camera/ActivityBase;

.field private mIsFinal:Z

.field private mUri:Landroid/net/Uri;

.field private mVideoPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/camera/storage/ImageSaver;


# direct methods
.method static synthetic -get0(Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;)Landroid/net/Uri;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;

    .prologue
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public constructor <init>(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/ActivityBase;Ljava/lang/String;Landroid/content/ContentValues;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/storage/ImageSaver;
    .param p2, "context"    # Lcom/android/camera/ActivityBase;
    .param p3, "videoPath"    # Ljava/lang/String;
    .param p4, "values"    # Landroid/content/ContentValues;
    .param p5, "isFinal"    # Z

    .prologue
    .line 643
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 645
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContext:Lcom/android/camera/ActivityBase;

    .line 646
    iput-object p3, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    .line 647
    iput-object p4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    .line 648
    iput-boolean p5, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mIsFinal:Z

    .line 649
    return-void
.end method

.method private addVideoToMediaStore(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "videoPath"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 704
    invoke-static {p1}, Lcom/android/camera/Util;->getDuration(Ljava/lang/String;)J

    move-result-wide v0

    .line 705
    .local v0, "duration":J
    const-wide/16 v4, 0x0

    cmp-long v4, v4, v0

    if-nez v4, :cond_0

    .line 706
    const-string/jumbo v4, "ImageSaver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "delete invalid video: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 708
    const/4 v4, 0x0

    return-object v4

    .line 711
    :cond_0
    const/4 v3, 0x0

    .line 712
    .local v3, "uri":Landroid/net/Uri;
    const-string/jumbo v4, "_size"

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 713
    const-string/jumbo v4, "duration"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 715
    :try_start_0
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContext:Lcom/android/camera/ActivityBase;

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 716
    sget-object v5, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 715
    invoke-virtual {v4, v5, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 722
    .local v3, "uri":Landroid/net/Uri;
    const-string/jumbo v4, "ImageSaver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Current video URI: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    .end local v3    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v3

    .line 717
    .local v3, "uri":Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 720
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v4, "ImageSaver"

    const-string/jumbo v5, "failed to add video to media store"

    invoke-static {v4, v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 722
    const-string/jumbo v4, "ImageSaver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Current video URI: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 721
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 722
    const-string/jumbo v5, "ImageSaver"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Current video URI: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    throw v4
.end method


# virtual methods
.method public isFinal()Z
    .locals 1

    .prologue
    .line 695
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mIsFinal:Z

    return v0
.end method

.method public onFinish()V
    .locals 0

    .prologue
    .line 701
    return-void
.end method

.method public run()V
    .locals 0

    .prologue
    .line 653
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->save()V

    .line 654
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->onFinish()V

    .line 655
    return-void
.end method

.method public save()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 659
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v5, "_data"

    invoke-virtual {v4, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 660
    .local v0, "finalName":Ljava/lang/String;
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 661
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 662
    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    .line 668
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->isFinal()Z

    move-result v5

    invoke-static {v4, v5}, Lcom/android/camera/storage/ImageSaver;->-wrap0(Lcom/android/camera/storage/ImageSaver;Z)Z

    move-result v2

    .line 669
    .local v2, "thumbnail":Z
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    invoke-direct {p0, v4, v5}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->addVideoToMediaStore(Ljava/lang/String;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mUri:Landroid/net/Uri;

    .line 670
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mUri:Landroid/net/Uri;

    if-eqz v4, :cond_5

    .line 671
    if-eqz v2, :cond_1

    .line 672
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    const/16 v5, 0x200

    invoke-static {v4, v5}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 673
    .local v3, "videoFrame":Landroid/graphics/Bitmap;
    if-eqz v3, :cond_4

    .line 674
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mUri:Landroid/net/Uri;

    invoke-static {v4, v3, v7, v7}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v1

    .line 675
    .local v1, "t":Lcom/android/camera/Thumbnail;
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v4, v1}, Lcom/android/camera/storage/ImageSaver;->-wrap5(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/Thumbnail;)V

    .line 681
    .end local v1    # "t":Lcom/android/camera/Thumbnail;
    .end local v3    # "videoFrame":Landroid/graphics/Bitmap;
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    iget-object v5, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mUri:Landroid/net/Uri;

    invoke-static {v4, v5}, Lcom/android/camera/storage/ImageSaver;->-wrap2(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;)V

    .line 682
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContext:Lcom/android/camera/ActivityBase;

    iget-object v5, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;)V

    .line 686
    :cond_2
    :goto_2
    return-void

    .line 664
    .end local v2    # "thumbnail":Z
    :cond_3
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v5, "_data"

    iget-object v6, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 677
    .restart local v2    # "thumbnail":Z
    .restart local v3    # "videoFrame":Landroid/graphics/Bitmap;
    :cond_4
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v4}, Lcom/android/camera/storage/ImageSaver;->-wrap3(Lcom/android/camera/storage/ImageSaver;)V

    goto :goto_1

    .line 683
    .end local v3    # "videoFrame":Landroid/graphics/Bitmap;
    :cond_5
    if-eqz v2, :cond_2

    .line 684
    iget-object v4, p0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v4}, Lcom/android/camera/storage/ImageSaver;->-wrap3(Lcom/android/camera/storage/ImageSaver;)V

    goto :goto_2
.end method
