.class Lcom/android/camera/fragment/sticker/FragmentSticker$2;
.super Ljava/lang/Object;
.source "FragmentSticker.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


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
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 3
    .param p1, "group"    # Landroid/widget/RadioGroup;
    .param p2, "checkedId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 80
    packed-switch p2, :pswitch_data_0

    .line 90
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get1(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get1(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;->onChanged()V

    .line 93
    :cond_0
    return-void

    .line 82
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get3(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/ui/NoScrollViewPager;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 85
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker$2;->this$0:Lcom/android/camera/fragment/sticker/FragmentSticker;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->-get3(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/ui/NoScrollViewPager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 80
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a004c
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
