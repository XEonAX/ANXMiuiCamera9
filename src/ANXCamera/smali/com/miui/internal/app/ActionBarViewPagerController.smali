.class public Lcom/miui/internal/app/ActionBarViewPagerController;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/ActionBarViewPagerController$1;,
        Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;
    }
.end annotation


# instance fields
.field private afp:Lcom/miui/internal/app/ActionBarImpl;

.field private afq:Landroid/animation/ObjectAnimator;

.field private afr:Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

.field private afs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/ActionBar$FragmentViewPagerChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private aft:Lcom/miui/internal/app/b;

.field private afu:Landroid/app/ActionBar$TabListener;

.field private afv:Lmiui/view/ViewPager;

.field private afw:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/miui/internal/app/ActionBarImpl;Landroid/app/FragmentManager;Z)V
    .registers 8

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/miui/internal/app/ActionBarViewPagerController$1;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarViewPagerController$1;-><init>(Lcom/miui/internal/app/ActionBarViewPagerController;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afu:Landroid/app/ActionBar$TabListener;

    .line 66
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    .line 67
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl;->zO()Lcom/miui/internal/widget/ActionBarOverlayLayout;

    move-result-object v1

    .line 68
    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 70
    sget v0, Lmiui/R$id;->view_pager:I

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 71
    instance-of v3, v0, Lmiui/view/ViewPager;

    if-eqz v3, :cond_4a

    .line 72
    check-cast v0, Lmiui/view/ViewPager;

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    .line 80
    :goto_24
    new-instance v0, Lcom/miui/internal/app/b;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-direct {v0, v2, p2, v1}, Lcom/miui/internal/app/b;-><init>(Landroid/content/Context;Landroid/app/FragmentManager;Lmiui/view/ViewPager;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    .line 81
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    new-instance v1, Lcom/miui/internal/app/ActionBarViewPagerController$2;

    invoke-direct {v1, p0}, Lcom/miui/internal/app/ActionBarViewPagerController$2;-><init>(Lcom/miui/internal/app/ActionBarViewPagerController;)V

    invoke-virtual {v0, v1}, Lmiui/view/ViewPager;->setInternalPageChangeListener(Lmiui/view/ViewPager$OnPageChangeListener;)Lmiui/view/ViewPager$OnPageChangeListener;

    .line 118
    if-eqz p3, :cond_49

    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-eqz v0, :cond_49

    .line 119
    new-instance v0, Lcom/miui/internal/app/c;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-direct {v0, v1, v2}, Lcom/miui/internal/app/c;-><init>(Lmiui/view/ViewPager;Lcom/miui/internal/app/b;)V

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarViewPagerController;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    .line 121
    :cond_49
    return-void

    .line 74
    :cond_4a
    new-instance v0, Lmiui/view/ViewPager;

    invoke-direct {v0, v2}, Lmiui/view/ViewPager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    .line 75
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    sget v3, Lmiui/R$id;->view_pager:I

    invoke-virtual {v0, v3}, Lmiui/view/ViewPager;->setId(I)V

    .line 76
    const v0, 0x1020002

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 77
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_24
.end method

.method static synthetic Ap(Lcom/miui/internal/app/ActionBarViewPagerController;)Lcom/miui/internal/app/ActionBarImpl;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    return-object v0
.end method

.method static synthetic Aq(Lcom/miui/internal/app/ActionBarViewPagerController;)Ljava/util/ArrayList;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic Ar(Lcom/miui/internal/app/ActionBarViewPagerController;)Lcom/miui/internal/app/b;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    return-object v0
.end method

.method static synthetic As(Lcom/miui/internal/app/ActionBarViewPagerController;)Lmiui/view/ViewPager;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    return-object v0
.end method


# virtual methods
.method An(I)V
    .registers 3

    .prologue
    .line 136
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/b;->AC(I)V

    .line 137
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarImpl;->zZ(I)V

    .line 138
    return-void
.end method

.method Ao(Landroid/app/Fragment;)V
    .registers 4

    .prologue
    .line 166
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/b;->AB(Landroid/app/Fragment;)I

    move-result v0

    .line 167
    if-ltz v0, :cond_d

    .line 168
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v1, v0}, Lcom/miui/internal/app/ActionBarImpl;->zZ(I)V

    .line 170
    :cond_d
    return-void
.end method

.method addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;ILjava/lang/Class;Landroid/os/Bundle;Z)I
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
    move-object v0, p2

    .line 130
    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afu:Landroid/app/ActionBar$TabListener;

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setInternalTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 131
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p2, p3}, Lcom/miui/internal/app/ActionBarImpl;->zV(Landroid/app/ActionBar$Tab;I)V

    .line 132
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    move-object v1, p1

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p2

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/miui/internal/app/b;->Av(Ljava/lang/String;ILjava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)I

    move-result v0

    return v0
.end method

.method addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I
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
    move-object v0, p2

    .line 124
    check-cast v0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afu:Landroid/app/ActionBar$TabListener;

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setInternalTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    .line 125
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p2}, Lcom/miui/internal/app/ActionBarImpl;->zT(Landroid/app/ActionBar$Tab;)V

    .line 126
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p2

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/internal/app/b;->Au(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;Landroid/app/ActionBar$Tab;Z)I

    move-result v0

    return v0
.end method

.method addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .registers 3

    .prologue
    .line 189
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 190
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    .line 192
    :cond_b
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    return-void
.end method

.method getFragmentAt(I)Landroid/app/Fragment;
    .registers 4

    .prologue
    .line 158
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/miui/internal/app/b;->Ax(IZ)Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method getFragmentTabCount()I
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0}, Lcom/miui/internal/app/b;->getCount()I

    move-result v0

    return v0
.end method

.method getViewPagerOffscreenPageLimit()I
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-virtual {v0}, Lmiui/view/ViewPager;->getOffscreenPageLimit()I

    move-result v0

    return v0
.end method

.method removeAllFragmentTab()V
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl;->zX()V

    .line 154
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0}, Lcom/miui/internal/app/b;->Ay()V

    .line 155
    return-void
.end method

.method removeFragmentTab(Landroid/app/ActionBar$Tab;)V
    .registers 3

    .prologue
    .line 148
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afp:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarImpl;->zY(Landroid/app/ActionBar$Tab;)V

    .line 149
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/b;->AA(Landroid/app/ActionBar$Tab;)I

    .line 150
    return-void
.end method

.method removeFragmentTab(Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 141
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/b;->Aw(Ljava/lang/String;)I

    move-result v0

    .line 142
    if-ltz v0, :cond_b

    .line 143
    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarViewPagerController;->An(I)V

    .line 145
    :cond_b
    return-void
.end method

.method removeOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    if-eqz v0, :cond_9

    .line 197
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 199
    :cond_9
    return-void
.end method

.method setFragmentActionMenuAt(IZ)V
    .registers 7

    .prologue
    .line 173
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->aft:Lcom/miui/internal/app/b;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/b;->setFragmentActionMenuAt(IZ)V

    .line 174
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-virtual {v0}, Lmiui/view/ViewPager;->getCurrentItem()I

    move-result v0

    if-ne p1, v0, :cond_4d

    .line 175
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afr:Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

    if-nez v0, :cond_43

    .line 176
    new-instance v0, Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;-><init>(Lcom/miui/internal/app/ActionBarViewPagerController;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afr:Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

    .line 177
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afr:Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

    const-string/jumbo v1, "Value"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_50

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afq:Landroid/animation/ObjectAnimator;

    .line 178
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afq:Landroid/animation/ObjectAnimator;

    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-virtual {v0}, Lmiui/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 179
    const/high16 v2, 0x10e0000

    .line 178
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    :goto_3f
    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 183
    :cond_43
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afr:Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/ActionBarViewPagerController$ActionMenuChangeAnimatorObject;->At(IZ)V

    .line 184
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afq:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 186
    :cond_4d
    return-void

    .line 180
    :cond_4e
    const/4 v0, 0x0

    goto :goto_3f

    .line 177
    :array_50
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method setViewPagerDecor(Landroid/view/View;)V
    .registers 6

    .prologue
    .line 210
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afw:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 211
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afw:Landroid/view/View;

    invoke-virtual {v0, v1}, Lmiui/view/ViewPager;->removeView(Landroid/view/View;)V

    .line 213
    :cond_b
    if-eqz p1, :cond_1f

    .line 214
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afw:Landroid/view/View;

    .line 215
    new-instance v0, Lmiui/view/ViewPager$LayoutParams;

    invoke-direct {v0}, Lmiui/view/ViewPager$LayoutParams;-><init>()V

    .line 216
    const/4 v1, 0x1

    iput-boolean v1, v0, Lmiui/view/ViewPager$LayoutParams;->isDecor:Z

    .line 217
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    iget-object v2, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afw:Landroid/view/View;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3, v0}, Lmiui/view/ViewPager;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 219
    :cond_1f
    return-void
.end method

.method setViewPagerOffscreenPageLimit(I)V
    .registers 3

    .prologue
    .line 206
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarViewPagerController;->afv:Lmiui/view/ViewPager;

    invoke-virtual {v0, p1}, Lmiui/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 207
    return-void
.end method
