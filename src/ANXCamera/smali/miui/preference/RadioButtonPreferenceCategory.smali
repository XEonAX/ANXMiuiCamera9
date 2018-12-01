.class public Lmiui/preference/RadioButtonPreferenceCategory;
.super Landroid/preference/PreferenceCategory;
.source "SourceFile"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "RadioButtonPreferenceCategory"


# instance fields
.field private iT:I

.field private iU:Lmiui/preference/RadioButtonPreference;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lmiui/preference/RadioButtonPreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iT:I

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iT:I

    .line 40
    return-void
.end method


# virtual methods
.method public addPreference(Landroid/preference/Preference;)Z
    .registers 4

    .prologue
    .line 66
    instance-of v0, p1, Lmiui/preference/RadioButtonPreference;

    if-nez v0, :cond_d

    .line 67
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Only RadioButtonPreference can be added toRadioButtonPreferenceCategory"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_d
    invoke-super {p0, p1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    move-result v0

    .line 70
    if-eqz v0, :cond_16

    .line 71
    invoke-virtual {p1, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 74
    :cond_16
    return v0
.end method

.method public getCheckedPosition()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iT:I

    return v0
.end method

.method public getCheckedPreference()Landroid/preference/Preference;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iU:Lmiui/preference/RadioButtonPreference;

    return-object v0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 4

    .prologue
    .line 137
    iget-object v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iU:Lmiui/preference/RadioButtonPreference;

    if-eq p1, v0, :cond_7

    .line 138
    invoke-virtual {p0, p1}, Lmiui/preference/RadioButtonPreferenceCategory;->setCheckedPreference(Landroid/preference/Preference;)V

    .line 140
    :cond_7
    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreferenceCategory;->getOnPreferenceClickListener()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v0

    .line 141
    if-eqz v0, :cond_10

    .line 142
    invoke-interface {v0, p0}, Landroid/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/preference/Preference;)Z

    .line 144
    :cond_10
    const/4 v0, 0x0

    return v0
.end method

.method public setCheckedPosition(I)V
    .registers 3

    .prologue
    .line 114
    invoke-virtual {p0, p1}, Lmiui/preference/RadioButtonPreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmiui/preference/RadioButtonPreferenceCategory;->setCheckedPreference(Landroid/preference/Preference;)V

    .line 115
    return-void
.end method

.method public setCheckedPreference(Landroid/preference/Preference;)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 95
    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreferenceCategory;->getPreferenceCount()I

    move-result v3

    move v1, v2

    .line 96
    :goto_6
    if-ge v1, v3, :cond_20

    .line 97
    invoke-virtual {p0, v1}, Lmiui/preference/RadioButtonPreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lmiui/preference/RadioButtonPreference;

    .line 98
    if-ne v0, p1, :cond_1c

    .line 99
    iput-object v0, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iU:Lmiui/preference/RadioButtonPreference;

    .line 100
    iput v1, p0, Lmiui/preference/RadioButtonPreferenceCategory;->iT:I

    .line 101
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lmiui/preference/RadioButtonPreference;->setChecked(Z)V

    .line 96
    :goto_18
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_6

    .line 103
    :cond_1c
    invoke-virtual {v0, v2}, Lmiui/preference/RadioButtonPreference;->setChecked(Z)V

    goto :goto_18

    .line 106
    :cond_20
    return-void
.end method

.method public uncheckAllPreference()V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 82
    invoke-virtual {p0}, Lmiui/preference/RadioButtonPreferenceCategory;->getPreferenceCount()I

    move-result v3

    move v1, v2

    .line 83
    :goto_6
    if-ge v1, v3, :cond_15

    .line 84
    invoke-virtual {p0, v1}, Lmiui/preference/RadioButtonPreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lmiui/preference/RadioButtonPreference;

    .line 85
    invoke-virtual {v0, v2}, Lmiui/preference/RadioButtonPreference;->setChecked(Z)V

    .line 83
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_6

    .line 87
    :cond_15
    return-void
.end method
