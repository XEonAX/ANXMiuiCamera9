.class public Lmiui/external/Application;
.super Landroid/app/Application;
.source "SourceFile"


# instance fields
.field private b:Lmiui/external/ApplicationDelegate;

.field private c:Z

.field private d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 52
    invoke-direct {p0}, Lmiui/external/Application;->d()Z

    move-result v0

    if-nez v0, :cond_0

    .line 53
    return-void

    .line 55
    :cond_0
    invoke-direct {p0}, Lmiui/external/Application;->c()Z

    move-result v0

    if-nez v0, :cond_1

    .line 56
    return-void

    .line 58
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/external/Application;->c:Z

    .line 59
    return-void
.end method

.method private a(Ljava/lang/Throwable;)V
    .locals 2

    .prologue
    .line 120
    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_1

    .line 134
    :cond_0
    const-string/jumbo v0, "miuisdk"

    const-string/jumbo v1, "MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support."

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 135
    sget-object v0, Lmiui/external/SdkConstants$SdkError;->GENERIC:Lmiui/external/SdkConstants$SdkError;

    invoke-static {v0}, Lmiui/external/a;->A(Lmiui/external/SdkConstants$SdkError;)V

    .line 136
    return-void

    .line 124
    :cond_1
    instance-of v0, p1, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v0, :cond_2

    .line 125
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_0

    .line 127
    :cond_2
    instance-of v0, p1, Ljava/lang/ExceptionInInitializerError;

    if-eqz v0, :cond_0

    .line 128
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_0
.end method

.method private b(Ljava/lang/String;I)V
    .locals 3

    .prologue
    .line 139
    const-string/jumbo v0, "miuisdk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support. phase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 140
    const-string/jumbo v2, " code: "

    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    sget-object v0, Lmiui/external/SdkConstants$SdkError;->GENERIC:Lmiui/external/SdkConstants$SdkError;

    invoke-static {v0}, Lmiui/external/a;->A(Lmiui/external/SdkConstants$SdkError;)V

    .line 142
    return-void
.end method

.method private c()Z
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 81
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 83
    invoke-static {}, Lmiui/external/c;->C()Ljava/lang/Class;

    move-result-object v1

    .line 84
    const-string/jumbo v2, "initialize"

    .line 83
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    .line 84
    const-class v4, Landroid/app/Application;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/util/Map;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 83
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 85
    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    const/4 v0, 0x0

    .line 83
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    const-string/jumbo v1, "initialize"

    invoke-direct {p0, v1, v0}, Lmiui/external/Application;->b(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    return v6

    .line 90
    :catch_0
    move-exception v0

    .line 91
    invoke-direct {p0, v0}, Lmiui/external/Application;->a(Ljava/lang/Throwable;)V

    .line 92
    return v6

    .line 94
    :cond_0
    return v7
.end method

.method private d()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 63
    :try_start_0
    invoke-static {}, Lmiui/external/SdkHelper;->isMiuiSystem()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    const-string/jumbo v0, "com.miui.core"

    const-string/jumbo v1, "miui"

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Lmiui/external/SdkHelper;->D(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    const-string/jumbo v1, "com.miui.core"

    const/4 v2, 0x0

    invoke-static {v2, v1}, Lmiui/external/SdkHelper;->E(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 66
    const-class v2, Lmiui/external/Application;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lmiui/external/d;->N(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)Z

    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    sget-object v0, Lmiui/external/SdkConstants$SdkError;->NO_SDK:Lmiui/external/SdkConstants$SdkError;

    invoke-static {v0}, Lmiui/external/a;->A(Lmiui/external/SdkConstants$SdkError;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    return v4

    .line 72
    :catch_0
    move-exception v0

    .line 73
    invoke-direct {p0, v0}, Lmiui/external/Application;->a(Ljava/lang/Throwable;)V

    .line 74
    return v4

    .line 76
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private e()Z
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 99
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 101
    invoke-static {}, Lmiui/external/c;->C()Ljava/lang/Class;

    move-result-object v1

    .line 102
    const-string/jumbo v2, "start"

    .line 101
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    .line 102
    const-class v4, Ljava/util/Map;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 101
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    .line 103
    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x0

    .line 101
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 104
    if-ne v0, v7, :cond_0

    .line 105
    sget-object v0, Lmiui/external/SdkConstants$SdkError;->LOW_SDK_VERSION:Lmiui/external/SdkConstants$SdkError;

    invoke-static {v0}, Lmiui/external/a;->A(Lmiui/external/SdkConstants$SdkError;)V

    .line 106
    return v6

    .line 107
    :cond_0
    if-eqz v0, :cond_1

    .line 108
    const-string/jumbo v1, "start"

    invoke-direct {p0, v1, v0}, Lmiui/external/Application;->b(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    return v6

    .line 111
    :catch_0
    move-exception v0

    .line 112
    invoke-direct {p0, v0}, Lmiui/external/Application;->a(Ljava/lang/Throwable;)V

    .line 113
    return v6

    .line 115
    :cond_1
    return v7
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 161
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 162
    iget-boolean v0, p0, Lmiui/external/Application;->c:Z

    if-nez v0, :cond_0

    .line 163
    return-void

    .line 165
    :cond_0
    invoke-direct {p0}, Lmiui/external/Application;->e()Z

    move-result v0

    if-nez v0, :cond_1

    .line 166
    return-void

    .line 168
    :cond_1
    invoke-virtual {p0}, Lmiui/external/Application;->onCreateApplicationDelegate()Lmiui/external/ApplicationDelegate;

    move-result-object v0

    iput-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    .line 169
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_2

    .line 170
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0, p0}, Lmiui/external/ApplicationDelegate;->z(Lmiui/external/Application;)V

    .line 172
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/external/Application;->d:Z

    .line 173
    return-void
.end method

.method final f(Landroid/content/res/Configuration;)V
    .locals 0

    .prologue
    .line 240
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 241
    return-void
.end method

.method final g()V
    .locals 0

    .prologue
    .line 188
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 189
    return-void
.end method

.method final h()V
    .locals 0

    .prologue
    .line 214
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 215
    return-void
.end method

.method final i()V
    .locals 0

    .prologue
    .line 201
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 202
    return-void
.end method

.method final j(I)V
    .locals 0

    .prologue
    .line 227
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 228
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0, p1}, Lmiui/external/ApplicationDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 237
    :goto_0
    return-void

    .line 235
    :cond_0
    invoke-virtual {p0, p1}, Lmiui/external/Application;->f(Landroid/content/res/Configuration;)V

    goto :goto_0
.end method

.method public final onCreate()V
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lmiui/external/Application;->d:Z

    if-nez v0, :cond_0

    .line 178
    return-void

    .line 180
    :cond_0
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_1

    .line 181
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0}, Lmiui/external/ApplicationDelegate;->onCreate()V

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_1
    invoke-virtual {p0}, Lmiui/external/Application;->g()V

    goto :goto_0
.end method

.method public onCreateApplicationDelegate()Lmiui/external/ApplicationDelegate;
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x0

    return-object v0
.end method

.method public final onLowMemory()V
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0}, Lmiui/external/ApplicationDelegate;->onLowMemory()V

    .line 211
    :goto_0
    return-void

    .line 209
    :cond_0
    invoke-virtual {p0}, Lmiui/external/Application;->h()V

    goto :goto_0
.end method

.method public final onTerminate()V
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0}, Lmiui/external/ApplicationDelegate;->onTerminate()V

    .line 198
    :goto_0
    return-void

    .line 196
    :cond_0
    invoke-virtual {p0}, Lmiui/external/Application;->i()V

    goto :goto_0
.end method

.method public final onTrimMemory(I)V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lmiui/external/Application;->b:Lmiui/external/ApplicationDelegate;

    invoke-virtual {v0, p1}, Lmiui/external/ApplicationDelegate;->onTrimMemory(I)V

    .line 224
    :goto_0
    return-void

    .line 222
    :cond_0
    invoke-virtual {p0, p1}, Lmiui/external/Application;->j(I)V

    goto :goto_0
.end method
