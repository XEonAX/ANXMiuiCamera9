.class final Lcom/android/camera/module/VideoModule$JpegPictureCallback;
.super Ljava/lang/Object;
.source "VideoModule.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JpegPictureCallback"
.end annotation


# instance fields
.field mLocation:Landroid/location/Location;

.field final synthetic this$0:Lcom/android/camera/module/VideoModule;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/VideoModule;Landroid/location/Location;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoModule;
    .param p2, "loc"    # Landroid/location/Location;

    .prologue
    .line 1818
    iput-object p1, p0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1819
    iput-object p2, p0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->mLocation:Landroid/location/Location;

    .line 1820
    return-void
.end method

.method private storeImage([BLandroid/location/Location;)V
    .locals 20
    .param p1, "data"    # [B
    .param p2, "loc"    # Landroid/location/Location;

    .prologue
    .line 1843
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 1844
    .local v18, "dateTaken":J
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v13

    .line 1846
    .local v13, "orientation":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v2, v2, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    .line 1848
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    const/16 v4, 0xc

    invoke-static {v3, v4}, Lcom/android/camera/module/VideoModule;->-wrap0(Lcom/android/camera/module/VideoModule;I)Z

    move-result v4

    .line 1849
    invoke-static/range {v18 .. v19}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v5

    .line 1850
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 1853
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v3, v3, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v10, v3, Lcom/android/camera/CameraSize;->width:I

    .line 1854
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v3, v3, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v11, v3, Lcom/android/camera/CameraSize;->height:I

    .line 1851
    const/4 v8, 0x0

    .line 1855
    const/4 v12, 0x0

    .line 1857
    const/4 v14, 0x0

    .line 1858
    const/4 v15, 0x0

    .line 1859
    const/16 v16, 0x1

    .line 1860
    const/16 v17, 0x0

    move-object/from16 v3, p1

    move-object/from16 v9, p2

    .line 1846
    invoke-virtual/range {v2 .. v17}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZ)V

    .line 1861
    return-void
.end method


# virtual methods
.method public onPictureBurstFinished(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 1840
    return-void
.end method

.method public onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V
    .locals 2
    .param p1, "jpegData"    # [B
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 1824
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPictureTaken"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1825
    iget-object v0, p0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/VideoModule;->-set0(Lcom/android/camera/module/VideoModule;Z)Z

    .line 1826
    iget-object v0, p0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->this$0:Lcom/android/camera/module/VideoModule;

    iget-boolean v0, v0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-eqz v0, :cond_0

    .line 1827
    return-void

    .line 1829
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->mLocation:Landroid/location/Location;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/VideoModule$JpegPictureCallback;->storeImage([BLandroid/location/Location;)V

    .line 1830
    return-void
.end method

.method public onPictureTakenFailed()V
    .locals 0

    .prologue
    .line 1835
    return-void
.end method
