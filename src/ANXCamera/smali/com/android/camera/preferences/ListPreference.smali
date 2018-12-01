.class public Lcom/android/camera/preferences/ListPreference;
.super Lcom/android/camera/preferences/CameraPreference;
.source "ListPreference.java"


# instance fields
.field private final mDefaultValues:[Ljava/lang/CharSequence;

.field private mEntries:[Ljava/lang/CharSequence;

.field private mEntryValues:[Ljava/lang/CharSequence;

.field private final mHasPopup:Z

.field private final mKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/android/camera/preferences/CameraPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    sget-object v4, Lcom/android/camera/R$styleable;->ListPreference:[I

    .line 50
    invoke-virtual {p1, p2, v4, v5, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 54
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 53
    invoke-static {v4}, Lcom/android/camera/Util;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/android/camera/preferences/ListPreference;->mKey:Ljava/lang/String;

    .line 55
    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "popup":Ljava/lang/String;
    if-nez v2, :cond_0

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lcom/android/camera/preferences/ListPreference;->mHasPopup:Z

    .line 62
    const/4 v1, 0x1

    .line 63
    .local v1, "attrDefaultValue":I
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    .line 64
    .local v3, "tv":Landroid/util/TypedValue;
    if-eqz v3, :cond_1

    iget v4, v3, Landroid/util/TypedValue;->type:I

    if-ne v4, v6, :cond_1

    .line 65
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/preferences/ListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    .line 71
    :goto_1
    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/camera/preferences/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 73
    const/4 v4, 0x2

    .line 72
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/camera/preferences/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 74
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    return-void

    .line 56
    .end local v1    # "attrDefaultValue":I
    .end local v3    # "tv":Landroid/util/TypedValue;
    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    goto :goto_0

    .line 67
    .restart local v1    # "attrDefaultValue":I
    .restart local v3    # "tv":Landroid/util/TypedValue;
    :cond_1
    new-array v4, v6, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/android/camera/preferences/ListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    .line 68
    iget-object v4, p0, Lcom/android/camera/preferences/ListPreference;->mDefaultValues:[Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    goto :goto_1
.end method


# virtual methods
.method public setEntries([Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 94
    if-nez p1, :cond_0

    const/4 v0, 0x0

    new-array p1, v0, [Ljava/lang/CharSequence;

    .end local p1    # "entries":[Ljava/lang/CharSequence;
    :cond_0
    iput-object p1, p0, Lcom/android/camera/preferences/ListPreference;->mEntries:[Ljava/lang/CharSequence;

    .line 95
    return-void
.end method

.method public setEntryValues([Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "values"    # [Ljava/lang/CharSequence;

    .prologue
    .line 98
    if-nez p1, :cond_0

    const/4 v0, 0x0

    new-array p1, v0, [Ljava/lang/CharSequence;

    .end local p1    # "values":[Ljava/lang/CharSequence;
    :cond_0
    iput-object p1, p0, Lcom/android/camera/preferences/ListPreference;->mEntryValues:[Ljava/lang/CharSequence;

    .line 99
    return-void
.end method
