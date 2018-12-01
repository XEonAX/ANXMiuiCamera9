.class public Lcom/android/camera/RotateDialogController;
.super Ljava/lang/Object;
.source "RotateDialogController.java"


# direct methods
.method public static showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "button1Text"    # Ljava/lang/String;
    .param p4, "r1"    # Ljava/lang/Runnable;
    .param p5, "button2Text"    # Ljava/lang/String;
    .param p6, "r2"    # Ljava/lang/Runnable;

    .prologue
    .line 164
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 166
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 167
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 168
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 170
    if-eqz p3, :cond_0

    .line 171
    new-instance v2, Lcom/android/camera/RotateDialogController$3;

    invoke-direct {v2, p4}, Lcom/android/camera/RotateDialogController$3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, p3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 180
    :cond_0
    if-eqz p5, :cond_1

    .line 181
    new-instance v2, Lcom/android/camera/RotateDialogController$4;

    invoke-direct {v2, p6}, Lcom/android/camera/RotateDialogController$4;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, p5, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 191
    :cond_1
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 192
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 193
    return-object v0
.end method

.method public static showSystemChoiceDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/app/AlertDialog;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "choiceContent"    # Ljava/lang/String;
    .param p4, "buttonText"    # Ljava/lang/String;
    .param p5, "checkrun"    # Ljava/lang/Runnable;
    .param p6, "uncheckrun"    # Ljava/lang/Runnable;

    .prologue
    const/4 v8, 0x0

    .line 199
    new-instance v4, Lcom/android/camera/RotateDialogController$5;

    invoke-direct {v4}, Lcom/android/camera/RotateDialogController$5;-><init>()V

    .line 206
    .local v4, "listener":Landroid/content/DialogInterface$OnKeyListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 208
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    .line 209
    const v7, 0x7f040028

    .line 208
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 210
    .local v5, "message":Landroid/view/View;
    const v6, 0x7f0a0084

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 211
    .local v3, "declaration":Landroid/widget/TextView;
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    const v6, 0x7f0a0085

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 213
    .local v2, "choice":Landroid/widget/CheckBox;
    invoke-virtual {v2, p3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 215
    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 216
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 217
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 218
    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 219
    if-eqz p4, :cond_0

    .line 220
    new-instance v6, Lcom/android/camera/RotateDialogController$6;

    invoke-direct {v6, v2, p5, p6}, Lcom/android/camera/RotateDialogController$6;-><init>(Landroid/widget/CheckBox;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p4, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 236
    :cond_0
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 237
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 238
    return-object v0
.end method
