.class public Lcom/miui/internal/view/menu/MenuBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Menu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/view/menu/MenuBuilder$Callback;,
        Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;
    }
.end annotation


# static fields
.field public static final CATEGORY_MASK:I = -0x10000

.field public static final CATEGORY_SHIFT:I = 0x10

.field private static final NS:[I

.field private static final Nu:Ljava/lang/String; = "android:menu:actionviewstates"

.field private static final Nv:Ljava/lang/String; = "android:menu:expandedactionview"

.field private static final Nw:Ljava/lang/String; = "android:menu:presenters"

.field public static final USER_MASK:I = 0xffff


# instance fields
.field private NA:Lcom/miui/internal/view/menu/MenuItemImpl;

.field NB:Landroid/graphics/drawable/Drawable;

.field NC:Ljava/lang/CharSequence;

.field ND:Landroid/view/View;

.field private NE:Z

.field private NF:Z

.field private NG:Z

.field private NH:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation
.end field

.field private NI:Z

.field private NJ:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation
.end field

.field private NK:Z

.field private NL:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/miui/internal/view/menu/MenuPresenter;",
            ">;>;"
        }
    .end annotation
.end field

.field private NM:Z

.field private NN:Z

.field private final NO:Landroid/content/res/Resources;

.field private NP:Z

.field private NQ:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation
.end field

.field private NR:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation
.end field

.field private Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

.field private Ny:Landroid/view/ContextMenu$ContextMenuInfo;

.field private Nz:I

.field private mActionItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/miui/internal/view/menu/MenuBuilder;->NS:[I

    .line 38
    return-void

    .line 63
    nop

    :array_a
    .array-data 4
        0x1
        0x4
        0x5
        0x3
        0x2
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nz:I

    .line 158
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    .line 160
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    .line 162
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NK:Z

    .line 164
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NF:Z

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NQ:Ljava/util/ArrayList;

    .line 169
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 168
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 209
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mContext:Landroid/content/Context;

    .line 210
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NR:Ljava/util/ArrayList;

    .line 215
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NG:Z

    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mActionItems:Ljava/util/ArrayList;

    .line 218
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    .line 219
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 221
    invoke-direct {p0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sH(Z)V

    .line 222
    return-void
.end method

.method private sD(IZ)V
    .registers 4

    .prologue
    .line 537
    if-ltz p1, :cond_a

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_b

    .line 538
    :cond_a
    return-void

    .line 541
    :cond_b
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 543
    if-eqz p2, :cond_16

    .line 544
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 546
    :cond_16
    return-void
.end method

.method private sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V
    .registers 10

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1151
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 1153
    if-eqz p5, :cond_12

    .line 1154
    iput-object p5, p0, Lcom/miui/internal/view/menu/MenuBuilder;->ND:Landroid/view/View;

    .line 1157
    iput-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NC:Ljava/lang/CharSequence;

    .line 1158
    iput-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NB:Landroid/graphics/drawable/Drawable;

    .line 1177
    :goto_e
    invoke-virtual {p0, v3}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 1178
    return-void

    .line 1160
    :cond_12
    if-lez p1, :cond_25

    .line 1161
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NC:Ljava/lang/CharSequence;

    .line 1166
    :cond_1a
    :goto_1a
    if-lez p3, :cond_2a

    .line 1167
    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NB:Landroid/graphics/drawable/Drawable;

    .line 1173
    :cond_22
    :goto_22
    iput-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->ND:Landroid/view/View;

    goto :goto_e

    .line 1162
    :cond_25
    if-eqz p2, :cond_1a

    .line 1163
    iput-object p2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NC:Ljava/lang/CharSequence;

    goto :goto_1a

    .line 1168
    :cond_2a
    if-eqz p4, :cond_22

    .line 1169
    iput-object p4, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NB:Landroid/graphics/drawable/Drawable;

    goto :goto_22
.end method

.method private sH(Z)V
    .registers 4

    .prologue
    .line 761
    if-eqz p1, :cond_18

    .line 762
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->keyboard:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_18

    .line 763
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    sget v1, Lcom/miui/internal/R$bool;->abc_config_showMenuShortcutsWhenKeyboardPresent:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 761
    :goto_15
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NP:Z

    .line 764
    return-void

    .line 761
    :cond_18
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 13

    .prologue
    .line 416
    invoke-static {p3}, Lcom/miui/internal/view/menu/MenuBuilder;->sz(I)I

    move-result v5

    .line 418
    new-instance v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 419
    iget v7, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nz:I

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v6, p4

    .line 418
    invoke-direct/range {v0 .. v7}, Lcom/miui/internal/view/menu/MenuItemImpl;-><init>(Lcom/miui/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V

    .line 421
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Ny:Landroid/view/ContextMenu$ContextMenuInfo;

    if-eqz v1, :cond_19

    .line 423
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Ny:Landroid/view/ContextMenu$ContextMenuInfo;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tB(Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 426
    :cond_19
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-static {v2, v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sv(Ljava/util/ArrayList;I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 427
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 429
    return-object v0
.end method

.method private sr(Z)V
    .registers 5

    .prologue
    .line 257
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 258
    return-void

    .line 261
    :cond_9
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 262
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 263
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 264
    if-nez v1, :cond_2c

    .line 265
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_12

    .line 267
    :cond_2c
    invoke-interface {v1, p1}, Lcom/miui/internal/view/menu/MenuPresenter;->updateMenuView(Z)V

    goto :goto_12

    .line 270
    :cond_30
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 271
    return-void
.end method

.method private ss(Landroid/os/Bundle;)V
    .registers 6

    .prologue
    .line 317
    const-string/jumbo v0, "android:menu:presenters"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v2

    .line 319
    if-eqz v2, :cond_11

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 320
    :cond_11
    return-void

    .line 323
    :cond_12
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_18
    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 324
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 325
    if-nez v1, :cond_32

    .line 326
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_18

    .line 328
    :cond_32
    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuPresenter;->getId()I

    move-result v0

    .line 329
    if-lez v0, :cond_18

    .line 330
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    .line 331
    if-eqz v0, :cond_18

    .line 332
    invoke-interface {v1, v0}, Lcom/miui/internal/view/menu/MenuPresenter;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_18

    .line 337
    :cond_44
    return-void
.end method

.method private st(Landroid/os/Bundle;)V
    .registers 6

    .prologue
    .line 292
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 293
    return-void

    .line 296
    :cond_9
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 298
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_14
    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 299
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 300
    if-nez v1, :cond_2e

    .line 301
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_14

    .line 303
    :cond_2e
    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuPresenter;->getId()I

    move-result v0

    .line 304
    if-lez v0, :cond_14

    .line 305
    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuPresenter;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 306
    if-eqz v1, :cond_14

    .line 307
    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_14

    .line 313
    :cond_3e
    const-string/jumbo v0, "android:menu:presenters"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 314
    return-void
.end method

.method private su(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 274
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 275
    return v0

    .line 280
    :cond_a
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v0

    :goto_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 281
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 282
    if-nez v1, :cond_2d

    .line 283
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move v0, v2

    :goto_2b
    move v2, v0

    goto :goto_11

    .line 284
    :cond_2d
    if-nez v2, :cond_36

    .line 285
    invoke-interface {v1, p1}, Lcom/miui/internal/view/menu/MenuPresenter;->onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    move-result v2

    move v0, v2

    goto :goto_2b

    .line 288
    :cond_35
    return v2

    :cond_36
    move v0, v2

    goto :goto_2b
.end method

.method private static sv(Ljava/util/ArrayList;I)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;I)I"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 795
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_8
    if-ltz v1, :cond_1d

    .line 796
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 797
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getOrdering()I

    move-result v0

    if-gt v0, p1, :cond_19

    .line 798
    add-int/lit8 v0, v1, 0x1

    return v0

    .line 795
    :cond_19
    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_8

    .line 802
    :cond_1d
    return v2
.end method

.method private static sz(I)I
    .registers 3

    .prologue
    .line 728
    const/high16 v0, -0x10000

    and-int/2addr v0, p0

    shr-int/lit8 v0, v0, 0x10

    .line 730
    if-ltz v0, :cond_c

    sget-object v1, Lcom/miui/internal/view/menu/MenuBuilder;->NS:[I

    array-length v1, v1

    if-lt v0, v1, :cond_15

    .line 731
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "order does not contain a valid category."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 734
    :cond_15
    sget-object v1, Lcom/miui/internal/view/menu/MenuBuilder;->NS:[I

    aget v0, v1, v0

    shl-int/lit8 v0, v0, 0x10

    const v1, 0xffff

    and-int/2addr v1, p0

    or-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public add(I)Landroid/view/MenuItem;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 439
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v1, v1, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIII)Landroid/view/MenuItem;
    .registers 6

    .prologue
    .line 449
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 6

    .prologue
    .line 444
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/internal/view/menu/MenuBuilder;->sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 434
    invoke-direct {p0, v0, v0, v0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public addIntentOptions(IIILandroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I[Landroid/view/MenuItem;)I
    .registers 18

    .prologue
    .line 479
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 481
    const/4 v0, 0x0

    invoke-virtual {v4, p4, p5, p6, v0}, Landroid/content/pm/PackageManager;->queryIntentActivityOptions(Landroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 482
    if-eqz v5, :cond_61

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    move v3, v0

    .line 484
    :goto_12
    and-int/lit8 v0, p7, 0x1

    if-nez v0, :cond_19

    .line 485
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->removeGroup(I)V

    .line 488
    :cond_19
    const/4 v0, 0x0

    move v2, v0

    :goto_1b
    if-ge v2, v3, :cond_69

    .line 489
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 490
    new-instance v6, Landroid/content/Intent;

    .line 491
    iget v1, v0, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-gez v1, :cond_64

    move-object v1, p6

    .line 490
    :goto_2a
    invoke-direct {v6, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 492
    new-instance v1, Landroid/content/ComponentName;

    .line 493
    iget-object v7, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 494
    iget-object v8, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 492
    invoke-direct {v1, v7, v8}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 495
    invoke-virtual {v0, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    .line 496
    invoke-virtual {v0, v4}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 495
    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v1

    .line 498
    if-eqz p8, :cond_5d

    iget v6, v0, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-ltz v6, :cond_5d

    .line 499
    iget v0, v0, Landroid/content/pm/ResolveInfo;->specificIndex:I

    aput-object v1, p8, v0

    .line 488
    :cond_5d
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1b

    .line 482
    :cond_61
    const/4 v0, 0x0

    move v3, v0

    goto :goto_12

    .line 491
    :cond_64
    iget v1, v0, Landroid/content/pm/ResolveInfo;->specificIndex:I

    aget-object v1, p5, v1

    goto :goto_2a

    .line 503
    :cond_69
    return v3
.end method

.method public addMenuPresenter(Lcom/miui/internal/view/menu/MenuPresenter;)V
    .registers 4

    .prologue
    .line 236
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0, p0}, Lcom/miui/internal/view/menu/MenuPresenter;->initForMenu(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 238
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 239
    return-void
.end method

.method public addSubMenu(I)Landroid/view/SubMenu;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 459
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v1, v1, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v0

    return-object v0
.end method

.method public addSubMenu(IIII)Landroid/view/SubMenu;
    .registers 6

    .prologue
    .line 473
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v0

    return-object v0
.end method

.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 8

    .prologue
    .line 464
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/internal/view/menu/MenuBuilder;->sp(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 465
    new-instance v1, Lcom/miui/internal/view/menu/SubMenuBuilder;

    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, p0, v0}, Lcom/miui/internal/view/menu/SubMenuBuilder;-><init>(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)V

    .line 466
    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tC(Lcom/miui/internal/view/menu/SubMenuBuilder;)V

    .line 468
    return-object v1
.end method

.method public addSubMenu(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 454
    invoke-virtual {p0, v0, v0, v0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v0

    return-object v0
.end method

.method public changeMenuMode()V
    .registers 2

    .prologue
    .line 789
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

    if-eqz v0, :cond_9

    .line 790
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

    invoke-interface {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder$Callback;->onMenuModeChange(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 792
    :cond_9
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 563
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    if-eqz v0, :cond_9

    .line 564
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->collapseItemActionView(Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    .line 566
    :cond_9
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 568
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 569
    return-void
.end method

.method public clearAll()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 553
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    .line 554
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->clear()V

    .line 555
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->clearHeader()V

    .line 556
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    .line 557
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    .line 558
    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 559
    return-void
.end method

.method public clearHeader()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 1142
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NB:Landroid/graphics/drawable/Drawable;

    .line 1143
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NC:Ljava/lang/CharSequence;

    .line 1144
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->ND:Landroid/view/View;

    .line 1146
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 1147
    return-void
.end method

.method public close()V
    .registers 2

    .prologue
    .line 984
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    .line 985
    return-void
.end method

.method public collapseItemActionView(Lcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x0

    .line 1305
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    if-eq v1, p1, :cond_f

    .line 1306
    :cond_e
    return v0

    .line 1311
    :cond_f
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1312
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v0

    :goto_19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 1313
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 1314
    if-nez v1, :cond_35

    .line 1315
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move v0, v2

    :cond_33
    move v2, v0

    goto :goto_19

    .line 1316
    :cond_35
    invoke-interface {v1, p0, p1}, Lcom/miui/internal/view/menu/MenuPresenter;->collapseItemActionView(Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 1320
    :goto_3b
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 1322
    if-eqz v0, :cond_42

    .line 1323
    iput-object v4, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 1325
    :cond_42
    return v0

    :cond_43
    move v0, v2

    goto :goto_3b
.end method

.method dispatchMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4

    .prologue
    .line 782
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

    invoke-interface {v0, p1, p2}, Lcom/miui/internal/view/menu/MenuBuilder$Callback;->onMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public expandItemActionView(Lcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 1281
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1282
    return v0

    .line 1287
    :cond_a
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1288
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v0

    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 1289
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 1290
    if-nez v1, :cond_30

    .line 1291
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move v0, v2

    :cond_2e
    move v2, v0

    goto :goto_14

    .line 1292
    :cond_30
    invoke-interface {v1, p0, p1}, Lcom/miui/internal/view/menu/MenuPresenter;->expandItemActionView(Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 1296
    :goto_36
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 1298
    if-eqz v0, :cond_3d

    .line 1299
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 1301
    :cond_3d
    return v0

    :cond_3e
    move v0, v2

    goto :goto_36
.end method

.method public findGroupIndex(I)I
    .registers 3

    .prologue
    .line 674
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->findGroupIndex(II)I

    move-result v0

    return v0
.end method

.method public findGroupIndex(II)I
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 678
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v1

    .line 680
    if-gez p2, :cond_8

    move p2, v0

    .line 684
    :cond_8
    :goto_8
    if-ge p2, v1, :cond_1c

    .line 685
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 687
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v0

    if-ne v0, p1, :cond_19

    .line 688
    return p2

    .line 684
    :cond_19
    add-int/lit8 p2, p2, 0x1

    goto :goto_8

    .line 692
    :cond_1c
    const/4 v0, -0x1

    return v0
.end method

.method public findItem(I)Landroid/view/MenuItem;
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 643
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v2

    .line 644
    const/4 v0, 0x0

    move v1, v0

    :goto_7
    if-ge v1, v2, :cond_2d

    .line 645
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 646
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_18

    .line 647
    return-object v0

    .line 648
    :cond_18
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 649
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/SubMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 651
    if-eqz v0, :cond_29

    .line 652
    return-object v0

    .line 644
    :cond_29
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_7

    .line 657
    :cond_2d
    return-object v4
.end method

.method public findItemIndex(I)I
    .registers 5

    .prologue
    .line 661
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v2

    .line 663
    const/4 v0, 0x0

    move v1, v0

    :goto_6
    if-ge v1, v2, :cond_1b

    .line 664
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 665
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v0

    if-ne v0, p1, :cond_17

    .line 666
    return v1

    .line 663
    :cond_17
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_6

    .line 670
    :cond_1b
    const/4 v0, -0x1

    return v0
.end method

.method public flagActionItems()V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 1095
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    if-nez v0, :cond_6

    .line 1096
    return-void

    .line 1101
    :cond_6
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v2, v3

    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 1102
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 1103
    if-nez v1, :cond_29

    .line 1104
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move v0, v2

    :goto_27
    move v2, v0

    goto :goto_d

    .line 1106
    :cond_29
    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuPresenter;->flagActionItems()Z

    move-result v0

    or-int/2addr v0, v2

    goto :goto_27

    .line 1110
    :cond_2f
    if-eqz v2, :cond_61

    .line 1111
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mActionItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1112
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1113
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 1114
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_74

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 1115
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isActionButton()Z

    move-result v2

    if-eqz v2, :cond_5b

    .line 1116
    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mActionItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 1118
    :cond_5b
    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 1124
    :cond_61
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mActionItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1125
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1126
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1128
    :cond_74
    iput-boolean v3, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 1129
    return-void
.end method

.method public getActionItems()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1132
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->flagActionItems()V

    .line 1133
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mActionItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected getActionViewStatesKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 405
    const-string/jumbo v0, "android:menu:actionviewstates"

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 778
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getExpandedItem()Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 2

    .prologue
    .line 1329
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NA:Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public getHeaderIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 1245
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NB:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getHeaderTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1241
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NC:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getHeaderView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1249
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->ND:Landroid/view/View;

    return-object v0
.end method

.method public getItem(I)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 702
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    return-object v0
.end method

.method public getNonActionItems()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1137
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->flagActionItems()V

    .line 1138
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NJ:Ljava/util/ArrayList;

    return-object v0
.end method

.method getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 774
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NO:Landroid/content/res/Resources;

    return-object v0
.end method

.method public getRootMenu()Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 1

    .prologue
    .line 1258
    return-object p0
.end method

.method public getVisibleItems()Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1051
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NG:Z

    if-nez v0, :cond_7

    .line 1052
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NR:Ljava/util/ArrayList;

    return-object v0

    .line 1056
    :cond_7
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NR:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1058
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 1059
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1060
    iget-object v2, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NR:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 1064
    :cond_2a
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NG:Z

    .line 1065
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 1067
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NR:Ljava/util/ArrayList;

    return-object v0
.end method

.method public hasVisibleItems()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 629
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v3

    move v1, v2

    .line 631
    :goto_6
    if-ge v1, v3, :cond_1c

    .line 632
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 633
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 634
    const/4 v0, 0x1

    return v0

    .line 631
    :cond_18
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_6

    .line 638
    :cond_1c
    return v2
.end method

.method isQwertyMode()Z
    .registers 2

    .prologue
    .line 741
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NN:Z

    return v0
.end method

.method public isShortcutKey(ILandroid/view/KeyEvent;)Z
    .registers 4

    .prologue
    .line 707
    invoke-virtual {p0, p1, p2}, Lcom/miui/internal/view/menu/MenuBuilder;->sw(ILandroid/view/KeyEvent;)Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isShortcutsVisible()Z
    .registers 2

    .prologue
    .line 770
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NP:Z

    return v0
.end method

.method public performIdentifierAction(II)Z
    .registers 4

    .prologue
    .line 914
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/miui/internal/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    move-result v0

    return v0
.end method

.method public performItemAction(Landroid/view/MenuItem;I)Z
    .registers 9

    .prologue
    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 918
    check-cast p1, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 920
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isEnabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_f

    .line 921
    :cond_e
    return v2

    .line 924
    :cond_f
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->invoke()Z

    move-result v3

    .line 926
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getSupportActionProvider()Landroid/view/ActionProvider;

    move-result-object v4

    .line 927
    if-eqz v4, :cond_2f

    invoke-virtual {v4}, Landroid/view/ActionProvider;->hasSubMenu()Z

    move-result v0

    move v1, v0

    .line 928
    :goto_1e
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 929
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->expandActionView()Z

    move-result v0

    or-int/2addr v0, v3

    .line 930
    if-eqz v0, :cond_2e

    .line 931
    invoke-virtual {p0, v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    .line 954
    :cond_2e
    :goto_2e
    return v0

    :cond_2f
    move v1, v2

    .line 927
    goto :goto_1e

    .line 933
    :cond_31
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v0

    if-nez v0, :cond_39

    if-eqz v1, :cond_64

    .line 934
    :cond_39
    invoke-virtual {p0, v2}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    .line 936
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v0

    if-nez v0, :cond_4e

    .line 937
    new-instance v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2, p0, p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;-><init>(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;Lcom/miui/internal/view/menu/MenuItemImpl;)V

    invoke-virtual {p1, v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->tC(Lcom/miui/internal/view/menu/SubMenuBuilder;)V

    .line 940
    :cond_4e
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    .line 941
    if-eqz v1, :cond_59

    .line 942
    invoke-virtual {v4, v0}, Landroid/view/ActionProvider;->onPrepareSubMenu(Landroid/view/SubMenu;)V

    .line 944
    :cond_59
    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->su(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    move-result v0

    or-int/2addr v0, v3

    .line 945
    if-nez v0, :cond_2e

    .line 946
    invoke-virtual {p0, v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    goto :goto_2e

    .line 949
    :cond_64
    and-int/lit8 v0, p2, 0x1

    if-nez v0, :cond_6d

    .line 950
    invoke-virtual {p0, v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    move v0, v3

    goto :goto_2e

    :cond_6d
    move v0, v3

    goto :goto_2e
.end method

.method public performShortcut(ILandroid/view/KeyEvent;I)Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 807
    invoke-virtual {p0, p1, p2}, Lcom/miui/internal/view/menu/MenuBuilder;->sw(ILandroid/view/KeyEvent;)Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v1

    .line 811
    if-eqz v1, :cond_b

    .line 812
    invoke-virtual {p0, v1, p3}, Lcom/miui/internal/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    move-result v0

    .line 815
    :cond_b
    and-int/lit8 v1, p3, 0x2

    if-eqz v1, :cond_13

    .line 816
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    .line 819
    :cond_13
    return v0
.end method

.method public removeGroup(I)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 513
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->findGroupIndex(I)I

    move-result v3

    .line 515
    if-ltz v3, :cond_2b

    .line 516
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int v4, v0, v3

    move v0, v1

    .line 518
    :goto_10
    add-int/lit8 v2, v0, 0x1

    if-ge v0, v4, :cond_27

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v0

    if-ne v0, p1, :cond_27

    .line 520
    invoke-direct {p0, v3, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sD(IZ)V

    move v0, v2

    goto :goto_10

    .line 524
    :cond_27
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 526
    :cond_2b
    return-void
.end method

.method public removeItem(I)V
    .registers 4

    .prologue
    .line 508
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->findItemIndex(I)I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sD(IZ)V

    .line 509
    return-void
.end method

.method public removeItemAt(I)V
    .registers 3

    .prologue
    .line 549
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sD(IZ)V

    .line 550
    return-void
.end method

.method public removeMenuPresenter(Lcom/miui/internal/view/menu/MenuPresenter;)V
    .registers 5

    .prologue
    .line 248
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 249
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 250
    if-eqz v1, :cond_1c

    if-ne v1, p1, :cond_6

    .line 251
    :cond_1c
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_6

    .line 254
    :cond_22
    return-void
.end method

.method public restoreActionViewStates(Landroid/os/Bundle;)V
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 375
    if-nez p1, :cond_4

    .line 376
    return-void

    .line 380
    :cond_4
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getActionViewStatesKey()Ljava/lang/String;

    move-result-object v1

    .line 379
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v2

    .line 382
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v3

    move v1, v0

    .line 383
    :goto_11
    if-ge v1, v3, :cond_3a

    .line 384
    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 385
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    .line 386
    if-eqz v4, :cond_27

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_27

    .line 387
    invoke-virtual {v4, v2}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 389
    :cond_27
    invoke-interface {v0}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v4

    if-eqz v4, :cond_36

    .line 390
    invoke-interface {v0}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    .line 391
    invoke-virtual {v0, p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->restoreActionViewStates(Landroid/os/Bundle;)V

    .line 383
    :cond_36
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_11

    .line 395
    :cond_3a
    const-string/jumbo v0, "android:menu:expandedactionview"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 396
    if-lez v0, :cond_4c

    .line 397
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 398
    if-eqz v0, :cond_4c

    .line 399
    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    .line 402
    :cond_4c
    return-void
.end method

.method public restorePresenterStates(Landroid/os/Bundle;)V
    .registers 2

    .prologue
    .line 344
    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->ss(Landroid/os/Bundle;)V

    .line 345
    return-void
.end method

.method sA(Lcom/miui/internal/view/menu/MenuItemImpl;)V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1046
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 1047
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 1048
    return-void
.end method

.method sB(Lcom/miui/internal/view/menu/MenuItemImpl;)V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1035
    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NG:Z

    .line 1036
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 1037
    return-void
.end method

.method sC(Z)V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 995
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    if-nez v0, :cond_f

    .line 996
    if-eqz p1, :cond_b

    .line 997
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NG:Z

    .line 998
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NE:Z

    .line 1001
    :cond_b
    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->sr(Z)V

    .line 1005
    :goto_e
    return-void

    .line 1003
    :cond_f
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    goto :goto_e
.end method

.method sE(Landroid/view/MenuItem;)V
    .registers 6

    .prologue
    .line 572
    invoke-interface {p1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v2

    .line 574
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 575
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v1

    if-ne v1, v2, :cond_a

    .line 576
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isExclusiveCheckable()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 579
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 584
    if-ne v0, p1, :cond_2f

    const/4 v1, 0x1

    :goto_2b
    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tD(Z)V

    goto :goto_a

    :cond_2f
    const/4 v1, 0x0

    goto :goto_2b

    .line 587
    :cond_31
    return-void
.end method

.method sG(Z)V
    .registers 2

    .prologue
    .line 1273
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NK:Z

    .line 1274
    return-void
.end method

.method public saveActionViewStates(Landroid/os/Bundle;)V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 350
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->size()I

    move-result v3

    .line 351
    const/4 v0, 0x0

    move v2, v0

    move-object v0, v1

    :goto_8
    if-ge v2, v3, :cond_4c

    .line 352
    invoke-virtual {p0, v2}, Lcom/miui/internal/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 353
    invoke-interface {v4}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v1

    .line 354
    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_4a

    .line 355
    if-nez v0, :cond_22

    .line 356
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 358
    :cond_22
    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 359
    invoke-interface {v4}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v1

    if-eqz v1, :cond_56

    .line 360
    const-string/jumbo v1, "android:menu:expandedactionview"

    invoke-interface {v4}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    invoke-virtual {p1, v1, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    move-object v1, v0

    .line 363
    :goto_36
    invoke-interface {v4}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 364
    invoke-interface {v4}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    .line 365
    invoke-virtual {v0, p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->saveActionViewStates(Landroid/os/Bundle;)V

    .line 351
    :cond_45
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    move-object v0, v1

    goto :goto_8

    :cond_4a
    move-object v1, v0

    .line 354
    goto :goto_36

    .line 369
    :cond_4c
    if-eqz v0, :cond_55

    .line 370
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->getActionViewStatesKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 372
    :cond_55
    return-void

    :cond_56
    move-object v1, v0

    goto :goto_36
.end method

.method public savePresenterStates(Landroid/os/Bundle;)V
    .registers 2

    .prologue
    .line 340
    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->st(Landroid/os/Bundle;)V

    .line 341
    return-void
.end method

.method public setCallback(Lcom/miui/internal/view/menu/MenuBuilder$Callback;)V
    .registers 2

    .prologue
    .line 409
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nx:Lcom/miui/internal/view/menu/MenuBuilder$Callback;

    .line 410
    return-void
.end method

.method public setCurrentMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 2

    .prologue
    .line 1269
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Ny:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 1270
    return-void
.end method

.method public setDefaultShowAsAction(I)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 2

    .prologue
    .line 225
    iput p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->Nz:I

    .line 226
    return-object p0
.end method

.method public setGroupCheckable(IZZ)V
    .registers 7

    .prologue
    .line 591
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 592
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v2

    if-ne v2, p1, :cond_6

    .line 593
    invoke-virtual {v0, p3}, Lcom/miui/internal/view/menu/MenuItemImpl;->setExclusiveCheckable(Z)V

    .line 594
    invoke-virtual {v0, p2}, Lcom/miui/internal/view/menu/MenuItemImpl;->setCheckable(Z)Landroid/view/MenuItem;

    goto :goto_6

    .line 597
    :cond_1f
    return-void
.end method

.method public setGroupEnabled(IZ)V
    .registers 6

    .prologue
    .line 620
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 621
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v2

    if-ne v2, p1, :cond_6

    .line 622
    invoke-virtual {v0, p2}, Lcom/miui/internal/view/menu/MenuItemImpl;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_6

    .line 625
    :cond_1c
    return-void
.end method

.method public setGroupVisible(IZ)V
    .registers 8

    .prologue
    const/4 v2, 0x1

    .line 604
    const/4 v0, 0x0

    .line 605
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 606
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v4

    if-ne v4, p1, :cond_2a

    .line 607
    invoke-virtual {v0, p2}, Lcom/miui/internal/view/menu/MenuItemImpl;->tE(Z)Z

    move-result v0

    if-eqz v0, :cond_2a

    move v0, v2

    :goto_22
    move v1, v0

    goto :goto_9

    .line 613
    :cond_24
    if-eqz v1, :cond_29

    .line 614
    invoke-virtual {p0, v2}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 616
    :cond_29
    return-void

    :cond_2a
    move v0, v1

    goto :goto_22
.end method

.method protected setHeaderIconInt(I)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 1224
    const/4 v1, 0x0

    move-object v0, p0

    move v3, p1

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 1225
    return-object p0
.end method

.method protected setHeaderIconInt(Landroid/graphics/drawable/Drawable;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move v3, v1

    move-object v4, p1

    move-object v5, v2

    .line 1212
    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 1213
    return-object p0
.end method

.method protected setHeaderTitleInt(I)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 1200
    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 1201
    return-object p0
.end method

.method protected setHeaderTitleInt(Ljava/lang/CharSequence;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 8

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move v3, v1

    move-object v5, v4

    .line 1188
    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 1189
    return-object p0
.end method

.method protected setHeaderViewInt(Landroid/view/View;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move v3, v1

    move-object v4, v2

    move-object v5, p1

    .line 1236
    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/MenuBuilder;->sF(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 1237
    return-object p0
.end method

.method public setQwertyMode(Z)V
    .registers 3

    .prologue
    .line 712
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NN:Z

    .line 714
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 715
    return-void
.end method

.method public setShortcutsVisible(Z)V
    .registers 3

    .prologue
    .line 752
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NP:Z

    if-ne v0, p1, :cond_5

    .line 753
    return-void

    .line 756
    :cond_5
    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/MenuBuilder;->sH(Z)V

    .line 757
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 758
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 697
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method final sq(Z)V
    .registers 5

    .prologue
    .line 966
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NF:Z

    if-eqz v0, :cond_5

    .line 967
    return-void

    .line 970
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NF:Z

    .line 971
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 972
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuPresenter;

    .line 973
    if-nez v1, :cond_28

    .line 974
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NL:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 976
    :cond_28
    invoke-interface {v1, p0, p1}, Lcom/miui/internal/view/menu/MenuPresenter;->onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V

    goto :goto_e

    .line 979
    :cond_2c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NF:Z

    .line 980
    return-void
.end method

.method public startDispatchingItemsChanged()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1020
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    .line 1022
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    if-eqz v0, :cond_d

    .line 1023
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    .line 1024
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 1026
    :cond_d
    return-void
.end method

.method public stopDispatchingItemsChanged()V
    .registers 2

    .prologue
    .line 1013
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    if-nez v0, :cond_a

    .line 1014
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NM:Z

    .line 1015
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NI:Z

    .line 1017
    :cond_a
    return-void
.end method

.method sw(ILandroid/view/KeyEvent;)Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 13

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 874
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NQ:Ljava/util/ArrayList;

    .line 875
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 876
    invoke-virtual {p0, v0, p1, p2}, Lcom/miui/internal/view/menu/MenuBuilder;->sx(Ljava/util/List;ILandroid/view/KeyEvent;)V

    .line 878
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 879
    return-object v9

    .line 882
    :cond_11
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v2

    .line 883
    new-instance v3, Landroid/view/KeyCharacterMap$KeyData;

    invoke-direct {v3}, Landroid/view/KeyCharacterMap$KeyData;-><init>()V

    .line 885
    invoke-virtual {p2, v3}, Landroid/view/KeyEvent;->getKeyData(Landroid/view/KeyCharacterMap$KeyData;)Z

    .line 888
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 889
    const/4 v4, 0x1

    if-ne v1, v4, :cond_2b

    .line 890
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0

    .line 893
    :cond_2b
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v4

    .line 896
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_33
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 897
    if-eqz v4, :cond_50

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getAlphabeticShortcut()C

    move-result v1

    .line 899
    :goto_45
    iget-object v6, v3, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    aget-char v6, v6, v8

    if-ne v1, v6, :cond_55

    .line 900
    and-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_55

    .line 905
    :cond_4f
    :goto_4f
    return-object v0

    .line 898
    :cond_50
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getNumericShortcut()C

    move-result v1

    goto :goto_45

    .line 901
    :cond_55
    iget-object v6, v3, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    const/4 v7, 0x2

    aget-char v6, v6, v7

    if-ne v1, v6, :cond_60

    .line 902
    and-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_4f

    .line 903
    :cond_60
    if-eqz v4, :cond_33

    const/16 v6, 0x8

    if-ne v1, v6, :cond_33

    .line 904
    const/16 v1, 0x43

    if-ne p1, v1, :cond_33

    goto :goto_4f

    .line 908
    :cond_6b
    return-object v9
.end method

.method sx(Ljava/util/List;ILandroid/view/KeyEvent;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/miui/internal/view/menu/MenuItemImpl;",
            ">;I",
            "Landroid/view/KeyEvent;",
            ")V"
        }
    .end annotation

    .prologue
    const/16 v9, 0x43

    const/4 v8, 0x0

    .line 830
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v2

    .line 831
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v3

    .line 832
    new-instance v4, Landroid/view/KeyCharacterMap$KeyData;

    invoke-direct {v4}, Landroid/view/KeyCharacterMap$KeyData;-><init>()V

    .line 834
    invoke-virtual {p3, v4}, Landroid/view/KeyEvent;->getKeyData(Landroid/view/KeyCharacterMap$KeyData;)Z

    move-result v0

    .line 836
    if-nez v0, :cond_19

    if-eq p2, v9, :cond_19

    .line 837
    return-void

    .line 841
    :cond_19
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NH:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1f
    :goto_1f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 842
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 843
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, p1, p2, p3}, Lcom/miui/internal/view/menu/MenuBuilder;->sx(Ljava/util/List;ILandroid/view/KeyEvent;)V

    .line 846
    :cond_3a
    if-eqz v2, :cond_5d

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getAlphabeticShortcut()C

    move-result v1

    .line 848
    :goto_40
    and-int/lit8 v6, v3, 0x5

    if-nez v6, :cond_1f

    .line 849
    if-eqz v1, :cond_1f

    .line 850
    iget-object v6, v4, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    aget-char v6, v6, v8

    if-eq v1, v6, :cond_53

    .line 851
    iget-object v6, v4, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    const/4 v7, 0x2

    aget-char v6, v6, v7

    if-ne v1, v6, :cond_62

    .line 854
    :cond_53
    :goto_53
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isEnabled()Z

    move-result v1

    .line 848
    if-eqz v1, :cond_1f

    .line 855
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    .line 847
    :cond_5d
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getNumericShortcut()C

    move-result v1

    goto :goto_40

    .line 852
    :cond_62
    if-eqz v2, :cond_1f

    const/16 v6, 0x8

    if-ne v1, v6, :cond_1f

    .line 853
    if-ne p2, v9, :cond_1f

    goto :goto_53

    .line 858
    :cond_6b
    return-void
.end method

.method sy()Z
    .registers 2

    .prologue
    .line 1277
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuBuilder;->NK:Z

    return v0
.end method
