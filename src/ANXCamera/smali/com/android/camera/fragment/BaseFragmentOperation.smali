.class public Lcom/android/camera/fragment/BaseFragmentOperation;
.super Ljava/lang/Object;
.source "BaseFragmentOperation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/BaseFragmentOperation$OperateFragment;
    }
.end annotation


# instance fields
.field public containerViewId:I
    .annotation build Landroid/support/annotation/IdRes;
    .end annotation
.end field

.field public operateType:I

.field public pendingFragmentInfo:I


# direct methods
.method private constructor <init>(I)V
    .locals 1
    .param p1, "containerViewId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 50
    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    .line 51
    return-void
.end method

.method private checkOperation()V
    .locals 2

    .prologue
    .line 105
    iget v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    if-lez v0, :cond_0

    .line 106
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "already set!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    return-void
.end method

.method public static create(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p0, "containerViewId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 54
    new-instance v0, Lcom/android/camera/fragment/BaseFragmentOperation;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentOperation;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 100
    const/4 v0, 0x7

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 101
    return-object p0
.end method

.method public popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p1, "fragmentInfo"    # I

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 86
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 87
    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    .line 88
    return-object p0
.end method

.method public push(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p1, "newFragmentInfo"    # I

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 79
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 80
    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    .line 81
    return-object p0
.end method

.method public removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 73
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 74
    return-object p0
.end method

.method public replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p1, "newFragmentInfo"    # I

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 59
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 60
    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    .line 61
    return-object p0
.end method

.method public show(I)Lcom/android/camera/fragment/BaseFragmentOperation;
    .locals 1
    .param p1, "fragmentInfo"    # I

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragmentOperation;->checkOperation()V

    .line 93
    const/4 v0, 0x6

    iput v0, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    .line 94
    iput p1, p0, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    .line 95
    return-object p0
.end method
