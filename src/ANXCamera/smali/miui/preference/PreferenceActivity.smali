.class public Lmiui/preference/PreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "SourceFile"

# interfaces
.implements Lmiui/app/IActivity;


# instance fields
.field private iR:Lcom/miui/internal/app/ActivityDelegate;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 34
    new-instance v0, Lcom/miui/internal/app/ActivityDelegate;

    const-class v1, Landroid/preference/PreferenceActivity;

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/app/ActivityDelegate;-><init>(Landroid/app/Activity;Ljava/lang/Class;)V

    iput-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    .line 35
    return-void
.end method


# virtual methods
.method public dismissImmersionMenu(Z)V
    .registers 3

    .prologue
    .line 208
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->dismissImmersionMenu(Z)V

    .line 209
    return-void
.end method

.method public bridge synthetic getActionBar()Landroid/app/ActionBar;
    .registers 2

    .prologue
    .line 37
    invoke-virtual {p0}, Lmiui/preference/PreferenceActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public getActionBar()Lmiui/app/ActionBar;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    return-object v0
.end method

.method public getTranslucentStatus()I
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->getTranslucentStatus()I

    move-result v0

    return v0
.end method

.method public invalidateOptionsMenu()V
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->invalidateOptionsMenu()V

    .line 118
    return-void
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .registers 3

    .prologue
    .line 154
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 155
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .registers 3

    .prologue
    .line 149
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 150
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_b

    .line 175
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onBackPressed()V

    .line 177
    :cond_b
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 72
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 73
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 74
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 49
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onCreate(Landroid/os/Bundle;)V

    .line 52
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lmiui/preference/PreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 53
    if-eqz v0, :cond_2c

    .line 54
    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setClipToPadding(Z)V

    .line 56
    sget v1, Lcom/miui/internal/R$attr;->preferenceScreenPaddingBottom:I

    .line 55
    invoke-static {p0, v1}, Lmiui/util/AttributeResolver;->resolveDimension(Landroid/content/Context;I)F

    move-result v1

    float-to-int v1, v1

    .line 57
    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 59
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 60
    if-eqz v0, :cond_2c

    .line 63
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 67
    :cond_2c
    invoke-static {}, Lcom/miui/internal/variable/Android_App_PreferenceActivity_class$Factory;->getInstance()Lcom/miui/internal/variable/Android_App_PreferenceActivity_class$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/variable/Android_App_PreferenceActivity_class$Factory;->get()Lcom/miui/internal/variable/Android_App_PreferenceActivity_class;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/miui/internal/variable/Android_App_PreferenceActivity_class;->onCreate(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 68
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4

    .prologue
    .line 159
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .registers 3

    .prologue
    .line 102
    if-nez p1, :cond_9

    .line 103
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 105
    :cond_9
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 233
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 235
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActivityDelegate;->dismissImmersionMenu(Z)V

    .line 236
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 4

    .prologue
    .line 169
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method protected onPostResume()V
    .registers 2

    .prologue
    .line 96
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPostResume()V

    .line 97
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->onPostResume()V

    .line 98
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 5

    .prologue
    .line 164
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/internal/app/ActivityDelegate;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 3

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 85
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 86
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3

    .prologue
    .line 78
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 79
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 80
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 90
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onStop()V

    .line 91
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->onStop()V

    .line 92
    return-void
.end method

.method protected onTitleChanged(Ljava/lang/CharSequence;I)V
    .registers 4

    .prologue
    .line 111
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onTitleChanged(Ljava/lang/CharSequence;I)V

    .line 112
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onTitleChanged(Ljava/lang/CharSequence;)V

    .line 113
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 144
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0
.end method

.method public requestExtraWindowFeature(I)Z
    .registers 3

    .prologue
    .line 135
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->requestWindowFeature(I)Z

    move-result v0

    return v0
.end method

.method public setImmersionMenuEnabled(Z)V
    .registers 3

    .prologue
    .line 184
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->setImmersionMenuEnabled(Z)V

    .line 185
    return-void
.end method

.method public setTranslucentStatus(I)V
    .registers 3

    .prologue
    .line 220
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->setTranslucentStatus(I)V

    .line 221
    return-void
.end method

.method public showImmersionMenu()V
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->showImmersionMenu()V

    .line 193
    return-void
.end method

.method public showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V
    .registers 4

    .prologue
    .line 200
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/internal/app/ActivityDelegate;->showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 201
    return-void
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lmiui/preference/PreferenceActivity;->iR:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActivityDelegate;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    return-object v0
.end method
