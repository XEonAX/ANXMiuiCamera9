.class Lcom/miui/internal/app/b;
.super Lmiui/view/PagerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;
    }
.end annotation


# instance fields
.field private afA:Landroid/app/FragmentTransaction;

.field private afB:Landroid/app/Fragment;

.field private afC:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;",
            ">;"
        }
    .end annotation
.end field

.field private afD:Landroid/app/FragmentManager;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/FragmentManager;Lmiui/view/ViewPager;)V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 269
    invoke-direct {p0}, Lmiui/view/PagerAdapter;-><init>()V

    .line 265
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    .line 266
    iput-object v1, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    .line 267
    iput-object v1, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    .line 270
    iput-object p1, p0, Lcom/miui/internal/app/b;->mContext:Landroid/content/Context;

    .line 271
    iput-object p2, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    .line 272
    invoke-virtual {p3, p0}, Lmiui/view/ViewPager;->setAdapter(Lmiui/view/PagerAdapter;)V

    .line 273
    return-void
.end method

.method private AD(Landroid/app/Fragment;)V
    .registers 4

    .prologue
    .line 457
    if-eqz p1, :cond_15

    .line 458
    invoke-virtual {p1}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 459
    if-eqz v0, :cond_15

    .line 460
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 461
    invoke-virtual {v1, p1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 462
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 463
    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 466
    :cond_15
    return-void
.end method

.method private Az()V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 446
    iget-object v0, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 447
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v0, v1

    .line 448
    :goto_e
    if-ge v0, v3, :cond_1a

    .line 449
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/b;->Ax(IZ)Landroid/app/Fragment;

    move-result-object v4

    .line 450
    invoke-virtual {v2, v4}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 448
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 452
    :cond_1a
    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 453
    iget-object v0, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 454
    return-void
.end method


# virtual methods
.method AA(Landroid/app/ActionBar$Tab;)I
    .registers 6

    .prologue
    .line 405
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 406
    const/4 v0, 0x0

    move v1, v0

    :goto_8
    if-ge v1, v2, :cond_28

    .line 407
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    .line 408
    iget-object v3, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afI:Landroid/app/ActionBar$Tab;

    if-ne v3, p1, :cond_24

    .line 409
    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    invoke-direct {p0, v0}, Lcom/miui/internal/app/b;->AD(Landroid/app/Fragment;)V

    .line 410
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 411
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 412
    return v1

    .line 406
    :cond_24
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_8

    .line 415
    :cond_28
    const/4 v0, -0x1

    return v0
.end method

.method AB(Landroid/app/Fragment;)I
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 419
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v0, v1

    .line 420
    :goto_8
    if-ge v0, v2, :cond_1f

    .line 421
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/b;->Ax(IZ)Landroid/app/Fragment;

    move-result-object v3

    if-ne v3, p1, :cond_1c

    .line 422
    invoke-direct {p0, p1}, Lcom/miui/internal/app/b;->AD(Landroid/app/Fragment;)V

    .line 423
    iget-object v1, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 424
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 425
    return v0

    .line 420
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 428
    :cond_1f
    const/4 v0, -0x1

    return v0
.end method

.method AC(I)V
    .registers 3

    .prologue
    .line 388
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/app/b;->Ax(IZ)Landroid/app/Fragment;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/b;->AD(Landroid/app/Fragment;)V

    .line 389
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 390
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 391
    return-void
.end method

.method Au(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)I
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Landroid/app/ActionBar$Tab;",
            "Z)I"
        }
    .end annotation

    .prologue
    .line 376
    iget-object v7, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;-><init>(Lcom/miui/internal/app/b;Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 378
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method Av(Ljava/lang/String;ILjava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)I
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Landroid/app/ActionBar$Tab;",
            "Z)I"
        }
    .end annotation

    .prologue
    .line 382
    iget-object v7, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;-><init>(Lcom/miui/internal/app/b;Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)V

    invoke-virtual {v7, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 383
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 384
    return p2
.end method

.method Aw(Ljava/lang/String;)I
    .registers 5

    .prologue
    .line 394
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 395
    const/4 v0, 0x0

    move v1, v0

    :goto_8
    if-ge v1, v2, :cond_1f

    .line 396
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    .line 397
    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afJ:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 398
    return v1

    .line 395
    :cond_1b
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_8

    .line 401
    :cond_1f
    const/4 v0, -0x1

    return v0
.end method

.method Ax(IZ)Landroid/app/Fragment;
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 362
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    .line 363
    iget-object v1, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    if-nez v1, :cond_31

    .line 365
    iget-object v1, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    iget-object v2, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afJ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    .line 366
    iget-object v1, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    if-nez v1, :cond_31

    if-eqz p2, :cond_31

    .line 367
    iget-object v1, p0, Lcom/miui/internal/app/b;->mContext:Landroid/content/Context;

    iget-object v2, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afF:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afE:Landroid/os/Bundle;

    invoke-static {v1, v2, v3}, Landroid/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/app/Fragment;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    .line 368
    iput-object v4, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afF:Ljava/lang/Class;

    .line 369
    iput-object v4, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afE:Landroid/os/Bundle;

    .line 372
    :cond_31
    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    return-object v0
.end method

.method Ay()V
    .registers 2

    .prologue
    .line 432
    invoke-direct {p0}, Lcom/miui/internal/app/b;->Az()V

    .line 433
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 434
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 435
    return-void
.end method

.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 5

    .prologue
    .line 281
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    if-nez v0, :cond_c

    .line 282
    iget-object v0, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    .line 284
    :cond_c
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    check-cast p3, Landroid/app/Fragment;

    invoke-virtual {v0, p3}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 285
    return-void
.end method

.method public finishUpdate(Landroid/view/ViewGroup;)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 305
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    if-eqz v0, :cond_11

    .line 306
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 307
    iput-object v1, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    .line 308
    iget-object v0, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 310
    :cond_11
    return-void
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 339
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .registers 5

    .prologue
    .line 348
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 349
    const/4 v0, 0x0

    move v1, v0

    :goto_8
    if-ge v1, v2, :cond_1b

    .line 350
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afG:Landroid/app/Fragment;

    if-ne p1, v0, :cond_17

    .line 351
    return v1

    .line 349
    :cond_17
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_8

    .line 354
    :cond_1b
    const/4 v0, -0x2

    return v0
.end method

.method getTabAt(I)Landroid/app/ActionBar$Tab;
    .registers 3

    .prologue
    .line 358
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afI:Landroid/app/ActionBar$Tab;

    return-object v0
.end method

.method public hasActionMenu(I)Z
    .registers 3

    .prologue
    .line 343
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    iget-boolean v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afH:Z

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 319
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    if-nez v0, :cond_d

    .line 320
    iget-object v0, p0, Lcom/miui/internal/app/b;->afD:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    .line 323
    :cond_d
    const/4 v0, 0x1

    invoke-virtual {p0, p2, v0}, Lcom/miui/internal/app/b;->Ax(IZ)Landroid/app/Fragment;

    move-result-object v1

    .line 324
    invoke-virtual {v1}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_28

    .line 325
    iget-object v0, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    invoke-virtual {v0, v1}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 329
    :goto_1d
    iget-object v0, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    if-eq v1, v0, :cond_27

    .line 330
    invoke-virtual {v1, v4}, Landroid/app/Fragment;->setMenuVisibility(Z)V

    .line 331
    invoke-virtual {v1, v4}, Landroid/app/Fragment;->setUserVisibleHint(Z)V

    .line 334
    :cond_27
    return-object v1

    .line 327
    :cond_28
    iget-object v2, p0, Lcom/miui/internal/app/b;->afA:Landroid/app/FragmentTransaction;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    move-result v3

    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    iget-object v0, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afJ:Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v0}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    goto :goto_1d
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 4

    .prologue
    .line 314
    check-cast p2, Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-ne v0, p1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method setFragmentActionMenuAt(IZ)V
    .registers 5

    .prologue
    .line 438
    iget-object v0, p0, Lcom/miui/internal/app/b;->afC:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;

    .line 439
    iget-boolean v1, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afH:Z

    if-eq v1, p2, :cond_11

    .line 440
    iput-boolean p2, v0, Lcom/miui/internal/app/DynamicFragmentPagerAdapter$FragmentInfo;->afH:Z

    .line 441
    invoke-virtual {p0}, Lcom/miui/internal/app/b;->notifyDataSetChanged()V

    .line 443
    :cond_11
    return-void
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 289
    check-cast p3, Landroid/app/Fragment;

    .line 290
    iget-object v0, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    if-eq p3, v0, :cond_20

    .line 291
    iget-object v0, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    if-eqz v0, :cond_16

    .line 292
    iget-object v0, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setMenuVisibility(Z)V

    .line 293
    iget-object v0, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setUserVisibleHint(Z)V

    .line 295
    :cond_16
    if-eqz p3, :cond_1e

    .line 296
    invoke-virtual {p3, v2}, Landroid/app/Fragment;->setMenuVisibility(Z)V

    .line 297
    invoke-virtual {p3, v2}, Landroid/app/Fragment;->setUserVisibleHint(Z)V

    .line 299
    :cond_1e
    iput-object p3, p0, Lcom/miui/internal/app/b;->afB:Landroid/app/Fragment;

    .line 301
    :cond_20
    return-void
.end method

.method public startUpdate(Landroid/view/ViewGroup;)V
    .registers 2

    .prologue
    .line 277
    return-void
.end method
