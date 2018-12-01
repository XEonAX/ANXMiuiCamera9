.class Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;
.super Landroid/hardware/camera2/marshal/Marshaler;
.source "AWBFrameControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarshalerAWBFrameControl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/hardware/camera2/marshal/Marshaler",
        "<",
        "Lcom/android/camera2/AWBFrameControl;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;


# direct methods
.method protected constructor <init>(Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;Landroid/hardware/camera2/utils/TypeReference;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;
    .param p3, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference",
            "<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "typeReference":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Lcom/android/camera2/AWBFrameControl;>;"
    iput-object p1, p0, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->this$1:Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/hardware/camera2/marshal/Marshaler;-><init>(Landroid/hardware/camera2/marshal/MarshalQueryable;Landroid/hardware/camera2/utils/TypeReference;I)V

    .line 37
    return-void
.end method


# virtual methods
.method public getNativeSize()I
    .locals 1

    .prologue
    .line 60
    const/16 v0, 0x10

    return v0
.end method

.method public marshal(Lcom/android/camera2/AWBFrameControl;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "value"    # Lcom/android/camera2/AWBFrameControl;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 41
    iget v0, p1, Lcom/android/camera2/AWBFrameControl;->mRGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 42
    iget v0, p1, Lcom/android/camera2/AWBFrameControl;->mGGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 43
    iget v0, p1, Lcom/android/camera2/AWBFrameControl;->mBGain:F

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 44
    iget v0, p1, Lcom/android/camera2/AWBFrameControl;->mColorTemperature:I

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 45
    return-void
.end method

.method public bridge synthetic marshal(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 0

    .prologue
    .line 39
    check-cast p1, Lcom/android/camera2/AWBFrameControl;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->marshal(Lcom/android/camera2/AWBFrameControl;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/AWBFrameControl;
    .locals 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 49
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v3

    .line 50
    .local v3, "rGain":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v2

    .line 51
    .local v2, "gGain":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    .line 53
    .local v0, "bGain":F
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 55
    .local v1, "colorTemperature":I
    new-instance v4, Lcom/android/camera2/AWBFrameControl;

    invoke-direct {v4, v3, v2, v0, v1}, Lcom/android/camera2/AWBFrameControl;-><init>(FFFI)V

    return-object v4
.end method

.method public bridge synthetic unmarshal(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;->unmarshal(Ljava/nio/ByteBuffer;)Lcom/android/camera2/AWBFrameControl;

    move-result-object v0

    return-object v0
.end method
