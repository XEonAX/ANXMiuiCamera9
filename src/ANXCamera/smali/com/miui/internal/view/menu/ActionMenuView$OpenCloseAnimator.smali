.class Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OpenCloseAnimator"
.end annotation


# instance fields
.field Oe:Landroid/animation/Animator;

.field Of:Landroid/animation/Animator;

.field Og:Z

.field final synthetic Oh:Lcom/miui/internal/view/menu/ActionMenuView;


# direct methods
.method public constructor <init>(Lcom/miui/internal/view/menu/ActionMenuView;)V
    .registers 2

    .prologue
    .line 295
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    return-void
.end method


# virtual methods
.method cancel()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 324
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->initialize()V

    .line 326
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Of:Landroid/animation/Animator;

    if-eqz v0, :cond_f

    .line 327
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Of:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 328
    iput-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Of:Landroid/animation/Animator;

    .line 330
    :cond_f
    return-void
.end method

.method close()V
    .registers 2

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->cancel()V

    .line 319
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Og:Z

    .line 320
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oe:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 321
    return-void
.end method

.method initialize()V
    .registers 5

    .prologue
    .line 299
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oe:Landroid/animation/Animator;

    if-nez v0, :cond_31

    .line 300
    const-string/jumbo v0, "TranslationY"

    const/4 v1, 0x1

    new-array v1, v1, [F

    .line 301
    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v2}, Lcom/miui/internal/view/menu/ActionMenuView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 300
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oe:Landroid/animation/Animator;

    .line 302
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oe:Landroid/animation/Animator;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/ActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 303
    const/high16 v2, 0x10e0000

    .line 302
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 304
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oe:Landroid/animation/Animator;

    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 306
    :cond_31
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    .prologue
    .line 344
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .prologue
    .line 339
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Of:Landroid/animation/Animator;

    .line 340
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    .prologue
    .line 348
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    .prologue
    .line 334
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Of:Landroid/animation/Animator;

    .line 335
    return-void
.end method

.method sN()V
    .registers 2

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->cancel()V

    .line 311
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Og:Z

    .line 312
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->sO(F)V

    .line 313
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuView;->startLayoutAnimation()V

    .line 314
    return-void
.end method

.method public sO(F)V
    .registers 4

    .prologue
    .line 290
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 291
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->Oh:Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v1, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 290
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 293
    :cond_15
    return-void
.end method