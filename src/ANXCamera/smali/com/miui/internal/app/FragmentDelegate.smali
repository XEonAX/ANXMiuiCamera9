.class public Lcom/miui/internal/app/FragmentDelegate;
.super Lcom/miui/internal/app/ActionBarDelegateImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/FragmentDelegate$1;,
        Lcom/miui/internal/app/FragmentDelegate$2;
    }
.end annotation


# static fields
.field public static final MENU_INVALIDATE:I = 0x1

.field private static final aer:I = 0x10


# instance fields
.field private aes:I

.field private aet:Landroid/app/Fragment;

.field private aeu:B

.field private final aev:Ljava/lang/Runnable;

.field private aew:Landroid/view/View;

.field private aex:Landroid/content/Context;

.field private final aey:Landroid/view/Window$Callback;

.field private mMenu:Lcom/miui/internal/view/menu/MenuBuilder;


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 3

    .prologue
    .line 104
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/ActionBarDelegateImpl;-><init>(Landroid/app/Activity;)V

    .line 53
    new-instance v0, Lcom/miui/internal/app/FragmentDelegate$1;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/FragmentDelegate$1;-><init>(Lcom/miui/internal/app/FragmentDelegate;)V

    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aev:Ljava/lang/Runnable;

    .line 81
    new-instance v0, Lcom/miui/internal/app/FragmentDelegate$2;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/FragmentDelegate$2;-><init>(Lcom/miui/internal/app/FragmentDelegate;)V

    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aey:Landroid/view/Window$Callback;

    .line 105
    iput-object p1, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    .line 106
    return-void
.end method

.method static synthetic zD(Lcom/miui/internal/app/FragmentDelegate;)Landroid/app/Fragment;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    return-object v0
.end method

.method static synthetic zE(Lcom/miui/internal/app/FragmentDelegate;)B
    .registers 2

    iget-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    return v0
.end method

.method static synthetic zF(Lcom/miui/internal/app/FragmentDelegate;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method static synthetic zG(Lcom/miui/internal/app/FragmentDelegate;B)B
    .registers 2

    iput-byte p1, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    return p1
.end method

.method static synthetic zH(Lcom/miui/internal/app/FragmentDelegate;Lcom/miui/internal/view/menu/MenuBuilder;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 2

    iput-object p1, p0, Lcom/miui/internal/app/FragmentDelegate;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    return-object p1
.end method


# virtual methods
.method public createActionBar()Lmiui/app/ActionBar;
    .registers 3

    .prologue
    .line 110
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl;

    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    invoke-direct {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;-><init>(Landroid/app/Fragment;)V

    return-object v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 4

    .prologue
    .line 293
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aex:Landroid/content/Context;

    if-nez v0, :cond_17

    .line 294
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->mActivity:Landroid/app/Activity;

    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aex:Landroid/content/Context;

    .line 295
    iget v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aes:I

    if-eqz v0, :cond_17

    .line 296
    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aex:Landroid/content/Context;

    iget v2, p0, Lcom/miui/internal/app/FragmentDelegate;->aes:I

    invoke-direct {v0, v1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aex:Landroid/content/Context;

    .line 299
    :cond_17
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aex:Landroid/content/Context;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    return-object v0
.end method

.method public invalidateOptionsMenu()V
    .registers 3

    .prologue
    .line 263
    iget-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    and-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_20

    .line 264
    iget-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    or-int/lit8 v0, v0, 0x10

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    .line 265
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aev:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 267
    :cond_20
    return-void
.end method

.method protected onCreateImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 304
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    instance-of v0, v0, Lmiui/app/IFragment;

    if-eqz v0, :cond_f

    .line 305
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    check-cast v0, Lmiui/app/IFragment;

    invoke-interface {v0, p1}, Lmiui/app/IFragment;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    .line 308
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 232
    if-nez p1, :cond_c

    .line 233
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    check-cast v0, Lmiui/app/IFragment;

    invoke-interface {v0, p1, p2}, Lmiui/app/IFragment;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    return v0

    .line 235
    :cond_c
    return v0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .registers 3

    .prologue
    .line 227
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 114
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lmiui/R$styleable;->Window:[I

    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 115
    sget v1, Lmiui/R$styleable;->Window_windowActionBar:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 116
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 117
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "You need to use a miui theme (or descendant) with this fragment."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_1f
    sget v1, Lmiui/R$styleable;->Window_windowActionBar:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 120
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/FragmentDelegate;->requestWindowFeature(I)Z

    .line 122
    :cond_2c
    sget v1, Lmiui/R$styleable;->Window_windowActionBarOverlay:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 123
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/FragmentDelegate;->requestWindowFeature(I)Z

    .line 125
    :cond_39
    sget v1, Lcom/miui/internal/R$styleable;->Window_windowTranslucentStatus:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/FragmentDelegate;->setTranslucentStatus(I)V

    .line 127
    sget v1, Lcom/miui/internal/R$styleable;->Window_immersionMenuEnabled:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/FragmentDelegate;->setImmersionMenuEnabled(Z)V

    .line 128
    sget v1, Lcom/miui/internal/R$styleable;->Window_immersionMenuLayout:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mImmersionLayoutResourceId:I

    .line 129
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 131
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 132
    iget-boolean v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeh:Z

    if-eqz v0, :cond_9c

    .line 133
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1, v2}, Lcom/miui/internal/app/FragmentDelegate;->zC(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)V

    .line 136
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 137
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    check-cast v1, Lmiui/app/IFragment;

    invoke-interface {v1, v2, v0, p2}, Lmiui/app/IFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v2

    .line 138
    if-eqz v2, :cond_99

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v1, v0, :cond_99

    .line 139
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_93

    .line 140
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 142
    :cond_93
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 143
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 149
    :cond_99
    :goto_99
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    return-object v0

    .line 146
    :cond_9c
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    check-cast v0, Lmiui/app/IFragment;

    invoke-interface {v0, v2, p1, p2}, Lmiui/app/IFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    goto :goto_99
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 241
    if-nez p1, :cond_a

    .line 242
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    invoke-virtual {v0, p2}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    .line 244
    :cond_a
    return v0
.end method

.method public onMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4

    .prologue
    .line 258
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/internal/app/FragmentDelegate;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method protected onPrepareImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 313
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    instance-of v0, v0, Lmiui/app/IFragment;

    if-eqz v0, :cond_d

    .line 314
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    invoke-virtual {v0, p1}, Landroid/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 315
    const/4 v0, 0x1

    return v0

    .line 318
    :cond_d
    const/4 v0, 0x0

    return v0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 249
    if-nez p1, :cond_d

    .line 250
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aet:Landroid/app/Fragment;

    check-cast v0, Lmiui/app/IFragment;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1, p3}, Lmiui/app/IFragment;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)V

    .line 251
    const/4 v0, 0x1

    return v0

    .line 253
    :cond_d
    return v0
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 281
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 282
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarImpl;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0

    .line 284
    :cond_12
    return-object v1
.end method

.method public setExtraThemeRes(I)V
    .registers 2

    .prologue
    .line 288
    iput p1, p0, Lcom/miui/internal/app/FragmentDelegate;->aes:I

    .line 289
    return-void
.end method

.method public setOnStatusBarChangeListener(Lmiui/app/OnStatusBarChangeListener;)V
    .registers 3

    .prologue
    .line 322
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    instance-of v0, v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_11

    .line 323
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setOnStatusBarChangeListener(Lmiui/app/OnStatusBarChangeListener;)V

    .line 325
    :cond_11
    return-void
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 276
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0
.end method

.method public updateOptionsMenu(I)V
    .registers 4

    .prologue
    .line 270
    iget-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    and-int/lit8 v1, p1, 0x1

    or-int/2addr v0, v1

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aeu:B

    .line 271
    return-void
.end method

.method final zC(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)V
    .registers 10

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 153
    iget-boolean v0, p0, Lcom/miui/internal/app/FragmentDelegate;->mSubDecorInstalled:Z

    if-nez v0, :cond_c1

    .line 154
    iput-boolean v5, p0, Lcom/miui/internal/app/FragmentDelegate;->mSubDecorInstalled:Z

    .line 156
    sget v0, Lcom/miui/internal/R$layout;->screen_action_bar:I

    .line 155
    invoke-virtual {p3, v0, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 157
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aey:Landroid/view/Window$Callback;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setCallback(Landroid/view/Window$Callback;)V

    .line 158
    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setRootSubDecor(Z)V

    .line 159
    iget-boolean v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aei:Z

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setOverlayMode(Z)V

    .line 160
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getTranslucentStatus()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setTranslucentStatus(I)V

    .line 162
    iget v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aes:I

    if-eqz v1, :cond_32

    .line 163
    const v1, 0x1010054

    invoke-static {p1, v1}, Lmiui/util/AttributeResolver;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 166
    :cond_32
    sget v1, Lcom/miui/internal/R$id;->action_bar:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/widget/ActionBarView;

    iput-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    .line 167
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget-object v2, p0, Lcom/miui/internal/app/FragmentDelegate;->aey:Landroid/view/Window$Callback;

    invoke-virtual {v1, v2}, Lcom/miui/internal/widget/ActionBarView;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 170
    iget-boolean v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mFeatureProgress:Z

    if-eqz v1, :cond_4c

    .line 171
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->initProgress()V

    .line 173
    :cond_4c
    iget-boolean v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mFeatureIndeterminateProgress:Z

    if-eqz v1, :cond_55

    .line 174
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->initIndeterminateProgress()V

    .line 178
    :cond_55
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->isImmersionMenuEnabled()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 179
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget v2, p0, Lcom/miui/internal/app/FragmentDelegate;->mImmersionLayoutResourceId:I

    invoke-virtual {v1, v2, p0}, Lcom/miui/internal/widget/ActionBarView;->initImmersionMore(ILcom/miui/internal/app/ActionBarDelegateImpl;)V

    .line 183
    :cond_62
    const-string/jumbo v1, "splitActionBarWhenNarrow"

    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->getUiOptionsFromMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 186
    if-eqz v4, :cond_b0

    .line 187
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 188
    sget v2, Lcom/miui/internal/R$bool;->abc_split_action_bar_is_narrow:I

    .line 187
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    move v3, v1

    .line 196
    :goto_7a
    sget v1, Lcom/miui/internal/R$id;->split_action_bar:I

    .line 195
    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/widget/ActionBarContainer;

    .line 197
    if-eqz v1, :cond_a7

    .line 198
    iget-object v2, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v2, v1}, Lcom/miui/internal/widget/ActionBarView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 199
    iget-object v2, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v2, v3}, Lcom/miui/internal/widget/ActionBarView;->setSplitActionBar(Z)V

    .line 200
    iget-object v2, p0, Lcom/miui/internal/app/FragmentDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v2, v4}, Lcom/miui/internal/widget/ActionBarView;->setSplitWhenNarrow(Z)V

    .line 203
    sget v2, Lcom/miui/internal/R$id;->action_context_bar:I

    .line 202
    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/internal/widget/ActionBarContextView;

    .line 204
    invoke-virtual {v1, v2}, Lcom/miui/internal/widget/ActionBarContainer;->setActionBarContextView(Lcom/miui/internal/widget/ActionBarContextView;)V

    .line 205
    invoke-virtual {v2, v1}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 206
    invoke-virtual {v2, v3}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitActionBar(Z)V

    .line 207
    invoke-virtual {v2, v4}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitWhenNarrow(Z)V

    .line 210
    :cond_a7
    invoke-virtual {p0, v5}, Lcom/miui/internal/app/FragmentDelegate;->updateOptionsMenu(I)V

    .line 211
    invoke-virtual {p0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 212
    iput-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    .line 219
    :cond_af
    :goto_af
    return-void

    .line 190
    :cond_b0
    sget-object v1, Lmiui/R$styleable;->Window:[I

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 191
    sget v1, Lmiui/R$styleable;->Window_windowSplitActionBar:I

    invoke-virtual {v2, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 192
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    move v3, v1

    goto :goto_7a

    .line 213
    :cond_c1
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_af

    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_af

    .line 214
    iget-object v0, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 215
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-nez v1, :cond_af

    .line 216
    iget-object v1, p0, Lcom/miui/internal/app/FragmentDelegate;->aew:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    goto :goto_af
.end method
