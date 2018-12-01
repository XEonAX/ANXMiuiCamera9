.class public Lcom/google/lens/sdk/LensApi;
.super Ljava/lang/Object;
.source "LensApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;,
        Lcom/google/lens/sdk/LensApi$LensAvailabilityStatus;,
        Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;
    }
.end annotation


# static fields
.field static final LENS_BITMAP_URI_KEY:Ljava/lang/String; = "LensBitmapUriKey"
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final LENS_DEEPLINKING_STRING:Ljava/lang/String; = "googleapp://lens"
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final LENS_DEEPLINKING_URI:Landroid/net/Uri;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private final context:Landroid/content/Context;

.field private final paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

.field private final serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-string/jumbo v0, "googleapp://lens"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/lens/sdk/LensApi;->LENS_DEEPLINKING_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p1, p0, Lcom/google/lens/sdk/LensApi;->context:Landroid/content/Context;

    .line 118
    new-instance v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-direct {v0, p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    .line 119
    new-instance v0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-direct {v0, p1}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    .line 120
    return-void
.end method

.method static synthetic access$000(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 26
    invoke-static {p0}, Lcom/google/lens/sdk/LensApi;->mapInternalLensAvailabilityToExternal(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/google/lens/sdk/LensApi;Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/lens/sdk/LensApi;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/google/lens/sdk/LensApi;->startLensActivity(Landroid/app/Activity;)V

    return-void
.end method

.method private static mapInternalLensAvailabilityToExternal(I)I
    .locals 2
    .param p0, "internalLensAvailabilityStatus"    # I
    .annotation build Lcom/google/lens/sdk/LensApi$LensAvailabilityStatus;
    .end annotation

    .prologue
    .line 284
    packed-switch p0, :pswitch_data_0

    .line 293
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v1, "Internal error code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "LensApi"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const/4 v0, 0x1

    return v0

    .line 291
    :pswitch_1
    return p0

    .line 284
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private startLensActivity(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x0

    .line 205
    iget-object v1, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v1}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->prewarmLensActivity()Z

    move-result v1

    if-nez v1, :cond_0

    .line 208
    :goto_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 209
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 210
    const-string/jumbo v1, "googleapp://lens"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 211
    invoke-virtual {p1, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 213
    return-void

    .line 206
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    const-string/jumbo v1, "LensApi"

    const-string/jumbo v2, "Lens is pre-warmed."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public checkLensAvailability(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V
    .locals 3
    .param p1, "callback"    # Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;

    .prologue
    .line 249
    iget-object v1, p0, Lcom/google/lens/sdk/LensApi;->context:Landroid/content/Context;

    const-string/jumbo v2, "keyguard"

    .line 250
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 251
    .local v0, "keyguardManager":Landroid/app/KeyguardManager;
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v1

    if-nez v1, :cond_1

    .line 257
    :cond_0
    iget-object v1, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    new-instance v2, Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;

    invoke-direct {v2, p1}, Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;-><init>(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V

    invoke-virtual {v1, v2}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->getParams(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;)V

    .line 258
    return-void

    .line 252
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    .line 253
    const/4 v1, 0x5

    invoke-interface {p1, v1}, Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;->onAvailabilityStatusFetched(I)V

    .line 254
    return-void
.end method

.method public launchLensActivity(Landroid/app/Activity;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 143
    const-string/jumbo v3, "keyguard"

    .line 144
    invoke-virtual {p1, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/KeyguardManager;

    .line 145
    .local v2, "keyguardManager":Landroid/app/KeyguardManager;
    invoke-virtual {v2}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v3

    if-nez v3, :cond_0

    .line 172
    invoke-direct {p0, p1}, Lcom/google/lens/sdk/LensApi;->startLensActivity(Landroid/app/Activity;)V

    .line 173
    return-void

    .line 146
    :cond_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-ge v3, v4, :cond_1

    .line 168
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .local v0, "-l_3_I":I
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x40

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Cannot start Lens when device is locked with Android "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "LensApi"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    return-void

    .line 147
    .end local v0    # "-l_3_I":I
    :cond_1
    new-instance v1, Lcom/google/lens/sdk/LensApi$1;

    invoke-direct {v1, p0, p1}, Lcom/google/lens/sdk/LensApi$1;-><init>(Lcom/google/lens/sdk/LensApi;Landroid/app/Activity;)V

    .line 165
    .local v1, "keyguardDismissCallback":Landroid/app/KeyguardManager$KeyguardDismissCallback;
    invoke-virtual {v2, p1, v1}, Landroid/app/KeyguardManager;->requestDismissKeyguard(Landroid/app/Activity;Landroid/app/KeyguardManager$KeyguardDismissCallback;)V

    .line 166
    return-void
.end method

.method public launchLensActivity(Landroid/app/Activity;I)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "feature"    # I
        .annotation build Lcom/google/lens/sdk/LensApi$LensFeature;
        .end annotation
    .end param

    .prologue
    .line 184
    packed-switch p2, :pswitch_data_0

    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x22

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Invalid lens activity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "LensApi"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :cond_0
    :goto_0
    return-void

    .line 186
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/google/lens/sdk/LensApi;->launchLensActivity(Landroid/app/Activity;)V

    goto :goto_0

    .line 189
    :pswitch_1
    iget-object v1, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-virtual {v1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->getArStickersAvailability()I

    move-result v1

    if-nez v1, :cond_0

    .line 190
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 191
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.google.ar.lens"

    const-string/jumbo v2, "com.google.vr.apps.ornament.app.MainActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 194
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 184
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->unbindService()V

    .line 130
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->bindService()Z

    .line 125
    return-void
.end method
