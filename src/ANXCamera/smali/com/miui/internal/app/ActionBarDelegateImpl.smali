.class public abstract Lcom/miui/internal/app/ActionBarDelegateImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/app/a;
.implements Lcom/miui/internal/view/menu/MenuPresenter$Callback;
.implements Lcom/miui/internal/view/menu/MenuBuilder$Callback;


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarDelegate"

.field static final aej:Ljava/lang/String; = "splitActionBarWhenNarrow"

.field static final aek:Ljava/lang/String; = "android.support.UI_OPTIONS"


# instance fields
.field aeh:Z

.field aei:Z

.field private ael:Lmiui/app/ActionBar;

.field private aem:Lcom/miui/internal/view/menu/MenuBuilder;

.field private aen:Z

.field private aeo:Landroid/view/MenuInflater;

.field private aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

.field private aeq:I

.field protected mActionBarView:Lcom/miui/internal/widget/ActionBarView;

.field protected mActionMode:Landroid/view/ActionMode;

.field final mActivity:Landroid/app/Activity;

.field protected mFeatureIndeterminateProgress:Z

.field protected mFeatureProgress:Z

.field protected mImmersionLayoutResourceId:I

.field protected mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

.field protected mSubDecorInstalled:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeq:I

    .line 77
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    .line 78
    return-void
.end method


# virtual methods
.method protected createMenu()Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 3

    .prologue
    .line 242
    new-instance v0, Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 243
    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->setCallback(Lcom/miui/internal/view/menu/MenuBuilder$Callback;)V

    .line 244
    return-object v0
.end method

.method public dismissImmersionMenu(Z)V
    .registers 3

    .prologue
    .line 342
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    if-eqz v0, :cond_9

    .line 343
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    invoke-interface {v0, p1}, Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;->dismiss(Z)V

    .line 345
    :cond_9
    return-void
.end method

.method public final getActionBar()Lmiui/app/ActionBar;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 84
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aei:Z

    if-eqz v0, :cond_16

    .line 85
    :cond_9
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->ael:Lmiui/app/ActionBar;

    if-nez v0, :cond_13

    .line 86
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->createActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->ael:Lmiui/app/ActionBar;

    .line 93
    :cond_13
    :goto_13
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->ael:Lmiui/app/ActionBar;

    return-object v0

    .line 90
    :cond_16
    iput-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->ael:Lmiui/app/ActionBar;

    goto :goto_13
.end method

.method protected final getActionBarThemedContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 130
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    .line 134
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    .line 135
    if-eqz v1, :cond_c

    .line 136
    invoke-virtual {v1}, Lmiui/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    .line 138
    :cond_c
    return-object v0
.end method

.method public getActivity()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeo:Landroid/view/MenuInflater;

    if-nez v0, :cond_15

    .line 98
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    .line 99
    if-eqz v0, :cond_18

    .line 100
    new-instance v1, Landroid/view/MenuInflater;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeo:Landroid/view/MenuInflater;

    .line 105
    :cond_15
    :goto_15
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeo:Landroid/view/MenuInflater;

    return-object v0

    .line 102
    :cond_18
    new-instance v0, Landroid/view/MenuInflater;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeo:Landroid/view/MenuInflater;

    goto :goto_15
.end method

.method public abstract getThemedContext()Landroid/content/Context;
.end method

.method public getTranslucentStatus()I
    .registers 2

    .prologue
    .line 277
    iget v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeq:I

    return v0
.end method

.method protected final getUiOptionsFromMetadata()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 113
    :try_start_1
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 114
    iget-object v2, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    .line 117
    iget-object v2, v1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v2, :cond_20

    .line 118
    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string/jumbo v2, "android.support.UI_OPTIONS"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1f} :catch_21

    move-result-object v0

    .line 120
    :cond_20
    return-object v0

    .line 121
    :catch_21
    move-exception v1

    .line 122
    const-string/jumbo v1, "ActionBarDelegate"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getUiOptionsFromMetadata: Activity \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 123
    iget-object v3, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 124
    const-string/jumbo v3, "\' not in manifest"

    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    return-object v0
.end method

.method public isImmersionMenuEnabled()Z
    .registers 2

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aen:Z

    return v0
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .registers 2

    .prologue
    .line 213
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .registers 2

    .prologue
    .line 209
    return-void
.end method

.method public onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V
    .registers 4

    .prologue
    .line 249
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->closeOptionsMenu()V

    .line 250
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .prologue
    .line 148
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mSubDecorInstalled:Z

    if-eqz v0, :cond_11

    .line 150
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 151
    invoke-virtual {v0, p1}, Lcom/miui/internal/app/ActionBarImpl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 153
    :cond_11
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .prologue
    .line 109
    return-void
.end method

.method protected abstract onCreateImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
.end method

.method public onMenuModeChange(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 3

    .prologue
    .line 259
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->reopenMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V

    .line 260
    return-void
.end method

.method public onOpenSubMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 3

    .prologue
    .line 254
    const/4 v0, 0x0

    return v0
.end method

.method public onPostResume()V
    .registers 3

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mSubDecorInstalled:Z

    if-eqz v0, :cond_14

    .line 170
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 171
    if-eqz v0, :cond_14

    .line 172
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setShowHideAnimationEnabled(Z)V

    .line 175
    :cond_14
    return-void
.end method

.method protected abstract onPrepareImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
.end method

.method public onStop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 157
    invoke-virtual {p0, v1}, Lcom/miui/internal/app/ActionBarDelegateImpl;->dismissImmersionMenu(Z)V

    .line 159
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    if-eqz v0, :cond_17

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mSubDecorInstalled:Z

    if-eqz v0, :cond_17

    .line 160
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/app/ActionBarImpl;

    .line 161
    if-eqz v0, :cond_17

    .line 162
    invoke-virtual {v0, v1}, Lcom/miui/internal/app/ActionBarImpl;->setShowHideAnimationEnabled(Z)V

    .line 165
    :cond_17
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 204
    const/4 v0, 0x0

    return-object v0
.end method

.method protected reopenMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V
    .registers 4

    .prologue
    .line 216
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isOverflowReserved()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 217
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_18

    xor-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_26

    .line 218
    :cond_18
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_25

    .line 219
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->showOverflowMenu()Z

    .line 224
    :cond_25
    :goto_25
    return-void

    .line 222
    :cond_26
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->hideOverflowMenu()Z

    goto :goto_25

    .line 227
    :cond_2c
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuBuilder;->close()V

    .line 228
    return-void
.end method

.method public requestWindowFeature(I)Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 179
    packed-switch p1, :pswitch_data_18

    .line 193
    :pswitch_4
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    move-result v0

    return v0

    .line 181
    :pswitch_b
    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    .line 182
    return v0

    .line 184
    :pswitch_e
    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aei:Z

    .line 185
    return v0

    .line 187
    :pswitch_11
    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mFeatureProgress:Z

    .line 188
    return v0

    .line 190
    :pswitch_14
    iput-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mFeatureIndeterminateProgress:Z

    .line 191
    return v0

    .line 179
    nop

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_11
        :pswitch_4
        :pswitch_4
        :pswitch_14
        :pswitch_4
        :pswitch_4
        :pswitch_b
        :pswitch_e
    .end packed-switch
.end method

.method public setImmersionMenuEnabled(Z)V
    .registers 4

    .prologue
    .line 281
    iput-boolean p1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aen:Z

    .line 282
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mSubDecorInstalled:Z

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeh:Z

    if-eqz v0, :cond_1e

    .line 283
    if-eqz p1, :cond_1f

    .line 284
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->showImmersionMore()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 285
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    iget v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mImmersionLayoutResourceId:I

    invoke-virtual {v0, v1, p0}, Lcom/miui/internal/widget/ActionBarView;->initImmersionMore(ILcom/miui/internal/app/ActionBarDelegateImpl;)V

    .line 290
    :cond_1b
    :goto_1b
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->invalidateOptionsMenu()V

    .line 292
    :cond_1e
    return-void

    .line 288
    :cond_1f
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarView;->hideImmersionMore()Z

    goto :goto_1b
.end method

.method protected setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 3

    .prologue
    .line 231
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-ne p1, v0, :cond_5

    .line 232
    return-void

    .line 235
    :cond_5
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 236
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_10

    .line 237
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {v0, p1, p0}, Lcom/miui/internal/widget/ActionBarView;->setMenu(Landroid/view/Menu;Lcom/miui/internal/view/menu/MenuPresenter$Callback;)V

    .line 239
    :cond_10
    return-void
.end method

.method public setTranslucentStatus(I)V
    .registers 4

    .prologue
    .line 263
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/internal/R$integer;->window_translucent_status:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 264
    if-ltz v0, :cond_12

    .line 265
    const/4 v1, 0x2

    if-gt v0, v1, :cond_12

    move p1, v0

    .line 268
    :cond_12
    iget v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeq:I

    if-eq v0, p1, :cond_2c

    .line 269
    invoke-static {}, Lcom/miui/internal/variable/Android_View_Window_class$Factory;->getInstance()Lcom/miui/internal/variable/Android_View_Window_class$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/variable/Android_View_Window_class$Factory;->get()Lcom/miui/internal/variable/Android_View_Window_class;

    move-result-object v0

    .line 270
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/miui/internal/variable/Android_View_Window_class;->setTranslucentStatus(Landroid/view/Window;I)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 271
    iput p1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aeq:I

    .line 274
    :cond_2c
    return-void
.end method

.method public showImmersionMenu()V
    .registers 3

    .prologue
    .line 299
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    if-eqz v0, :cond_14

    .line 300
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    sget v1, Lcom/miui/internal/R$id;->more:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ActionBarView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 301
    if-eqz v0, :cond_14

    .line 302
    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->mActionBarView:Lcom/miui/internal/widget/ActionBarView;

    invoke-virtual {p0, v0, v1}, Lcom/miui/internal/app/ActionBarDelegateImpl;->showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 303
    return-void

    .line 307
    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 308
    const-string/jumbo v1, "Can\'t find anchor view in actionbar. Do you use default actionbar and immersion menu is enabled?"

    .line 307
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public showImmersionMenu(Landroid/view/View;Landroid/view/ViewGroup;)V
    .registers 5

    .prologue
    .line 312
    iget-boolean v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aen:Z

    if-nez v0, :cond_e

    .line 313
    const-string/jumbo v0, "ActionBarDelegate"

    const-string/jumbo v1, "Try to show immersion menu when immersion menu disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    return-void

    .line 317
    :cond_e
    if-nez p1, :cond_19

    .line 318
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You must specify a valid anchor view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_19
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    if-nez v0, :cond_28

    .line 322
    invoke-virtual {p0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->createMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 323
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->onCreateImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z

    .line 325
    :cond_28
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarDelegateImpl;->onPrepareImmersionMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z

    move-result v0

    if-eqz v0, :cond_56

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->hasVisibleItems()Z

    move-result v0

    if-eqz v0, :cond_56

    .line 326
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    if-nez v0, :cond_61

    .line 327
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->IS_TABLET:Z

    if-eqz v0, :cond_57

    .line 328
    new-instance v0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;-><init>(Lcom/miui/internal/app/ActionBarDelegateImpl;Landroid/view/Menu;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    .line 335
    :goto_49
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    invoke-interface {v0}, Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_56

    .line 336
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    invoke-interface {v0, p1, p2}, Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;->show(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 339
    :cond_56
    return-void

    .line 330
    :cond_57
    new-instance v0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;-><init>(Lcom/miui/internal/app/ActionBarDelegateImpl;Landroid/view/Menu;)V

    iput-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    goto :goto_49

    .line 333
    :cond_61
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aep:Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/app/ActionBarDelegateImpl;->aem:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v1}, Lcom/miui/internal/view/menu/ImmersionMenuPopupWindow;->update(Landroid/view/Menu;)V

    goto :goto_49
.end method

.method public startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .prologue
    .line 199
    const/4 v0, 0x0

    return-object v0
.end method
