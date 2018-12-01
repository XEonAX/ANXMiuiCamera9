.class public Lcom/miui/internal/app/AlertControllerImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/app/AlertControllerImpl$1;,
        Lcom/miui/internal/app/AlertControllerImpl$2;,
        Lcom/miui/internal/app/AlertControllerImpl$3;,
        Lcom/miui/internal/app/AlertControllerImpl$4;,
        Lcom/miui/internal/app/AlertControllerImpl$ButtonHandler;
    }
.end annotation


# instance fields
.field private adA:[Z

.field private adB:Landroid/view/View;

.field private adC:Z

.field private adD:Landroid/content/DialogInterface;

.field private adE:Lmiui/widget/EditableListViewWrapper;

.field private adF:Landroid/os/Handler;

.field private adG:Landroid/graphics/drawable/Drawable;

.field private adH:I

.field private final adI:Ljava/lang/Runnable;

.field private final adJ:I

.field private final adK:I

.field private adL:Landroid/widget/ListView;

.field private adM:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

.field private adN:Ljava/lang/CharSequence;

.field private adO:Landroid/widget/TextView;

.field private final adP:I

.field private adQ:Landroid/widget/ScrollView;

.field private final adR:I

.field private adS:Ljava/lang/CharSequence;

.field private adT:Landroid/widget/TextView;

.field private adU:Landroid/view/View;

.field private final adV:Landroid/view/Window;

.field private adW:Landroid/view/Window$Callback;

.field private adk:Lmiui/app/ActionBar;

.field private adl:Landroid/widget/ListAdapter;

.field private final adm:I

.field private adn:Landroid/view/ViewGroup;

.field private ado:Landroid/view/View$OnClickListener;

.field private adp:Landroid/widget/Button;

.field private adq:Landroid/os/Message;

.field private adr:Ljava/lang/CharSequence;

.field private ads:Landroid/widget/Button;

.field private adt:Landroid/os/Message;

.field private adu:Ljava/lang/CharSequence;

.field private adv:Landroid/widget/Button;

.field private adw:Landroid/os/Message;

.field private adx:Ljava/lang/CharSequence;

.field private ady:Landroid/widget/Button;

.field private adz:I

.field private mActionBarView:Lcom/miui/internal/widget/ActionBarView;

.field private mActionItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;",
            ">;"
        }
    .end annotation
.end field

.field private mCheckBoxMessage:Ljava/lang/CharSequence;

.field private mContext:Landroid/content/Context;

.field private mIsChecked:Z

.field private mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

.field private mOnActionItemClickListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/DialogInterface;Landroid/view/Window;)V
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adH:I

    .line 135
    new-instance v0, Lcom/miui/internal/app/AlertControllerImpl$1;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/AlertControllerImpl$1;-><init>(Lcom/miui/internal/app/AlertControllerImpl;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ado:Landroid/view/View$OnClickListener;

    .line 155
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adz:I

    .line 297
    new-instance v0, Lcom/miui/internal/app/AlertControllerImpl$2;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/AlertControllerImpl$2;-><init>(Lcom/miui/internal/app/AlertControllerImpl;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adI:Ljava/lang/Runnable;

    .line 871
    new-instance v0, Lcom/miui/internal/app/AlertControllerImpl$3;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/AlertControllerImpl$3;-><init>(Lcom/miui/internal/app/AlertControllerImpl;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adM:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    .line 884
    new-instance v0, Lcom/miui/internal/app/AlertControllerImpl$4;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/AlertControllerImpl$4;-><init>(Lcom/miui/internal/app/AlertControllerImpl;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adW:Landroid/view/Window$Callback;

    .line 192
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    .line 193
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adD:Landroid/content/DialogInterface;

    .line 194
    iput-object p3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    .line 195
    new-instance v0, Lcom/miui/internal/app/AlertControllerImpl$ButtonHandler;

    invoke-direct {v0, p2}, Lcom/miui/internal/app/AlertControllerImpl$ButtonHandler;-><init>(Landroid/content/DialogInterface;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adF:Landroid/os/Handler;

    .line 198
    sget-object v0, Lcom/miui/internal/R$styleable;->AlertDialog:[I

    .line 197
    const/4 v1, 0x0

    .line 199
    const v2, 0x101005d

    .line 197
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 201
    sget v1, Lcom/miui/internal/R$styleable;->AlertDialog_layout:I

    .line 202
    sget v2, Lcom/miui/internal/R$layout;->alert_dialog:I

    .line 201
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adm:I

    .line 204
    sget v1, Lcom/miui/internal/R$styleable;->AlertDialog_listLayout:I

    .line 205
    sget v2, Lcom/miui/internal/R$layout;->select_dialog:I

    .line 203
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adK:I

    .line 207
    sget v1, Lcom/miui/internal/R$styleable;->AlertDialog_multiChoiceItemLayout:I

    .line 208
    sget v2, Lcom/miui/internal/R$layout;->select_dialog_multichoice:I

    .line 206
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adP:I

    .line 210
    sget v1, Lcom/miui/internal/R$styleable;->AlertDialog_singleChoiceItemLayout:I

    .line 211
    sget v2, Lmiui/R$layout;->select_dialog_singlechoice:I

    .line 209
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adR:I

    .line 213
    sget v1, Lcom/miui/internal/R$styleable;->AlertDialog_listItemLayout:I

    .line 214
    sget v2, Lcom/miui/internal/R$layout;->select_dialog_item:I

    .line 212
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adJ:I

    .line 216
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 217
    return-void
.end method

.method private setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 4

    .prologue
    .line 310
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-ne p1, v0, :cond_5

    .line 311
    return-void

    .line 314
    :cond_5
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 315
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_12

    .line 316
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adM:Lcom/miui/internal/view/menu/MenuPresenter$Callback;

    invoke-virtual {v0, p1, v1}, Lcom/miui/internal/widget/ActionBarView;->setMenu(Landroid/view/Menu;Lcom/miui/internal/view/menu/MenuPresenter$Callback;)V

    .line 318
    :cond_12
    return-void
.end method

.method static yV(Landroid/view/View;)Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 220
    invoke-virtual {p0}, Landroid/view/View;->onCheckIsTextEditor()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 221
    return v3

    .line 224
    :cond_9
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_e

    .line 225
    return v2

    .line 228
    :cond_e
    check-cast p0, Landroid/view/ViewGroup;

    .line 229
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 230
    :cond_14
    if-lez v0, :cond_23

    .line 231
    add-int/lit8 v0, v0, -0x1

    .line 232
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 233
    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->yV(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 234
    return v3

    .line 238
    :cond_23
    return v2
.end method

.method private yW()V
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 255
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_80

    .line 256
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    sget v1, Lcom/miui/internal/R$layout;->screen_action_bar:I

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 257
    sget v0, Lcom/miui/internal/R$id;->action_bar:I

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarView;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    .line 258
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adW:Landroid/view/Window$Callback;

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarView;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 262
    sget v0, Lcom/miui/internal/R$id;->split_action_bar:I

    .line 261
    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarContainer;

    .line 263
    if-eqz v0, :cond_49

    .line 264
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 265
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarView;->setSplitActionBar(Z)V

    .line 266
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarView;->setSplitWhenNarrow(Z)V

    .line 269
    sget v1, Lcom/miui/internal/R$id;->action_context_bar:I

    .line 268
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/internal/widget/ActionBarContextView;

    .line 270
    invoke-virtual {v1, v0}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitView(Lcom/miui/internal/widget/ActionBarContainer;)V

    .line 271
    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitActionBar(Z)V

    .line 272
    invoke-virtual {v1, v4}, Lcom/miui/internal/widget/ActionBarContextView;->setSplitWhenNarrow(Z)V

    .line 276
    :cond_49
    const v0, 0x1020002

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 277
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adm:I

    invoke-static {v1, v3, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 279
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    invoke-virtual {v0, v2}, Landroid/view/Window;->setContentView(Landroid/view/View;)V

    .line 280
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adI:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 283
    new-instance v1, Lcom/miui/internal/app/ActionBarImpl;

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adD:Landroid/content/DialogInterface;

    check-cast v0, Landroid/app/Dialog;

    invoke-direct {v1, v0}, Lcom/miui/internal/app/ActionBarImpl;-><init>(Landroid/app/Dialog;)V

    iput-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adk:Lmiui/app/ActionBar;

    .line 284
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adk:Lmiui/app/ActionBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayOptions(I)V

    .line 286
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, v4}, Lcom/miui/internal/widget/ActionBarView;->setCollapsable(Z)V

    .line 295
    :cond_7f
    :goto_7f
    return-void

    .line 288
    :cond_80
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    iget v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adm:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setContentView(I)V

    .line 290
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->IS_TABLET:Z

    if-nez v0, :cond_7f

    .line 291
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 292
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    goto :goto_7f
.end method

.method private yX(Landroid/widget/TextView;)Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 861
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    .line 862
    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    if-lez v1, :cond_1b

    .line 863
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    .line 864
    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v0

    if-lez v0, :cond_1b

    .line 865
    const/4 v0, 0x1

    return v0

    .line 868
    :cond_1b
    return v2
.end method

.method private yY(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 327
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionItems:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;

    .line 328
    iget v2, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;->id:I

    iget-object v3, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;->label:Ljava/lang/CharSequence;

    invoke-virtual {p1, v4, v2, v4, v3}, Lcom/miui/internal/view/menu/MenuBuilder;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v2

    iget v0, v0, Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;->icon:I

    invoke-interface {v2, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 329
    const/4 v2, 0x2

    .line 328
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    goto :goto_7

    .line 331
    :cond_26
    const/4 v0, 0x1

    return v0
.end method

.method private yZ(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 336
    const/4 v0, 0x1

    return v0
.end method

.method private za()V
    .registers 5

    .prologue
    .line 758
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    if-eqz v0, :cond_21

    .line 759
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 760
    sget v1, Lcom/miui/internal/R$dimen;->dialog_title_average_vertical_padding:I

    .line 759
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 761
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v2

    .line 762
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v3

    .line 761
    invoke-virtual {v1, v2, v0, v3, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 764
    :cond_21
    return-void
.end method

.method private zb(Landroid/view/ViewGroup;)V
    .registers 11

    .prologue
    const/4 v8, -0x1

    const/16 v7, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 782
    const v0, 0x1020019

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    .line 783
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    if-eqz v0, :cond_11f

    .line 784
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->ado:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 785
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adx:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d1

    .line 786
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setVisibility(I)V

    move v1, v2

    move v4, v2

    move v5, v2

    .line 796
    :goto_2b
    const v0, 0x102001a

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    .line 797
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    if-eqz v0, :cond_4e

    .line 798
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    iget-object v6, p0, Lcom/miui/internal/app/AlertControllerImpl;->ado:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 799
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adr:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e8

    .line 800
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 810
    :cond_4e
    :goto_4e
    const v0, 0x102001b

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    .line 811
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    if-eqz v0, :cond_71

    .line 812
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    iget-object v6, p0, Lcom/miui/internal/app/AlertControllerImpl;->ado:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 813
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adu:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_ff

    .line 814
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 824
    :cond_71
    :goto_71
    if-eqz v5, :cond_11b

    .line 826
    sget v0, Lcom/miui/internal/R$id;->buttonGroup:I

    .line 825
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 828
    if-nez v4, :cond_80

    const/4 v4, 0x2

    if-le v1, v4, :cond_b9

    .line 830
    :cond_80
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 831
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 834
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    if-eqz v1, :cond_97

    .line 835
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 836
    iput v8, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 837
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 839
    :cond_97
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    if-eqz v1, :cond_a8

    .line 840
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 841
    iput v8, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 842
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 844
    :cond_a8
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    if-eqz v1, :cond_b9

    .line 845
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 846
    iput v8, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 847
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 851
    :cond_b9
    iget-boolean v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adC:Z

    if-nez v1, :cond_c1

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    if-eqz v1, :cond_116

    .line 852
    :cond_c1
    :goto_c1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v1

    .line 853
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v4

    .line 852
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 858
    :cond_d0
    :goto_d0
    return-void

    .line 788
    :cond_d1
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adx:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 789
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 791
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->yX(Landroid/widget/TextView;)Z

    move-result v0

    move v1, v3

    move v4, v0

    move v5, v3

    .line 792
    goto/16 :goto_2b

    .line 802
    :cond_e8
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    iget-object v4, p0, Lcom/miui/internal/app/AlertControllerImpl;->adr:Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 803
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 805
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->yX(Landroid/widget/TextView;)Z

    move-result v4

    .line 806
    add-int/lit8 v1, v1, 0x1

    move v5, v3

    goto/16 :goto_4e

    .line 816
    :cond_ff
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    iget-object v4, p0, Lcom/miui/internal/app/AlertControllerImpl;->adu:Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 817
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 819
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->yX(Landroid/widget/TextView;)Z

    move-result v4

    .line 820
    add-int/lit8 v1, v1, 0x1

    move v5, v3

    goto/16 :goto_71

    .line 851
    :cond_116
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mCheckBoxMessage:Ljava/lang/CharSequence;

    if-eqz v1, :cond_d0

    goto :goto_c1

    .line 856
    :cond_11b
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_d0

    :cond_11f
    move v1, v2

    move v4, v2

    move v5, v2

    goto/16 :goto_2b
.end method

.method private zc(Landroid/widget/FrameLayout;)V
    .registers 4

    .prologue
    .line 767
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mCheckBoxMessage:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1c

    .line 768
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 769
    const v0, 0x1020001

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 770
    iget-boolean v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mIsChecked:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 771
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mCheckBoxMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 775
    :goto_1b
    return-void

    .line 773
    :cond_1c
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_1b
.end method

.method private zd(Landroid/view/ViewGroup;)V
    .registers 7

    .prologue
    const/16 v4, 0x8

    const/4 v2, -0x1

    const/4 v3, 0x0

    .line 584
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 585
    sget v1, Lcom/miui/internal/R$id;->scrollView:I

    .line 584
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    .line 586
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->setFocusable(Z)V

    .line 589
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    sget v1, Lmiui/R$id;->message:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    .line 590
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    if-nez v0, :cond_26

    .line 591
    return-void

    .line 594
    :cond_26
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adN:Ljava/lang/CharSequence;

    if-eqz v0, :cond_5d

    .line 595
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adN:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 596
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 597
    sget v1, Lcom/miui/internal/R$id;->topPanel:I

    .line 596
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 600
    if-eqz v0, :cond_5c

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-ne v0, v4, :cond_5c

    .line 601
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 602
    sget v1, Lcom/miui/internal/R$dimen;->dialog_message_without_title_vertical_padding:I

    .line 601
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 603
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    .line 604
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    .line 603
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 641
    :cond_5c
    :goto_5c
    return-void

    .line 607
    :cond_5d
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 608
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->removeView(Landroid/view/View;)V

    .line 610
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    if-eqz v0, :cond_c7

    .line 611
    invoke-direct {p0}, Lcom/miui/internal/app/AlertControllerImpl;->zf()V

    .line 613
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 614
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 616
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 619
    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 620
    invoke-direct {p0}, Lcom/miui/internal/app/AlertControllerImpl;->za()V

    .line 624
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->IS_TABLET:Z

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    if-nez v0, :cond_5c

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    if-eqz v0, :cond_5c

    .line 625
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 626
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    sget v1, Lcom/miui/internal/R$id;->topPanel:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 628
    :try_start_a8
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 629
    sget v2, Lcom/miui/internal/R$drawable;->dialog_title_bg_light:I

    .line 628
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_b7
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_a8 .. :try_end_b7} :catch_cb

    .line 634
    :goto_b7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    .line 635
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    .line 634
    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    goto :goto_5c

    .line 638
    :cond_c7
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_5c

    .line 630
    :catch_cb
    move-exception v0

    goto :goto_b7
.end method

.method private ze(Landroid/widget/FrameLayout;)V
    .registers 9

    .prologue
    const/4 v5, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 708
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    if-eqz v0, :cond_b7

    .line 709
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 710
    const v1, 0x102002b

    .line 709
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 711
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 713
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    if-eqz v0, :cond_29

    .line 714
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, 0x0

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 717
    :cond_29
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_86

    .line 718
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    .line 720
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 722
    sget v2, Lcom/miui/internal/R$dimen;->dialog_custom_vertical_padding:I

    .line 720
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 723
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    if-eqz v2, :cond_49

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    .line 725
    :cond_49
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    if-eqz v2, :cond_87

    move v2, v3

    :goto_50
    iput-boolean v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adC:Z

    .line 727
    iget-object v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 729
    sget v5, Lcom/miui/internal/R$dimen;->dialog_custom_horizontal_padding:I

    .line 727
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 730
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    if-eqz v2, :cond_89

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    .line 733
    :goto_68
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v6

    if-eqz v6, :cond_72

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v5

    .line 736
    :cond_72
    const v6, 0x102000d

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 737
    if-eqz v6, :cond_8b

    instance-of v6, v6, Lmiui/widget/ProgressBar;

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_8b

    .line 738
    invoke-virtual {p1, v4, v4, v4, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 739
    iput-boolean v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adC:Z

    .line 755
    :cond_86
    :goto_86
    return-void

    :cond_87
    move v2, v4

    .line 725
    goto :goto_50

    :cond_89
    move v2, v5

    .line 731
    goto :goto_68

    .line 740
    :cond_8b
    sget v6, Lcom/miui/internal/R$id;->datePicker:I

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_9b

    .line 741
    sget v6, Lcom/miui/internal/R$id;->timePicker:I

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_a4

    .line 743
    :cond_9b
    invoke-virtual {p1, v4, v4, v4, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 744
    invoke-direct {p0}, Lcom/miui/internal/app/AlertControllerImpl;->za()V

    .line 745
    iput-boolean v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adC:Z

    goto :goto_86

    .line 742
    :cond_a4
    sget v6, Lcom/miui/internal/R$id;->dateTimePicker:I

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_9b

    .line 748
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    .line 747
    invoke-virtual {p1, v2, v1, v5, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 749
    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    goto :goto_86

    .line 753
    :cond_b7
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_86
.end method

.method private zf()V
    .registers 4

    .prologue
    .line 644
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getChoiceMode()I

    move-result v1

    .line 645
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adl:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_85

    .line 646
    const/4 v0, 0x2

    if-ne v1, v0, :cond_a5

    .line 647
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    sget v2, Lcom/miui/internal/R$id;->cancel:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 648
    if-eqz v0, :cond_21

    .line 649
    new-instance v2, Lcom/miui/internal/app/AlertControllerImpl$5;

    invoke-direct {v2, p0}, Lcom/miui/internal/app/AlertControllerImpl$5;-><init>(Lcom/miui/internal/app/AlertControllerImpl;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 657
    :cond_21
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    sget v2, Lcom/miui/internal/R$id;->select:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 658
    if-eqz v0, :cond_37

    .line 659
    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ady:Landroid/widget/Button;

    .line 660
    new-instance v2, Lcom/miui/internal/app/AlertControllerImpl$6;

    invoke-direct {v2, p0, v0}, Lcom/miui/internal/app/AlertControllerImpl$6;-><init>(Lcom/miui/internal/app/AlertControllerImpl;Landroid/widget/Button;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 671
    :cond_37
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ady:Landroid/widget/Button;

    if-eqz v0, :cond_9d

    .line 672
    new-instance v0, Lmiui/widget/EditableListViewWrapper;

    iget-object v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    invoke-direct {v0, v2}, Lmiui/widget/EditableListViewWrapper;-><init>(Landroid/widget/AbsListView;)V

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adE:Lmiui/widget/EditableListViewWrapper;

    .line 673
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 674
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adE:Lmiui/widget/EditableListViewWrapper;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adl:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Lmiui/widget/EditableListViewWrapper;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 675
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    .line 677
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    new-instance v2, Lcom/miui/internal/app/AlertControllerImpl$7;

    invoke-direct {v2, p0, v0}, Lcom/miui/internal/app/AlertControllerImpl$7;-><init>(Lcom/miui/internal/app/AlertControllerImpl;Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 686
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adA:[Z

    if-eqz v0, :cond_76

    .line 687
    const/4 v0, 0x0

    :goto_65
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adA:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_76

    .line 688
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adE:Lmiui/widget/EditableListViewWrapper;

    iget-object v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adA:[Z

    aget-boolean v2, v2, v0

    invoke-virtual {v1, v0, v2}, Lmiui/widget/EditableListViewWrapper;->setItemChecked(IZ)V

    .line 687
    add-int/lit8 v0, v0, 0x1

    goto :goto_65

    .line 691
    :cond_76
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->ady:Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adE:Lmiui/widget/EditableListViewWrapper;

    invoke-virtual {v0}, Lmiui/widget/EditableListViewWrapper;->isAllItemsChecked()Z

    move-result v0

    if-eqz v0, :cond_9a

    .line 692
    sget v0, Lmiui/R$string;->deselect_all:I

    .line 691
    :goto_82
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(I)V

    .line 701
    :cond_85
    :goto_85
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adz:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_99

    .line 702
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    iget v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adz:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 703
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    iget v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adz:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 705
    :cond_99
    return-void

    .line 692
    :cond_9a
    sget v0, Lmiui/R$string;->select_all:I

    goto :goto_82

    .line 694
    :cond_9d
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adl:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_85

    .line 697
    :cond_a5
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adl:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_85
.end method

.method private zg(Landroid/view/ViewGroup;)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 536
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    if-eqz v0, :cond_67

    .line 538
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 539
    const/4 v1, -0x1

    const/4 v2, -0x2

    .line 538
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 540
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {p1, v1, v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 543
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 544
    sget v1, Lcom/miui/internal/R$dimen;->dialog_title_vertical_padding:I

    .line 543
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 545
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    if-eqz v1, :cond_2c

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    .line 548
    :cond_2c
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 550
    sget v2, Lcom/miui/internal/R$dimen;->dialog_title_horizontal_padding:I

    .line 548
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 551
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    if-eqz v1, :cond_65

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .line 554
    :goto_46
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    if-eqz v3, :cond_54

    iget-object v2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .line 557
    :cond_54
    iget-object v3, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    invoke-virtual {v3, v1, v0, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 560
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 561
    sget v1, Lcom/miui/internal/R$id;->alertTitle:I

    .line 560
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 562
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 581
    :cond_64
    :goto_64
    return-void

    :cond_65
    move v1, v2

    .line 552
    goto :goto_46

    .line 564
    :cond_67
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adS:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 565
    if-eqz v0, :cond_99

    .line 567
    sget v0, Lcom/miui/internal/R$id;->alertTitle:I

    .line 566
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    .line 568
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adS:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 570
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adG:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8d

    .line 571
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adG:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 574
    :cond_8d
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adH:I

    if-eqz v0, :cond_64

    .line 575
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    iget v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adH:I

    invoke-virtual {v0, v1, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    goto :goto_64

    .line 578
    :cond_99
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_64
.end method

.method private zh()V
    .registers 3

    .prologue
    .line 500
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 501
    sget v1, Lcom/miui/internal/R$id;->topPanel:I

    .line 500
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 502
    if-eqz v0, :cond_f

    .line 503
    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->zg(Landroid/view/ViewGroup;)V

    .line 507
    :cond_f
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 508
    sget v1, Lcom/miui/internal/R$id;->contentPanel:I

    .line 507
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 509
    if-eqz v0, :cond_1e

    .line 510
    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->zd(Landroid/view/ViewGroup;)V

    .line 514
    :cond_1e
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 515
    sget v1, Lmiui/R$id;->customPanel:I

    .line 514
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 516
    if-eqz v0, :cond_2d

    .line 517
    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->ze(Landroid/widget/FrameLayout;)V

    .line 521
    :cond_2d
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 522
    sget v1, Lcom/miui/internal/R$id;->checkboxPanel:I

    .line 521
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 523
    if-eqz v0, :cond_3c

    .line 524
    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->zc(Landroid/widget/FrameLayout;)V

    .line 528
    :cond_3c
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 529
    sget v1, Lcom/miui/internal/R$id;->buttonPanel:I

    .line 528
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 530
    if-eqz v0, :cond_4b

    .line 531
    invoke-direct {p0, v0}, Lcom/miui/internal/app/AlertControllerImpl;->zb(Landroid/view/ViewGroup;)V

    .line 533
    :cond_4b
    return-void
.end method

.method static synthetic zi(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic zj(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adq:Landroid/os/Message;

    return-object v0
.end method

.method static synthetic zk(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic zl(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adt:Landroid/os/Message;

    return-object v0
.end method

.method static synthetic zm(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic zn(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adw:Landroid/os/Message;

    return-object v0
.end method

.method static synthetic zo(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ady:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic zp(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/content/DialogInterface;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adD:Landroid/content/DialogInterface;

    return-object v0
.end method

.method static synthetic zq(Lcom/miui/internal/app/AlertControllerImpl;)Lmiui/widget/EditableListViewWrapper;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adE:Lmiui/widget/EditableListViewWrapper;

    return-object v0
.end method

.method static synthetic zr(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adF:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic zs(Lcom/miui/internal/app/AlertControllerImpl;Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    invoke-direct {p0, p1}, Lcom/miui/internal/app/AlertControllerImpl;->yY(Lcom/miui/internal/view/menu/MenuBuilder;)Z

    move-result v0

    return v0
.end method

.method static synthetic zt(Lcom/miui/internal/app/AlertControllerImpl;Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    invoke-direct {p0, p1}, Lcom/miui/internal/app/AlertControllerImpl;->yZ(Lcom/miui/internal/view/menu/MenuBuilder;)Z

    move-result v0

    return v0
.end method

.method static synthetic zu(Lcom/miui/internal/app/AlertControllerImpl;Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/miui/internal/app/AlertControllerImpl;->setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V

    return-void
.end method


# virtual methods
.method createMenu()Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 3

    .prologue
    .line 321
    new-instance v0, Lcom/miui/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 322
    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->setCallback(Lcom/miui/internal/view/menu/MenuBuilder$Callback;)V

    .line 323
    return-object v0
.end method

.method public getActionBar()Lmiui/app/ActionBar;
    .registers 2

    .prologue
    .line 477
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adk:Lmiui/app/ActionBar;

    return-object v0
.end method

.method public getButton(I)Landroid/widget/Button;
    .registers 3

    .prologue
    .line 464
    packed-switch p1, :pswitch_data_e

    .line 472
    const/4 v0, 0x0

    return-object v0

    .line 466
    :pswitch_5
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adv:Landroid/widget/Button;

    return-object v0

    .line 468
    :pswitch_8
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adp:Landroid/widget/Button;

    return-object v0

    .line 470
    :pswitch_b
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->ads:Landroid/widget/Button;

    return-object v0

    .line 464
    :pswitch_data_e
    .packed-switch -0x3
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public getCheckedItems()[Z
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adA:[Z

    return-object v0
.end method

.method public getDialogInterface()Landroid/content/DialogInterface;
    .registers 2

    .prologue
    .line 460
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adD:Landroid/content/DialogInterface;

    return-object v0
.end method

.method public getListItemLayout()I
    .registers 2

    .prologue
    .line 432
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adJ:I

    return v0
.end method

.method public getListLayout()I
    .registers 2

    .prologue
    .line 428
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adK:I

    return v0
.end method

.method public getListView()Landroid/widget/ListView;
    .registers 2

    .prologue
    .line 420
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    return-object v0
.end method

.method public getMessageView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 444
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    return-object v0
.end method

.method public getMultiChoiceItemLayout()I
    .registers 2

    .prologue
    .line 440
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adP:I

    return v0
.end method

.method public getSingleChoiceItemLayout()I
    .registers 2

    .prologue
    .line 436
    iget v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adR:I

    return v0
.end method

.method public installContent()V
    .registers 4

    .prologue
    const/high16 v2, 0x20000

    .line 242
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 244
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->yV(Landroid/view/View;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1b

    .line 245
    :cond_16
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 249
    :cond_1b
    invoke-direct {p0}, Lcom/miui/internal/app/AlertControllerImpl;->yW()V

    .line 250
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adV:Landroid/view/Window;

    sget v1, Lcom/miui/internal/R$id;->parentPanel:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    .line 251
    invoke-direct {p0}, Lcom/miui/internal/app/AlertControllerImpl;->zh()V

    .line 252
    return-void
.end method

.method public isChecked()Z
    .registers 3

    .prologue
    .line 456
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adn:Landroid/view/ViewGroup;

    const v1, 0x1020001

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mIsChecked:Z

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    .prologue
    .line 490
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    invoke-virtual {v0, p2}, Landroid/widget/ScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    .prologue
    .line 495
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adQ:Landroid/widget/ScrollView;

    invoke-virtual {v0, p2}, Landroid/widget/ScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 6

    .prologue
    .line 341
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mOnActionItemClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_f

    .line 342
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->mOnActionItemClickListener:Landroid/content/DialogInterface$OnClickListener;

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adD:Landroid/content/DialogInterface;

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 344
    :cond_f
    const/4 v0, 0x1

    return v0
.end method

.method public onMenuModeChange(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 2

    .prologue
    .line 349
    return-void
.end method

.method public setActionItems(Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/internal/variable/AlertControllerWrapper$AlertParams$ActionItem;",
            ">;",
            "Landroid/content/DialogInterface$OnClickListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 415
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mActionItems:Ljava/util/ArrayList;

    .line 416
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->mOnActionItemClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 417
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 2

    .prologue
    .line 481
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adl:Landroid/widget/ListAdapter;

    .line 482
    return-void
.end method

.method public setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V
    .registers 7

    .prologue
    .line 389
    if-nez p4, :cond_a

    if-eqz p3, :cond_a

    .line 390
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adF:Landroid/os/Handler;

    invoke-virtual {v0, p1, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p4

    .line 393
    :cond_a
    packed-switch p1, :pswitch_data_26

    .line 410
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Button does not exist"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 395
    :pswitch_16
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adx:Ljava/lang/CharSequence;

    .line 396
    iput-object p4, p0, Lcom/miui/internal/app/AlertControllerImpl;->adw:Landroid/os/Message;

    .line 412
    :goto_1a
    return-void

    .line 400
    :pswitch_1b
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adr:Ljava/lang/CharSequence;

    .line 401
    iput-object p4, p0, Lcom/miui/internal/app/AlertControllerImpl;->adq:Landroid/os/Message;

    goto :goto_1a

    .line 405
    :pswitch_20
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->adu:Ljava/lang/CharSequence;

    .line 406
    iput-object p4, p0, Lcom/miui/internal/app/AlertControllerImpl;->adt:Landroid/os/Message;

    goto :goto_1a

    .line 393
    nop

    :pswitch_data_26
    .packed-switch -0x3
        :pswitch_20
        :pswitch_1b
        :pswitch_16
    .end packed-switch
.end method

.method public setCheckBox(ZLjava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 384
    iput-boolean p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->mIsChecked:Z

    .line 385
    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl;->mCheckBoxMessage:Ljava/lang/CharSequence;

    .line 386
    return-void
.end method

.method public setCheckedItem(I)V
    .registers 2

    .prologue
    .line 485
    iput p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adz:I

    .line 486
    return-void
.end method

.method public setCheckedItems([Z)V
    .registers 2

    .prologue
    .line 448
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adA:[Z

    .line 449
    return-void
.end method

.method public setCustomTitle(Landroid/view/View;)V
    .registers 2

    .prologue
    .line 369
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adB:Landroid/view/View;

    .line 370
    return-void
.end method

.method public setIcon(I)V
    .registers 3

    .prologue
    .line 357
    iput p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adH:I

    .line 358
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adG:Landroid/graphics/drawable/Drawable;

    .line 359
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 352
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adG:Landroid/graphics/drawable/Drawable;

    .line 353
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adH:I

    .line 354
    return-void
.end method

.method public setListView(Landroid/widget/ListView;)V
    .registers 2

    .prologue
    .line 424
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adL:Landroid/widget/ListView;

    .line 425
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 373
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adN:Ljava/lang/CharSequence;

    .line 374
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 375
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adO:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 377
    :cond_b
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 362
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adS:Ljava/lang/CharSequence;

    .line 363
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 364
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl;->adT:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    :cond_b
    return-void
.end method

.method public setView(Landroid/view/View;)V
    .registers 2

    .prologue
    .line 380
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl;->adU:Landroid/view/View;

    .line 381
    return-void
.end method
