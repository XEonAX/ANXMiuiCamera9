.class public Lmiui/preference/PreferenceFragment;
.super Landroid/preference/PreferenceFragment;
.source "SourceFile"

# interfaces
.implements Lmiui/app/IFragment;


# instance fields
.field private iV:Lcom/miui/internal/app/FragmentDelegate;

.field private iW:Z

.field private iX:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 29
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 33
    iput-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    .line 35
    iput-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    .line 29
    return-void
.end method


# virtual methods
.method public dismissImmersionMenu(Z)V
    .registers 3

    .prologue
    .line 361
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->dismissImmersionMenu(Z)V

    .line 362
    return-void
.end method

.method public getActionBar()Lmiui/app/ActionBar;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    return-object v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public invalidateOptionsMenu()V
    .registers 3

    .prologue
    .line 166
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    if-eqz v0, :cond_23

    .line 167
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/FragmentDelegate;->updateOptionsMenu(I)V

    .line 168
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_23

    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    if-eqz v0, :cond_23

    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 169
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 172
    :cond_23
    return-void
.end method

.method public final onActionModeFinished(Landroid/view/ActionMode;)V
    .registers 2

    .prologue
    .line 203
    return-void
.end method

.method public final onActionModeStarted(Landroid/view/ActionMode;)V
    .registers 2

    .prologue
    .line 193
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 92
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 93
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 94
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 40
    new-instance v0, Lcom/miui/internal/app/FragmentDelegate;

    invoke-direct {v0, p0}, Lcom/miui/internal/app/FragmentDelegate;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    .line 41
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->onCreate(Landroid/os/Bundle;)V

    .line 42
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    .prologue
    .line 279
    const/4 v0, 0x1

    return v0
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 218
    if-nez p1, :cond_1c

    .line 220
    iget-boolean v1, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    if-eqz v1, :cond_1b

    iget-boolean v1, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    if-eqz v1, :cond_1b

    .line 221
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v1

    if-nez v1, :cond_1b

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 222
    invoke-virtual {p0, p2}, Lmiui/preference/PreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    .line 225
    :cond_1b
    return v0

    .line 227
    :cond_1c
    return v0
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9

    .prologue
    const/4 v4, 0x0

    .line 72
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p2, p3}, Lcom/miui/internal/app/FragmentDelegate;->onCreateView(Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 74
    const v0, 0x102000a

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 75
    if-eqz v0, :cond_23

    .line 76
    invoke-virtual {v0, v4}, Landroid/widget/ListView;->setClipToPadding(Z)V

    .line 77
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 78
    sget v3, Lcom/miui/internal/R$attr;->preferenceScreenPaddingBottom:I

    .line 77
    invoke-static {v2, v3}, Lmiui/util/AttributeResolver;->resolveDimension(Landroid/content/Context;I)F

    move-result v2

    float-to-int v2, v2

    .line 79
    invoke-virtual {v0, v4, v4, v4, v2}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 82
    :cond_23
    return-object v1
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 366
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    .line 368
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/FragmentDelegate;->dismissImmersionMenu(Z)V

    .line 369
    return-void
.end method

.method public final onHiddenChanged(Z)V
    .registers 3

    .prologue
    .line 312
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onHiddenChanged(Z)V

    .line 313
    if-nez p1, :cond_e

    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    if-eqz v0, :cond_e

    .line 314
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 316
    :cond_e
    xor-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lmiui/preference/PreferenceFragment;->onVisibilityChanged(Z)V

    .line 317
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    .prologue
    .line 297
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)V
    .registers 5

    .prologue
    .line 241
    if-nez p1, :cond_19

    .line 242
    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    if-eqz v0, :cond_19

    .line 243
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 244
    invoke-virtual {p0, p3}, Lmiui/preference/PreferenceFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 248
    :cond_19
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 52
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 53
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->onPostResume()V

    .line 54
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 46
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onStop()V

    .line 47
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->onStop()V

    .line 48
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .registers 2

    .prologue
    .line 330
    return-void
.end method

.method public requestWindowFeature(I)Z
    .registers 3

    .prologue
    .line 158
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->requestWindowFeature(I)Z

    move-result v0

    return v0
.end method

.method public setHasOptionsMenu(Z)V
    .registers 3

    .prologue
    .line 131
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->setHasOptionsMenu(Z)V

    .line 132
    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    if-eq v0, p1, :cond_1e

    .line 133
    iput-boolean p1, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    .line 134
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    if-eqz v0, :cond_1e

    .line 135
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 138
    :cond_1e
    return-void
.end method

.method public setImmersionMenuEnabled(Z)V
    .registers 3

    .prologue
    .line 337
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->setImmersionMenuEnabled(Z)V

    .line 338
    return-void
.end method

.method public setMenuVisibility(Z)V
    .registers 3

    .prologue
    .line 142
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->setMenuVisibility(Z)V

    .line 143
    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    if-eq v0, p1, :cond_1e

    .line 144
    iput-boolean p1, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    .line 145
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    if-eqz v0, :cond_1e

    .line 146
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 149
    :cond_1e
    return-void
.end method

.method public setThemeRes(I)V
    .registers 3

    .prologue
    .line 121
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->setExtraThemeRes(I)V

    .line 122
    return-void
.end method

.method public showImmersionMenu()V
    .registers 2

    .prologue
    .line 345
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->showImmersionMenu()V

    .line 346
    return-void
.end method

.method public showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V
    .registers 4

    .prologue
    .line 353
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/FragmentDelegate;->showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 354
    return-void
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 116
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/FragmentDelegate;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0
.end method

.method public updateOptionsMenuContent()V
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isHidden()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1f

    .line 180
    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iW:Z

    .line 179
    if-eqz v0, :cond_1f

    .line 180
    iget-boolean v0, p0, Lmiui/preference/PreferenceFragment;->iX:Z

    .line 179
    if-eqz v0, :cond_1f

    .line 180
    invoke-virtual {p0}, Lmiui/preference/PreferenceFragment;->isAdded()Z

    move-result v0

    .line 179
    if-eqz v0, :cond_1f

    .line 181
    iget-object v0, p0, Lmiui/preference/PreferenceFragment;->iV:Lcom/miui/internal/app/FragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/FragmentDelegate;->invalidateOptionsMenu()V

    .line 183
    :cond_1f
    return-void
.end method
