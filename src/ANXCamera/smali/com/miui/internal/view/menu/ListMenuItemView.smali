.class public Lcom/miui/internal/view/menu/ListMenuItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuView$ItemView;


# instance fields
.field private PA:Landroid/graphics/drawable/Drawable;

.field private PB:Landroid/widget/CheckBox;

.field private PC:Z

.field private PD:Landroid/widget/ImageView;

.field private PE:Lcom/miui/internal/view/menu/MenuItemImpl;

.field private PF:Z

.field private PG:Landroid/widget/RadioButton;

.field private PH:Landroid/view/View;

.field private PI:Landroid/widget/TextView;

.field private PJ:I

.field private PK:Landroid/content/Context;

.field private PL:Landroid/widget/TextView;

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    iput-object p1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->mContext:Landroid/content/Context;

    .line 55
    sget-object v0, Lmiui/R$styleable;->MenuView:[I

    .line 54
    invoke-virtual {p1, p2, v0, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 57
    sget v1, Lmiui/R$styleable;->MenuView_android_itemBackground:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PA:Landroid/graphics/drawable/Drawable;

    .line 58
    sget v1, Lmiui/R$styleable;->MenuView_android_itemTextAppearance:I

    .line 59
    const/4 v2, -0x1

    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PJ:I

    .line 61
    sget v1, Lcom/miui/internal/R$styleable;->MenuView_android_preserveIconSpacing:I

    .line 60
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    .line 62
    iput-object p1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PK:Landroid/content/Context;

    .line 64
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    return-void
.end method

.method private tk()Landroid/view/LayoutInflater;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->mInflater:Landroid/view/LayoutInflater;

    if-nez v0, :cond_c

    .line 285
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->mInflater:Landroid/view/LayoutInflater;

    .line 287
    :cond_c
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method private tl()V
    .registers 4

    .prologue
    .line 268
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tk()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 270
    sget v1, Lcom/miui/internal/R$layout;->list_menu_item_checkbox:I

    .line 271
    const/4 v2, 0x0

    .line 270
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 269
    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    .line 272
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->addView(Landroid/view/View;)V

    .line 273
    return-void
.end method

.method private tm()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 254
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tk()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 255
    sget v1, Lcom/miui/internal/R$layout;->list_menu_item_icon:I

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    .line 257
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    invoke-virtual {p0, v0, v2}, Lcom/miui/internal/view/menu/ListMenuItemView;->addView(Landroid/view/View;I)V

    .line 258
    return-void
.end method

.method private tn()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 261
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tk()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 262
    sget v1, Lcom/miui/internal/R$layout;->list_menu_item_radio:I

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    .line 264
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    invoke-virtual {p0, v0, v2}, Lcom/miui/internal/view/menu/ListMenuItemView;->addView(Landroid/view/View;I)V

    .line 265
    return-void
.end method


# virtual methods
.method public getItemData()Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public initialize(Lcom/miui/internal/view/menu/MenuItemImpl;I)V
    .registers 5

    .prologue
    .line 88
    iput-object p1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 90
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_34

    const/4 v0, 0x0

    :goto_9
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setVisibility(I)V

    .line 92
    invoke-virtual {p1, p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->tF(Lcom/miui/internal/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setTitle(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setCheckable(Z)V

    .line 94
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tG()Z

    move-result v0

    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tH()C

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/view/menu/ListMenuItemView;->setShortcut(ZC)V

    .line 95
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 96
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isEnabled()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setEnabled(Z)V

    .line 97
    return-void

    .line 90
    :cond_34
    const/16 v0, 0x8

    goto :goto_9
.end method

.method protected onFinishInflate()V
    .registers 4

    .prologue
    .line 73
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 75
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PA:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 77
    sget v0, Lcom/miui/internal/R$id;->title:I

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    .line 78
    iget v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PJ:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_20

    .line 79
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PK:Landroid/content/Context;

    .line 80
    iget v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PJ:I

    .line 79
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 83
    :cond_20
    sget v0, Lcom/miui/internal/R$id;->shortcut:I

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PI:Landroid/widget/TextView;

    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PH:Landroid/view/View;

    .line 85
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6

    .prologue
    .line 242
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    if-eqz v0, :cond_20

    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    if-eqz v0, :cond_20

    .line 244
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 245
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 246
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v2, :cond_20

    iget v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-gtz v2, :cond_20

    .line 247
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 250
    :cond_20
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 251
    return-void
.end method

.method public prefersCondensedTitle()Z
    .registers 2

    .prologue
    .line 276
    const/4 v0, 0x0

    return v0
.end method

.method public setCheckable(Z)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    const/16 v4, 0x8

    .line 122
    if-nez p1, :cond_e

    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    if-nez v0, :cond_e

    .line 123
    return-void

    .line 131
    :cond_e
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isExclusiveCheckable()Z

    move-result v0

    if-eqz v0, :cond_71

    .line 132
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    if-nez v0, :cond_1d

    .line 133
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tn()V

    .line 135
    :cond_1d
    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    .line 136
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    .line 145
    :goto_21
    if-eqz p1, :cond_7d

    .line 146
    iget-object v3, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v3}, Lcom/miui/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 148
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_35

    .line 149
    invoke-virtual {v2, v1}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 153
    :cond_35
    if-eqz v0, :cond_40

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->getVisibility()I

    move-result v2

    if-eq v2, v4, :cond_40

    .line 154
    invoke-virtual {v0, v4}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 166
    :cond_40
    :goto_40
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PH:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 167
    if-eqz p1, :cond_54

    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Lcom/miui/internal/view/menu/MenuItemImpl;->isExclusiveCheckable()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_5f

    .line 168
    :cond_54
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 169
    const v2, 0x10103a3

    .line 168
    invoke-static {v1, v2}, Lmiui/util/AttributeResolver;->resolveDimensionPixelSize(Landroid/content/Context;I)I

    move-result v1

    .line 170
    :cond_5f
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 171
    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PH:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ListMenuItemView;->setActivated(Z)V

    .line 175
    return-void

    .line 138
    :cond_71
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    if-nez v0, :cond_78

    .line 139
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tl()V

    .line 141
    :cond_78
    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    .line 142
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    goto :goto_21

    .line 157
    :cond_7d
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    if-eqz v0, :cond_86

    .line 158
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 160
    :cond_86
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    if-eqz v0, :cond_40

    .line 161
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    invoke-virtual {v0, v4}, Landroid/widget/RadioButton;->setVisibility(I)V

    goto :goto_40
.end method

.method public setChecked(Z)V
    .registers 3

    .prologue
    .line 180
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isExclusiveCheckable()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 181
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    if-nez v0, :cond_f

    .line 182
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tn()V

    .line 184
    :cond_f
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PG:Landroid/widget/RadioButton;

    .line 192
    :goto_11
    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 194
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ListMenuItemView;->setActivated(Z)V

    .line 195
    return-void

    .line 186
    :cond_18
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    if-nez v0, :cond_1f

    .line 187
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tl()V

    .line 189
    :cond_1f
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PB:Landroid/widget/CheckBox;

    goto :goto_11
.end method

.method public setForceShowIcon(Z)V
    .registers 2

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PC:Z

    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    .line 101
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v0, 0x0

    .line 216
    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->shouldShowIcon()Z

    move-result v1

    if-nez v1, :cond_15

    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PC:Z

    .line 217
    :goto_c
    if-nez v1, :cond_17

    iget-boolean v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_17

    .line 218
    return-void

    .line 216
    :cond_15
    const/4 v1, 0x1

    goto :goto_c

    .line 221
    :cond_17
    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    if-nez v2, :cond_24

    if-nez p1, :cond_24

    iget-boolean v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_24

    .line 222
    return-void

    .line 225
    :cond_24
    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    if-nez v2, :cond_2b

    .line 226
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ListMenuItemView;->tm()V

    .line 229
    :cond_2b
    if-nez p1, :cond_31

    iget-boolean v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PF:Z

    if-eqz v2, :cond_48

    .line 230
    :cond_31
    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    if-eqz v1, :cond_46

    :goto_35
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_45

    .line 233
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 238
    :cond_45
    :goto_45
    return-void

    :cond_46
    move-object p1, v0

    .line 230
    goto :goto_35

    .line 236
    :cond_48
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PD:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_45
.end method

.method public setItemInvoker(Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;)V
    .registers 3

    .prologue
    .line 199
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setShortcut(ZC)V
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 203
    if-eqz p1, :cond_26

    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tG()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 206
    :goto_b
    if-nez v0, :cond_18

    .line 207
    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PI:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PE:Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Lcom/miui/internal/view/menu/MenuItemImpl;->tI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    :cond_18
    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PI:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-eq v1, v0, :cond_25

    .line 211
    iget-object v1, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PI:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 213
    :cond_25
    return-void

    .line 204
    :cond_26
    const/16 v0, 0x8

    goto :goto_b
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 5

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 104
    if-eqz p1, :cond_18

    .line 105
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_17

    .line 108
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 115
    :cond_17
    :goto_17
    return-void

    .line 111
    :cond_18
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v2, :cond_17

    .line 112
    iget-object v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PL:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_17
.end method

.method public showsIcon()Z
    .registers 2

    .prologue
    .line 280
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ListMenuItemView;->PC:Z

    return v0
.end method
