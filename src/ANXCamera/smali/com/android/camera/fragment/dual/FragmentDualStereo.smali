.class public Lcom/android/camera/fragment/dual/FragmentDualStereo;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentDualStereo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/camera/fragment/manually/ManuallyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$DualController;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 45
    const/16 v0, 0xff5

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public hideZoomButton()V
    .locals 0

    .prologue
    .line 81
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 36
    return-void
.end method

.method public isZoomVisible()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public onBackEvent(I)Z
    .locals 1
    .param p1, "callingFrom"    # I

    .prologue
    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 71
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    const/4 v0, 0x0

    return v0
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;
    .param p4, "isCustomValue"    # Z

    .prologue
    .line 31
    return-void
.end method

.method public showZoomButton()V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method public updateZoomValue()V
    .locals 0

    .prologue
    .line 56
    return-void
.end method

.method public visibleHeight()I
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method
