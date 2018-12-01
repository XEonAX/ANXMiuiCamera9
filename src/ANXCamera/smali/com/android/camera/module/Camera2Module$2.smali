.class Lcom/android/camera/module/Camera2Module$2;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->multiCapture()Z
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$2;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 424
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
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 427
    .local p1, "observableEmitter":Lio/reactivex/ObservableEmitter;, "Lio/reactivex/ObservableEmitter<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$2;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->-set2(Lcom/android/camera/module/Camera2Module;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;

    .line 428
    return-void
.end method
