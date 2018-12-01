.class Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;
.super Landroid/os/AsyncTask;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveOutputImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

.field private mHeight:I

.field private mLocation:Landroid/location/Location;

.field private mOrientation:I

.field private mStartTime:J

.field private mTimeTaken:J

.field private mTitle:Ljava/lang/String;

.field private mWidth:I

.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;JLandroid/location/Location;IIILjava/lang/String;Lcom/android/camera/groupshot/GroupShot;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;
    .param p2, "time"    # J
    .param p4, "location"    # Landroid/location/Location;
    .param p5, "width"    # I
    .param p6, "height"    # I
    .param p7, "orientation"    # I
    .param p8, "title"    # Ljava/lang/String;
    .param p9, "groupShot"    # Lcom/android/camera/groupshot/GroupShot;

    .prologue
    .line 758
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 760
    iput-wide p2, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mTimeTaken:J

    .line 761
    iput-object p4, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mLocation:Landroid/location/Location;

    .line 762
    iput p5, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mWidth:I

    .line 763
    iput p6, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mHeight:I

    .line 764
    iput p7, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mOrientation:I

    .line 765
    iput-object p8, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mTitle:Ljava/lang/String;

    .line 766
    iput-object p9, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    .line 767
    return-void
.end method

.method private finishGroupShot()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 865
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Lcom/android/camera/groupshot/GroupShot;->clearImages()I

    .line 866
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Lcom/android/camera/groupshot/GroupShot;->finish()V

    .line 867
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v0, :cond_0

    .line 868
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    .line 870
    :cond_0
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    .line 871
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get4(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->-set6(Lcom/android/camera/module/Camera2Module;I)I

    .line 872
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 18
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 771
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "doInBackground start"

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    const/4 v4, 0x0

    .line 774
    .local v4, "path":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5}, Lcom/android/camera/groupshot/GroupShot;->attach_end()I

    move-result v13

    .line 775
    .local v13, "result":I
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "attach_end() = 0x%08x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 777
    const/4 v5, 0x0

    return-object v5

    .line 779
    :cond_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/android/camera/groupshot/GroupShot;->setBaseImage(I)I

    move-result v13

    .line 780
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "setBaseImage() = 0x%08x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 781
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5}, Lcom/android/camera/groupshot/GroupShot;->setBestFace()I

    move-result v13

    .line 782
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "groupshot attach end & setbestface cost "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    move-wide/from16 v16, v0

    sub-long v8, v8, v16

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 786
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mTitle:Ljava/lang/String;

    invoke-static {v5}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 788
    .local v4, "path":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5, v4}, Lcom/android/camera/groupshot/GroupShot;->getImageAndSaveJpeg(Ljava/lang/String;)I

    .line 789
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "groupshot finish group cost "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    move-wide/from16 v16, v0

    sub-long v8, v8, v16

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 793
    const/4 v5, 0x0

    return-object v5

    .line 797
    :cond_1
    sget-boolean v5, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v5, :cond_2

    .line 798
    const-string/jumbo v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 799
    .local v12, "originPath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 800
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 801
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mGroupShotInternal:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5, v12}, Lcom/android/camera/groupshot/GroupShot;->saveInputImages(Ljava/lang/String;)I

    .line 804
    .end local v12    # "originPath":Ljava/lang/String;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->isCancelled()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_4

    .line 805
    const/4 v5, 0x0

    return-object v5

    .line 808
    .end local v4    # "path":Ljava/lang/String;
    .end local v13    # "result":I
    :catch_0
    move-exception v11

    .line 809
    .local v11, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "SaveOutputImageTask exception occurs, "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 810
    if-eqz v4, :cond_3

    .line 811
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 813
    :cond_3
    const/4 v5, 0x0

    return-object v5

    .line 815
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v4    # "path":Ljava/lang/String;
    .restart local v13    # "result":I
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 816
    const/4 v5, 0x0

    return-object v5

    .line 819
    :cond_5
    invoke-static {}, Lcom/android/camera/CameraApplicationDelegate;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    .line 820
    .local v3, "appContext":Landroid/content/Context;
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mOrientation:I

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v6

    .line 821
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mTimeTaken:J

    .line 820
    invoke-static {v4, v5, v6, v8, v9}, Lcom/android/camera/ExifHelper;->writeExif(Ljava/lang/String;ILandroid/location/Location;J)V

    .line 822
    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mOrientation:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mTimeTaken:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mLocation:Landroid/location/Location;

    .line 823
    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mWidth:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mHeight:I

    .line 822
    invoke-static/range {v3 .. v10}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;

    move-result-object v15

    .line 824
    .local v15, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "groupshot insert db cost "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    move-wide/from16 v16, v0

    sub-long v8, v8, v16

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v5, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 827
    .local v2, "cameraMirror":Lcom/android/camera/Camera;
    if-nez v2, :cond_6

    .line 828
    const/4 v5, 0x0

    return-object v5

    .line 830
    :cond_6
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 832
    if-eqz v15, :cond_7

    .line 833
    invoke-virtual {v2, v15}, Lcom/android/camera/Camera;->addSecureUri(Landroid/net/Uri;)V

    .line 834
    invoke-static {v3, v15}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 835
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    .line 836
    const/4 v6, 0x0

    .line 835
    invoke-static {v5, v15, v6}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v14

    .line 837
    .local v14, "t":Lcom/android/camera/Thumbnail;
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v14, v6, v7}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 839
    .end local v14    # "t":Lcom/android/camera/Thumbnail;
    :cond_7
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "groupshot asynctask cost "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    move-wide/from16 v16, v0

    sub-long v8, v8, v16

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    const/4 v5, 0x0

    return-object v5
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 769
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 850
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SaveOutputImageTask onCancelled"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->finishGroupShot()V

    .line 852
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 856
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SaveOutputImageTask onPostExecute"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 857
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    .line 858
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ThumbnailUpdater;->updateThumbnailView(Z)V

    .line 860
    :cond_0
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "groupshot image process cost "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    sub-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 861
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->finishGroupShot()V

    .line 862
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 854
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 845
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->mStartTime:J

    .line 846
    return-void
.end method
