.class Lcom/android/camera/module/Camera2Module$13;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->onCreate(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$13;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1886
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAvailabilityStatusFetched(I)V
    .locals 2
    .param p1, "i"    # I

    .prologue
    const/4 v0, 0x0

    .line 1889
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$13;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1, p1}, Lcom/android/camera/module/Camera2Module;->-set7(Lcom/android/camera/module/Camera2Module;I)I

    .line 1891
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$13;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->-get8(Lcom/android/camera/module/Camera2Module;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 1890
    :cond_0
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setGoogleLensAvailability(Z)V

    .line 1892
    return-void
.end method
