.class public Lmiui/preference/VolumePreference;
.super Lmiui/preference/SeekBarDialogPreference;
.source "SourceFile"

# interfaces
.implements Landroid/preference/PreferenceManager$OnActivityStopListener;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/preference/VolumePreference$SavedState;,
        Lmiui/preference/VolumePreference$SeekBarVolumizer;,
        Lmiui/preference/VolumePreference$VolumeStore;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VolumePreference"

.field private static final ix:Lmiui/reflect/Method;

.field private static final iy:Lmiui/reflect/Method;

.field private static final iz:I


# instance fields
.field private iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

.field private iB:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 50
    const-class v0, Landroid/preference/PreferenceManager;

    const-string/jumbo v1, "registerOnActivityStopListener"

    const-string/jumbo v2, "(Landroid/preference/PreferenceManager$OnActivityStopListener;)V"

    invoke-static {v0, v1, v2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    .line 49
    sput-object v0, Lmiui/preference/VolumePreference;->ix:Lmiui/reflect/Method;

    .line 52
    const-class v0, Landroid/preference/PreferenceManager;

    const-string/jumbo v1, "unregisterOnActivityStopListener"

    const-string/jumbo v2, "(Landroid/preference/PreferenceManager$OnActivityStopListener;)V"

    invoke-static {v0, v1, v2}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    .line 51
    sput-object v0, Lmiui/preference/VolumePreference;->iy:Lmiui/reflect/Method;

    .line 54
    invoke-static {}, Lmiui/preference/VolumePreference;->eu()I

    move-result v0

    sput v0, Lmiui/preference/VolumePreference;->iz:I

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 72
    invoke-direct {p0, p1, p2}, Lmiui/preference/SeekBarDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    sget-object v0, Lcom/miui/internal/R$styleable;->VolumePreference:[I

    .line 74
    invoke-virtual {p1, p2, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 76
    sget v1, Lmiui/preference/VolumePreference;->iz:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lmiui/preference/VolumePreference;->iB:I

    .line 77
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 78
    return-void
.end method

.method private et()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 147
    sget-object v0, Lmiui/preference/VolumePreference;->iy:Lmiui/reflect/Method;

    .line 148
    const-class v1, Landroid/preference/PreferenceManager;

    invoke-virtual {p0}, Lmiui/preference/VolumePreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v2

    .line 147
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    .line 148
    const/4 v4, 0x0

    aput-object p0, v3, v4

    .line 147
    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 150
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_41

    .line 151
    invoke-virtual {p0}, Lmiui/preference/VolumePreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 152
    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 153
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 154
    sget v1, Lcom/miui/internal/R$id;->seekbar:I

    .line 153
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 155
    if-eqz v0, :cond_35

    invoke-virtual {v0, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 157
    :cond_35
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 159
    :cond_3a
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->stop()V

    .line 160
    iput-object v5, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    .line 163
    :cond_41
    return-void
.end method

.method private static eu()I
    .registers 3

    .prologue
    .line 60
    :try_start_0
    const-string/jumbo v0, "android.R.styleable"

    const-string/jumbo v1, "VolumePreference_streamType"

    const-string/jumbo v2, "I"

    invoke-static {v0, v1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object v0

    .line 61
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_13

    move-result v0

    return v0

    .line 62
    :catch_13
    move-exception v0

    .line 63
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 64
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public onActivityStop()V
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_9

    .line 139
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-static {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->eF(Lmiui/preference/VolumePreference$SeekBarVolumizer;)V

    .line 141
    :cond_9
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .registers 8

    .prologue
    const/4 v5, 0x1

    .line 86
    invoke-super {p0, p1}, Lmiui/preference/SeekBarDialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 88
    sget v0, Lcom/miui/internal/R$id;->seekbar:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 89
    new-instance v1, Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {p0}, Lmiui/preference/VolumePreference;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lmiui/preference/VolumePreference;->iB:I

    invoke-direct {v1, p0, v2, v0, v3}, Lmiui/preference/VolumePreference$SeekBarVolumizer;-><init>(Lmiui/preference/VolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;I)V

    iput-object v1, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    .line 91
    sget-object v0, Lmiui/preference/VolumePreference;->ix:Lmiui/reflect/Method;

    .line 92
    const-class v1, Landroid/preference/PreferenceManager;

    invoke-virtual {p0}, Lmiui/preference/VolumePreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v2

    .line 91
    new-array v3, v5, [Ljava/lang/Object;

    .line 92
    const/4 v4, 0x0

    aput-object p0, v3, v4

    .line 91
    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 96
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 97
    invoke-virtual {p1, v5}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 98
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 99
    return-void
.end method

.method protected onDialogClosed(Z)V
    .registers 3

    .prologue
    .line 128
    invoke-super {p0, p1}, Lmiui/preference/SeekBarDialogPreference;->onDialogClosed(Z)V

    .line 130
    if-nez p1, :cond_e

    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_e

    .line 131
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 134
    :cond_e
    invoke-direct {p0}, Lmiui/preference/VolumePreference;->et()V

    .line 135
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 7

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 103
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-nez v0, :cond_7

    return v1

    .line 104
    :cond_7
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_12

    move v0, v1

    .line 105
    :goto_e
    sparse-switch p2, :sswitch_data_2e

    .line 122
    return v2

    :cond_12
    move v0, v2

    .line 104
    goto :goto_e

    .line 107
    :sswitch_14
    if-eqz v0, :cond_1c

    .line 108
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->changeVolumeBy(I)V

    .line 110
    :cond_1c
    return v1

    .line 112
    :sswitch_1d
    if-eqz v0, :cond_24

    .line 113
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0, v1}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->changeVolumeBy(I)V

    .line 115
    :cond_24
    return v1

    .line 117
    :sswitch_25
    if-eqz v0, :cond_2c

    .line 118
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->muteVolume()V

    .line 120
    :cond_2c
    return v1

    .line 105
    nop

    :sswitch_data_2e
    .sparse-switch
        0x18 -> :sswitch_1d
        0x19 -> :sswitch_14
        0xa4 -> :sswitch_25
    .end sparse-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    .prologue
    .line 188
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmiui/preference/VolumePreference$SavedState;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_14

    .line 190
    :cond_10
    invoke-super {p0, p1}, Lmiui/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 191
    return-void

    .line 194
    :cond_14
    check-cast p1, Lmiui/preference/VolumePreference$SavedState;

    .line 195
    invoke-virtual {p1}, Lmiui/preference/VolumePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Lmiui/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 196
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_2a

    .line 197
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {p1}, Lmiui/preference/VolumePreference$SavedState;->ev()Lmiui/preference/VolumePreference$VolumeStore;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->onRestoreInstanceState(Lmiui/preference/VolumePreference$VolumeStore;)V

    .line 199
    :cond_2a
    return-void
.end method

.method protected onSampleStarting(Lmiui/preference/VolumePreference$SeekBarVolumizer;)V
    .registers 3

    .prologue
    .line 166
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eq p1, v0, :cond_d

    .line 167
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v0}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->stopSample()V

    .line 169
    :cond_d
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 173
    invoke-super {p0}, Lmiui/preference/SeekBarDialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 174
    invoke-virtual {p0}, Lmiui/preference/VolumePreference;->isPersistent()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 176
    return-object v0

    .line 179
    :cond_b
    new-instance v1, Lmiui/preference/VolumePreference$SavedState;

    invoke-direct {v1, v0}, Lmiui/preference/VolumePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 180
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    if-eqz v0, :cond_1d

    .line 181
    iget-object v0, p0, Lmiui/preference/VolumePreference;->iA:Lmiui/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {v1}, Lmiui/preference/VolumePreference$SavedState;->ev()Lmiui/preference/VolumePreference$VolumeStore;

    move-result-object v2

    invoke-virtual {v0, v2}, Lmiui/preference/VolumePreference$SeekBarVolumizer;->onSaveInstanceState(Lmiui/preference/VolumePreference$VolumeStore;)V

    .line 183
    :cond_1d
    return-object v1
.end method

.method public setStreamType(I)V
    .registers 2

    .prologue
    .line 81
    iput p1, p0, Lmiui/preference/VolumePreference;->iB:I

    .line 82
    return-void
.end method
