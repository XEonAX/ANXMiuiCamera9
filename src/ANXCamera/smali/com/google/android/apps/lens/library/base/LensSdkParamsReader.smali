.class public Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;
.super Ljava/lang/Object;
.source "LensSdkParamsReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;,
        Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

.field public static final LENS_AVAILABILITY_PROVIDER_URI:Ljava/lang/String;


# instance fields
.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

.field private lensSdkParamsReady:Z

.field private final packageManager:Landroid/content/pm/PackageManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 33
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "com.google.android.googlequicksearchbox.GsaPublicContentProvider"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "content://%s/publicvalue/lens_oem_availability"

    .line 34
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->LENS_AVAILABILITY_PROVIDER_URI:Ljava/lang/String;

    .line 64
    new-instance v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-direct {v0}, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;-><init>()V

    sput-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    .line 65
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const-string/jumbo v1, "0.1.0"

    iput-object v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensSdkVersion:Ljava/lang/String;

    .line 66
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const-string/jumbo v1, ""

    iput-object v1, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->agsaVersionName:Ljava/lang/String;

    .line 67
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iput v3, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->lensAvailabilityStatus:I

    .line 68
    sget-object v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iput v3, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;-><init>(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    .line 73
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/content/pm/PackageManager;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "packageManager"    # Landroid/content/pm/PackageManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    .line 77
    iput-object p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->context:Landroid/content/Context;

    .line 78
    iput-object p2, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    .line 79
    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->updateParams()V

    .line 80
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    return-object v0
.end method

.method static synthetic access$302(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;
    .param p1, "x1"    # Z

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    return-object v0
.end method

.method private updateParams()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 118
    iput-boolean v7, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    .line 119
    sget-object v4, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->DEFAULT_PARAMS:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v4}, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->clone()Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    .line 121
    :try_start_0
    iget-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    const-string/jumbo v5, "com.google.android.googlequicksearchbox"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 122
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    if-nez v1, :cond_1

    .line 129
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    iget-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    const/4 v5, 0x1

    iput v5, v4, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    .line 132
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-ge v4, v5, :cond_2

    .line 142
    :cond_0
    :goto_1
    new-instance v2, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;

    invoke-direct {v2, p0, v8}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;-><init>(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$1;)V

    .line 143
    .local v2, "queryGsaTask":Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;
    new-array v4, v7, [Ljava/lang/Void;

    invoke-virtual {v2, v4}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 144
    return-void

    .line 123
    .end local v2    # "queryGsaTask":Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$QueryGsaTask;
    .restart local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v5, v4, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->agsaVersionName:Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 125
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string/jumbo v4, "LensSdkParamsReader"

    const-string/jumbo v5, "Unable to find agsa package: com.google.android.googlequicksearchbox"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 133
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_2
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 134
    .local v3, "stickersIntent":Landroid/content/Intent;
    const-string/jumbo v4, "com.google.ar.lens"

    const-string/jumbo v5, "com.google.vr.apps.ornament.app.MainActivity"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    iget-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->packageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v4, v3, v7}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 138
    iget-object v4, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iput v7, v4, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    goto :goto_1
.end method


# virtual methods
.method public getArStickersAvailability()I
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    iget v0, v0, Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;->arStickersAvailabilityStatus:I

    return v0
.end method

.method public getParams(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParamsReady:Z

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->lensSdkParams:Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;

    invoke-interface {p1, v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;->onLensSdkParamsAvailable(Lcom/google/android/apps/lens/library/base/proto/nano/LensSdkParamsProto$LensSdkParams;)V

    .line 106
    return-void
.end method
