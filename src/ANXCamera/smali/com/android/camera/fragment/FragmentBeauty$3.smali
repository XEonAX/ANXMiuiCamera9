.class Lcom/android/camera/fragment/FragmentBeauty$3;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBeauty;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mPrePosition:I

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBeauty;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->mPrePosition:I

    .line 1
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 160
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 124
    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->mPrePosition:I

    .line 125
    return-void
.end method

.method public onPageSelected(I)V
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 129
    const/4 v3, 0x5

    .line 130
    .local v3, "type":I
    packed-switch p1, :pswitch_data_0

    .line 143
    :cond_0
    :goto_0
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 144
    const/16 v5, 0xb9

    .line 143
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;

    .line 145
    .local v2, "faceBeautyProtocol":Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;
    if-eqz v2, :cond_1

    .line 146
    const/4 v4, 0x3

    if-ne v4, v3, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-interface {v2, v4}, Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;->onFaceBeautySwitched(Z)V

    .line 150
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 151
    const/16 v5, 0xa0

    .line 150
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 152
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_3

    .line 153
    return-void

    .line 134
    .end local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    .end local v2    # "faceBeautyProtocol":Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;
    :pswitch_1
    const/4 v3, 0x3

    .line 136
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xaf

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 137
    .local v1, "bottomPopupTips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    if-eqz v1, :cond_0

    .line 138
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    goto :goto_0

    .line 146
    .end local v1    # "bottomPopupTips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    .restart local v2    # "faceBeautyProtocol":Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 155
    .restart local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    :cond_3
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 156
    return-void

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
