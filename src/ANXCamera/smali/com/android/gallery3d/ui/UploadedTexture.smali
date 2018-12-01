.class public abstract Lcom/android/gallery3d/ui/UploadedTexture;
.super Lcom/android/gallery3d/ui/BasicTexture;
.source "UploadedTexture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;
    }
.end annotation


# static fields
.field private static sBorderKey:Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;

.field private static sBorderLines:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field static sCropRect:[F

.field static sTextureId:[I

.field private static sUploadedCount:I


# instance fields
.field protected mBitmap:Landroid/graphics/Bitmap;

.field private mBorder:I

.field private mContentValid:Z

.field private mIsPremultiplied:Z

.field private mIsUploading:Z

.field private mOpaque:Z

.field private mThrottled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 48
    sput-object v0, Lcom/android/gallery3d/ui/UploadedTexture;->sBorderLines:Ljava/util/HashMap;

    .line 50
    new-instance v0, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;-><init>(Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;)V

    sput-object v0, Lcom/android/gallery3d/ui/UploadedTexture;->sBorderKey:Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;

    .line 216
    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lcom/android/gallery3d/ui/UploadedTexture;->sTextureId:[I

    .line 217
    const/4 v0, 0x4

    new-array v0, v0, [F

    sput-object v0, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    .line 44
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/gallery3d/ui/UploadedTexture;-><init>(Z)V

    .line 69
    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 3
    .param p1, "hasBorder"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/android/gallery3d/ui/BasicTexture;-><init>(Lcom/android/gallery3d/ui/GLCanvas;II)V

    .line 54
    iput-boolean v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mContentValid:Z

    .line 57
    iput-boolean v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mIsUploading:Z

    .line 58
    iput-boolean v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mOpaque:Z

    .line 59
    iput-boolean v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mThrottled:Z

    .line 60
    iput-boolean v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mIsPremultiplied:Z

    .line 73
    if-eqz p1, :cond_0

    .line 74
    invoke-virtual {p0, v2}, Lcom/android/gallery3d/ui/UploadedTexture;->setBorder(Z)V

    .line 75
    iput v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    .line 77
    :cond_0
    return-void
.end method

.method private freeBitmap()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 150
    iget-object v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    .line 151
    iget-object v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/ui/UploadedTexture;->onFreeBitmap(Landroid/graphics/Bitmap;)V

    .line 152
    iput-object v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    .line 153
    return-void

    .line 150
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getBitmap()Landroid/graphics/Bitmap;
    .locals 4

    .prologue
    .line 137
    iget-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_0

    .line 138
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->onGetBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    .line 139
    iget-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isPremultiplied()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mIsPremultiplied:Z

    .line 140
    iget-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    mul-int/lit8 v3, v3, 0x2

    add-int v1, v2, v3

    .line 141
    .local v1, "w":I
    iget-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget v3, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    mul-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 142
    .local v0, "h":I
    iget v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mWidth:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 143
    invoke-virtual {p0, v1, v0}, Lcom/android/gallery3d/ui/UploadedTexture;->setSize(II)V

    .line 146
    .end local v0    # "h":I
    .end local v1    # "w":I
    :cond_0
    iget-object v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    return-object v2
.end method

.method private static getBorderLine(ZLandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "vertical"    # Z
    .param p1, "config"    # Landroid/graphics/Bitmap$Config;
    .param p2, "length"    # I

    .prologue
    const/4 v3, 0x1

    .line 122
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sBorderKey:Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;

    .line 123
    .local v1, "key":Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;
    iput-boolean p0, v1, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;->vertical:Z

    .line 124
    iput-object p1, v1, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;->config:Landroid/graphics/Bitmap$Config;

    .line 125
    iput p2, v1, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;->length:I

    .line 126
    sget-object v2, Lcom/android/gallery3d/ui/UploadedTexture;->sBorderLines:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 127
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 128
    if-eqz p0, :cond_1

    .line 129
    invoke-static {v3, p2, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 131
    :goto_0
    sget-object v2, Lcom/android/gallery3d/ui/UploadedTexture;->sBorderLines:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;->clone()Lcom/android/gallery3d/ui/UploadedTexture$BorderKey;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    :cond_0
    return-object v0

    .line 130
    :cond_1
    invoke-static {p2, v3, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method public static resetUploadLimit()V
    .locals 1

    .prologue
    .line 209
    const/4 v0, 0x0

    sput v0, Lcom/android/gallery3d/ui/UploadedTexture;->sUploadedCount:I

    .line 210
    return-void
.end method

.method public static uploadLimitReached()Z
    .locals 2

    .prologue
    .line 213
    sget v0, Lcom/android/gallery3d/ui/UploadedTexture;->sUploadedCount:I

    const/16 v1, 0x64

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 26
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 220
    invoke-direct/range {p0 .. p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v13

    .line 221
    .local v13, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v13, :cond_5

    .line 223
    :try_start_0
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v22

    .line 224
    .local v22, "bWidth":I
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v21

    .line 225
    .local v21, "bHeight":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    mul-int/lit8 v1, v1, 0x2

    add-int v25, v22, v1

    .line 226
    .local v25, "width":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    mul-int/lit8 v1, v1, 0x2

    add-int v24, v21, v1

    .line 227
    .local v24, "height":I
    invoke-virtual/range {p0 .. p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getTextureWidth()I

    move-result v4

    .line 228
    .local v4, "texWidth":I
    invoke-virtual/range {p0 .. p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getTextureHeight()I

    move-result v5

    .line 230
    .local v5, "texHeight":I
    move/from16 v0, v22

    if-gt v0, v4, :cond_1

    move/from16 v0, v21

    if-gt v0, v5, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    .line 236
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    int-to-float v2, v2

    const/4 v6, 0x0

    aput v2, v1, v6

    .line 237
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    add-int v2, v2, v21

    int-to-float v2, v2

    const/4 v6, 0x1

    aput v2, v1, v6

    .line 238
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    move/from16 v0, v22

    int-to-float v2, v0

    const/4 v6, 0x2

    aput v2, v1, v6

    .line 239
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    move/from16 v0, v21

    neg-int v2, v0

    int-to-float v2, v2

    const/4 v6, 0x3

    aput v2, v1, v6

    .line 242
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sTextureId:[I

    const/4 v2, 0x1

    const/4 v6, 0x0

    invoke-static {v2, v1, v6}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 243
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sTextureId:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    const/16 v2, 0xde1

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 245
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sCropRect:[F

    .line 244
    const/16 v2, 0xde1

    .line 245
    const v6, 0x8b9d

    const/4 v7, 0x0

    .line 244
    invoke-static {v2, v6, v1, v7}, Landroid/opengl/GLES20;->glTexParameterfv(II[FI)V

    .line 246
    const/16 v1, 0xde1

    .line 247
    const/16 v2, 0x2802

    const v6, 0x812f

    .line 246
    invoke-static {v1, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 248
    const/16 v1, 0xde1

    .line 249
    const/16 v2, 0x2803

    const v6, 0x812f

    .line 248
    invoke-static {v1, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 251
    const v1, 0x46180400    # 9729.0f

    .line 250
    const/16 v2, 0xde1

    .line 251
    const/16 v6, 0x2801

    .line 250
    invoke-static {v2, v6, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 253
    const v1, 0x46180400    # 9729.0f

    .line 252
    const/16 v2, 0xde1

    .line 253
    const/16 v6, 0x2800

    .line 252
    invoke-static {v2, v6, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 255
    move/from16 v0, v22

    if-ne v0, v4, :cond_2

    move/from16 v0, v21

    if-ne v0, v5, :cond_2

    .line 256
    const/16 v1, 0xde1

    const/4 v2, 0x0

    const/4 v6, 0x0

    invoke-static {v1, v2, v13, v6}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    :cond_0
    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/android/gallery3d/ui/UploadedTexture;->freeBitmap()V

    .line 297
    invoke-virtual/range {p0 .. p1}, Lcom/android/gallery3d/ui/UploadedTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 298
    sget-object v1, Lcom/android/gallery3d/ui/UploadedTexture;->sTextureId:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mId:I

    .line 299
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mState:I

    .line 300
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mContentValid:Z

    .line 305
    return-void

    .line 230
    :cond_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 258
    :cond_2
    :try_start_1
    invoke-static {v13}, Landroid/opengl/GLUtils;->getInternalFormat(Landroid/graphics/Bitmap;)I

    move-result v3

    .line 259
    .local v3, "format":I
    invoke-static {v13}, Landroid/opengl/GLUtils;->getType(Landroid/graphics/Bitmap;)I

    move-result v8

    .line 260
    .local v8, "type":I
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v23

    .line 262
    .local v23, "config":Landroid/graphics/Bitmap$Config;
    const/16 v1, 0xde1

    const/4 v2, 0x0

    .line 263
    const/4 v6, 0x0

    const/4 v9, 0x0

    move v7, v3

    .line 262
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 265
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    .line 264
    const/16 v9, 0xde1

    const/4 v10, 0x0

    move v14, v3

    move v15, v8

    invoke-static/range {v9 .. v15}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 267
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    if-lez v1, :cond_3

    .line 269
    const/4 v1, 0x1

    move-object/from16 v0, v23

    invoke-static {v1, v0, v5}, Lcom/android/gallery3d/ui/UploadedTexture;->getBorderLine(ZLandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 270
    .local v18, "line":Landroid/graphics/Bitmap;
    const/16 v14, 0xde1

    const/4 v15, 0x0

    .line 271
    const/16 v16, 0x0

    const/16 v17, 0x0

    move/from16 v19, v3

    move/from16 v20, v8

    .line 270
    invoke-static/range {v14 .. v20}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 274
    const/4 v1, 0x0

    move-object/from16 v0, v23

    invoke-static {v1, v0, v4}, Lcom/android/gallery3d/ui/UploadedTexture;->getBorderLine(ZLandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 275
    const/16 v14, 0xde1

    const/4 v15, 0x0

    .line 276
    const/16 v16, 0x0

    const/16 v17, 0x0

    move/from16 v19, v3

    move/from16 v20, v8

    .line 275
    invoke-static/range {v14 .. v20}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 280
    .end local v18    # "line":Landroid/graphics/Bitmap;
    :cond_3
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    add-int v1, v1, v22

    if-ge v1, v4, :cond_4

    .line 281
    const/4 v1, 0x1

    move-object/from16 v0, v23

    invoke-static {v1, v0, v5}, Lcom/android/gallery3d/ui/UploadedTexture;->getBorderLine(ZLandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 283
    .restart local v18    # "line":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    add-int v16, v1, v22

    .line 282
    const/16 v14, 0xde1

    const/4 v15, 0x0

    .line 283
    const/16 v17, 0x0

    move/from16 v19, v3

    move/from16 v20, v8

    .line 282
    invoke-static/range {v14 .. v20}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 287
    .end local v18    # "line":Landroid/graphics/Bitmap;
    :cond_4
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    add-int v1, v1, v21

    if-ge v1, v5, :cond_0

    .line 288
    const/4 v1, 0x0

    move-object/from16 v0, v23

    invoke-static {v1, v0, v4}, Lcom/android/gallery3d/ui/UploadedTexture;->getBorderLine(ZLandroid/graphics/Bitmap$Config;I)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 290
    .restart local v18    # "line":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    add-int v17, v1, v21

    .line 289
    const/16 v14, 0xde1

    const/4 v15, 0x0

    .line 290
    const/16 v16, 0x0

    move/from16 v19, v3

    move/from16 v20, v8

    .line 289
    invoke-static/range {v14 .. v20}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 293
    .end local v3    # "format":I
    .end local v4    # "texWidth":I
    .end local v5    # "texHeight":I
    .end local v8    # "type":I
    .end local v18    # "line":Landroid/graphics/Bitmap;
    .end local v21    # "bHeight":I
    .end local v22    # "bWidth":I
    .end local v23    # "config":Landroid/graphics/Bitmap$Config;
    .end local v24    # "height":I
    .end local v25    # "width":I
    :catchall_0
    move-exception v1

    .line 294
    invoke-direct/range {p0 .. p0}, Lcom/android/gallery3d/ui/UploadedTexture;->freeBitmap()V

    .line 293
    throw v1

    .line 302
    :cond_5
    const/4 v1, -0x1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/gallery3d/ui/UploadedTexture;->mState:I

    .line 303
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Texture load fail, no bitmap"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getBitmapData(Landroid/graphics/Bitmap$CompressFormat;)[B
    .locals 3
    .param p1, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    const/4 v2, 0x0

    .line 331
    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 332
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 333
    return-object v2

    .line 335
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 336
    .local v1, "stream":Ljava/io/ByteArrayOutputStream;
    const/16 v2, 0x64

    invoke-virtual {v0, p1, v2, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 337
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public getHeight()I
    .locals 2

    .prologue
    .line 163
    iget v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mWidth:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getBitmap()Landroid/graphics/Bitmap;

    .line 164
    :cond_0
    iget v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mHeight:I

    return v0
.end method

.method public getTarget()I
    .locals 1

    .prologue
    .line 315
    const/16 v0, 0xde1

    return v0
.end method

.method public getWidth()I
    .locals 2

    .prologue
    .line 157
    iget v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mWidth:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getBitmap()Landroid/graphics/Bitmap;

    .line 158
    :cond_0
    iget v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mWidth:I

    return v0
.end method

.method public isContentValid()Z
    .locals 1

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mContentValid:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOpaque()Z
    .locals 1

    .prologue
    .line 323
    iget-boolean v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mOpaque:Z

    return v0
.end method

.method public isPremultiplied()Z
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isPremultiplied()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mIsPremultiplied:Z

    goto :goto_0
.end method

.method public onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 309
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/UploadedTexture;->updateContent(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 310
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->isContentValid()Z

    move-result v0

    return v0
.end method

.method protected abstract onFreeBitmap(Landroid/graphics/Bitmap;)V
.end method

.method protected abstract onGetBitmap()Landroid/graphics/Bitmap;
.end method

.method public recycle()V
    .locals 1

    .prologue
    .line 342
    invoke-super {p0}, Lcom/android/gallery3d/ui/BasicTexture;->recycle()V

    .line 343
    iget-object v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->freeBitmap()V

    .line 344
    :cond_0
    return-void
.end method

.method public setOpaque(Z)V
    .locals 0
    .param p1, "isOpaque"    # Z

    .prologue
    .line 319
    iput-boolean p1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mOpaque:Z

    .line 320
    return-void
.end method

.method public updateContent(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 7
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    const/16 v0, 0xde1

    .line 191
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_2

    .line 192
    iget-boolean v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mThrottled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/android/gallery3d/ui/UploadedTexture;->sUploadedCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/android/gallery3d/ui/UploadedTexture;->sUploadedCount:I

    const/16 v1, 0x64

    if-le v0, v1, :cond_0

    .line 193
    return-void

    .line 195
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/gallery3d/ui/UploadedTexture;->uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 206
    :cond_1
    :goto_0
    return-void

    .line 196
    :cond_2
    iget-boolean v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mContentValid:Z

    if-nez v1, :cond_1

    .line 197
    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    .line 198
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v4}, Landroid/opengl/GLUtils;->getInternalFormat(Landroid/graphics/Bitmap;)I

    move-result v5

    .line 199
    .local v5, "format":I
    invoke-static {v4}, Landroid/opengl/GLUtils;->getType(Landroid/graphics/Bitmap;)I

    move-result v6

    .line 200
    .local v6, "type":I
    iget v1, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mId:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 201
    iget v2, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    iget v3, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mBorder:I

    const/4 v1, 0x0

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 203
    invoke-direct {p0}, Lcom/android/gallery3d/ui/UploadedTexture;->freeBitmap()V

    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/gallery3d/ui/UploadedTexture;->mContentValid:Z

    goto :goto_0
.end method
