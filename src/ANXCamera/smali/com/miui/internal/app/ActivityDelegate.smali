.class public Lcom/miui/internal/app/ActivityDelegate;
.super Lcom/miui/internal/app/ActionBarDelegateImpl;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuPresenter$Callback;
.implements Lcom/miui/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/ActivityDelegate$1;
    }
.end annotation


# static fields
.field private static final adZ:Ljava/lang/String; = "miui:ActionBar"

.field private static final aea:Lmiui/reflect/Method;

.field private static final aeb:Lmiui/reflect/Method;

.field private static final aec:Lmiui/reflect/Method;


# instance fields
.field private aed:Lcom/miui/internal/widget/ActionBarContainer;

.field private final aee:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final aef:Ljava/lang/Runnable;

.field private aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 49
    const-class v0, Landroid/app/Activity;

    const-string/jumbo v1, "onCreatePanelMenu"

    .line 50
    const-string/jumbo v2, "(ILandroid/view/Menu;)Z"

    .line 49
    invoke-static {v0, v1, v2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/miui/internal/app/ActivityDelegate;->aea:Lmiui/reflect/Method;

    .line 52
    const-class v0, Landroid/app/Activity;

    const-string/jumbo v1, "onPreparePanel"

    .line 53
    const-string/jumbo v2, "(ILandroid/view/View;Landroid/view/Menu;)Z"

    .line 52
    invoke-static {v0, v1, v2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/miui/internal/app/ActivityDelegate;->aec:Lmiui/reflect/Method;

    .line 55
    const-class v0, Landroid/app/Activity;

    const-string/jumbo v1, "onMenuItemSelected"

    .line 56
    const-string/jumbo v2, "(ILandroid/view/MenuItem;)Z"

    .line 55
    invoke-static {v0, v1, v2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/miui/internal/app/ActivityDelegate;->aeb:Lmiui/reflect/Method;

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/miui/internal/app/ActionBarDelegateImpl;-><init>(Landroid/app/Activity;)V

    .line 64
    new-instance v0, Lcom/miui/internal/app/ActivityDelegate$1;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActivityDelegate$1;-><init>(Lcom/miui/internal/app/ActivityDelegate;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aef:Ljava/lang/Runnable;

    .line 80
    iput-object p2, p0, Lcom/miui/internal/app/ActivityDelegate;->aee:Ljava/lang/Class;

    .line 81
    return-void
.end method

.method public static getDecorViewLayoutRes(Landroid/view/Window;)I
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 89
    invoke-virtual {p0}, Landroid/view/Window;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 91
    sget v0, Lcom/miui/internal/R$attr;->windowActionBar:I

    .line 90
    invoke-static {v2, v0, v4}, Lmiui/util/AttributeResolver;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 93
    sget v0, Lcom/miui/internal/R$attr;->windowActionBarMovable:I

    .line 92
    invoke-static {v2, v0, v4}, Lmiui/util/AttributeResolver;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 94
    sget v0, Lcom/miui/internal/R$layout;->screen_action_bar_movable:I

    .line 103
    :goto_17
    sget v1, Lmiui/R$attr;->startingWindowOverlay:I

    .line 102
    invoke-static {v2, v1}, Lmiui/util/AttributeResolver;->resolve(Landroid/content/Context;I)I

    move-result v1

    .line 104
    if-lez v1, :cond_2c

    invoke-static {}, Lcom/miui/internal/app/ActivityDelegate;->zv()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-static {v2}, Lcom/miui/internal/app/ActivityDelegate;->zw(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move v0, v1

    .line 108
    :cond_2c
    invoke-virtual {p0}, Landroid/view/Window;->isFloating()Z

    move-result v1

    if-nez v1, :cond_4b

    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Dialog;

    if-eqz v1, :cond_4b

    .line 110
    sget v1, Lcom/miui/internal/R$attr;->windowTranslucentStatus:I

    .line 109
    invoke-static {v2, v1, v4}, Lmiui/util/AttributeResolver;->resolveInt(Landroid/content/Context;II)I

    move-result v1

    .line 111
    invoke-static {}, Lcom/miui/internal/variable/Android_View_Window_class$Factory;->getInstance()Lcom/miui/internal/variable/Android_View_Window_class$Factory;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/internal/variable/Android_View_Window_class$Factory;->get()Lcom/miui/internal/variable/Android_View_Window_class;

    move-result-object v2

    .line 112
    invoke-virtual {v2, p0, v1}, Lcom/miui/internal/variable/Android_View_Window_class;->setTranslucentStatus(Landroid/view/Window;I)Z

    .line 114
    :cond_4b
    return v0

    .line 96
    :cond_4c
    sget v0, Lcom/miui/internal/R$layout;->screen_action_bar:I

    goto :goto_17

    .line 99
    :cond_4f
    sget v0, Lcom/miui/internal/R$layout;->screen_simple:I

    goto :goto_17
.end method

.method static synthetic zA(Lcom/miui/internal/app/ActivityDelegate;ILandroid/view/Menu;)Z
    .registers 4

    invoke-direct {p0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->zx(ILandroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method static synthetic zB(Lcom/miui/internal/app/ActivityDelegate;ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/internal/app/ActivityDelegate;->zz(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method private static zv()Z
    .registers 2

    .prologue
    .line 118
    const-string/jumbo v0, "android"

    invoke-static {}, Lmiui/util/AppConstants;->getCurrentApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static zw(Landroid/content/Context;)Z
    .registers 3

    .prologue
    .line 123
    sget v0, Lmiui/R$attr;->windowActionBar:I

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lmiui/util/AttributeResolver;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    return v0
.end method

.method private zx(ILandroid/view/Menu;)Z
    .registers 9

    .prologue
    .line 420
    sget-object v0, Lcom/miui/internal/app/ActivityDelegate;->aea:Lmiui/reflect/Method;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aee:Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 421
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p2, v3, v4

    .line 420
    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invokeBoolean(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private zy(ILandroid/view/MenuItem;)Z
    .registers 9

    .prologue
    .line 430
    sget-object v0, Lcom/miui/internal/app/ActivityDelegate;->aeb:Lmiui/reflect/Method;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aee:Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 431
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p2, v3, v4

    .line 430
    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invokeBoolean(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private zz(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 10

    .prologue
    .line 425
    sget-object v0, Lcom/miui/internal/app/ActivityDelegate;->aec:Lmiui/reflect/Method;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aee:Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    .line 426
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    .line 425
    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invokeBoolean(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public createActionBar()Lmiui/app/ActionBar;
    .registers 3

    .prologue
    .line 137
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method protected installSubDecor()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 159
    iget-boolean v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mSubDecorInstalled:Z

    if-eqz v0, :cond_7

    .line 160
    return-void

    .line 163
    :cond_7
    iput-boolean v7, p0, Lcom/miui/internal/app/ActivityDelegate;->mSubDecorInstalled:Z

    .line 165
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    sget-object v1, Lmiui/R$styleable;->Window:[I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 167
    sget v0, Lmiui/R$styleable;->Window_windowLayoutMode:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    if-ne v0, v7, :cond_24

    .line 170
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 173
    :cond_24
    sget v0, Lmiui/R$styleable;->Window_windowActionBar:I

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-nez v0, :cond_38

    .line 174
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 175
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "You need to use a miui theme (or descendant) with this activity."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    :cond_38
    sget v0, Lmiui/R$styleable;->Window_windowActionBar:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 179
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActivityDelegate;->requestWindowFeature(I)Z

    .line 181
    :cond_45
    sget v0, Lmiui/R$styleable;->Window_windowActionBarOverlay:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 182
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActivityDelegate;->requestWindowFeature(I)Z

    .line 185
    :cond_52
    sget v0, Lcom/miui/internal/R$styleable;->Window_windowTranslucentStatus:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActivityDelegate;->setTranslucentStatus(I)V

    .line 189
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 192
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 193
    instance-of v1, v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    if-eqz v1, :cond_154

    .line 194
    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 198
    :goto_75
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setCallback(Landroid/view/Window$Callback;)V

    .line 199
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getTranslucentStatus()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setTranslucentStatus(I)V

    .line 202
    iget-boolean v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeh:Z

    if-eqz v0, :cond_145

    .line 203
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 204
    sget v1, Lcom/miui/internal/R$id;->action_bar_container:I

    .line 203
    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContainer;

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aed:Lcom/miui/internal/widget/ActionBarContainer;

    .line 205
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iget-boolean v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aei:Z

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setOverlayMode(Z)V

    .line 206
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    sget v1, Lcom/miui/internal/R$id;->action_bar:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarView;

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    .line 207
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarView;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 210
    iget-boolean v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mFeatureProgress:Z

    if-eqz v0, :cond_b8

    .line 211
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->initProgress()V

    .line 213
    :cond_b8
    iget-boolean v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mFeatureIndeterminateProgress:Z

    if-eqz v0, :cond_c1

    .line 214
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->initIndeterminateProgress()V

    .line 218
    :cond_c1
    sget v0, Lcom/miui/internal/R$styleable;->Window_immersionMenuLayout:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mImmersionLayoutResourceId:I

    .line 219
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->isImmersionMenuEnabled()Z

    move-result v0

    if-eqz v0, :cond_d6

    .line 220
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mImmersionLayoutResourceId:I

    invoke-virtual {v0, v1, p0}, Lcom/miui/internal/widget/ActionBarView;->initImmersionMore(ILcom/miui/internal/app/ActionBarDelegateImpl;)V

    .line 225
    :cond_d6
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getCustomNavigationView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_eb

    .line 226
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->getDisplayOptions()I

    move-result v1

    or-int/lit8 v1, v1, 0x10

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarView;->setDisplayOptions(I)V

    .line 230
    :cond_eb
    const-string/jumbo v0, "splitActionBarWhenNarrow"

    .line 231
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getUiOptionsFromMetadata()Ljava/lang/String;

    move-result-object v1

    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 234
    if-eqz v4, :cond_15e

    .line 235
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 236
    sget v1, Lcom/miui/internal/R$bool;->abc_split_action_bar_is_narrow:I

    .line 235
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    move v2, v0

    .line 241
    :goto_105
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 242
    sget v1, Lcom/miui/internal/R$id;->split_action_bar:I

    .line 241
    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContainer;

    .line 243
    if-eqz v0, :cond_136

    .line 244
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 245
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v2}, Lcom/miui/internal/widget/ActionBarView;->setSplitActionBar(Z)V

    .line 246
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarView;->setSplitWhenNarrow(Z)V

    .line 248
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 249
    sget v5, Lcom/miui/internal/R$id;->action_context_bar:I

    .line 248
    invoke-virtual {v1, v5}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/widget/ActionBarContextView;

    .line 250
    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setActionBarContextView(Lcom/miui/internal/widget/ActionBarContextView;)V

    .line 251
    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 252
    invoke-virtual {v1, v2}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitActionBar(Z)V

    .line 253
    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitWhenNarrow(Z)V

    .line 256
    :cond_136
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aef:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 259
    :cond_145
    sget v0, Lcom/miui/internal/R$styleable;->Window_immersionMenuEnabled:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    if-eqz v0, :cond_150

    .line 260
    invoke-virtual {p0, v7}, Lcom/miui/internal/app/ActivityDelegate;->setImmersionMenuEnabled(Z)V

    .line 263
    :cond_150
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 264
    return-void

    .line 196
    :cond_154
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    goto/16 :goto_75

    .line 238
    :cond_15e
    sget v0, Lmiui/R$styleable;->Window_windowSplitActionBar:I

    invoke-virtual {v3, v0, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    move v2, v0

    goto :goto_105
.end method

.method public invalidateOptionsMenu()V
    .registers 2

    .prologue
    .line 379
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aef:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 380
    return-void
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .registers 3

    .prologue
    .line 402
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionMode:Landroid/view/ActionMode;

    .line 403
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .registers 2

    .prologue
    .line 397
    iput-object p1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionMode:Landroid/view/ActionMode;

    .line 398
    return-void
.end method

.method public onBackPressed()Z
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 406
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_b

    .line 407
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    .line 408
    return v1

    .line 411
    :cond_b
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->hasExpandedActionView()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 412
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->collapseActionView()V

    .line 413
    return v1

    .line 416
    :cond_1d
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 8

    .prologue
    .line 128
    invoke-super {p0, p1}, Lcom/miui/internal/app/ActionBarDelegateImpl;->onCreate(Landroid/os/Bundle;)V

    .line 129
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->installSubDecor()V

    .line 130
    invoke-static {}, Lmiui/extension/ExtensionManager;->getInstance()Lmiui/extension/ExtensionManager;

    move-result-object v0

    const-string/jumbo v1, "Activity"

    .line 131
    const-string/jumbo v2, "onCreate"

    .line 130
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 132
    iget-object v4, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 133
    const/4 v4, 0x1

    aput-object p1, v3, v4

    .line 130
    invoke-virtual {v0, v1, v2, v3}, Lmiui/extension/ExtensionManager;->invoke(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 134
    return-void
.end method

.method protected onCreateImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 436
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 313
    if-eqz p1, :cond_7

    invoke-direct {p0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->zx(ILandroid/view/Menu;)Z

    move-result v0

    :cond_7
    return v0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 274
    if-nez p1, :cond_31

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->isImmersionMenuEnabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_31

    .line 275
    const/4 v1, 0x1

    .line 276
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 279
    iget-object v2, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionMode:Landroid/view/ActionMode;

    if-nez v2, :cond_2c

    .line 280
    if-nez v0, :cond_23

    .line 282
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->createMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    .line 283
    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActivityDelegate;->setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 286
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 288
    invoke-direct {p0, v4, v0}, Lcom/miui/internal/app/ActivityDelegate;->zx(ILandroid/view/Menu;)Z

    move-result v1

    .line 291
    :cond_23
    if-eqz v1, :cond_2c

    .line 293
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 295
    invoke-direct {p0, v4, v3, v0}, Lcom/miui/internal/app/ActivityDelegate;->zz(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v1

    .line 299
    :cond_2c
    if-eqz v1, :cond_32

    .line 301
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 308
    :cond_31
    :goto_31
    return-object v3

    .line 304
    :cond_32
    invoke-virtual {p0, v3}, Lcom/miui/internal/app/ActivityDelegate;->setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V

    goto :goto_31
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 5

    .prologue
    .line 352
    invoke-direct {p0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->zy(ILandroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 353
    if-nez p1, :cond_38

    .line 354
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_38

    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 355
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getDisplayOptions()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_38

    .line 357
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_3a

    .line 358
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->onNavigateUp()Z

    move-result v0

    .line 363
    :goto_31
    if-nez v0, :cond_38

    .line 364
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 369
    :cond_38
    const/4 v0, 0x1

    return v0

    .line 360
    :cond_3a
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->onNavigateUpFromChild(Landroid/app/Activity;)Z

    move-result v0

    goto :goto_31
.end method

.method public onMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 5

    .prologue
    .line 374
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Landroid/app/Activity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPostResume()V
    .registers 3

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 153
    if-eqz v0, :cond_c

    .line 154
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setShowHideAnimationEnabled(Z)V

    .line 156
    :cond_c
    return-void
.end method

.method protected onPrepareImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 441
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 318
    if-eqz p1, :cond_7

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/internal/app/ActivityDelegate;->zz(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    :cond_7
    return v0
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .prologue
    .line 330
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aed:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_12

    .line 331
    const-string/jumbo v0, "miui:ActionBar"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    .line 332
    if-eqz v0, :cond_12

    .line 333
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aed:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContainer;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 336
    :cond_12
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .prologue
    .line 322
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aed:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_14

    .line 323
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 324
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate;->aed:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContainer;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 325
    const-string/jumbo v1, "miui:ActionBar"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 327
    :cond_14
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 142
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActivityDelegate;->dismissImmersionMenu(Z)V

    .line 144
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 145
    if-eqz v0, :cond_f

    .line 146
    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setShowHideAnimationEnabled(Z)V

    .line 148
    :cond_f
    return-void
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 267
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_9

    .line 268
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 270
    :cond_9
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 389
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 390
    invoke-virtual {p0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarImpl;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0

    .line 392
    :cond_12
    return-object v1
.end method

.method public setOnStatusBarChangeListener(Lmiui/app/OnStatusBarChangeListener;)V
    .registers 3

    .prologue
    .line 445
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_9

    .line 446
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setOnStatusBarChangeListener(Lmiui/app/OnStatusBarChangeListener;)V

    .line 448
    :cond_9
    return-void
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 384
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate;->aeg:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0
.end method
