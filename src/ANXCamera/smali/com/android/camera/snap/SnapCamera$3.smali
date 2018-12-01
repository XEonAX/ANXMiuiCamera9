.class Lcom/android/camera/snap/SnapCamera$3;
.super Ljava/lang/Object;
.source "SnapCamera.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapCamera;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$3;->this$0:Lcom/android/camera/snap/SnapCamera;

    .line 621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 9
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    const/4 v6, 0x0

    .line 627
    const/4 v3, 0x0

    .local v3, "image":Landroid/media/Image;
    :try_start_0
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v3

    .line 628
    .local v3, "image":Landroid/media/Image;
    if-nez v3, :cond_3

    .line 640
    if-eqz v3, :cond_0

    :try_start_1
    invoke-virtual {v3}, Landroid/media/Image;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_0
    :goto_0
    if-eqz v6, :cond_2

    :try_start_2
    throw v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 638
    .end local v3    # "image":Landroid/media/Image;
    :catch_0
    move-exception v2

    .line 639
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 641
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    return-void

    .line 640
    .restart local v3    # "image":Landroid/media/Image;
    :catch_1
    move-exception v6

    goto :goto_0

    .line 629
    :cond_2
    return-void

    .line 631
    :cond_3
    :try_start_3
    invoke-virtual {v3}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v4

    .line 632
    .local v4, "planes":[Landroid/media/Image$Plane;
    array-length v5, v4

    if-lez v5, :cond_4

    .line 633
    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 634
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    new-array v1, v5, [B

    .line 635
    .local v1, "data":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 636
    iget-object v5, p0, Lcom/android/camera/snap/SnapCamera$3;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v5, v1}, Lcom/android/camera/snap/SnapCamera;->-wrap1(Lcom/android/camera/snap/SnapCamera;[B)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 640
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "data":[B
    :cond_4
    if-eqz v3, :cond_5

    :try_start_4
    invoke-virtual {v3}, Landroid/media/Image;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_5
    :goto_1
    if-eqz v6, :cond_1

    :try_start_5
    throw v6
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    :catch_2
    move-exception v6

    goto :goto_1

    .end local v3    # "image":Landroid/media/Image;
    .end local v4    # "planes":[Landroid/media/Image$Plane;
    :catch_3
    move-exception v5

    :try_start_6
    throw v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception v6

    move-object v8, v6

    move-object v6, v5

    move-object v5, v8

    :goto_2
    if-eqz v3, :cond_6

    :try_start_7
    invoke-virtual {v3}, Landroid/media/Image;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    :cond_6
    :goto_3
    if-eqz v6, :cond_8

    :try_start_8
    throw v6

    :catch_4
    move-exception v7

    if-nez v6, :cond_7

    move-object v6, v7

    goto :goto_3

    :cond_7
    if-eq v6, v7, :cond_6

    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_8
    throw v5
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    :catchall_1
    move-exception v5

    goto :goto_2
.end method
