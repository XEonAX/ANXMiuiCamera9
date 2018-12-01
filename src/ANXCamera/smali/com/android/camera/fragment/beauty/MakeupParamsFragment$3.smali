.class Lcom/android/camera/fragment/beauty/MakeupParamsFragment$3;
.super Ljava/lang/Object;
.source "MakeupParamsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
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
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$3;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    .line 125
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
    .line 128
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$3;->this$0:Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    iput p3, v2, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    .line 130
    packed-switch p3, :pswitch_data_0

    .line 144
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 147
    .local v1, "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :goto_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/BeautyParameters;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 149
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 150
    const/16 v3, 0xb4

    .line 149
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 151
    .local v0, "mp":Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 152
    return-void

    .line 132
    .end local v0    # "mp":Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_0
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 135
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_1
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 138
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_2
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 141
    .end local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    :pswitch_3
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .restart local v1    # "type":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    goto :goto_0

    .line 130
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
