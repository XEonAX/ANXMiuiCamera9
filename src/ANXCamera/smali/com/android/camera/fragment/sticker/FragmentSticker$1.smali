.class Lcom/android/camera/fragment/sticker/FragmentSticker$1;
.super Ljava/lang/Object;
.source "FragmentSticker.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/FragmentSticker;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/sticker/FragmentSticker;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 73
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 57
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 61
    packed-switch p1, :pswitch_data_0

    .line 69
    :goto_0
    return-void

    .line 63
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get2(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0a004c

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 66
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$1;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get2(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f0a004d

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 61
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
