.class public Lmiui/app/AlertDialog;
.super Landroid/app/Dialog;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/AlertDialog$Builder;
    }
.end annotation


# static fields
.field public static final THEME_DARK:I = 0x2

.field public static final THEME_DARK_EDIT:I = 0x4

.field public static final THEME_DARK_EDIT_DEFAULT:I = 0x6

.field public static final THEME_LIGHT:I = 0x3

.field public static final THEME_LIGHT_EDIT:I = 0x5

.field public static final THEME_LIGHT_EDIT_DEFAULT:I = 0x7


# instance fields
.field private El:Lcom/miui/internal/variable/AlertControllerWrapper;


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lmiui/app/AlertDialog;->pv(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lmiui/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 92
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .registers 5

    .prologue
    .line 95
    invoke-static {p1, p2}, Lmiui/app/AlertDialog;->pv(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 96
    new-instance v0, Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {p0}, Lmiui/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-direct {v0, p1, p0, v1}, Lcom/miui/internal/variable/AlertControllerWrapper;-><init>(Landroid/content/Context;Landroid/content/DialogInterface;Landroid/view/Window;)V

    iput-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    .line 97
    return-void
.end method

.method static pv(Landroid/content/Context;I)I
    .registers 6

    .prologue
    .line 116
    packed-switch p1, :pswitch_data_2e

    .line 142
    const/high16 v0, 0x1000000

    if-lt p1, v0, :cond_1a

    .line 153
    :goto_7
    return p1

    .line 118
    :pswitch_8
    sget p1, Lmiui/R$style;->Theme_Dark_Dialog_Alert:I

    goto :goto_7

    .line 122
    :pswitch_b
    sget p1, Lmiui/R$style;->Theme_Light_Dialog_Alert:I

    goto :goto_7

    .line 126
    :pswitch_e
    sget p1, Lcom/miui/internal/R$style;->Theme_Dark_Dialog_Edit:I

    goto :goto_7

    .line 130
    :pswitch_11
    sget p1, Lcom/miui/internal/R$style;->Theme_Light_Dialog_Edit:I

    goto :goto_7

    .line 134
    :pswitch_14
    sget p1, Lcom/miui/internal/R$style;->Theme_Dark_Dialog_Edit_Default:I

    goto :goto_7

    .line 138
    :pswitch_17
    sget p1, Lcom/miui/internal/R$style;->Theme_Light_Dialog_Edit_Default:I

    goto :goto_7

    .line 145
    :cond_1a
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 146
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010309

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 147
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_7

    .line 116
    nop

    :pswitch_data_2e
    .packed-switch 0x2
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
    .end packed-switch
.end method

.method static synthetic pw(Lmiui/app/AlertDialog;)Lcom/miui/internal/variable/AlertControllerWrapper;
    .registers 2

    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    return-object v0
.end method


# virtual methods
.method public getButton(I)Landroid/widget/Button;
    .registers 3

    .prologue
    .line 167
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method public getCheckedItems()[Z
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->getCheckedItems()[Z

    move-result-object v0

    return-object v0
.end method

.method public getListView()Landroid/widget/ListView;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->getListView()Landroid/widget/ListView;

    move-result-object v0

    return-object v0
.end method

.method public getMessageView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    return-object v0
.end method

.method public getMiuiActionBar()Lmiui/app/ActionBar;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->getImpl()Lcom/miui/internal/app/AlertControllerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/app/AlertControllerImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->isChecked()Z

    move-result v0

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3

    .prologue
    .line 101
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 102
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0}, Lcom/miui/internal/variable/AlertControllerWrapper;->installContent()V

    .line 103
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    .prologue
    .line 290
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/variable/AlertControllerWrapper;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    .prologue
    .line 285
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/variable/AlertControllerWrapper;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .registers 6

    .prologue
    .line 242
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    .line 243
    return-void
.end method

.method public setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V
    .registers 6

    .prologue
    .line 228
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, p3}, Lcom/miui/internal/variable/AlertControllerWrapper;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    .line 229
    return-void
.end method

.method public setCustomTitle(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 190
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setCustomTitle(Landroid/view/View;)V

    .line 191
    return-void
.end method

.method public setIcon(I)V
    .registers 3

    .prologue
    .line 251
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setIcon(I)V

    .line 252
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 255
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 256
    return-void
.end method

.method public setIconAttribute(I)V
    .registers 4

    .prologue
    .line 264
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {p0}, Lmiui/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lmiui/util/AttributeResolver;->resolve(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setIcon(I)V

    .line 265
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 198
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setMessage(Ljava/lang/CharSequence;)V

    .line 199
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 181
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 182
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setTitle(Ljava/lang/CharSequence;)V

    .line 183
    return-void
.end method

.method public setView(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 214
    iget-object v0, p0, Lmiui/app/AlertDialog;->El:Lcom/miui/internal/variable/AlertControllerWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/internal/variable/AlertControllerWrapper;->setView(Landroid/view/View;)V

    .line 215
    return-void
.end method
