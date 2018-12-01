.class public Lcom/android/camera/CameraSize;
.super Ljava/lang/Object;
.source "CameraSize.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/android/camera/CameraSize;",
        ">;"
    }
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput p1, p0, Lcom/android/camera/CameraSize;->width:I

    .line 68
    iput p2, p0, Lcom/android/camera/CameraSize;->height:I

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p0, p1}, Lcom/android/camera/CameraSize;->parseString(Ljava/lang/String;)V

    .line 35
    return-void
.end method


# virtual methods
.method public area()I
    .locals 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v0, v1

    goto :goto_0
.end method

.method public compareTo(Lcom/android/camera/CameraSize;)I
    .locals 3
    .param p1, "another"    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 113
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v0, v1

    iget v1, p1, Lcom/android/camera/CameraSize;->width:I

    iget v2, p1, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v1, v2

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 111
    check-cast p1, Lcom/android/camera/CameraSize;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraSize;->compareTo(Lcom/android/camera/CameraSize;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 87
    if-nez p1, :cond_0

    .line 88
    return v2

    .line 90
    :cond_0
    if-ne p0, p1, :cond_1

    .line 91
    return v1

    .line 93
    :cond_1
    instance-of v3, p1, Lcom/android/camera/CameraSize;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 94
    check-cast v0, Lcom/android/camera/CameraSize;

    .line 95
    .local v0, "cameraSize":Lcom/android/camera/CameraSize;
    iget v3, p0, Lcom/android/camera/CameraSize;->width:I

    iget v4, v0, Lcom/android/camera/CameraSize;->width:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Lcom/android/camera/CameraSize;->height:I

    iget v4, v0, Lcom/android/camera/CameraSize;->height:I

    if-ne v3, v4, :cond_2

    :goto_0
    return v1

    :cond_2
    move v1, v2

    goto :goto_0

    .line 97
    .end local v0    # "cameraSize":Lcom/android/camera/CameraSize;
    :cond_3
    return v2
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/android/camera/CameraSize;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 108
    iget v0, p0, Lcom/android/camera/CameraSize;->height:I

    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    shl-int/lit8 v1, v1, 0x10

    iget v2, p0, Lcom/android/camera/CameraSize;->width:I

    ushr-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    xor-int/2addr v0, v1

    return v0
.end method

.method public isAspectRatio16_9()Z
    .locals 2

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    const/4 v0, 0x0

    return v0

    .line 135
    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio16_9(II)Z

    move-result v0

    return v0
.end method

.method public isAspectRatio18_9()Z
    .locals 2

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const/4 v0, 0x0

    return v0

    .line 128
    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio18_9(II)Z

    move-result v0

    return v0
.end method

.method public isAspectRatio1_1()Z
    .locals 2

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    const/4 v0, 0x0

    return v0

    .line 149
    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio1_1(II)Z

    move-result v0

    return v0
.end method

.method public isAspectRatio4_3()Z
    .locals 2

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    const/4 v0, 0x0

    return v0

    .line 142
    :cond_0
    iget v0, p0, Lcom/android/camera/CameraSize;->width:I

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 117
    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    iget v2, p0, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v1, v2

    if-gtz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public parseSize(Lcom/android/camera/CameraSize;)Lcom/android/camera/CameraSize;
    .locals 1
    .param p1, "cameraSize"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 72
    iget v0, p1, Lcom/android/camera/CameraSize;->width:I

    iput v0, p0, Lcom/android/camera/CameraSize;->width:I

    .line 73
    iget v0, p1, Lcom/android/camera/CameraSize;->height:I

    iput v0, p0, Lcom/android/camera/CameraSize;->height:I

    .line 74
    return-object p0
.end method

.method public parseString(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 38
    if-nez p1, :cond_0

    const/4 v0, -0x1

    .line 39
    .local v0, "index":I
    :goto_0
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 40
    iput v2, p0, Lcom/android/camera/CameraSize;->width:I

    .line 41
    iput v2, p0, Lcom/android/camera/CameraSize;->height:I

    .line 46
    :goto_1
    return-void

    .line 38
    .end local v0    # "index":I
    :cond_0
    const/16 v1, 0x78

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .restart local v0    # "index":I
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/CameraSize;->width:I

    .line 44
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/CameraSize;->height:I

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
