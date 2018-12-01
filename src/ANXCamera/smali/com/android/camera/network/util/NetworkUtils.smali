.class public Lcom/android/camera/network/util/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# static fields
.field private static DBG:Z

.field private static sApp:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/network/util/NetworkUtils;->DBG:Z

    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static isActiveNetworkMetered()Z
    .locals 3

    .prologue
    .line 40
    sget-object v1, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string/jumbo v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 41
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    if-nez v0, :cond_0

    .line 42
    const/4 v1, 0x0

    return v1

    .line 44
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v1

    return v1
.end method

.method public static isNetworkConnected()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 22
    sget-object v2, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string/jumbo v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 24
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    if-nez v0, :cond_0

    .line 25
    return v4

    .line 30
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 31
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 32
    :cond_1
    return v4

    .line 35
    :cond_2
    const/4 v2, 0x1

    return v2
.end method
