.class public Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;
.super Ljava/lang/Object;
.source "MakeupSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MakeupItem"
.end annotation


# instance fields
.field private mImageResource:I

.field private mTextResource:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "image"    # I
    .param p2, "name"    # I

    .prologue
    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    .line 191
    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    .line 192
    return-void
.end method


# virtual methods
.method public getImageResource()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->mTextResource:I

    return v0
.end method
