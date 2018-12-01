.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$EffectCropViewController;
.implements Lcom/android/camera/protocol/ModeProtocol$IndicatorProtocol;


# virtual methods
.method public abstract getPreviewWidth()I
.end method

.method public abstract hideDelayNumber()V
.end method

.method public abstract hideReviewViews()V
.end method

.method public abstract onViewTouchEvent(ILandroid/view/MotionEvent;)Z
.end method

.method public abstract performHapticFeedback(I)V
.end method

.method public abstract setPreviewAspectRatio(F)V
.end method

.method public abstract showDelayNumber(I)V
.end method

.method public abstract showReviewViews(Landroid/graphics/Bitmap;)V
.end method
