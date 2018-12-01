.class Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;
.super Ljava/lang/Object;
.source "RemodelingParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    iput p3, v2, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mSelectedParam:I

    .line 78
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->-get0(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/effect/BeautyParameters$Type;

    .line 79
    .local v1, "type":Lcom/android/camera/effect/BeautyParameters$Type;
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/BeautyParameters;->setType(Lcom/android/camera/effect/BeautyParameters$Type;)V

    .line 81
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 82
    const/16 v3, 0xb4

    .line 81
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 83
    .local v0, "mp":Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 84
    return-void
.end method
