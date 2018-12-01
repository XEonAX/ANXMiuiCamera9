.class Lmiui/preference/ButtonPreference$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/preference/ButtonPreference;->onBindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ji:Lmiui/preference/ButtonPreference;


# direct methods
.method constructor <init>(Lmiui/preference/ButtonPreference;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/preference/ButtonPreference$1;->ji:Lmiui/preference/ButtonPreference;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .prologue
    .line 77
    iget-object v0, p0, Lmiui/preference/ButtonPreference$1;->ji:Lmiui/preference/ButtonPreference;

    invoke-static {v0}, Lmiui/preference/ButtonPreference;->eG(Lmiui/preference/ButtonPreference;)Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 78
    iget-object v0, p0, Lmiui/preference/ButtonPreference$1;->ji:Lmiui/preference/ButtonPreference;

    invoke-static {v0}, Lmiui/preference/ButtonPreference;->eG(Lmiui/preference/ButtonPreference;)Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v0

    iget-object v1, p0, Lmiui/preference/ButtonPreference$1;->ji:Lmiui/preference/ButtonPreference;

    invoke-interface {v0, v1}, Landroid/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/preference/Preference;)Z

    .line 80
    :cond_13
    return-void
.end method
