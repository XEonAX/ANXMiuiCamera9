.class Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/MenuPopupHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MenuAdapter"
.end annotation


# instance fields
.field final synthetic OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

.field private Oy:Lcom/miui/internal/view/menu/MenuBuilder;

.field private Oz:I


# direct methods
.method public constructor <init>(Lcom/miui/internal/view/menu/MenuPopupHelper;Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 4

    .prologue
    .line 312
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 310
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    .line 313
    iput-object p2, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 314
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->sU()V

    .line 315
    return-void
.end method

.method static synthetic sV(Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    .line 318
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sT(Lcom/miui/internal/view/menu/MenuPopupHelper;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 319
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 320
    :goto_e
    iget v1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    if-gez v1, :cond_1e

    .line 321
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 319
    :cond_17
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_e

    .line 323
    :cond_1e
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getItem(I)Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 4

    .prologue
    .line 327
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sT(Lcom/miui/internal/view/menu/MenuPopupHelper;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 328
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 329
    :goto_e
    iget v1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    if-ltz v1, :cond_18

    iget v1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    if-lt p1, v1, :cond_18

    .line 330
    add-int/lit8 p1, p1, 0x1

    .line 332
    :cond_18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0

    .line 328
    :cond_1f
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oy:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_e
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 326
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->getItem(I)Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4

    .prologue
    .line 338
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    .prologue
    const/4 v4, 0x0

    .line 342
    if-nez p2, :cond_2b

    .line 343
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sQ(Lcom/miui/internal/view/menu/MenuPopupHelper;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v1}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sS(Lcom/miui/internal/view/menu/MenuPopupHelper;)I

    move-result v1

    invoke-virtual {v0, v1, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    :goto_13
    move-object v0, v1

    .line 346
    check-cast v0, Lcom/miui/internal/view/menu/MenuView$ItemView;

    .line 347
    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    iget-boolean v2, v2, Lcom/miui/internal/view/menu/MenuPopupHelper;->Op:Z

    if-eqz v2, :cond_23

    move-object v2, v1

    .line 348
    check-cast v2, Lcom/miui/internal/view/menu/ListMenuItemView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/miui/internal/view/menu/ListMenuItemView;->setForceShowIcon(Z)V

    .line 350
    :cond_23
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->getItem(I)Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v2

    invoke-interface {v0, v2, v4}, Lcom/miui/internal/view/menu/MenuView$ItemView;->initialize(Lcom/miui/internal/view/menu/MenuItemImpl;I)V

    .line 351
    return-object v1

    :cond_2b
    move-object v1, p2

    goto :goto_13
.end method

.method public notifyDataSetChanged()V
    .registers 1

    .prologue
    .line 372
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->sU()V

    .line 373
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 374
    return-void
.end method

.method sU()V
    .registers 6

    .prologue
    .line 355
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sR(Lcom/miui/internal/view/menu/MenuPopupHelper;)Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getExpandedItem()Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v2

    .line 356
    if-eqz v2, :cond_2d

    .line 357
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->OA:Lcom/miui/internal/view/menu/MenuPopupHelper;

    invoke-static {v0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->sR(Lcom/miui/internal/view/menu/MenuPopupHelper;)Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v3

    .line 358
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 359
    const/4 v0, 0x0

    move v1, v0

    :goto_1c
    if-ge v1, v4, :cond_2d

    .line 360
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 361
    if-ne v0, v2, :cond_29

    .line 362
    iput v1, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    .line 363
    return-void

    .line 359
    :cond_29
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1c

    .line 367
    :cond_2d
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/view/menu/MenuPopupHelper$MenuAdapter;->Oz:I

    .line 368
    return-void
.end method
