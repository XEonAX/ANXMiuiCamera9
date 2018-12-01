.class Lcom/android/camera/fragment/top/FragmentTopConfig$2;
.super Ljava/lang/Object;
.source "FragmentTopConfig.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/top/FragmentTopConfig;->removeConfigItem(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/FragmentTopConfig;

.field final synthetic val$newFilterView:Landroid/view/View;

.field final synthetic val$oldFilterView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/FragmentTopConfig;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/top/FragmentTopConfig;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->this$0:Lcom/android/camera/fragment/top/FragmentTopConfig;

    iput-object p2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->val$oldFilterView:Landroid/view/View;

    iput-object p3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->val$newFilterView:Landroid/view/View;

    .line 921
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 925
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->val$oldFilterView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 926
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->val$oldFilterView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 931
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig$2;->val$newFilterView:Landroid/view/View;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 932
    return-void
.end method
