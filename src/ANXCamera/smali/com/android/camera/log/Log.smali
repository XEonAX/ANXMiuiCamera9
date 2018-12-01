.class public Lcom/android/camera/log/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field private static final MAX_TAG_LEN:I

.field private static sDebugPriority:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v2, 0x2

    .line 58
    const-string/jumbo v3, "CAM_"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    rsub-int/lit8 v3, v3, 0x17

    sput v3, Lcom/android/camera/log/Log;->MAX_TAG_LEN:I

    .line 71
    sput v2, Lcom/android/camera/log/Log;->sDebugPriority:I

    .line 75
    :try_start_0
    invoke-static {}, Lcom/android/camera/log/Log;->getOverrideLevel()I

    move-result v1

    .line 76
    .local v1, "overrideLevel":I
    if-eqz v1, :cond_0

    .line 80
    sput v1, Lcom/android/camera/log/Log;->sDebugPriority:I

    .line 28
    :goto_0
    return-void

    .line 82
    :cond_0
    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    sput v2, Lcom/android/camera/log/Log;->sDebugPriority:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 82
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_1
    const v2, 0x7fffffff

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CONTINUAL_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "formattedTag":Ljava/lang/String;
    const-string/jumbo v1, "CAM_CONTINUAL_"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->shouldLogForDebug(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 114
    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 116
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 140
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 144
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    invoke-static {v0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    return v1

    .line 148
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 192
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 196
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 200
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 202
    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    return v1

    .line 204
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static getOverrideLevel()I
    .locals 2

    .prologue
    .line 210
    const/4 v0, 0x2

    .line 211
    .local v0, "defaultLevel":I
    const-string/jumbo v1, "camera.debug.log_level"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 152
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 156
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 160
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 162
    invoke-static {v0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    return v1

    .line 164
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method private static isLoggable(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "level"    # I

    .prologue
    .line 215
    sget v0, Lcom/android/camera/log/Log;->sDebugPriority:I

    if-le v0, p1, :cond_0

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->shouldLog(Ljava/lang/String;I)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static shouldLog(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "level"    # I

    .prologue
    .line 223
    const-string/jumbo v0, "CAM_"

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    .line 223
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static shouldLogForDebug(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "level"    # I

    .prologue
    .line 219
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private static tagFormat(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sget v2, Lcom/android/camera/log/Log;->MAX_TAG_LEN:I

    sub-int v0, v1, v2

    .line 96
    .local v0, "lenDiff":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CAM_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-lez v0, :cond_0

    sget v2, Lcom/android/camera/log/Log;->MAX_TAG_LEN:I

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "tag":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 124
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 172
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 176
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 178
    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    return v1

    .line 180
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static w(Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 184
    invoke-static {p0}, Lcom/android/camera/log/Log;->tagFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "formattedTag":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    return v1

    .line 188
    :cond_0
    const/4 v1, -0x1

    return v1
.end method
