.class public Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "PortraitNewbieDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method private adjustViewHeight(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v2, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 64
    .local v2, "screenWidth":I
    int-to-float v4, v2

    const/high16 v5, 0x3f400000    # 0.75f

    div-float/2addr v4, v5

    float-to-int v1, v4

    .line 65
    .local v1, "newHeight":I
    sget v4, Lcom/android/camera/Util;->sWindowHeight:I

    sub-int/2addr v4, v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v5

    sub-int v3, v4, v5

    .line 67
    .local v3, "topMargin":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 68
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-eq v4, v1, :cond_0

    .line 69
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 70
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 72
    :cond_0
    return-void
.end method

.method private resumeMode()V
    .locals 9

    .prologue
    const/16 v8, 0xab

    .line 115
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 116
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 118
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->isAdded()Z

    move-result v6

    if-nez v6, :cond_0

    .line 119
    return-void

    .line 121
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Lcom/android/camera/Camera;

    .line 122
    .local v2, "camera":Lcom/android/camera/Camera;
    invoke-virtual {v2}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 123
    return-void

    .line 126
    :cond_1
    invoke-virtual {v2}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 127
    return-void

    .line 129
    :cond_2
    sget-object v6, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v6}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackScenarioAbort(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 132
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    check-cast v6, Lcom/android/camera/Camera;

    invoke-virtual {v6}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/BaseModule;

    .line 133
    .local v1, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/android/camera/module/BaseModule;->setCameraDevice(Lcom/android/camera2/Camera2Proxy;)V

    .line 135
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v6

    .line 136
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v7

    .line 135
    invoke-virtual {v1, v6, v7}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 137
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 138
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 141
    new-instance v3, Lcom/android/camera/module/loader/FunctionDataSetup;

    invoke-direct {v3, v8}, Lcom/android/camera/module/loader/FunctionDataSetup;-><init>(I)V

    .line 142
    .local v3, "dataSetup":Lcom/android/camera/module/loader/FunctionDataSetup;
    new-instance v5, Lcom/android/camera/module/loader/FunctionUISetup;

    const/4 v6, 0x1

    invoke-direct {v5, v8, v6}, Lcom/android/camera/module/loader/FunctionUISetup;-><init>(IZ)V

    .line 145
    .local v5, "uiSetup":Lcom/android/camera/module/loader/FunctionUISetup;
    :try_start_0
    invoke-static {v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/android/camera/module/loader/FunctionDataSetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    .line 146
    invoke-static {v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/camera/module/loader/FunctionUISetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    :goto_0
    return-void

    .line 147
    :catch_0
    move-exception v4

    .line 148
    .local v4, "e":Ljava/lang/Exception;
    const-string/jumbo v6, "PortraitHint"

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onBackEvent(I)Z
    .locals 1
    .param p1, "callingFrom"    # I

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->dismissAllowingStateLoss()V

    .line 156
    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->resumeMode()V

    .line 158
    packed-switch p1, :pswitch_data_0

    .line 164
    const/4 v0, 0x0

    return v0

    .line 161
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 158
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 110
    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->resumeMode()V

    .line 111
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 105
    :goto_0
    return-void

    .line 100
    :pswitch_0
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->onBackEvent(I)Z

    goto :goto_0

    .line 98
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a002d
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object v0

    .line 54
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 55
    .local v1, "window":Landroid/view/Window;
    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    .line 56
    sget-boolean v2, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v2, :cond_0

    .line 57
    const/16 v2, 0x700

    invoke-virtual {v1, v2}, Landroid/view/Window;->addExtraFlags(I)V

    .line 59
    :cond_0
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
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
    .line 45
    const v1, 0x7f04000b

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 46
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f0a002d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const v1, 0x7f0a002e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->adjustViewHeight(Landroid/view/View;)V

    .line 48
    return-object v0
.end method

.method public onDestroyView()V
    .locals 3

    .prologue
    .line 91
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xab

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 92
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 93
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 94
    return-void
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 170
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 171
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->onBackEvent(I)Z

    .line 172
    return v1

    .line 173
    :cond_0
    const/16 v0, 0x19

    if-eq p2, v0, :cond_1

    const/16 v0, 0x18

    if-ne p2, v0, :cond_2

    .line 175
    :cond_1
    return v1

    .line 177
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 76
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 77
    invoke-virtual {p0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 78
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
    .line 82
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 84
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xab

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 85
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->addInBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 86
    return-void
.end method
