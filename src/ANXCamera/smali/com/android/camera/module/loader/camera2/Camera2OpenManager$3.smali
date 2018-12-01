.class Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;
.super Ljava/lang/Object;
.source "Camera2OpenManager.java"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->attachInObservable(Lio/reactivex/Observer;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableOnSubscribe",
        "<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 189
    .local p1, "emitter":Lio/reactivex/ObservableEmitter;, "Lio/reactivex/ObservableEmitter<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-set1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;

    .line 190
    return-void
.end method
