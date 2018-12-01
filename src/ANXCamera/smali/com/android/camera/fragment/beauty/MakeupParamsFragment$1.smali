.class Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;
.super Ljava/lang/Object;
.source "MakeupParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
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
    .line 72
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget v1, v1, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    iput v1, v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLastSelectedParam:I

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 74
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget v1, v1, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-static {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-wrap0(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget v1, v1, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLastSelectedParam:I

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iget v2, v2, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-wrap1(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;II)V

    .line 77
    :cond_0
    return-void
.end method
