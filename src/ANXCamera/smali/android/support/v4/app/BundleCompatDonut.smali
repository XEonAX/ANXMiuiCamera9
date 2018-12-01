.class Landroid/support/v4/app/BundleCompatDonut;
.super Ljava/lang/Object;
.source "BundleCompatDonut.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BundleCompatDonut"

.field private static sGetIBinderMethod:Ljava/lang/reflect/Method;

.field private static sGetIBinderMethodFetched:Z

.field private static sPutIBinderMethod:Ljava/lang/reflect/Method;

.field private static sPutIBinderMethodFetched:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;
    .registers 11
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 39
    sget-boolean v4, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethodFetched:Z

    if-eqz v4, :cond_b

    .line 49
    :goto_6
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    if-nez v4, :cond_32

    .line 63
    :goto_a
    return-object v7

    .line 41
    :cond_b
    const/4 v4, 0x1

    :try_start_c
    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Landroid/os/Bundle;

    const-string/jumbo v6, "getIBinder"

    invoke-virtual {v5, v6, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    .line 42
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_24
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_24} :catch_27

    .line 46
    :goto_24
    sput-boolean v8, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethodFetched:Z

    goto :goto_6

    .line 43
    :catch_27
    move-exception v2

    .line 44
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to retrieve getIBinder method"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_24

    .line 51
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :cond_32
    :try_start_32
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v4, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/IBinder;
    :try_end_40
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_32 .. :try_end_40} :catch_41
    .catch Ljava/lang/IllegalAccessException; {:try_start_32 .. :try_end_40} :catch_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_40} :catch_5b

    return-object v4

    .line 52
    :catch_41
    move-exception v3

    .line 53
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke getIBinder via reflection"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    sput-object v7, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a

    .line 55
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_4e
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke getIBinder via reflection"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 57
    sput-object v7, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a

    .line 58
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_5b
    move-exception v1

    .line 59
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke getIBinder via reflection"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    sput-object v7, Landroid/support/v4/app/BundleCompatDonut;->sGetIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a
.end method

.method public static putBinder(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/IBinder;)V
    .registers 12
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "binder"    # Landroid/os/IBinder;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 67
    sget-boolean v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethodFetched:Z

    if-eqz v4, :cond_b

    .line 78
    :goto_6
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    if-nez v4, :cond_37

    .line 92
    :goto_a
    return-void

    .line 69
    :cond_b
    const/4 v4, 0x2

    :try_start_c
    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Landroid/os/IBinder;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-class v5, Landroid/os/Bundle;

    const-string/jumbo v6, "putIBinder"

    invoke-virtual {v5, v6, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    .line 71
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_29
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_29} :catch_2c

    .line 75
    :goto_29
    sput-boolean v7, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethodFetched:Z

    goto :goto_6

    .line 72
    :catch_2c
    move-exception v2

    .line 73
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to retrieve putIBinder method"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_29

    .line 80
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :cond_37
    :try_start_37
    sget-object v4, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-virtual {v4, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_37 .. :try_end_45} :catch_46
    .catch Ljava/lang/IllegalAccessException; {:try_start_37 .. :try_end_45} :catch_53
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_45} :catch_60

    goto :goto_a

    .line 81
    :catch_46
    move-exception v3

    .line 82
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke putIBinder via reflection"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    sput-object v8, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a

    .line 84
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_53
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke putIBinder via reflection"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    sput-object v8, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a

    .line 87
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_60
    move-exception v1

    .line 88
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string/jumbo v4, "BundleCompatDonut"

    const-string/jumbo v5, "Failed to invoke putIBinder via reflection"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    sput-object v8, Landroid/support/v4/app/BundleCompatDonut;->sPutIBinderMethod:Ljava/lang/reflect/Method;

    goto :goto_a
.end method
