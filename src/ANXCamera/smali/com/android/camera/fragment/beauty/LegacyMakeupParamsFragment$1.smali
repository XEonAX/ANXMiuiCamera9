.class Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;
.super Ljava/lang/Object;
.source "LegacyMakeupParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

    .line 41
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
    .line 44
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;->this$0:Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

    iput p3, v2, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->mSelectedParam:I

    .line 46
    packed-switch p3, :pswitch_data_0

    .line 57
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 60
    .local v1, "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :goto_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/BeautyParameters;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 62
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 63
    const/16 v3, 0xb4

    .line 62
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 64
    .local v0, "mp":Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 65
    return-void

    .line 48
    .end local v0    # "mp":Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_0
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 51
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_1
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 54
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_2
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 46
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
