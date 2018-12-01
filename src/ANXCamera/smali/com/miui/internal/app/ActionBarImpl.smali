.class public Lcom/miui/internal/app/ActionBarImpl;
.super Lmiui/app/ActionBar;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/ActionBarImpl$1;,
        Lcom/miui/internal/app/ActionBarImpl$2;,
        Lcom/miui/internal/app/ActionBarImpl$TabImpl;
    }
.end annotation


# static fields
.field private static final aeA:I = 0x1

.field private static final aeB:I = -0x1

.field private static final aez:I

.field private static aff:Landroid/app/ActionBar$TabListener;


# instance fields
.field private aeC:Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;

.field private aeD:Lcom/miui/internal/widget/ActionModeView;

.field private aeE:Lcom/miui/internal/widget/ActionBarView;

.field private aeF:Landroid/animation/Animator;

.field private aeG:Lcom/miui/internal/widget/ActionBarContainer;

.field private aeH:Landroid/view/View;

.field private aeI:Landroid/view/View$OnClickListener;

.field private aeJ:I

.field private aeK:Lcom/miui/internal/widget/ActionBarContextView;

.field private aeL:I

.field private aeM:Z

.field private aeN:Landroid/app/FragmentManager;

.field private aeO:Z

.field private aeP:Z

.field private aeQ:Z

.field private aeR:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/ActionBar$OnMenuVisibilityListener;",
            ">;"
        }
    .end annotation
.end field

.field private aeS:Z

.field private aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

.field private aeU:I

.field private aeV:Lcom/miui/internal/widget/SearchActionModeView;

.field private aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

.field private aeX:Z

.field private aeY:Z

.field private aeZ:Lcom/miui/internal/view/menu/PhoneActionMenuView;

.field private afa:Landroid/animation/Animator;

.field private afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

.field private afc:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/app/ActionBarImpl$TabImpl;",
            ">;"
        }
    .end annotation
.end field

.field private afd:Landroid/content/Context;

.field private afe:Lcom/miui/internal/app/ActionBarViewPagerController;

.field mActionMode:Landroid/view/ActionMode;

.field private mContext:Landroid/content/Context;

.field private mSplitView:Lcom/miui/internal/widget/ActionBarContainer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$1;

    invoke-direct {v0}, Lcom/miui/internal/app/ActionBarImpl$1;-><init>()V

    .line 65
    sput-object v0, Lcom/miui/internal/app/ActionBarImpl;->aff:Landroid/app/ActionBar$TabListener;

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4

    .prologue
    .line 178
    invoke-direct {p0}, Lmiui/app/ActionBar;-><init>()V

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    .line 141
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeR:Ljava/util/ArrayList;

    .line 152
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeL:I

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    .line 167
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$2;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarImpl$2;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    .line 166
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeC:Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;

    .line 179
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    .line 180
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeN:Landroid/app/FragmentManager;

    .line 181
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/miui/internal/R$id;->action_bar_overlay_layout:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->init(Landroid/view/ViewGroup;)V

    .line 182
    invoke-virtual {p1}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setTitle(Ljava/lang/CharSequence;)V

    .line 183
    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;)V
    .registers 4

    .prologue
    .line 193
    invoke-direct {p0}, Lmiui/app/ActionBar;-><init>()V

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    .line 141
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeR:Ljava/util/ArrayList;

    .line 152
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeL:I

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    .line 167
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$2;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarImpl$2;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    .line 166
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeC:Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;

    .line 194
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    .line 195
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/miui/internal/R$id;->action_bar_overlay_layout:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->init(Landroid/view/ViewGroup;)V

    .line 197
    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 185
    invoke-direct {p0}, Lmiui/app/ActionBar;-><init>()V

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    .line 141
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeR:Ljava/util/ArrayList;

    .line 152
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeL:I

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    .line 167
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$2;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarImpl$2;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    .line 166
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeC:Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;

    move-object v0, p1

    .line 186
    check-cast v0, Lmiui/app/IFragment;

    invoke-interface {v0}, Lmiui/app/IFragment;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    .line 187
    invoke-virtual {p1}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeN:Landroid/app/FragmentManager;

    .line 188
    invoke-virtual {p1}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->init(Landroid/view/ViewGroup;)V

    .line 189
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 190
    if-eqz v0, :cond_48

    invoke-virtual {v0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_44
    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setTitle(Ljava/lang/CharSequence;)V

    .line 191
    return-void

    :cond_48
    move-object v0, v1

    .line 190
    goto :goto_44
.end method

.method private Ab(Z)V
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 280
    iput-boolean p1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    .line 282
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    if-nez v0, :cond_38

    .line 283
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarView;->setEmbeddedTabView(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    .line 284
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContainer;->setTabContainer(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    .line 289
    :goto_14
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getNavigationMode()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_45

    const/4 v0, 0x1

    .line 290
    :goto_1c
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-eqz v2, :cond_2e

    .line 291
    if-eqz v0, :cond_47

    .line 292
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v2, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 296
    :goto_27
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    iget-boolean v3, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    invoke-virtual {v2, v3}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setEmbeded(Z)V

    .line 298
    :cond_2e
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    iget-boolean v3, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    if-nez v3, :cond_4f

    :goto_34
    invoke-virtual {v2, v0}, Lcom/miui/internal/widget/ActionBarView;->setCollapsable(Z)V

    .line 299
    return-void

    .line 286
    :cond_38
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContainer;->setTabContainer(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    .line 287
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarView;->setEmbeddedTabView(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    goto :goto_14

    :cond_45
    move v0, v1

    .line 289
    goto :goto_1c

    .line 294
    :cond_47
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    goto :goto_27

    :cond_4f
    move v0, v1

    .line 298
    goto :goto_34
.end method

.method private Ad(Z)V
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1261
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    if-eqz v0, :cond_3c

    .line 1263
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1264
    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeZ:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    .line 1266
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeZ:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeH:Landroid/view/View;

    if-eqz v0, :cond_3c

    .line 1267
    if-eqz p1, :cond_3d

    .line 1268
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeI:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;->show()Landroid/animation/Animator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 1275
    :cond_3c
    :goto_3c
    return-void

    .line 1271
    :cond_3d
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;->hide()Landroid/animation/Animator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    goto :goto_3c
.end method

.method private Ae(Z)V
    .registers 5

    .prologue
    .line 1092
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeP:Z

    iget-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeQ:Z

    .line 1093
    iget-boolean v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeY:Z

    .line 1092
    invoke-static {v0, v1, v2}, Lcom/miui/internal/app/ActionBarImpl;->zJ(ZZZ)Z

    move-result v0

    .line 1095
    if-eqz v0, :cond_17

    .line 1096
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    if-nez v0, :cond_16

    .line 1097
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    .line 1098
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->doShow(Z)V

    .line 1106
    :cond_16
    :goto_16
    return-void

    .line 1101
    :cond_17
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    if-eqz v0, :cond_16

    .line 1102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    .line 1103
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->doHide(Z)V

    goto :goto_16
.end method

.method static synthetic Af(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ActionBarContainer;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    return-object v0
.end method

.method static synthetic Ag(Lcom/miui/internal/app/ActionBarImpl;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic Ah(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/view/menu/PhoneActionMenuView;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeZ:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    return-object v0
.end method

.method static synthetic Ai(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ActionBarContainer;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    return-object v0
.end method

.method static synthetic Aj(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ScrollingTabContainerView;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    return-object v0
.end method

.method static synthetic Ak()Landroid/app/ActionBar$TabListener;
    .registers 1

    sget-object v0, Lcom/miui/internal/app/ActionBarImpl;->aff:Landroid/app/ActionBar$TabListener;

    return-object v0
.end method

.method public static getActionBar(Landroid/view/View;)Lcom/miui/internal/app/ActionBarImpl;
    .registers 4

    .prologue
    const/4 v1, 0x0

    move-object v0, p0

    .line 201
    :goto_2
    if-eqz v0, :cond_22

    .line 202
    instance-of v2, v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    if-eqz v2, :cond_11

    .line 203
    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 215
    :goto_10
    return-object v0

    .line 208
    :cond_11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_20

    .line 209
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_2

    :cond_20
    move-object v0, v1

    .line 211
    goto :goto_2

    :cond_22
    move-object v0, v1

    goto :goto_10
.end method

.method private static zJ(ZZZ)Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 221
    if-eqz p2, :cond_4

    .line 222
    return v0

    .line 223
    :cond_4
    if-nez p0, :cond_8

    if-eqz p1, :cond_a

    .line 224
    :cond_8
    const/4 v0, 0x0

    return v0

    .line 226
    :cond_a
    return v0
.end method

.method private zK()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1080
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v0, :cond_8

    .line 1081
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 1083
    :cond_8
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1084
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-eqz v0, :cond_16

    .line 1085
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ScrollingTabContainerView;->removeAllTabs()V

    .line 1087
    :cond_16
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 1088
    return-void
.end method

.method private zL(Landroid/app/ActionBar$Tab;I)V
    .registers 6

    .prologue
    .line 1062
    check-cast p1, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    .line 1063
    invoke-virtual {p1}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getCallback()Landroid/app/ActionBar$TabListener;

    move-result-object v0

    .line 1065
    if-nez v0, :cond_11

    .line 1066
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1067
    const-string/jumbo v1, "Action Bar Tab must have a Callback"

    .line 1066
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1070
    :cond_11
    invoke-virtual {p1, p2}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setPosition(I)V

    .line 1071
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1073
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 1074
    add-int/lit8 v0, p2, 0x1

    move v1, v0

    :goto_22
    if-ge v1, v2, :cond_33

    .line 1075
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setPosition(I)V

    .line 1074
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_22

    .line 1077
    :cond_33
    return-void
.end method

.method private zM(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 4

    .prologue
    .line 839
    instance-of v0, p1, Lmiui/view/SearchActionMode$Callback;

    if-eqz v0, :cond_c

    .line 840
    new-instance v0, Lcom/miui/internal/view/SearchActionModeImpl;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/miui/internal/view/SearchActionModeImpl;-><init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V

    .line 844
    :goto_b
    return-object v0

    .line 842
    :cond_c
    new-instance v0, Lcom/miui/internal/view/EditActionModeImpl;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/miui/internal/view/EditActionModeImpl;-><init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V

    goto :goto_b
.end method

.method private zN()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1039
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-eqz v0, :cond_6

    .line 1040
    return-void

    .line 1043
    :cond_6
    new-instance v0, Lcom/miui/internal/widget/ScrollingTabContainerView;

    .line 1044
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    .line 1043
    invoke-direct {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;-><init>(Landroid/content/Context;)V

    .line 1046
    iget-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    if-eqz v1, :cond_21

    .line 1047
    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 1048
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarView;->setEmbeddedTabView(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    .line 1057
    :goto_19
    iget-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setEmbeded(Z)V

    .line 1058
    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    .line 1059
    return-void

    .line 1050
    :cond_21
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getNavigationMode()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_31

    .line 1051
    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 1055
    :goto_2b
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContainer;->setTabContainer(Lcom/miui/internal/widget/ScrollingTabContainerView;)V

    goto :goto_19

    .line 1053
    :cond_31
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    goto :goto_2b
.end method

.method private zP(Z)Landroid/animation/Animator;
    .registers 12

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1109
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1110
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarContainer;->getHeight()I

    move-result v1

    .line 1111
    if-eqz p1, :cond_5f

    .line 1112
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v2, "TranslationY"

    new-array v3, v8, [F

    iget-object v4, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v4}, Lcom/miui/internal/widget/ActionBarContainer;->getTranslationY()F

    move-result v4

    aput v4, v3, v6

    aput v9, v3, v7

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 1113
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "Alpha"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getAlpha()F

    move-result v5

    aput v5, v4, v6

    const/high16 v5, 0x3f800000    # 1.0f

    aput v5, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 1114
    new-array v3, v8, [Landroid/animation/Animator;

    aput-object v1, v3, v6

    aput-object v2, v3, v7

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1115
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1116
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/miui/internal/R$integer;->action_bar_appear_duration:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1130
    :goto_5e
    return-object v0

    .line 1118
    :cond_5f
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "TranslationY"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getTranslationY()F

    move-result v5

    aput v5, v4, v6

    neg-int v1, v1

    int-to-float v1, v1

    aput v1, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 1119
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "Alpha"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getAlpha()F

    move-result v5

    aput v5, v4, v6

    aput v9, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 1120
    new-array v3, v8, [Landroid/animation/Animator;

    aput-object v1, v3, v6

    aput-object v2, v3, v7

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1121
    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1122
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/miui/internal/R$integer;->action_bar_disappear_duration:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1123
    new-instance v1, Lcom/miui/internal/app/ActionBarImpl$5;

    invoke-direct {v1, p0}, Lcom/miui/internal/app/ActionBarImpl$5;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_5e
.end method

.method private zQ()I
    .registers 4

    .prologue
    .line 1134
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getHeight()I

    move-result v1

    .line 1135
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getChildCount()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2b

    .line 1136
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1137
    if-eqz v0, :cond_29

    instance-of v2, v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    if-eqz v2, :cond_2b

    .line 1138
    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    .line 1139
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v2

    if-nez v2, :cond_2b

    .line 1140
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getCollapsedHeight()I

    move-result v0

    .line 1144
    :goto_28
    return v0

    :cond_29
    move v0, v1

    .line 1137
    goto :goto_28

    :cond_2b
    move v0, v1

    goto :goto_28
.end method

.method private zR(Z)Landroid/animation/Animator;
    .registers 12

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1148
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1149
    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zQ()I

    move-result v1

    .line 1150
    if-eqz p1, :cond_5d

    .line 1151
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v2, "TranslationY"

    new-array v3, v8, [F

    iget-object v4, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v4}, Lcom/miui/internal/widget/ActionBarContainer;->getTranslationY()F

    move-result v4

    aput v4, v3, v6

    aput v9, v3, v7

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 1152
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "Alpha"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getAlpha()F

    move-result v5

    aput v5, v4, v6

    const/high16 v5, 0x3f800000    # 1.0f

    aput v5, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 1153
    new-array v3, v8, [Landroid/animation/Animator;

    aput-object v1, v3, v6

    aput-object v2, v3, v7

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1154
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1155
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/miui/internal/R$integer;->action_bar_appear_duration:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1169
    :goto_5c
    return-object v0

    .line 1157
    :cond_5d
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "TranslationY"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getTranslationY()F

    move-result v5

    aput v5, v4, v6

    int-to-float v1, v1

    aput v1, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 1158
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const-string/jumbo v3, "Alpha"

    new-array v4, v8, [F

    iget-object v5, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Lcom/miui/internal/widget/ActionBarContainer;->getAlpha()F

    move-result v5

    aput v5, v4, v6

    aput v9, v4, v7

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 1159
    new-array v3, v8, [Landroid/animation/Animator;

    aput-object v1, v3, v6

    aput-object v2, v3, v7

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1160
    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1161
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/miui/internal/R$integer;->action_bar_disappear_duration:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1162
    new-instance v1, Lcom/miui/internal/app/ActionBarImpl$6;

    invoke-direct {v1, p0}, Lcom/miui/internal/app/ActionBarImpl$6;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_5c
.end method


# virtual methods
.method Aa()Z
    .registers 2

    .prologue
    .line 1245
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeX:Z

    return v0
.end method

.method Ac()V
    .registers 2

    .prologue
    .line 746
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeY:Z

    if-nez v0, :cond_b

    .line 747
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeY:Z

    .line 748
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->Ae(Z)V

    .line 750
    :cond_b
    return-void
.end method

.method public addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;ILjava/lang/Class;Landroid/os/Bundle;Z)I
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/ActionBar$Tab;",
            "I",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)I"
        }
    .end annotation

    .prologue
    .line 959
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/miui/internal/app/ActionBarViewPagerController;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;ILjava/lang/Class;Landroid/os/Bundle;Z)I

    move-result v0

    return v0
.end method

.method public addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/ActionBar$Tab;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)I"
        }
    .end annotation

    .prologue
    .line 951
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/internal/app/ActionBarViewPagerController;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I

    move-result v0

    return v0
.end method

.method public addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .registers 3

    .prologue
    .line 928
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    .line 929
    return-void
.end method

.method public addOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V
    .registers 3

    .prologue
    .line 774
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeR:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 775
    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;)V
    .registers 3

    .prologue
    .line 542
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/app/ActionBarImpl;->addTab(Landroid/app/ActionBar$Tab;Z)V

    .line 543
    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;I)V
    .registers 4

    .prologue
    .line 558
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/internal/app/ActionBarImpl;->addTab(Landroid/app/ActionBar$Tab;IZ)V

    .line 559
    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;IZ)V
    .registers 6

    .prologue
    .line 563
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 564
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 565
    const-string/jumbo v1, "Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab()."

    .line 564
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 569
    :cond_f
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/internal/app/ActionBarImpl;->zW(Landroid/app/ActionBar$Tab;IZ)V

    .line 570
    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;Z)V
    .registers 5

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 548
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 549
    const-string/jumbo v1, "Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab()."

    .line 548
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 553
    :cond_f
    invoke-virtual {p0, p1, p2}, Lcom/miui/internal/app/ActionBarImpl;->zU(Landroid/app/ActionBar$Tab;Z)V

    .line 554
    return-void
.end method

.method public createActionModeView(Landroid/view/ActionMode$Callback;)Lcom/miui/internal/widget/ActionModeView;
    .registers 4

    .prologue
    .line 849
    instance-of v0, p1, Lmiui/view/SearchActionMode$Callback;

    if-eqz v0, :cond_22

    .line 850
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeV:Lcom/miui/internal/widget/SearchActionModeView;

    if-nez v0, :cond_e

    .line 851
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->createSearchActionModeView()Lcom/miui/internal/widget/SearchActionModeView;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeV:Lcom/miui/internal/widget/SearchActionModeView;

    .line 853
    :cond_e
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeV:Lcom/miui/internal/widget/SearchActionModeView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/SearchActionModeView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v0, v1, :cond_1f

    .line 854
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeV:Lcom/miui/internal/widget/SearchActionModeView;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->addView(Landroid/view/View;)V

    .line 856
    :cond_1f
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeV:Lcom/miui/internal/widget/SearchActionModeView;

    .line 861
    :goto_21
    return-object v0

    .line 858
    :cond_22
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeK:Lcom/miui/internal/widget/ActionBarContextView;

    goto :goto_21
.end method

.method public createSearchActionModeView()Lcom/miui/internal/widget/SearchActionModeView;
    .registers 5

    .prologue
    .line 865
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 867
    sget v1, Lcom/miui/internal/R$layout;->search_action_mode_view:I

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    const/4 v3, 0x0

    .line 866
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/SearchActionModeView;

    .line 868
    new-instance v1, Lcom/miui/internal/app/ActionBarImpl$4;

    invoke-direct {v1, p0}, Lcom/miui/internal/app/ActionBarImpl$4;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/SearchActionModeView;->setOnBackClickListener(Landroid/view/View$OnClickListener;)V

    .line 876
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarContainer;->getPendingInsets()Landroid/graphics/Rect;

    move-result-object v1

    .line 877
    if-eqz v1, :cond_28

    .line 878
    iget v1, v1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/SearchActionModeView;->setStatusBarPaddingTop(I)V

    .line 880
    :cond_28
    return-object v0
.end method

.method public doHide(Z)V
    .registers 7

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1213
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    if-eqz v0, :cond_d

    .line 1214
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 1217
    :cond_d
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->Aa()Z

    move-result v0

    if-nez v0, :cond_3e

    .line 1219
    :goto_13
    if-eqz p1, :cond_40

    .line 1220
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->zP(Z)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    .line 1221
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 1228
    :goto_20
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_3d

    .line 1229
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    if-eqz v0, :cond_2d

    .line 1230
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 1232
    :cond_2d
    if-eqz p1, :cond_58

    .line 1233
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->zR(Z)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    .line 1234
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 1240
    :goto_3a
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->Ad(Z)V

    .line 1242
    :cond_3d
    return-void

    .line 1217
    :cond_3e
    const/4 p1, 0x1

    goto :goto_13

    .line 1223
    :cond_40
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarContainer;->getHeight()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setTranslationY(F)V

    .line 1224
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarContainer;->setAlpha(F)V

    .line 1225
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarContainer;->setVisibility(I)V

    goto :goto_20

    .line 1236
    :cond_58
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zQ()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setTranslationY(F)V

    .line 1237
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarContainer;->setAlpha(F)V

    .line 1238
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarContainer;->setVisibility(I)V

    goto :goto_3a
.end method

.method public doShow(Z)V
    .registers 7

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1173
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    if-eqz v0, :cond_e

    .line 1174
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 1176
    :cond_e
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->Aa()Z

    move-result v0

    if-nez v0, :cond_75

    .line 1178
    :goto_14
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 1179
    if-eqz p1, :cond_77

    .line 1180
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->zP(Z)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    .line 1181
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeF:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 1187
    :goto_26
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_74

    .line 1188
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    if-eqz v0, :cond_33

    .line 1189
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 1191
    :cond_33
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 1192
    if-eqz p1, :cond_82

    .line 1193
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->zR(Z)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    .line 1194
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afa:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 1195
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isSplitActionBar()Z

    move-result v0

    if-eqz v0, :cond_71

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getChildCount()I

    move-result v0

    if-lez v0, :cond_71

    .line 1196
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1197
    if-eqz v1, :cond_71

    instance-of v0, v1, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    if-eqz v0, :cond_71

    move-object v0, v1

    .line 1198
    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1199
    if-eqz v0, :cond_71

    .line 1200
    check-cast v1, Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/ActionMenuView;->startLayoutAnimation()V

    .line 1208
    :cond_71
    :goto_71
    invoke-direct {p0, v2}, Lcom/miui/internal/app/ActionBarImpl;->Ad(Z)V

    .line 1210
    :cond_74
    return-void

    :cond_75
    move p1, v2

    .line 1176
    goto :goto_14

    .line 1183
    :cond_77
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarContainer;->setTranslationY(F)V

    .line 1184
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarContainer;->setAlpha(F)V

    goto :goto_26

    .line 1205
    :cond_82
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v3}, Lcom/miui/internal/widget/ActionBarContainer;->setTranslationY(F)V

    .line 1206
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarContainer;->setAlpha(F)V

    goto :goto_71
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2

    .prologue
    .line 463
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getCustomNavigationView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayOptions()I
    .registers 2

    .prologue
    .line 524
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getFragmentAt(I)Landroid/app/Fragment;
    .registers 3

    .prologue
    .line 944
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->getFragmentAt(I)Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public getFragmentTabCount()I
    .registers 2

    .prologue
    .line 939
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarViewPagerController;->getFragmentTabCount()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 734
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getHeight()I

    move-result v0

    return v0
.end method

.method public getNavigationItemCount()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 382
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->getNavigationMode()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    .line 389
    return v0

    .line 384
    :pswitch_b
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 386
    :pswitch_12
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->getDropdownAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v1

    .line 387
    if-eqz v1, :cond_1e

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    :cond_1e
    return v0

    .line 382
    nop

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
        :pswitch_b
    .end packed-switch
.end method

.method public getNavigationMode()I
    .registers 2

    .prologue
    .line 494
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getNavigationMode()I

    move-result v0

    return v0
.end method

.method public getSelectedNavigationIndex()I
    .registers 3

    .prologue
    const/4 v0, -0x1

    .line 370
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->getNavigationMode()I

    move-result v1

    packed-switch v1, :pswitch_data_1e

    .line 376
    return v0

    .line 372
    :pswitch_b
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v1, :cond_15

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getPosition()I

    move-result v0

    :cond_15
    return v0

    .line 374
    :pswitch_16
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getDropdownSelectedPosition()I

    move-result v0

    return v0

    .line 370
    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_b
    .end packed-switch
.end method

.method public getSelectedTab()Landroid/app/ActionBar$Tab;
    .registers 2

    .prologue
    .line 702
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 484
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTabAt(I)Landroid/app/ActionBar$Tab;
    .registers 3

    .prologue
    .line 707
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActionBar$Tab;

    return-object v0
.end method

.method public getTabCount()I
    .registers 2

    .prologue
    .line 712
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 5

    .prologue
    .line 717
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afd:Landroid/content/Context;

    if-nez v0, :cond_23

    .line 718
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 719
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 720
    const v2, 0x1010397

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 721
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    .line 723
    if-eqz v0, :cond_26

    .line 724
    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->afd:Landroid/content/Context;

    .line 729
    :cond_23
    :goto_23
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afd:Landroid/content/Context;

    return-object v0

    .line 726
    :cond_26
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afd:Landroid/content/Context;

    goto :goto_23
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 474
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getViewPagerOffscreenPageLimit()I
    .registers 2

    .prologue
    .line 1015
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarViewPagerController;->getViewPagerOffscreenPageLimit()I

    move-result v0

    return v0
.end method

.method public hasNonEmbeddedTabs()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 302
    iget-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    if-nez v1, :cond_d

    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getNavigationMode()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_d

    const/4 v0, 0x1

    :cond_d
    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 754
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeP:Z

    if-nez v0, :cond_b

    .line 755
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeP:Z

    .line 756
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->Ae(Z)V

    .line 758
    :cond_b
    return-void
.end method

.method protected init(Landroid/view/ViewGroup;)V
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    move-object v0, p1

    .line 231
    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 232
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->setActionBar(Lmiui/app/ActionBar;)V

    .line 233
    sget v0, Lcom/miui/internal/R$id;->action_bar:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarView;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    .line 235
    sget v0, Lcom/miui/internal/R$id;->action_context_bar:I

    .line 234
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContextView;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeK:Lcom/miui/internal/widget/ActionBarContextView;

    .line 237
    sget v0, Lcom/miui/internal/R$id;->action_bar_container:I

    .line 236
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContainer;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    .line 239
    sget v0, Lcom/miui/internal/R$id;->split_action_bar:I

    .line 238
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContainer;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    .line 240
    sget v0, Lcom/miui/internal/R$id;->content_mask:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeH:Landroid/view/View;

    .line 242
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeH:Landroid/view/View;

    if-eqz v0, :cond_47

    .line 243
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$3;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarImpl$3;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeI:Landroid/view/View$OnClickListener;

    .line 253
    :cond_47
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_4f

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeK:Lcom/miui/internal/widget/ActionBarContextView;

    if-nez v0, :cond_78

    .line 255
    :cond_4f
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 256
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " can only be used "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 257
    const-string/jumbo v2, "with a compatible window decor layout"

    .line 256
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 255
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 254
    :cond_78
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_4f

    .line 260
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isSplitActionBar()Z

    move-result v0

    if-eqz v0, :cond_ae

    move v0, v1

    :goto_85
    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeJ:I

    .line 264
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getDisplayOptions()I

    move-result v0

    .line 265
    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_b0

    move v0, v1

    .line 266
    :goto_92
    if-eqz v0, :cond_96

    .line 267
    iput-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeM:Z

    .line 270
    :cond_96
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/miui/internal/view/ActionBarPolicy;->get(Landroid/content/Context;)Lcom/miui/internal/view/ActionBarPolicy;

    move-result-object v2

    .line 271
    invoke-virtual {v2}, Lcom/miui/internal/view/ActionBarPolicy;->enableHomeButtonByDefault()Z

    move-result v3

    if-nez v3, :cond_a3

    move v1, v0

    :cond_a3
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setHomeButtonEnabled(Z)V

    .line 272
    invoke-virtual {v2}, Lcom/miui/internal/view/ActionBarPolicy;->hasEmbeddedTabs()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->Ab(Z)V

    .line 273
    return-void

    :cond_ae
    move v0, v2

    .line 261
    goto :goto_85

    :cond_b0
    move v0, v2

    .line 265
    goto :goto_92
.end method

.method public isFragmentViewPagerMode()Z
    .registers 2

    .prologue
    .line 900
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 769
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeS:Z

    return v0
.end method

.method public newTab()Landroid/app/ActionBar$Tab;
    .registers 2

    .prologue
    .line 537
    new-instance v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;-><init>(Lcom/miui/internal/app/ActionBarImpl;)V

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 276
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/internal/view/ActionBarPolicy;->get(Landroid/content/Context;)Lcom/miui/internal/view/ActionBarPolicy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/view/ActionBarPolicy;->hasEmbeddedTabs()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->Ab(Z)V

    .line 277
    return-void
.end method

.method public removeAllFragmentTab()V
    .registers 2

    .prologue
    .line 985
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarViewPagerController;->removeAllFragmentTab()V

    .line 986
    return-void
.end method

.method public removeAllTabs()V
    .registers 3

    .prologue
    .line 626
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 627
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 628
    const-string/jumbo v1, "Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab()."

    .line 627
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 632
    :cond_f
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->zX()V

    .line 633
    return-void
.end method

.method public removeFragmentTab(Landroid/app/ActionBar$Tab;)V
    .registers 3

    .prologue
    .line 975
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->removeFragmentTab(Landroid/app/ActionBar$Tab;)V

    .line 976
    return-void
.end method

.method public removeFragmentTab(Landroid/app/Fragment;)V
    .registers 3

    .prologue
    .line 980
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->Ao(Landroid/app/Fragment;)V

    .line 981
    return-void
.end method

.method public removeFragmentTab(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 970
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->removeFragmentTab(Ljava/lang/String;)V

    .line 971
    return-void
.end method

.method public removeFragmentTabAt(I)V
    .registers 3

    .prologue
    .line 965
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->An(I)V

    .line 966
    return-void
.end method

.method public removeOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .registers 3

    .prologue
    .line 934
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->removeOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    .line 935
    return-void
.end method

.method public removeOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V
    .registers 3

    .prologue
    .line 780
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeR:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 781
    return-void
.end method

.method public removeTab(Landroid/app/ActionBar$Tab;)V
    .registers 4

    .prologue
    .line 604
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 605
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 606
    const-string/jumbo v1, "Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab()."

    .line 605
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 610
    :cond_f
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->zY(Landroid/app/ActionBar$Tab;)V

    .line 611
    return-void
.end method

.method public removeTabAt(I)V
    .registers 4

    .prologue
    .line 615
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 616
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 617
    const-string/jumbo v1, "Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab()."

    .line 616
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 621
    :cond_f
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->zZ(I)V

    .line 622
    return-void
.end method

.method public selectTab(Landroid/app/ActionBar$Tab;)V
    .registers 5

    .prologue
    const/4 v0, -0x1

    .line 670
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getNavigationMode()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_11

    .line 671
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v0

    :cond_e
    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 673
    return-void

    .line 676
    :cond_11
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeN:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->disallowAddToBackStack()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 678
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-ne v2, p1, :cond_41

    .line 679
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v0, :cond_37

    .line 680
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getCallback()Landroid/app/ActionBar$TabListener;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-interface {v0, v2, v1}, Landroid/app/ActionBar$TabListener;->onTabReselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V

    .line 681
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ScrollingTabContainerView;->animateToTab(I)V

    .line 695
    :cond_37
    :goto_37
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_40

    .line 696
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 698
    :cond_40
    return-void

    .line 684
    :cond_41
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    .line 685
    if-eqz p1, :cond_49

    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v0

    .line 684
    :cond_49
    invoke-virtual {v2, v0}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setTabSelected(I)V

    .line 686
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v0, :cond_5b

    .line 687
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getCallback()Landroid/app/ActionBar$TabListener;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-interface {v0, v2, v1}, Landroid/app/ActionBar$TabListener;->onTabUnselected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V

    .line 689
    :cond_5b
    check-cast p1, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    .line 690
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v0, :cond_37

    .line 691
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getCallback()Landroid/app/ActionBar$TabListener;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-interface {v0, v2, v1}, Landroid/app/ActionBar$TabListener;->onTabSelected(Landroid/app/ActionBar$Tab;Landroid/app/FragmentTransaction;)V

    goto :goto_37
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 447
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeG:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarContainer;->setPrimaryBackground(Landroid/graphics/drawable/Drawable;)V

    .line 448
    return-void
.end method

.method public setCustomView(I)V
    .registers 5

    .prologue
    .line 468
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 469
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    const/4 v2, 0x0

    .line 468
    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setCustomView(Landroid/view/View;)V

    .line 470
    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 317
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setCustomNavigationView(Landroid/view/View;)V

    .line 318
    return-void
.end method

.method public setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V
    .registers 4

    .prologue
    .line 322
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 323
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setCustomNavigationView(Landroid/view/View;)V

    .line 324
    return-void
.end method

.method public setDisplayHomeAsUpEnabled(Z)V
    .registers 4

    .prologue
    const/4 v1, 0x4

    .line 424
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setDisplayOptions(II)V

    .line 426
    return-void

    .line 424
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setDisplayOptions(I)V
    .registers 3

    .prologue
    .line 529
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_7

    .line 530
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeM:Z

    .line 532
    :cond_7
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setDisplayOptions(I)V

    .line 533
    return-void
.end method

.method public setDisplayOptions(II)V
    .registers 7

    .prologue
    .line 405
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getDisplayOptions()I

    move-result v0

    .line 406
    and-int/lit8 v1, p2, 0x4

    if-eqz v1, :cond_d

    .line 407
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeM:Z

    .line 409
    :cond_d
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    and-int v2, p1, p2

    not-int v3, p2

    and-int/2addr v0, v3

    or-int/2addr v0, v2

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarView;->setDisplayOptions(I)V

    .line 410
    return-void
.end method

.method public setDisplayShowCustomEnabled(Z)V
    .registers 4

    .prologue
    const/16 v1, 0x10

    .line 436
    if-eqz p1, :cond_9

    move v0, v1

    :goto_5
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setDisplayOptions(II)V

    .line 438
    return-void

    .line 436
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setDisplayShowHomeEnabled(Z)V
    .registers 4

    .prologue
    const/4 v1, 0x2

    .line 419
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setDisplayOptions(II)V

    .line 420
    return-void

    .line 419
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setDisplayShowTitleEnabled(Z)V
    .registers 4

    .prologue
    const/16 v1, 0x8

    .line 430
    if-eqz p1, :cond_9

    move v0, v1

    :goto_5
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setDisplayOptions(II)V

    .line 432
    return-void

    .line 430
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setDisplayUseLogoEnabled(Z)V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 414
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setDisplayOptions(II)V

    .line 415
    return-void

    .line 414
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setEndView(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 1030
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setEndView(Landroid/view/View;)V

    .line 1031
    return-void
.end method

.method public setFragmentActionMenuAt(IZ)V
    .registers 4

    .prologue
    .line 990
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/ActionBarViewPagerController;->setFragmentActionMenuAt(IZ)V

    .line 991
    return-void
.end method

.method public setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;)V
    .registers 4

    .prologue
    .line 905
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/internal/app/ActionBarImpl;->setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;Z)V

    .line 906
    return-void
.end method

.method public setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;Z)V
    .registers 6

    .prologue
    .line 911
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isFragmentViewPagerMode()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 912
    return-void

    .line 915
    :cond_7
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->removeAllTabs()V

    .line 916
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setNavigationMode(I)V

    .line 917
    new-instance v0, Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-direct {v0, p0, p2, p3}, Lcom/miui/internal/app/ActionBarViewPagerController;-><init>(Lcom/miui/internal/app/ActionBarImpl;Landroid/app/FragmentManager;Z)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    .line 919
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    .line 920
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    .line 922
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarContainer;->setFragmentViewPagerMode(Z)V

    .line 923
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 3

    .prologue
    .line 442
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setHomeButtonEnabled(Z)V

    .line 443
    return-void
.end method

.method public setIcon(I)V
    .registers 3

    .prologue
    .line 328
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setIcon(I)V

    .line 329
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 333
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 334
    return-void
.end method

.method public setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V
    .registers 4

    .prologue
    .line 349
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setDropdownAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 350
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p2}, Lcom/miui/internal/widget/ActionBarView;->setCallback(Landroid/app/ActionBar$OnNavigationListener;)V

    .line 351
    return-void
.end method

.method public setLogo(I)V
    .registers 3

    .prologue
    .line 338
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setLogo(I)V

    .line 339
    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 343
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 344
    return-void
.end method

.method public setNavigationMode(I)V
    .registers 6

    .prologue
    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 499
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarView;->getNavigationMode()I

    move-result v1

    .line 500
    packed-switch v1, :pswitch_data_46

    .line 507
    :goto_b
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, p1}, Lcom/miui/internal/widget/ActionBarView;->setNavigationMode(I)V

    .line 508
    packed-switch p1, :pswitch_data_4c

    .line 518
    :cond_13
    :goto_13
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    .line 519
    const/4 v2, 0x2

    if-ne p1, v2, :cond_1c

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeO:Z

    xor-int/lit8 v0, v0, 0x1

    .line 518
    :cond_1c
    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarView;->setCollapsable(Z)V

    .line 520
    return-void

    .line 502
    :pswitch_20
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getSelectedNavigationIndex()I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    .line 503
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 504
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    goto :goto_b

    .line 510
    :pswitch_32
    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zN()V

    .line 511
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 512
    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    if-eq v1, v3, :cond_13

    .line 513
    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setSelectedNavigationItem(I)V

    .line 514
    iput v3, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    goto :goto_13

    .line 500
    :pswitch_data_46
    .packed-switch 0x2
        :pswitch_20
    .end packed-switch

    .line 508
    :pswitch_data_4c
    .packed-switch 0x2
        :pswitch_32
    .end packed-switch
.end method

.method public setProgress(I)V
    .registers 3

    .prologue
    .line 1010
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setProgress(I)V

    .line 1011
    return-void
.end method

.method public setProgressBarIndeterminate(Z)V
    .registers 3

    .prologue
    .line 1005
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setProgressBarIndeterminate(Z)V

    .line 1006
    return-void
.end method

.method public setProgressBarIndeterminateVisibility(Z)V
    .registers 3

    .prologue
    .line 1000
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setProgressBarIndeterminateVisibility(Z)V

    .line 1001
    return-void
.end method

.method public setProgressBarVisibility(Z)V
    .registers 3

    .prologue
    .line 995
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setProgressBarVisibility(Z)V

    .line 996
    return-void
.end method

.method public setSelectedNavigationItem(I)V
    .registers 4

    .prologue
    .line 355
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getNavigationMode()I

    move-result v0

    packed-switch v0, :pswitch_data_24

    .line 363
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 364
    const-string/jumbo v1, "setSelectedNavigationIndex not valid for current navigation mode"

    .line 363
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 357
    :pswitch_12
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActionBar$Tab;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 366
    :goto_1d
    return-void

    .line 360
    :pswitch_1e
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setDropdownSelectedPosition(I)V

    goto :goto_1d

    .line 355
    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_12
    .end packed-switch
.end method

.method public setShowHideAnimationEnabled(Z)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 1249
    iput-boolean p1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeX:Z

    .line 1250
    if-nez p1, :cond_e

    .line 1252
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1253
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->doShow(Z)V

    .line 1258
    :cond_e
    :goto_e
    return-void

    .line 1255
    :cond_f
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->doHide(Z)V

    goto :goto_e
.end method

.method public setSplitBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .prologue
    .line 452
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_23

    .line 453
    const/4 v0, 0x0

    :goto_5
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarContainer;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_23

    .line 454
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lcom/miui/internal/view/menu/ActionMenuView;

    if-eqz v1, :cond_20

    .line 455
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 453
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 459
    :cond_23
    return-void
.end method

.method public setStartView(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 1025
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setStartView(Landroid/view/View;)V

    .line 1026
    return-void
.end method

.method public setSubtitle(I)V
    .registers 3

    .prologue
    .line 489
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 490
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 400
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 401
    return-void
.end method

.method public setTabBadgeVisibility(IZ)V
    .registers 4

    .prologue
    .line 312
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setBadgeVisibility(IZ)V

    .line 313
    return-void
.end method

.method public setTabsMode(Z)V
    .registers 2

    .prologue
    .line 307
    invoke-direct {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->Ab(Z)V

    .line 308
    return-void
.end method

.method public setTitle(I)V
    .registers 3

    .prologue
    .line 479
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->setTitle(Ljava/lang/CharSequence;)V

    .line 480
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 395
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ActionBarView;->setTitle(Ljava/lang/CharSequence;)V

    .line 396
    return-void
.end method

.method public setViewPagerDecor(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 1035
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->setViewPagerDecor(Landroid/view/View;)V

    .line 1036
    return-void
.end method

.method public setViewPagerOffscreenPageLimit(I)V
    .registers 3

    .prologue
    .line 1020
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afe:Lcom/miui/internal/app/ActionBarViewPagerController;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarViewPagerController;->setViewPagerOffscreenPageLimit(I)V

    .line 1021
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 739
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeP:Z

    if-eqz v0, :cond_a

    .line 740
    iput-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeP:Z

    .line 741
    invoke-direct {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->Ae(Z)V

    .line 743
    :cond_a
    return-void
.end method

.method public showActionBarShadow(Z)V
    .registers 2

    .prologue
    .line 885
    return-void
.end method

.method public showSplitActionBar(ZZ)V
    .registers 4

    .prologue
    .line 889
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isSplitActionBar()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 890
    if-eqz p1, :cond_10

    .line 891
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, p2}, Lcom/miui/internal/widget/ActionBarContainer;->show(Z)V

    .line 896
    :cond_f
    :goto_f
    return-void

    .line 893
    :cond_10
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, p2}, Lcom/miui/internal/widget/ActionBarContainer;->hide(Z)V

    goto :goto_f
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 784
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_c

    .line 785
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    .line 788
    :cond_c
    invoke-direct {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->zM(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v1

    .line 790
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    instance-of v0, v0, Lcom/miui/internal/widget/SearchActionModeView;

    if-eqz v0, :cond_1a

    instance-of v0, v1, Lcom/miui/internal/view/SearchActionModeImpl;

    if-nez v0, :cond_24

    .line 791
    :cond_1a
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    instance-of v0, v0, Lcom/miui/internal/widget/ActionBarContextView;

    if-eqz v0, :cond_2e

    instance-of v0, v1, Lcom/miui/internal/view/EditActionModeImpl;

    .line 790
    if-eqz v0, :cond_2e

    .line 792
    :cond_24
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    invoke-interface {v0}, Lcom/miui/internal/widget/ActionModeView;->closeMode()V

    .line 793
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    invoke-interface {v0}, Lcom/miui/internal/widget/ActionModeView;->killMode()V

    .line 796
    :cond_2e
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->createActionModeView(Landroid/view/ActionMode$Callback;)Lcom/miui/internal/widget/ActionModeView;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    .line 798
    instance-of v0, v1, Lcom/miui/internal/view/ActionModeImpl;

    if-eqz v0, :cond_7d

    move-object v0, v1

    .line 799
    check-cast v0, Lcom/miui/internal/view/ActionModeImpl;

    .line 800
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/view/ActionModeImpl;->setActionModeView(Lcom/miui/internal/widget/ActionModeView;)V

    .line 801
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarImpl;->aeC:Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;

    invoke-virtual {v0, v2}, Lcom/miui/internal/view/ActionModeImpl;->setActionModeCallback(Lcom/miui/internal/view/ActionModeImpl$ActionModeCallback;)V

    .line 802
    invoke-virtual {v0}, Lcom/miui/internal/view/ActionModeImpl;->dispatchOnCreate()Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 803
    invoke-virtual {v1}, Landroid/view/ActionMode;->invalidate()V

    .line 804
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    invoke-interface {v0, v1}, Lcom/miui/internal/widget/ActionModeView;->initForMode(Landroid/view/ActionMode;)V

    .line 805
    invoke-virtual {p0, v5}, Lcom/miui/internal/app/ActionBarImpl;->zI(Z)V

    .line 806
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_6b

    .line 807
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeJ:I

    if-ne v0, v5, :cond_6b

    .line 808
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarContainer;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_6b

    .line 809
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->mSplitView:Lcom/miui/internal/widget/ActionBarContainer;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 812
    :cond_6b
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    instance-of v0, v0, Lcom/miui/internal/widget/ActionBarContextView;

    if-eqz v0, :cond_7a

    .line 813
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    check-cast v0, Lcom/miui/internal/widget/ActionBarContextView;

    .line 815
    const/16 v2, 0x20

    .line 813
    invoke-virtual {v0, v2}, Lcom/miui/internal/widget/ActionBarContextView;->sendAccessibilityEvent(I)V

    .line 817
    :cond_7a
    iput-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->mActionMode:Landroid/view/ActionMode;

    .line 818
    return-object v1

    .line 821
    :cond_7d
    return-object v3
.end method

.method zI(Z)V
    .registers 4

    .prologue
    .line 825
    if-eqz p1, :cond_2a

    .line 826
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->Ac()V

    .line 831
    :goto_5
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeD:Lcom/miui/internal/widget/ActionModeView;

    invoke-interface {v0, p1}, Lcom/miui/internal/widget/ActionModeView;->animateToVisibility(Z)V

    .line 832
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->hasEmbeddedTabs()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeE:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isCollapsed()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 833
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-eqz p1, :cond_2e

    const/16 v0, 0x8

    :goto_26
    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 835
    :cond_29
    return-void

    .line 828
    :cond_2a
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->zS()V

    goto :goto_5

    .line 833
    :cond_2e
    const/4 v0, 0x0

    goto :goto_26
.end method

.method zO()Lcom/miui/internal/widget/ActionBarOverlayLayout;
    .registers 2

    .prologue
    .line 573
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeT:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    return-object v0
.end method

.method zS()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 761
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeY:Z

    if-eqz v0, :cond_a

    .line 762
    iput-boolean v1, p0, Lcom/miui/internal/app/ActionBarImpl;->aeY:Z

    .line 763
    invoke-direct {p0, v1}, Lcom/miui/internal/app/ActionBarImpl;->Ae(Z)V

    .line 765
    :cond_a
    return-void
.end method

.method zT(Landroid/app/ActionBar$Tab;)V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 577
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getTabCount()I

    move-result v1

    if-nez v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/app/ActionBarImpl;->zU(Landroid/app/ActionBar$Tab;Z)V

    .line 578
    return-void
.end method

.method zU(Landroid/app/ActionBar$Tab;Z)V
    .registers 4

    .prologue
    .line 581
    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zN()V

    .line 582
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/widget/ScrollingTabContainerView;->addTab(Landroid/app/ActionBar$Tab;Z)V

    .line 583
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/miui/internal/app/ActionBarImpl;->zL(Landroid/app/ActionBar$Tab;I)V

    .line 584
    if-eqz p2, :cond_16

    .line 585
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 587
    :cond_16
    return-void
.end method

.method zV(Landroid/app/ActionBar$Tab;I)V
    .registers 4

    .prologue
    .line 590
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarImpl;->getTabCount()I

    move-result v0

    if-ne p2, v0, :cond_b

    const/4 v0, 0x1

    :goto_7
    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/internal/app/ActionBarImpl;->zW(Landroid/app/ActionBar$Tab;IZ)V

    .line 591
    return-void

    .line 590
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method zW(Landroid/app/ActionBar$Tab;IZ)V
    .registers 5

    .prologue
    .line 594
    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zN()V

    .line 595
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/internal/widget/ScrollingTabContainerView;->addTab(Landroid/app/ActionBar$Tab;IZ)V

    .line 596
    invoke-direct {p0, p1, p2}, Lcom/miui/internal/app/ActionBarImpl;->zL(Landroid/app/ActionBar$Tab;I)V

    .line 597
    if-eqz p3, :cond_10

    .line 598
    invoke-virtual {p0, p1}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 600
    :cond_10
    return-void
.end method

.method zX()V
    .registers 1

    .prologue
    .line 665
    invoke-direct {p0}, Lcom/miui/internal/app/ActionBarImpl;->zK()V

    .line 666
    return-void
.end method

.method zY(Landroid/app/ActionBar$Tab;)V
    .registers 3

    .prologue
    .line 636
    invoke-virtual {p1}, Landroid/app/ActionBar$Tab;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->zZ(I)V

    .line 637
    return-void
.end method

.method zZ(I)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 640
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    if-nez v0, :cond_6

    .line 642
    return-void

    .line 645
    :cond_6
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    if-eqz v0, :cond_3c

    .line 646
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeW:Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->getPosition()I

    move-result v0

    move v1, v0

    .line 647
    :goto_11
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afb:Lcom/miui/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v0, p1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->removeTabAt(I)V

    .line 648
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    .line 649
    if-eqz v0, :cond_24

    .line 650
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setPosition(I)V

    .line 653
    :cond_24
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v3, p1

    .line 654
    :goto_2b
    if-ge v3, v4, :cond_40

    .line 655
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    invoke-virtual {v0, v3}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setPosition(I)V

    .line 654
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_2b

    .line 646
    :cond_3c
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl;->aeU:I

    move v1, v0

    goto :goto_11

    .line 658
    :cond_40
    if-ne v1, p1, :cond_4e

    .line 659
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4f

    move-object v0, v2

    :goto_4b
    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 662
    :cond_4e
    return-void

    .line 660
    :cond_4f
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl;->afc:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    goto :goto_4b
.end method
