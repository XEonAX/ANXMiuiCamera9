.class public Lcom/android/camera/fragment/BaseFragmentDelegate;
.super Ljava/lang/Object;
.source "BaseFragmentDelegate.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/BaseFragmentDelegate$FragmentInto;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private animationComposite:Lcom/android/camera/animation/AnimationComposite;

.field private currentFragments:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mActivity:Lcom/android/camera/Camera;

.field private originalFragments:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/BaseFragmentDelegate;->TAG:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/Camera;)V
    .locals 1
    .param p1, "activity"    # Lcom/android/camera/Camera;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    .line 92
    new-instance v0, Lcom/android/camera/animation/AnimationComposite;

    invoke-direct {v0}, Lcom/android/camera/animation/AnimationComposite;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    .line 93
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    .line 94
    return-void
.end method

.method private applyUpdateSet(Ljava/util/List;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V
    .locals 15
    .param p2, "baseLifecycleListener"    # Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/BaseFragmentOperation;",
            ">;",
            "Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "replaceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/BaseFragmentOperation;>;"
    if-eqz p1, :cond_0

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 241
    :cond_0
    new-instance v13, Ljava/lang/RuntimeException;

    const-string/jumbo v14, "need operation info"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 244
    :cond_1
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    if-eqz v13, :cond_2

    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v13}, Lcom/android/camera/Camera;->isFinishing()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 245
    return-void

    .line 248
    :cond_2
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v13}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 250
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    .line 253
    .local v3, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "replaceInfo$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_d

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/camera/fragment/BaseFragmentOperation;

    .line 254
    .local v11, "replaceInfo":Lcom/android/camera/fragment/BaseFragmentOperation;
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    invoke-virtual {p0, v13}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v7

    .line 255
    .local v7, "lastFragmentInfo":I
    iget v9, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->pendingFragmentInfo:I

    .line 258
    .local v9, "pendingFragmentInfo":I
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    packed-switch v13, :pswitch_data_0

    goto :goto_0

    .line 260
    :pswitch_0
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    invoke-virtual {p0, v13}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v7

    .line 261
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v13, v7}, Lcom/android/camera/animation/AnimationComposite;->remove(I)V

    .line 262
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-direct {p0, v13, v9, v7, v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v8

    .line 263
    .local v8, "newFragment":Lcom/android/camera/fragment/BaseFragment;
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v13, v8, v14}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 264
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v14

    invoke-virtual {v13, v14, v8}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 266
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v9, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto :goto_0

    .line 270
    .end local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_1
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v13, v9}, Lcom/android/camera/animation/AnimationComposite;->remove(I)V

    .line 272
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v10

    check-cast v10, Lcom/android/camera/fragment/BaseFragment;

    .line 273
    .local v10, "removeFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v10, :cond_3

    .line 274
    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    .line 275
    invoke-virtual {v3, v10}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 278
    :cond_3
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v9, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto :goto_0

    .line 283
    .end local v10    # "removeFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_2
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v13, v7}, Lcom/android/camera/animation/AnimationComposite;->remove(I)V

    .line 284
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/android/camera/fragment/BaseFragment;

    .line 285
    .local v6, "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v6, :cond_4

    .line 286
    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    .line 287
    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 292
    :cond_4
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v7, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto/16 :goto_0

    .line 298
    .end local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_3
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/android/camera/fragment/BaseFragment;

    .line 299
    .restart local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v6, :cond_5

    .line 300
    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    .line 301
    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 303
    :cond_5
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v8

    check-cast v8, Lcom/android/camera/fragment/BaseFragment;

    .line 304
    .restart local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v8, :cond_6

    .line 305
    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->pendingShow()V

    .line 306
    invoke-virtual {v3, v8}, Landroid/support/v4/app/FragmentTransaction;->show(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 312
    :goto_1
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v14

    invoke-virtual {v13, v14, v8}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 314
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v9, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto/16 :goto_0

    .line 308
    :cond_6
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-direct {p0, v13, v9, v7, v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v8

    .line 309
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v13, v8, v14}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_1

    .line 319
    .end local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    .end local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_4
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->currentFragments:Landroid/util/SparseArray;

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    invoke-virtual {v13, v14}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 320
    .local v4, "fragments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v13

    if-ge v5, v13, :cond_a

    .line 321
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 322
    .local v1, "fragmentInfo":I
    if-ne v1, v9, :cond_8

    .line 320
    :cond_7
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 325
    :cond_8
    iget-object v13, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v13, v1}, Lcom/android/camera/animation/AnimationComposite;->remove(I)V

    .line 326
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v10

    check-cast v10, Lcom/android/camera/fragment/BaseFragment;

    .line 328
    .restart local v10    # "removeFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v10, :cond_7

    .line 329
    if-eq v1, v7, :cond_9

    .line 330
    const/4 v13, 0x1

    invoke-virtual {v10, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    .line 334
    :goto_4
    invoke-virtual {v3, v10}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_3

    .line 332
    :cond_9
    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    goto :goto_4

    .line 338
    .end local v1    # "fragmentInfo":I
    .end local v10    # "removeFragment":Lcom/android/camera/fragment/BaseFragment;
    :cond_a
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v8

    check-cast v8, Lcom/android/camera/fragment/BaseFragment;

    .line 339
    .restart local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-virtual {v8, v7}, Lcom/android/camera/fragment/BaseFragment;->setLastFragmentInfo(I)V

    .line 340
    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->pendingShow()V

    .line 341
    invoke-virtual {v3, v8}, Landroid/support/v4/app/FragmentTransaction;->show(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 343
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v9, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto/16 :goto_0

    .line 347
    .end local v4    # "fragments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "i":I
    .end local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_5
    if-eq v7, v9, :cond_b

    .line 348
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/android/camera/fragment/BaseFragment;

    .line 349
    .restart local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v6, :cond_b

    .line 350
    const/4 v13, 0x1

    invoke-virtual {v6, v13}, Lcom/android/camera/fragment/BaseFragment;->pendingGone(Z)V

    .line 351
    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 355
    .end local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    :cond_b
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v8

    check-cast v8, Lcom/android/camera/fragment/BaseFragment;

    .line 356
    .restart local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-virtual {v8, v7}, Lcom/android/camera/fragment/BaseFragment;->setLastFragmentInfo(I)V

    .line 357
    invoke-virtual {v8}, Lcom/android/camera/fragment/BaseFragment;->pendingShow()V

    .line 358
    invoke-virtual {v3, v8}, Landroid/support/v4/app/FragmentTransaction;->show(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 360
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v9, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto/16 :goto_0

    .line 364
    .end local v8    # "newFragment":Lcom/android/camera/fragment/BaseFragment;
    :pswitch_6
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/android/camera/fragment/BaseFragment;

    .line 365
    .restart local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    if-eqz v6, :cond_c

    .line 366
    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 368
    :cond_c
    iget v13, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->containerViewId:I

    iget v14, v11, Lcom/android/camera/fragment/BaseFragmentOperation;->operateType:I

    invoke-direct {p0, v13, v7, v14}, Lcom/android/camera/fragment/BaseFragmentDelegate;->updateCurrentFragments(III)V

    goto/16 :goto_0

    .line 375
    .end local v6    # "lastFragment":Lcom/android/camera/fragment/BaseFragment;
    .end local v7    # "lastFragmentInfo":I
    .end local v9    # "pendingFragmentInfo":I
    .end local v11    # "replaceInfo":Lcom/android/camera/fragment/BaseFragmentOperation;
    :cond_d
    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 376
    return-void

    .line 258
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;
    .locals 2
    .param p1, "isInit"    # Z
    .param p2, "fragmentId"    # I
    .param p3, "lastFragmentInfo"    # I
    .param p4, "baseLifecycleListener"    # Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .prologue
    .line 448
    const/4 v0, 0x0

    .line 450
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    sparse-switch p2, :sswitch_data_0

    .line 520
    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :goto_0
    invoke-virtual {v0, p3}, Lcom/android/camera/fragment/BaseFragment;->setLastFragmentInfo(I)V

    .line 521
    invoke-virtual {v0, p4}, Lcom/android/camera/fragment/BaseFragment;->setLifecycleListener(Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    .line 522
    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragment;->registerProtocol()V

    .line 523
    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/BaseFragment;->setEnableClickInitValue(Z)V

    .line 524
    return-object v0

    .line 453
    .restart local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_0
    const/4 v1, 0x0

    return-object v1

    .line 456
    :sswitch_1
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomAction;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentBottomAction;-><init>()V

    .line 457
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 460
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_2
    new-instance v0, Lcom/android/camera/fragment/FragmentMainContent;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentMainContent;-><init>()V

    .line 461
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 464
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_3
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopConfig;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;-><init>()V

    .line 465
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 468
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_4
    new-instance v0, Lcom/android/camera/fragment/FragmentFilter;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    .line 469
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 472
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_5
    new-instance v0, Lcom/android/camera/fragment/manually/FragmentManually;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/manually/FragmentManually;-><init>()V

    .line 473
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 476
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_6
    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentBeauty;-><init>()V

    .line 477
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 480
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_7
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FragmentPopupMakeup;-><init>()V

    .line 481
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 484
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_8
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;-><init>()V

    .line 485
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 488
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_9
    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentSticker;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/sticker/FragmentSticker;-><init>()V

    .line 489
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 492
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_a
    new-instance v0, Lcom/android/camera/fragment/FragmentPanorama;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentPanorama;-><init>()V

    .line 493
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 496
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_b
    new-instance v0, Lcom/android/camera/fragment/beauty/FragmentPopupBeautyLevel;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeautyLevel;-><init>()V

    .line 497
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 500
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_c
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;-><init>()V

    .line 501
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 504
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_d
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomIntentDone;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentBottomIntentDone;-><init>()V

    .line 505
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 508
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_e
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;-><init>()V

    .line 509
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 512
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_f
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualStereo;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/dual/FragmentDualStereo;-><init>()V

    .line 513
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 516
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    :sswitch_10
    new-instance v0, Lcom/android/camera/fragment/FragmentScreenLight;

    .end local v0    # "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-direct {v0}, Lcom/android/camera/fragment/FragmentScreenLight;-><init>()V

    .line 517
    .local v0, "baseFragment":Lcom/android/camera/fragment/BaseFragment;
    goto :goto_0

    .line 450
    nop

    :sswitch_data_0
    .sparse-switch
        0xf0 -> :sswitch_0
        0xf1 -> :sswitch_1
        0xf3 -> :sswitch_2
        0xf4 -> :sswitch_3
        0xf7 -> :sswitch_5
        0xf9 -> :sswitch_8
        0xfa -> :sswitch_4
        0xfb -> :sswitch_6
        0xfc -> :sswitch_7
        0xff -> :sswitch_9
        0xff0 -> :sswitch_a
        0xff1 -> :sswitch_c
        0xff2 -> :sswitch_b
        0xff3 -> :sswitch_d
        0xff4 -> :sswitch_e
        0xff5 -> :sswitch_f
        0xff6 -> :sswitch_10
    .end sparse-switch
.end method

.method private initCurrentFragments(Landroid/util/SparseIntArray;)V
    .locals 5
    .param p1, "originalFragments"    # Landroid/util/SparseIntArray;

    .prologue
    .line 200
    invoke-virtual {p1}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    .line 201
    .local v2, "size":I
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3, v2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v3, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->currentFragments:Landroid/util/SparseArray;

    .line 202
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 203
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    iget-object v3, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->currentFragments:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v3, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 202
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_0
    return-void
.end method

.method private updateCurrentFragments(III)V
    .locals 3
    .param p1, "containerViewId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p2, "fragmentInfo"    # I
    .param p3, "type"    # I

    .prologue
    .line 381
    iget-object v2, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->currentFragments:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 383
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    packed-switch p3, :pswitch_data_0

    .line 434
    :cond_0
    :goto_0
    return-void

    .line 385
    :pswitch_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 386
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 390
    :pswitch_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 391
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p2, :cond_1

    .line 392
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 390
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 398
    .end local v0    # "i":I
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 399
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p2, :cond_2

    .line 400
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 398
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 407
    .end local v0    # "i":I
    :pswitch_3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 411
    :pswitch_4
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 412
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 416
    :pswitch_5
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 417
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p2, :cond_4

    .line 418
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 422
    :cond_3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 416
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 426
    .end local v0    # "i":I
    :pswitch_6
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 427
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p2, :cond_5

    .line 428
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto/16 :goto_0

    .line 426
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 383
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public delegateEvent(I)V
    .locals 9
    .param p1, "event"    # I

    .prologue
    const v8, 0x7f0a0095

    const v7, 0x7f0a009a

    const/16 v6, 0xf1

    const v5, 0x7f0a009b

    const v4, 0x7f0a009c

    .line 535
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 538
    .local v1, "replaceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/BaseFragmentOperation;>;"
    packed-switch p1, :pswitch_data_0

    .line 637
    :cond_0
    :goto_0
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/android/camera/fragment/BaseFragmentDelegate;->applyUpdateSet(Ljava/util/List;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    .line 638
    return-void

    .line 542
    :pswitch_0
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v0

    .line 543
    .local v0, "currentActiveFragment":I
    const/16 v2, 0xfa

    if-eq v0, v2, :cond_1

    .line 544
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xfa

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->push(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 548
    :goto_1
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 546
    :cond_1
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/camera/fragment/BaseFragmentOperation;->popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 552
    .end local v0    # "currentActiveFragment":I
    :pswitch_1
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v0

    .line 553
    .restart local v0    # "currentActiveFragment":I
    const/16 v2, 0xfb

    if-eq v0, v2, :cond_2

    .line 554
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xfb

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->push(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 556
    :cond_2
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/camera/fragment/BaseFragmentOperation;->popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 557
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 562
    .end local v0    # "currentActiveFragment":I
    :pswitch_2
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v0

    .line 563
    .restart local v0    # "currentActiveFragment":I
    const/16 v2, 0xff

    if-eq v0, v2, :cond_3

    .line 564
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->push(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 567
    :cond_3
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/camera/fragment/BaseFragmentOperation;->popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    invoke-static {v7}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff1

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 578
    .end local v0    # "currentActiveFragment":I
    :pswitch_3
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xfc

    if-eq v2, v3, :cond_4

    .line 579
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xfc

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 581
    :cond_4
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 586
    :pswitch_4
    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xff2

    if-eq v2, v3, :cond_5

    .line 587
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff2

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 589
    :cond_5
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 594
    :pswitch_5
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xff3

    if-eq v2, v3, :cond_7

    .line 595
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->push(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 596
    const v2, 0x7f0a0097

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 597
    const v2, 0x7f0a0098

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 598
    iget-object v2, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v2

    if-nez v2, :cond_6

    .line 599
    invoke-static {v8}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 601
    :cond_6
    invoke-static {v7}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 602
    const v2, 0x7f0a0099

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 604
    :cond_7
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/camera/fragment/BaseFragmentOperation;->popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    const v2, 0x7f0a0097

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const v3, 0x7f0a0097

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getOriginalFragment(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 606
    const v2, 0x7f0a0098

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const v3, 0x7f0a0098

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getOriginalFragment(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 607
    iget-object v2, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v2

    if-nez v2, :cond_8

    .line 608
    invoke-static {v8}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {p0, v8}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getOriginalFragment(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 610
    :cond_8
    invoke-static {v7}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {p0, v7}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getOriginalFragment(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 611
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v2

    if-nez v2, :cond_9

    invoke-static {}, Lcom/android/camera/Device;->isSupportedStereo()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 612
    :cond_9
    const v2, 0x7f0a0099

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const v3, 0x7f0a0099

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getOriginalFragment(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 618
    :pswitch_6
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v2

    if-eq v2, v6, :cond_0

    .line 619
    invoke-static {v4}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/android/camera/fragment/BaseFragmentOperation;->popAndClearOthers(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 621
    invoke-static {v5}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->removeCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 623
    invoke-static {v7}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff1

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->replaceWith(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 628
    :pswitch_7
    const v2, 0x7f0a009d

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xf0

    if-ne v2, v3, :cond_a

    .line 629
    const v2, 0x7f0a009d

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    const/16 v3, 0xff6

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentOperation;->show(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 631
    :cond_a
    const v2, 0x7f0a009d

    invoke-static {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->create(I)Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragmentOperation;->hideCurrent()Lcom/android/camera/fragment/BaseFragmentOperation;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 538
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;
    .locals 3
    .param p1, "prefixCompletable"    # Lio/reactivex/Completable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "startControl"    # Lcom/android/camera/module/loader/StartControl;
    .param p3, "lifecycleListener"    # Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-object v1, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    if-nez v1, :cond_0

    .line 221
    return-object v2

    .line 224
    :cond_0
    const/4 v0, 0x0

    .line 225
    .local v0, "resultAction":Lio/reactivex/functions/Action;
    if-eqz p3, :cond_1

    .line 226
    new-instance v0, Lcom/android/camera/fragment/BaseFragmentDelegate$1;

    .end local v0    # "resultAction":Lio/reactivex/functions/Action;
    invoke-direct {v0, p0, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate$1;-><init>(Lcom/android/camera/fragment/BaseFragmentDelegate;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    .line 235
    :cond_1
    iget-object v1, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v1, p1, v0, p2}, Lcom/android/camera/animation/AnimationComposite;->dispose(Lio/reactivex/Completable;Lio/reactivex/functions/Action;Lcom/android/camera/module/loader/StartControl;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    return-object v1
.end method

.method public getActiveFragment(I)I
    .locals 3
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 642
    iget-object v2, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->currentFragments:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 643
    .local v1, "fragments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 644
    const/16 v2, 0xf0

    return v2

    .line 646
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 647
    .local v0, "fragmentInfo":I
    return v0
.end method

.method public getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    return-object v0
.end method

.method public getOriginalFragment(I)I
    .locals 3
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 651
    iget-object v1, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    const/16 v2, 0xf0

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 652
    .local v0, "fragmentInfo":I
    return v0
.end method

.method public init(Landroid/support/v4/app/FragmentManager;ILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V
    .locals 12
    .param p1, "supportFragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p2, "initMode"    # I
    .param p3, "baseLifecycleListener"    # Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->registerProtocol()V

    .line 124
    const/4 v9, 0x1

    const/16 v10, 0xf4

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v7

    .line 128
    .local v7, "fragmentTopConfig":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xf7

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v4

    .line 130
    .local v4, "fragmentManually":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xff1

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v2

    .line 132
    .local v2, "fragmentBottomPopupTips":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xf1

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v1

    .line 134
    .local v1, "fragmentBottomAction":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xf3

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v3

    .line 136
    .local v3, "fragmentMainContent":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xff0

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v5

    .line 138
    .local v5, "fragmentPanorama":Lcom/android/camera/fragment/BaseFragment;
    const/4 v9, 0x1

    const/16 v10, 0xff6

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v6

    .line 140
    .local v6, "fragmentScreenLight":Lcom/android/camera/fragment/BaseFragment;
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    .line 141
    .local v8, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a009a

    invoke-virtual {v8, v10, v2, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 142
    invoke-virtual {v1}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a009c

    invoke-virtual {v8, v10, v1, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 143
    invoke-virtual {v7}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a0097

    invoke-virtual {v8, v10, v7, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 145
    invoke-virtual {v4}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a0098

    invoke-virtual {v8, v10, v4, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 146
    invoke-virtual {v3}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a0095

    invoke-virtual {v8, v10, v3, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 147
    invoke-virtual {v5}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a0096

    invoke-virtual {v8, v10, v5, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 148
    invoke-virtual {v6}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a009d

    invoke-virtual {v8, v10, v6, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 149
    invoke-virtual {v8, v6}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 151
    const/4 v0, 0x0

    .line 153
    .local v0, "dualFragment":Lcom/android/camera/fragment/BaseFragment;
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 154
    const/4 v9, 0x1

    const/16 v10, 0xff4

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v0

    .line 159
    .end local v0    # "dualFragment":Lcom/android/camera/fragment/BaseFragment;
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 160
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a0099

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 161
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v0}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 162
    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f0a0099

    invoke-virtual {v8, v10, v0, v9}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 167
    :goto_1
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a009a

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 168
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a009c

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 169
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v7}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a0097

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 172
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    const v10, 0x7f0a009b

    const/16 v11, 0xf0

    invoke-virtual {v9, v10, v11}, Landroid/util/SparseIntArray;->put(II)V

    .line 174
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v4}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a0098

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 175
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v3}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a0095

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 176
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-virtual {v5}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    const v11, 0x7f0a0096

    invoke-virtual {v9, v11, v10}, Landroid/util/SparseIntArray;->put(II)V

    .line 177
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    const v10, 0x7f0a009d

    const/16 v11, 0xf0

    invoke-virtual {v9, v10, v11}, Landroid/util/SparseIntArray;->put(II)V

    .line 181
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v2}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v2}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 182
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v7}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v7}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 184
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v4}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v4}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 185
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v3}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v3}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 186
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v1}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v1}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 187
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v5}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v5}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 188
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v6}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v10

    invoke-virtual {v9, v10, v6}, Lcom/android/camera/animation/AnimationComposite;->put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V

    .line 190
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    invoke-direct {p0, v9}, Lcom/android/camera/fragment/BaseFragmentDelegate;->initCurrentFragments(Landroid/util/SparseIntArray;)V

    .line 194
    invoke-virtual {v8}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 196
    invoke-interface {p3}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeAlive()V

    .line 197
    return-void

    .line 155
    .restart local v0    # "dualFragment":Lcom/android/camera/fragment/BaseFragment;
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportedStereo()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 156
    const/4 v9, 0x1

    const/16 v10, 0xff5

    const/16 v11, 0xf0

    invoke-direct {p0, v9, v10, v11, p3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->constructFragment(ZIILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lcom/android/camera/fragment/BaseFragment;

    move-result-object v0

    .local v0, "dualFragment":Lcom/android/camera/fragment/BaseFragment;
    goto/16 :goto_0

    .line 164
    .end local v0    # "dualFragment":Lcom/android/camera/fragment/BaseFragment;
    :cond_2
    iget-object v9, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->originalFragments:Landroid/util/SparseIntArray;

    const v10, 0x7f0a0099

    const/16 v11, 0xf0

    invoke-virtual {v9, v10, v11}, Landroid/util/SparseIntArray;->put(II)V

    goto/16 :goto_1
.end method

.method public registerProtocol()V
    .locals 2

    .prologue
    .line 98
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 99
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 103
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 104
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->animationComposite:Lcom/android/camera/animation/AnimationComposite;

    invoke-virtual {v0}, Lcom/android/camera/animation/AnimationComposite;->destroy()V

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/BaseFragmentDelegate;->mActivity:Lcom/android/camera/Camera;

    .line 106
    return-void
.end method
