.class public Lcom/miui/internal/view/menu/ActionMenuItemView;
.super Landroid/widget/Button;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuView$ItemView;


# instance fields
.field private OS:Z

.field private OT:Lcom/miui/internal/view/menu/MenuItemImpl;

.field private OU:Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .prologue
    .line 23
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/internal/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method


# virtual methods
.method public getItemData()Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OT:Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public initialize(Lcom/miui/internal/view/menu/MenuItemImpl;I)V
    .registers 4

    .prologue
    .line 36
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OT:Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 39
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setSelected(Z)V

    .line 41
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setTitle(Ljava/lang/CharSequence;)V

    .line 42
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 43
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setCheckable(Z)V

    .line 44
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setChecked(Z)V

    .line 45
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isEnabled()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setEnabled(Z)V

    .line 46
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setClickable(Z)V

    .line 47
    return-void
.end method

.method public performClick()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 98
    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 99
    return v3

    .line 102
    :cond_9
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OU:Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OU:Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OT:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-interface {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;->invokeItem(Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 103
    invoke-virtual {p0, v2}, Lcom/miui/internal/view/menu/ActionMenuItemView;->playSoundEffect(I)V

    .line 104
    return v3

    .line 106
    :cond_1b
    return v2
.end method

.method public prefersCondensedTitle()Z
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public setCheckable(Z)V
    .registers 2

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OS:Z

    .line 62
    return-void
.end method

.method public setChecked(Z)V
    .registers 3

    .prologue
    .line 66
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OS:Z

    if-eqz v0, :cond_7

    .line 67
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setSelected(Z)V

    .line 69
    :cond_7
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 77
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    .line 78
    if-eq v0, p1, :cond_1b

    .line 79
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuItemView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 80
    sget v1, Lcom/miui/internal/R$dimen;->action_button_icon_bounds:I

    .line 79
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 81
    invoke-virtual {p1, v3, v3, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 82
    invoke-virtual {p0, v2, p1, v2, v2}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 84
    :cond_1b
    return-void
.end method

.method public setItemInvoker(Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;)V
    .registers 2

    .prologue
    .line 111
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuItemView;->OU:Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;

    .line 112
    return-void
.end method

.method public setShortcut(ZC)V
    .registers 3

    .prologue
    .line 73
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2

    .prologue
    .line 56
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuItemView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    return-void
.end method

.method public showsIcon()Z
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x1

    return v0
.end method
