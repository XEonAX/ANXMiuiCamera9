.class public Lcom/android/camera/module/PanoramaModule$StillProcTask;
.super Ljava/lang/Thread;
.source "PanoramaModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/PanoramaModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "StillProcTask"
.end annotation


# instance fields
.field private shootCount:I

.field final synthetic this$0:Lcom/android/camera/module/PanoramaModule;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/PanoramaModule;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    .line 865
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 866
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->shootCount:I

    .line 865
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 870
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "StillProcTask>>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    :goto_0
    const/4 v0, 0x0

    .line 873
    .local v0, "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get2(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 874
    :goto_1
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get3(Lcom/android/camera/module/PanoramaModule;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 876
    :try_start_1
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "StillProcTask waiting>>"

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 877
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get2(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 878
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "StillProcTask waiting<<"

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 879
    :catch_0
    move-exception v1

    .line 880
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "StillProcTask: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 873
    .end local v0    # "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 883
    .restart local v0    # "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    :cond_0
    :try_start_3
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 884
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    check-cast v0, Lcom/android/camera/module/PanoramaModule$StillImageData;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_1
    monitor-exit v4

    .line 888
    if-eqz v0, :cond_4

    .line 890
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "attachStillImageExt() start: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    if-nez v3, :cond_5

    .line 892
    const/high16 v2, -0x40000000    # -2.0f

    .line 894
    .local v2, "ret":I
    :goto_2
    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v3, v3, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v3, :cond_2

    .line 895
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "attachStillImageExt() -> 0x%x"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 896
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v3, v3, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v4, Lcom/android/camera/module/PanoramaModule$StillProcTask$1;

    invoke-direct {v4, p0}, Lcom/android/camera/module/PanoramaModule$StillProcTask$1;-><init>(Lcom/android/camera/module/PanoramaModule$StillProcTask;)V

    invoke-virtual {v3, v4}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 903
    :cond_2
    iget v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->shootCount:I

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 904
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mImage:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP;->attachSetJpegForCopyingExif(Ljava/nio/ByteBuffer;)I

    .line 913
    :cond_3
    iget v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->shootCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->shootCount:I

    .line 914
    iget-object v3, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mImage:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)I

    .line 915
    iget-object v3, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mMotionData:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)I

    .line 916
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-wrap1(Lcom/android/camera/module/PanoramaModule;)V

    .line 919
    .end local v2    # "ret":I
    :cond_4
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get6(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 920
    :try_start_4
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get3(Lcom/android/camera/module/PanoramaModule;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 921
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "StillProcTask: exiting"

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit v4

    .line 928
    :goto_3
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_7

    .line 929
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/PanoramaModule$StillImageData;

    .line 930
    .local v0, "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    iget-object v3, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mImage:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)I

    .line 931
    iget-object v3, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mMotionData:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/android/camera/panorama/NativeMemoryAllocator;->freeBuffer(Ljava/nio/ByteBuffer;)I

    .line 932
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-wrap1(Lcom/android/camera/module/PanoramaModule;)V

    goto :goto_3

    .line 893
    .end local v0    # "dat":Lcom/android/camera/module/PanoramaModule$StillImageData;
    :cond_5
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$StillProcTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mImage:Ljava/nio/ByteBuffer;

    iget v5, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mId:I

    iget-object v6, v0, Lcom/android/camera/module/PanoramaModule$StillImageData;->mMotionData:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4, v5, v6}, Lcom/android/camera/panorama/MorphoPanoramaGP;->attachStillImageExt(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)I

    move-result v2

    .restart local v2    # "ret":I
    goto/16 :goto_2

    .end local v2    # "ret":I
    :cond_6
    monitor-exit v4

    goto/16 :goto_0

    .line 919
    :catchall_1
    move-exception v3

    monitor-exit v4

    throw v3

    .line 934
    :cond_7
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "StillProcTask<<"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 935
    return-void
.end method
