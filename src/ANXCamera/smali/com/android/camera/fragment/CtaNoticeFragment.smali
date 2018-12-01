.class public Lcom/android/camera/fragment/CtaNoticeFragment;
.super Landroid/app/DialogFragment;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/CtaNoticeFragment$CTA;,
        Lcom/android/camera/fragment/CtaNoticeFragment$Licence;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method private static buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "userNoticeMessageFormat"    # I

    .prologue
    const/16 v10, 0x21

    .line 103
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 104
    .local v4, "res":Landroid/content/res/Resources;
    const v8, 0x7f0f01b7

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 105
    .local v6, "userAgreement":Ljava/lang/String;
    const v8, 0x7f0f01b8

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "privacyPolicy":Ljava/lang/String;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    .line 107
    const/4 v9, 0x0

    aput-object v6, v8, v9

    const/4 v9, 0x1

    aput-object v2, v8, v9

    .line 106
    invoke-virtual {v4, p1, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "message":Ljava/lang/String;
    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$3;-><init>(Landroid/content/Context;)V

    .line 116
    .local v0, "agreementUrlClickListener":Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;
    new-instance v3, Lcom/android/camera/fragment/CtaNoticeFragment$4;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$4;-><init>(Landroid/content/Context;)V

    .line 123
    .local v3, "privacyUrlClickListener":Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;
    new-instance v7, Landroid/text/SpannableStringBuilder;

    invoke-direct {v7, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 124
    .local v7, "userNotice":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 125
    .local v5, "start":I
    new-instance v8, Lcom/android/camera/ui/UrlSpan;

    invoke-direct {v8, v0}, Lcom/android/camera/ui/UrlSpan;-><init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V

    .line 127
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v5

    .line 125
    invoke-virtual {v7, v8, v5, v9, v10}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 129
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 130
    new-instance v8, Lcom/android/camera/ui/UrlSpan;

    invoke-direct {v8, v3}, Lcom/android/camera/ui/UrlSpan;-><init>(Lcom/android/camera/ui/UrlSpan$UrlSpanOnClickListener;)V

    .line 132
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v5

    .line 130
    invoke-virtual {v7, v8, v5, v9, v10}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 133
    return-object v7
.end method

.method public static checkCta(Landroid/app/FragmentManager;)Z
    .locals 2
    .param p0, "fragmentManager"    # Landroid/app/FragmentManager;

    .prologue
    .line 56
    invoke-static {}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->canConnectNetwork()Z

    move-result v1

    if-nez v1, :cond_0

    .line 57
    new-instance v0, Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;-><init>()V

    .line 58
    .local v0, "ctaNoticeDialog":Lcom/android/camera/fragment/CtaNoticeFragment;
    const-string/jumbo v1, "CtaNoticeFragment"

    invoke-virtual {v0, p0, v1}, Lcom/android/camera/fragment/CtaNoticeFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 59
    const/4 v1, 0x0

    return v1

    .line 61
    .end local v0    # "ctaNoticeDialog":Lcom/android/camera/fragment/CtaNoticeFragment;
    :cond_0
    const/4 v1, 0x1

    return v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->setCancelable(Z)V

    .line 68
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 73
    const v4, 0x7f0f01bb

    .line 72
    invoke-static {v3, v4}, Lcom/android/camera/fragment/CtaNoticeFragment;->buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    .line 75
    .local v2, "userNotice":Landroid/text/SpannableStringBuilder;
    new-instance v3, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 76
    const v4, 0x7f0f01bc

    .line 75
    invoke-virtual {v3, v4}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object v3

    .line 78
    new-instance v4, Lcom/android/camera/fragment/CtaNoticeFragment$1;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$1;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    const v5, 0x7f0f01b9

    .line 75
    invoke-virtual {v3, v5, v4}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v3

    .line 83
    new-instance v4, Lcom/android/camera/fragment/CtaNoticeFragment$2;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/CtaNoticeFragment$2;-><init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V

    const/high16 v5, 0x1040000

    .line 75
    invoke-virtual {v3, v5, v4}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v3

    .line 88
    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0f01ba

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    .line 75
    invoke-virtual {v3, v5, v4}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    .line 90
    .local v0, "builder":Lmiui/app/AlertDialog$Builder;
    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v1

    .line 91
    .local v1, "dialog":Lmiui/app/AlertDialog;
    return-object v1
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 97
    invoke-super {p0}, Landroid/app/DialogFragment;->onStart()V

    .line 98
    invoke-virtual {p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Lmiui/app/AlertDialog;

    invoke-virtual {v1}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    .line 99
    .local v0, "messageText":Landroid/widget/TextView;
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 100
    return-void
.end method
