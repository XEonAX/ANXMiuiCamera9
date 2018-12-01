.class public Lmiui/app/AlertDialog$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

.field private En:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 303
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lmiui/app/AlertDialog;->pv(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 304
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    new-instance v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-static {p1, p2}, Lmiui/app/AlertDialog;->pv(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, p1, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v2}, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    .line 319
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v2, 0x4

    if-lt p2, v2, :cond_1d

    const/4 v2, 0x7

    if-gt p2, v2, :cond_1d

    const/4 v0, 0x1

    :cond_1d
    iput-boolean v0, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mEditMode:Z

    .line 320
    iput p2, p0, Lmiui/app/AlertDialog$Builder;->En:I

    .line 321
    return-void
.end method


# virtual methods
.method public addActionItem(III)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 599
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v0, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lmiui/app/AlertDialog$Builder;->addActionItem(Ljava/lang/CharSequence;II)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addActionItem(Ljava/lang/CharSequence;II)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 583
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v0, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mActionItems:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 584
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mActionItems:Ljava/util/ArrayList;

    .line 587
    :cond_f
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v0, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mActionItems:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;

    invoke-direct {v1, p1, p2, p3}, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;-><init>(Ljava/lang/CharSequence;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 588
    return-object p0
.end method

.method public create()Lmiui/app/AlertDialog;
    .registers 4

    .prologue
    .line 913
    new-instance v0, Lmiui/app/AlertDialog;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    iget v2, p0, Lmiui/app/AlertDialog$Builder;->En:I

    invoke-direct {v0, v1, v2}, Lmiui/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 914
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    invoke-static {v0}, Lmiui/app/AlertDialog;->pw(Lmiui/app/AlertDialog;)Lcom/miui/internal/variable/AlertControllerWrapper;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->apply(Lcom/android/internal/app/AlertController;)V

    .line 915
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-boolean v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCancelable:Z

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setCancelable(Z)V

    .line 916
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-boolean v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCancelable:Z

    if-eqz v1, :cond_25

    .line 917
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 919
    :cond_25
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 920
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 921
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnShowListener:Landroid/content/DialogInterface$OnShowListener;

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 922
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    if-eqz v1, :cond_47

    .line 923
    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 925
    :cond_47
    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 332
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v0, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 648
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mAdapter:Landroid/widget/ListAdapter;

    .line 649
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 650
    return-object p0
.end method

.method public setCancelable(Z)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 526
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-boolean p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCancelable:Z

    .line 527
    return-object p0
.end method

.method public setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 396
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-boolean p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsChecked:Z

    .line 397
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckBoxMessage:Ljava/lang/CharSequence;

    .line 398
    return-object p0
.end method

.method public setCursor(Landroid/database/Cursor;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 666
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCursor:Landroid/database/Cursor;

    .line 667
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mLabelColumn:Ljava/lang/String;

    .line 668
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 669
    return-object p0
.end method

.method public setCustomTitle(Landroid/view/View;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 366
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCustomTitleView:Landroid/view/View;

    .line 367
    return-object p0
.end method

.method public setIcon(I)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 409
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIconId:I

    .line 410
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 424
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 425
    return-object p0
.end method

.method public setIconAttribute(I)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 438
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lmiui/util/AttributeResolver;->resolve(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIconId:I

    .line 439
    return-object p0
.end method

.method public setItems(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 620
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 621
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 622
    return-object p0
.end method

.method public setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 632
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 633
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 634
    return-object p0
.end method

.method public setMessage(I)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 376
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 377
    return-object p0
.end method

.method public setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 386
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 387
    return-object p0
.end method

.method public setMultiChoiceAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnMultiChoiceClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 770
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mAdapter:Landroid/widget/ListAdapter;

    .line 771
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsMultiChoice:Z

    .line 772
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 773
    return-object p0
.end method

.method public setMultiChoiceItems(I[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 692
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 693
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 694
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItems:[Z

    .line 695
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsMultiChoice:Z

    .line 696
    return-object p0
.end method

.method public setMultiChoiceItems(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnMultiChoiceClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 7

    .prologue
    .line 746
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCursor:Landroid/database/Cursor;

    .line 747
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p4, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 748
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsCheckedColumn:Ljava/lang/String;

    .line 749
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mLabelColumn:Ljava/lang/String;

    .line 750
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsMultiChoice:Z

    .line 751
    return-object p0
.end method

.method public setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 718
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 719
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCheckboxClickListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 720
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItems:[Z

    .line 721
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsMultiChoice:Z

    .line 722
    return-object p0
.end method

.method public setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 476
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 477
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 478
    return-object p0
.end method

.method public setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 489
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 490
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 491
    return-object p0
.end method

.method public setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 502
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNeutralButtonText:Ljava/lang/CharSequence;

    .line 503
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 504
    return-object p0
.end method

.method public setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 515
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNeutralButtonText:Ljava/lang/CharSequence;

    .line 516
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mNeutralButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 517
    return-object p0
.end method

.method public setOnActionItemClickListener(Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 609
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnActionItemClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 610
    return-object p0
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 537
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 538
    return-object p0
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 548
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 549
    return-object p0
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 878
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 879
    return-object p0
.end method

.method public setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 570
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    .line 571
    return-object p0
.end method

.method public setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 559
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnShowListener:Landroid/content/DialogInterface$OnShowListener;

    .line 560
    return-object p0
.end method

.method public setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 450
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 451
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 452
    return-object p0
.end method

.method public setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 463
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 464
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 465
    return-object p0
.end method

.method public setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 792
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 793
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 794
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItem:I

    .line 795
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsSingleChoice:Z

    .line 796
    return-object p0
.end method

.method public setSingleChoiceItems(Landroid/database/Cursor;ILjava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 7

    .prologue
    .line 817
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCursor:Landroid/database/Cursor;

    .line 818
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p4, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 819
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItem:I

    .line 820
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mLabelColumn:Ljava/lang/String;

    .line 821
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsSingleChoice:Z

    .line 822
    return-object p0
.end method

.method public setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 862
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mAdapter:Landroid/widget/ListAdapter;

    .line 863
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 864
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItem:I

    .line 865
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsSingleChoice:Z

    .line 866
    return-object p0
.end method

.method public setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;
    .registers 6

    .prologue
    .line 840
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mItems:[Ljava/lang/CharSequence;

    .line 841
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 842
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput p2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mCheckedItem:I

    .line 843
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mIsSingleChoice:Z

    .line 844
    return-object p0
.end method

.method public setTitle(I)Lmiui/app/AlertDialog$Builder;
    .registers 4

    .prologue
    .line 341
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 342
    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 351
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 352
    return-object p0
.end method

.method public setView(I)Lmiui/app/AlertDialog$Builder;
    .registers 5

    .prologue
    .line 890
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iget-object v1, v1, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mInflater:Landroid/view/LayoutInflater;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mView:Landroid/view/View;

    .line 891
    return-object p0
.end method

.method public setView(Landroid/view/View;)Lmiui/app/AlertDialog$Builder;
    .registers 3

    .prologue
    .line 902
    iget-object v0, p0, Lmiui/app/AlertDialog$Builder;->Em:Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;

    iput-object p1, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams;->mView:Landroid/view/View;

    .line 903
    return-object p0
.end method

.method public show()Lmiui/app/AlertDialog;
    .registers 2

    .prologue
    .line 933
    invoke-virtual {p0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v0

    .line 934
    invoke-virtual {v0}, Lmiui/app/AlertDialog;->show()V

    .line 935
    return-object v0
.end method
