.class Lcom/android/camera/fragment/FragmentBeauty$1;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBeauty;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBeauty;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$1;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty$1;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->onBackEvent(I)Z

    .line 91
    return-void
.end method
