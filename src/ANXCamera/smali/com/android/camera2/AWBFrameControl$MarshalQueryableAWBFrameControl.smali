.class public Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;
.super Ljava/lang/Object;
.source "AWBFrameControl.java"

# interfaces
.implements Landroid/hardware/camera2/marshal/MarshalQueryable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/AWBFrameControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MarshalQueryableAWBFrameControl"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/hardware/camera2/marshal/MarshalQueryable",
        "<",
        "Lcom/android/camera2/AWBFrameControl;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createMarshaler(Landroid/hardware/camera2/utils/TypeReference;I)Landroid/hardware/camera2/marshal/Marshaler;
    .locals 1
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference",
            "<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;I)",
            "Landroid/hardware/camera2/marshal/Marshaler",
            "<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Lcom/android/camera2/AWBFrameControl;>;"
    new-instance v0, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl$MarshalerAWBFrameControl;-><init>(Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;Landroid/hardware/camera2/utils/TypeReference;I)V

    return-object v0
.end method

.method public isTypeMappingSupported(Landroid/hardware/camera2/utils/TypeReference;I)Z
    .locals 2
    .param p2, "nativeType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/utils/TypeReference",
            "<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .local p1, "managedType":Landroid/hardware/camera2/utils/TypeReference;, "Landroid/hardware/camera2/utils/TypeReference<Lcom/android/camera2/AWBFrameControl;>;"
    const/4 v0, 0x0

    .line 71
    if-nez p2, :cond_0

    const-class v0, Lcom/android/camera2/AWBFrameControl;

    invoke-virtual {p1}, Landroid/hardware/camera2/utils/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_0
    return v0
.end method
