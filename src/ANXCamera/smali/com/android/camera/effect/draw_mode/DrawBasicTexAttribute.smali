.class public Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawBasicTexAttribute.java"


# instance fields
.field public mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field public mHeight:I

.field public mIsSnapshot:Z

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V
    .locals 1
    .param p1, "texture"    # Lcom/android/gallery3d/ui/BasicTexture;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    .line 15
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    .line 16
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    .line 17
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    .line 18
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    .line 19
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 20
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mTarget:I

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mIsSnapshot:Z

    .line 22
    return-void
.end method


# virtual methods
.method public init(Lcom/android/gallery3d/ui/BasicTexture;IIII)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 1
    .param p1, "texture"    # Lcom/android/gallery3d/ui/BasicTexture;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 44
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    .line 45
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    .line 46
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    .line 47
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    .line 48
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 49
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mTarget:I

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mIsSnapshot:Z

    .line 51
    return-object p0
.end method

.method public init(Lcom/android/gallery3d/ui/BasicTexture;IIIIZ)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .locals 1
    .param p1, "texture"    # Lcom/android/gallery3d/ui/BasicTexture;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "isSnapshot"    # Z

    .prologue
    .line 56
    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    .line 57
    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    .line 58
    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    .line 59
    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    .line 60
    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 61
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mTarget:I

    .line 62
    iput-boolean p6, p0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mIsSnapshot:Z

    .line 63
    return-object p0
.end method
