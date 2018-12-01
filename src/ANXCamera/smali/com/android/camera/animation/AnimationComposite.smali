.class public Lcom/android/camera/animation/AnimationComposite;
.super Ljava/lang/Object;
.source "AnimationComposite.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

.field private mAfterFrameArrivedEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimationDisposable:Lio/reactivex/disposables/Disposable;

.field private mCurrentDegree:I

.field private mOrientation:I

.field private mResourceSparseArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera/animation/AnimationDelegate$AnimationResource;",
            ">;"
        }
    .end annotation
.end field

.field private mRotationAnimator:Landroid/animation/ValueAnimator;

.field private mStartDegree:I

.field private mTargetDegree:I


# direct methods
.method static synthetic -get0(Lcom/android/camera/animation/AnimationComposite;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/animation/AnimationComposite;

    .prologue
    iget v0, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/animation/AnimationComposite;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/animation/AnimationComposite;
    .param p1, "-value"    # Lio/reactivex/ObservableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/animation/AnimationComposite;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/animation/AnimationComposite;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    return p1
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    .line 121
    iput v1, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    .line 123
    iput v1, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    .line 124
    iput v1, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    .line 43
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    .line 45
    new-instance v0, Lcom/android/camera/animation/AnimationComposite$1;

    invoke-direct {v0, p0}, Lcom/android/camera/animation/AnimationComposite$1;-><init>(Lcom/android/camera/animation/AnimationComposite;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    .line 50
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    .line 51
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "integer"    # Ljava/lang/Integer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 254
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 255
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 256
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .line 257
    .local v1, "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    invoke-interface {v1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->canProvide()Z

    move-result v2

    if-nez v2, :cond_0

    .line 255
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 260
    :cond_0
    invoke-interface {v1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->isEnableClick()Z

    move-result v2

    if-nez v2, :cond_1

    .line 261
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->setClickEnable(Z)V

    .line 263
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->notifyAfterFrameAvailable(I)V

    goto :goto_1

    .line 265
    .end local v1    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    :cond_2
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 249
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/animation/AnimationComposite;->accept(Ljava/lang/Integer;)V

    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 236
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 238
    iput-object v1, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 242
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 244
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 245
    iput-object v1, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    .line 247
    :cond_1
    return-void
.end method

.method public dispose(Lio/reactivex/Completable;Lio/reactivex/functions/Action;Lcom/android/camera/module/loader/StartControl;)Lio/reactivex/disposables/Disposable;
    .locals 9
    .param p1, "prefixCompletable"    # Lio/reactivex/Completable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "resultAction"    # Lio/reactivex/functions/Action;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "startControl"    # Lcom/android/camera/module/loader/StartControl;

    .prologue
    const/4 v7, 0x0

    .line 65
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v1, "inElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    if-eqz p1, :cond_0

    .line 68
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_0
    iget-boolean v6, p3, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureView:Z

    if-eqz v6, :cond_4

    .line 80
    iget v3, p3, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 81
    .local v3, "newMode":I
    iget-boolean v2, p3, Lcom/android/camera/module/loader/StartControl;->mNeedViewAnimation:Z

    .line 82
    .local v2, "needViewAnimation":Z
    iget v6, p3, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    const/4 v8, 0x2

    if-ne v6, v8, :cond_1

    const/4 v5, 0x1

    .line 83
    .local v5, "timeOut":Z
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    if-ge v0, v6, :cond_4

    .line 84
    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v6, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .line 85
    .local v4, "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    invoke-interface {v4}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->canProvide()Z

    move-result v6

    if-nez v6, :cond_2

    .line 83
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 82
    .end local v0    # "i":I
    .end local v4    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    .end local v5    # "timeOut":Z
    :cond_1
    const/4 v5, 0x0

    .restart local v5    # "timeOut":Z
    goto :goto_0

    .line 88
    .restart local v0    # "i":I
    .restart local v4    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    :cond_2
    if-eqz v2, :cond_3

    move-object v6, v1

    :goto_3
    invoke-interface {v4, v3, v6, v5}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->provideAnimateElement(ILjava/util/List;Z)V

    goto :goto_2

    :cond_3
    move-object v6, v7

    goto :goto_3

    .line 106
    .end local v0    # "i":I
    .end local v2    # "needViewAnimation":Z
    .end local v3    # "newMode":I
    .end local v4    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    .end local v5    # "timeOut":Z
    :cond_4
    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v6}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_5

    .line 107
    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v6}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 110
    :cond_5
    if-eqz p2, :cond_6

    .line 111
    invoke-static {v1}, Lio/reactivex/Completable;->merge(Ljava/lang/Iterable;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-virtual {v6, p2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    move-result-object v6

    iput-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    .line 117
    :goto_4
    iget-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    return-object v6

    .line 113
    :cond_6
    invoke-static {v1}, Lio/reactivex/Completable;->merge(Ljava/lang/Iterable;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-virtual {v6}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v6

    iput-object v6, p0, Lcom/android/camera/animation/AnimationComposite;->mAnimationDisposable:Lio/reactivex/disposables/Disposable;

    goto :goto_4
.end method

.method public disposeRotation(I)V
    .locals 14
    .param p1, "orientation"    # I

    .prologue
    const/16 v13, 0x168

    const/4 v12, 0x0

    .line 132
    if-ltz p1, :cond_0

    rem-int/lit16 p1, p1, 0x168

    .line 133
    :goto_0
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    if-ne v10, p1, :cond_1

    .line 134
    return-void

    .line 132
    :cond_0
    rem-int/lit16 v10, p1, 0x168

    add-int/lit16 p1, v10, 0x168

    goto :goto_0

    .line 136
    :cond_1
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_3

    const/4 v5, 0x1

    .line 138
    .local v5, "needAnimation":Z
    :goto_1
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    sub-int v3, p1, v10

    .line 139
    .local v3, "diff":I
    if-ltz v3, :cond_4

    .line 143
    :goto_2
    const/16 v10, 0xb4

    if-le v3, v10, :cond_2

    add-int/lit16 v3, v3, -0x168

    .line 144
    :cond_2
    if-gtz v3, :cond_5

    const/4 v2, 0x1

    .line 146
    .local v2, "clockWise":Z
    :goto_3
    iput p1, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    .line 147
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mOrientation:I

    if-nez v10, :cond_6

    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    if-nez v10, :cond_6

    .line 148
    return-void

    .line 136
    .end local v2    # "clockWise":Z
    .end local v3    # "diff":I
    .end local v5    # "needAnimation":Z
    :cond_3
    const/4 v5, 0x0

    .restart local v5    # "needAnimation":Z
    goto :goto_1

    .line 139
    .restart local v3    # "diff":I
    :cond_4
    add-int/lit16 v3, v3, 0x168

    goto :goto_2

    .line 144
    :cond_5
    const/4 v2, 0x0

    .restart local v2    # "clockWise":Z
    goto :goto_3

    .line 151
    :cond_6
    rsub-int v10, p1, 0x168

    rem-int/lit16 v10, v10, 0x168

    iput v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    .line 153
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v6, "pendingViews":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v10}, Landroid/util/SparseArray;->size()I

    move-result v10

    if-ge v4, v10, :cond_8

    .line 156
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v10, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .line 157
    .local v7, "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    invoke-interface {v7}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->canProvide()Z

    move-result v10

    if-nez v10, :cond_7

    .line 155
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 160
    :cond_7
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    invoke-interface {v7, v6, v10}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->provideRotateItem(Ljava/util/List;I)V

    goto :goto_5

    .line 163
    .end local v7    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    :cond_8
    if-nez v5, :cond_a

    .line 164
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    iput v10, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    .line 165
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "view$iterator":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    .line 166
    .local v8, "view":Landroid/view/View;
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    int-to-float v10, v10

    invoke-static {v8, v10}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    goto :goto_6

    .line 168
    .end local v8    # "view":Landroid/view/View;
    :cond_9
    return-void

    .line 171
    .end local v9    # "view$iterator":Ljava/util/Iterator;
    :cond_a
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    if-eqz v10, :cond_b

    .line 172
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v10}, Landroid/animation/ValueAnimator;->cancel()V

    .line 175
    :cond_b
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mCurrentDegree:I

    iput v10, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    .line 180
    if-eqz v2, :cond_e

    .line 181
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    if-ne v10, v13, :cond_c

    const/4 v1, 0x0

    .line 182
    .local v1, "animateStart":I
    :goto_7
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    if-nez v10, :cond_d

    const/16 v0, 0x168

    .line 188
    .local v0, "animateEnd":I
    :goto_8
    const/4 v10, 0x2

    new-array v10, v10, [I

    aput v1, v10, v12

    const/4 v11, 0x1

    aput v0, v10, v11

    invoke-static {v10}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v10

    iput-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    .line 189
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    new-instance v11, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v10, v11}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 190
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v10}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 191
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    new-instance v11, Lcom/android/camera/animation/AnimationComposite$2;

    invoke-direct {v11, p0, v6}, Lcom/android/camera/animation/AnimationComposite$2;-><init>(Lcom/android/camera/animation/AnimationComposite;Ljava/util/List;)V

    invoke-virtual {v10, v11}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 201
    iget-object v10, p0, Lcom/android/camera/animation/AnimationComposite;->mRotationAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v10}, Landroid/animation/ValueAnimator;->start()V

    .line 202
    return-void

    .line 181
    .end local v0    # "animateEnd":I
    .end local v1    # "animateStart":I
    :cond_c
    iget v1, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    .restart local v1    # "animateStart":I
    goto :goto_7

    .line 182
    :cond_d
    iget v0, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    .restart local v0    # "animateEnd":I
    goto :goto_8

    .line 184
    .end local v0    # "animateEnd":I
    .end local v1    # "animateStart":I
    :cond_e
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    if-nez v10, :cond_f

    const/16 v1, 0x168

    .line 185
    .restart local v1    # "animateStart":I
    :goto_9
    iget v10, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    if-ne v10, v13, :cond_10

    const/4 v0, 0x0

    .restart local v0    # "animateEnd":I
    goto :goto_8

    .line 184
    .end local v0    # "animateEnd":I
    .end local v1    # "animateStart":I
    :cond_f
    iget v1, p0, Lcom/android/camera/animation/AnimationComposite;->mStartDegree:I

    .restart local v1    # "animateStart":I
    goto :goto_9

    .line 185
    :cond_10
    iget v0, p0, Lcom/android/camera/animation/AnimationComposite;->mTargetDegree:I

    .restart local v0    # "animateEnd":I
    goto :goto_8
.end method

.method public notifyAfterFirstFrameArrived(I)V
    .locals 2
    .param p1, "arrivedType"    # I

    .prologue
    .line 228
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 229
    :cond_0
    return-void

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mAfterFrameArrivedEmitter:Lio/reactivex/ObservableEmitter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 233
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 3
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 218
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 219
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .line 220
    .local v1, "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    invoke-interface {v1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->canProvide()Z

    move-result v2

    if-nez v2, :cond_0

    .line 218
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 223
    :cond_0
    invoke-interface {v1, p1, p2}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->notifyDataChanged(II)V

    goto :goto_1

    .line 225
    .end local v1    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    :cond_1
    return-void
.end method

.method public put(ILcom/android/camera/animation/AnimationDelegate$AnimationResource;)V
    .locals 1
    .param p1, "fragmentInfo"    # I
    .param p2, "resource"    # Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 56
    return-void
.end method

.method public remove(I)V
    .locals 1
    .param p1, "fragmentInfo"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 60
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 205
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 206
    iget-object v2, p0, Lcom/android/camera/animation/AnimationComposite;->mResourceSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;

    .line 207
    .local v1, "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    invoke-interface {v1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->canProvide()Z

    move-result v2

    if-nez v2, :cond_1

    .line 205
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 210
    :cond_1
    invoke-interface {v1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->isEnableClick()Z

    move-result v2

    if-eq v2, p1, :cond_0

    .line 211
    invoke-interface {v1, p1}, Lcom/android/camera/animation/AnimationDelegate$AnimationResource;->setClickEnable(Z)V

    goto :goto_1

    .line 214
    .end local v1    # "resource":Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
    :cond_2
    return-void
.end method
