.class public Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "LensDirtyDetectDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method private adjustView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    .line 62
    .local v1, "rect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 64
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    iget v2, v1, Landroid/graphics/Rect;->top:I

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 65
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 66
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    mul-int/lit8 v2, v2, 0x4

    div-int/lit8 v2, v2, 0x3

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 67
    return-void
.end method


# virtual methods
.method public onBackEvent(I)Z
    .locals 1
    .param p1, "callingFrom"    # I

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->dismissAllowingStateLoss()V

    .line 100
    packed-switch p1, :pswitch_data_0

    .line 106
    const/4 v0, 0x0

    return v0

    .line 103
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 100
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 93
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->onBackEvent(I)Z

    .line 94
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object v0

    .line 51
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 52
    .local v1, "window":Landroid/view/Window;
    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    .line 54
    sget-boolean v2, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v2, :cond_0

    .line 55
    const/16 v2, 0x700

    invoke-virtual {v1, v2}, Landroid/view/Window;->addExtraFlags(I)V

    .line 57
    :cond_0
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 37
    const v3, 0x7f04000a

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 38
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    const v3, 0x7f0a002c

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 40
    .local v1, "title":Landroid/widget/TextView;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v3

    .line 41
    const/4 v4, 0x1

    .line 40
    if-ne v3, v4, :cond_0

    const/4 v0, 0x1

    .line 42
    .local v0, "isFrontCamera":Z
    :goto_0
    if-eqz v0, :cond_1

    const v3, 0x7f0f01d2

    :goto_1
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 44
    const v3, 0x7f0a002b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->adjustView(Landroid/view/View;)V

    .line 45
    return-object v2

    .line 40
    .end local v0    # "isFrontCamera":Z
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "isFrontCamera":Z
    goto :goto_0

    .line 43
    :cond_1
    const v3, 0x7f0f01d1

    goto :goto_1
.end method

.method public onDestroyView()V
    .locals 3

    .prologue
    .line 86
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xab

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 87
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 88
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 89
    return-void
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 112
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 113
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->onBackEvent(I)Z

    .line 114
    return v1

    .line 116
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 71
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 72
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 73
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 77
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 79
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xab

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 80
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->addInBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 81
    return-void
.end method
