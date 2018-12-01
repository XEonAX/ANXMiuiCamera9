.class public Lcom/android/camera/ui/ColorActivateTextView;
.super Landroid/widget/TextView;
.source "ColorActivateTextView.java"


# instance fields
.field private mActivateColor:I

.field private mNormalCor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    return-void
.end method


# virtual methods
.method public setActivateColor(I)V
    .locals 0
    .param p1, "activateColor"    # I

    .prologue
    .line 18
    iput p1, p0, Lcom/android/camera/ui/ColorActivateTextView;->mActivateColor:I

    .line 19
    return-void
.end method

.method public setActivated(Z)V
    .locals 1
    .param p1, "activated"    # Z

    .prologue
    .line 39
    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/camera/ui/ColorActivateTextView;->mActivateColor:I

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ColorActivateTextView;->setTextColor(I)V

    .line 40
    invoke-super {p0, p1}, Landroid/widget/TextView;->setActivated(Z)V

    .line 41
    return-void

    .line 39
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/ColorActivateTextView;->mNormalCor:I

    goto :goto_0
.end method

.method public setNormalCor(I)V
    .locals 0
    .param p1, "normalCor"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/android/camera/ui/ColorActivateTextView;->mNormalCor:I

    .line 23
    return-void
.end method
