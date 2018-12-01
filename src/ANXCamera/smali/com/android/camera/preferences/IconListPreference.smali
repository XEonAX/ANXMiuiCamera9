.class public Lcom/android/camera/preferences/IconListPreference;
.super Lcom/android/camera/preferences/ListPreference;
.source "IconListPreference.java"


# instance fields
.field private mEnabled:Z

.field private mIconIds:[I

.field private mImageIds:[I

.field private mLargeIconIds:[I

.field private mSingleIconId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/android/camera/preferences/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    iput-boolean v4, p0, Lcom/android/camera/preferences/IconListPreference;->mEnabled:Z

    .line 42
    sget-object v2, Lcom/android/camera/R$styleable;->IconListPreference:[I

    .line 41
    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 43
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 44
    .local v1, "res":Landroid/content/res/Resources;
    invoke-virtual {v0, v4, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/preferences/IconListPreference;->mSingleIconId:I

    .line 46
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    .line 49
    const/4 v2, 0x2

    .line 48
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    .line 51
    const/4 v2, 0x3

    .line 50
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    .line 52
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 53
    return-void
.end method

.method private getIds(Landroid/content/res/Resources;I)[I
    .locals 6
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "iconsRes"    # I

    .prologue
    const/4 v5, 0x0

    .line 92
    if-nez p2, :cond_0

    .line 93
    const/4 v4, 0x0

    return-object v4

    .line 95
    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 96
    .local v0, "array":Landroid/content/res/TypedArray;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v3

    .line 97
    .local v3, "n":I
    new-array v2, v3, [I

    .line 98
    .local v2, "ids":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 99
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    aput v4, v2, v1

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    :cond_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 102
    return-object v2
.end method
