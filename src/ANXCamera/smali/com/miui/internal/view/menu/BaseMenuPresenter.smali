.class public abstract Lcom/miui/internal/view/menu/BaseMenuPresenter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuPresenter;


# instance fields
.field private Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

.field private Oj:I

.field private Ok:I

.field private Ol:I

.field protected mContext:Landroid/content/Context;

.field protected mInflater:Landroid/view/LayoutInflater;

.field protected mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

.field protected mMenuView:Lcom/miui/internal/view/menu/MenuView;

.field protected mSystemContext:Landroid/content/Context;

.field protected mSystemInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 5

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mSystemContext:Landroid/content/Context;

    .line 46
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    .line 47
    iput p2, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Ol:I

    .line 48
    iput p3, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Ok:I

    .line 49
    return-void
.end method


# virtual methods
.method protected addItemView(Landroid/view/View;I)V
    .registers 4

    .prologue
    .line 119
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 120
    if-eqz v0, :cond_b

    .line 121
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 123
    :cond_b
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 124
    return-void
.end method

.method public abstract bindItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Lcom/miui/internal/view/menu/MenuView$ItemView;)V
.end method

.method public collapseItemActionView(Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 4

    .prologue
    .line 199
    const/4 v0, 0x0

    return v0
.end method

.method public createItemView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView$ItemView;
    .registers 5

    .prologue
    .line 136
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Ok:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuView$ItemView;

    return-object v0
.end method

.method public expandItemActionView(Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 4

    .prologue
    .line 195
    const/4 v0, 0x0

    return v0
.end method

.method public flagActionItems()Z
    .registers 2

    .prologue
    .line 191
    const/4 v0, 0x0

    return v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 203
    iget v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oj:I

    return v0
.end method

.method public getItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .prologue
    .line 152
    instance-of v0, p2, Lcom/miui/internal/view/menu/MenuView$ItemView;

    if-eqz v0, :cond_d

    .line 153
    check-cast p2, Lcom/miui/internal/view/menu/MenuView$ItemView;

    move-object v0, p2

    .line 157
    :goto_7
    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->bindItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Lcom/miui/internal/view/menu/MenuView$ItemView;)V

    .line 158
    check-cast v0, Landroid/view/View;

    return-object v0

    .line 155
    :cond_d
    invoke-virtual {p0, p3}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->createItemView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView$ItemView;

    move-result-object v0

    goto :goto_7
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView;
    .registers 5

    .prologue
    .line 59
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-nez v0, :cond_1c

    .line 60
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Ol:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuView;

    iput-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    .line 61
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    iget-object v1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v1}, Lcom/miui/internal/view/menu/MenuView;->initialize(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 62
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->updateMenuView(Z)V

    .line 65
    :cond_1c
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    return-object v0
.end method

.method public initForMenu(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 4

    .prologue
    .line 53
    iput-object p1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mContext:Landroid/content/Context;

    .line 54
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    .line 55
    iput-object p2, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 56
    return-void
.end method

.method public onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V
    .registers 4

    .prologue
    .line 181
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_9

    .line 182
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1, p2}, Lcom/miui/internal/view/menu/MenuPresenter$Callback;->onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V

    .line 184
    :cond_9
    return-void
.end method

.method public onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z
    .registers 3

    .prologue
    .line 187
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1}, Lcom/miui/internal/view/menu/MenuPresenter$Callback;->onOpenSubMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setCallback(Lcom/miui/internal/view/menu/MenuPresenter$Callback;)V
    .registers 2

    .prologue
    .line 127
    iput-object p1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oi:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    .line 128
    return-void
.end method

.method public setId(I)V
    .registers 2

    .prologue
    .line 207
    iput p1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->Oj:I

    .line 208
    return-void
.end method

.method public shouldIncludeItem(ILcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 4

    .prologue
    .line 177
    const/4 v0, 0x1

    return v0
.end method

.method public updateMenuView(Z)V
    .registers 11

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 72
    iget-object v0, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    .line 73
    if-nez v0, :cond_9

    .line 74
    return-void

    .line 78
    :cond_9
    iget-object v1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuView;->hasBackgroundView()Z

    move-result v1

    if-eqz v1, :cond_71

    .line 79
    const/4 v1, 0x1

    .line 81
    :goto_12
    iget-object v2, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_6f

    .line 82
    iget-object v2, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Lcom/miui/internal/view/menu/MenuBuilder;->flagActionItems()V

    .line 83
    iget-object v2, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v2

    .line 84
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v5, v1

    :goto_26
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 85
    invoke-virtual {p0, v5, v1}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->shouldIncludeItem(ILcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 86
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 87
    instance-of v2, v3, Lcom/miui/internal/view/menu/MenuView$ItemView;

    if-eqz v2, :cond_59

    move-object v2, v3

    .line 88
    check-cast v2, Lcom/miui/internal/view/menu/MenuView$ItemView;

    invoke-interface {v2}, Lcom/miui/internal/view/menu/MenuView$ItemView;->getItemData()Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v2

    .line 89
    :goto_47
    invoke-virtual {p0, v1, v3, v0}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->getItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    .line 90
    if-eq v1, v2, :cond_50

    .line 92
    invoke-virtual {v8, v4}, Landroid/view/View;->setPressed(Z)V

    .line 96
    :cond_50
    if-eq v8, v3, :cond_55

    .line 97
    invoke-virtual {p0, v8, v5}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->addItemView(Landroid/view/View;I)V

    .line 99
    :cond_55
    add-int/lit8 v1, v5, 0x1

    :goto_57
    move v5, v1

    goto :goto_26

    :cond_59
    move-object v2, v6

    .line 88
    goto :goto_47

    .line 105
    :cond_5b
    :goto_5b
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v5, v1, :cond_6c

    .line 106
    iget-object v1, p0, Lcom/miui/internal/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    invoke-interface {v1, v5}, Lcom/miui/internal/view/menu/MenuView;->filterLeftoverView(I)Z

    move-result v1

    if-nez v1, :cond_5b

    .line 107
    add-int/lit8 v5, v5, 0x1

    goto :goto_5b

    .line 110
    :cond_6c
    return-void

    :cond_6d
    move v1, v5

    goto :goto_57

    :cond_6f
    move v5, v1

    goto :goto_5b

    :cond_71
    move v1, v4

    goto :goto_12
.end method
