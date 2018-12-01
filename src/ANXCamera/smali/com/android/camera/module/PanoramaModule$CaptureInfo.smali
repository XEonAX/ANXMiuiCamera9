.class Lcom/android/camera/module/PanoramaModule$CaptureInfo;
.super Ljava/lang/Object;
.source "PanoramaModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/PanoramaModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CaptureInfo"
.end annotation


# instance fields
.field mId:I

.field mStatus:I

.field final synthetic this$0:Lcom/android/camera/module/PanoramaModule;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/PanoramaModule;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;
    .param p2, "id"    # I
    .param p3, "status"    # I

    .prologue
    .line 847
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$CaptureInfo;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 848
    iput p2, p0, Lcom/android/camera/module/PanoramaModule$CaptureInfo;->mId:I

    .line 849
    iput p3, p0, Lcom/android/camera/module/PanoramaModule$CaptureInfo;->mStatus:I

    .line 850
    return-void
.end method
