.class Lcom/android/camera/fragment/beauty/BeautyLevelFragment$1;
.super Ljava/lang/Object;
.source "BeautyLevelFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/BeautyLevelFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BeautyLevelFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/BeautyLevelFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyLevelFragment$1;->this$0:Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
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
    .line 83
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyLevelFragment$1;->this$0:Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    invoke-virtual {v0, p3}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;->setBeautyLevel(I)V

    .line 84
    return-void
.end method
