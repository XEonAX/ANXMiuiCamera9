.class public final Landroid/support/v4/widget/CompoundButtonCompat;
.super Ljava/lang/Object;
.source "CompoundButtonCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/CompoundButtonCompat$Api23CompoundButtonImpl;,
        Landroid/support/v4/widget/CompoundButtonCompat$BaseCompoundButtonCompat;,
        Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;,
        Landroid/support/v4/widget/CompoundButtonCompat$LollipopCompoundButtonImpl;
    }
.end annotation


# static fields
.field private static final IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 40
    .local v0, "sdk":I
    const/16 v1, 0x17

    if-ge v0, v1, :cond_12

    .line 42
    const/16 v1, 0x15

    if-ge v0, v1, :cond_1a

    .line 45
    new-instance v1, Landroid/support/v4/widget/CompoundButtonCompat$BaseCompoundButtonCompat;

    invoke-direct {v1}, Landroid/support/v4/widget/CompoundButtonCompat$BaseCompoundButtonCompat;-><init>()V

    sput-object v1, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    .line 47
    :goto_11
    return-void

    .line 41
    :cond_12
    new-instance v1, Landroid/support/v4/widget/CompoundButtonCompat$Api23CompoundButtonImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/CompoundButtonCompat$Api23CompoundButtonImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    goto :goto_11

    .line 43
    :cond_1a
    new-instance v1, Landroid/support/v4/widget/CompoundButtonCompat$LollipopCompoundButtonImpl;

    invoke-direct {v1}, Landroid/support/v4/widget/CompoundButtonCompat$LollipopCompoundButtonImpl;-><init>()V

    sput-object v1, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    goto :goto_11
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getButtonDrawable(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 174
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;->getButtonDrawable(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getButtonTintList(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 138
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;->getButtonTintList(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public static getButtonTintMode(Landroid/widget/CompoundButton;)Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .param p0, "button"    # Landroid/widget/CompoundButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 164
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;->getButtonTintMode(Landroid/widget/CompoundButton;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public static setButtonTintList(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p0, "button"    # Landroid/widget/CompoundButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 128
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;->setButtonTintList(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    .line 129
    return-void
.end method

.method public static setButtonTintMode(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p0, "button"    # Landroid/widget/CompoundButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 154
    sget-object v0, Landroid/support/v4/widget/CompoundButtonCompat;->IMPL:Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/CompoundButtonCompat$CompoundButtonCompatImpl;->setButtonTintMode(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V

    .line 155
    return-void
.end method
