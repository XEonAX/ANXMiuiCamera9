.class public Lmiui/preference/RadioButtonPreference;
.super Landroid/preference/CheckBoxPreference;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lmiui/preference/RadioButtonPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .prologue
    .line 71
    sget v0, Lmiui/R$attr;->radioButtonPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lmiui/preference/RadioButtonPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    sget-object v0, Lcom/miui/internal/R$styleable;->RadioButtonPreference:[I

    invoke-virtual {p1, p2, v0, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 47
    sget v1, Lcom/miui/internal/R$styleable;->RadioButtonPreference_android_layout:I

    .line 48
    sget v2, Lcom/miui/internal/R$layout;->preference_radiobutton:I

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 49
    sget v2, Lcom/miui/internal/R$styleable;->RadioButtonPreference_android_widgetLayout:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 51
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 53
    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreference;->getLayoutResource()I

    move-result v0

    if-eq v0, v1, :cond_26

    .line 54
    sget v0, Lcom/miui/internal/R$layout;->preference_radiobutton:I

    invoke-virtual {p0, v0}, Lmiui/preference/RadioButtonPreference;->setLayoutResource(I)V

    .line 56
    :cond_26
    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreference;->getWidgetLayoutResource()I

    move-result v0

    if-eq v0, v2, :cond_2f

    .line 57
    invoke-virtual {p0, v3}, Lmiui/preference/RadioButtonPreference;->setWidgetLayoutResource(I)V

    .line 59
    :cond_2f
    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 5

    .prologue
    .line 85
    invoke-super {p0, p1}, Landroid/preference/CheckBoxPreference;->onBindView(Landroid/view/View;)V

    .line 87
    const v0, 0x1020016

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 88
    if-eqz v1, :cond_20

    instance-of v0, v1, Landroid/widget/CheckedTextView;

    if-eqz v0, :cond_20

    move-object v0, v1

    .line 89
    check-cast v0, Landroid/widget/CheckedTextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/CheckedTextView;->setCheckMarkDrawable(I)V

    .line 90
    check-cast v1, Landroid/widget/CheckedTextView;

    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreference;->isChecked()Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 93
    :cond_20
    const v0, 0x1020001

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 94
    if-eqz v0, :cond_2d

    .line 95
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 97
    :cond_2d
    return-void
.end method
