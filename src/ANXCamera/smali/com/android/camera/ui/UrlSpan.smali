.class public Lcom/android/camera/ui/UrlSpan;
.super Landroid/text/style/ClickableSpan;
.source "UrlSpan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;
    }
.end annotation


# instance fields
.field private mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V
    .locals 0
    .param p1, "l"    # Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    .line 18
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "widget"    # Landroid/view/View;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/android/camera/ui/UrlSpan;->mOnClickListener:Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;

    invoke-interface {v0}, Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;->onClick()V

    .line 31
    :cond_0
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "ds"    # Landroid/text/TextPaint;

    .prologue
    .line 22
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 23
    const v0, -0xffff01

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 24
    return-void
.end method
