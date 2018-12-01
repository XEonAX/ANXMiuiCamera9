.class public abstract Lcom/android/camera/network/download/Verifier;
.super Ljava/lang/Object;
.source "Verifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/download/Verifier$Sha1;
    }
.end annotation


# instance fields
.field private mAlgorithm:Ljava/lang/String;

.field private mHash:[B


# direct methods
.method static synthetic -wrap0(Ljava/lang/String;I)[B
    .locals 1
    .param p0, "hex"    # Ljava/lang/String;
    .param p1, "hexCount"    # I

    .prologue
    invoke-static {p0, p1}, Lcom/android/camera/network/download/Verifier;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "hash"    # [B

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/android/camera/network/download/Verifier;->mAlgorithm:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/android/camera/network/download/Verifier;->mHash:[B

    .line 22
    return-void
.end method

.method private static decode(Ljava/lang/String;I)[B
    .locals 7
    .param p0, "hex"    # Ljava/lang/String;
    .param p1, "hexCount"    # I

    .prologue
    const/4 v4, 0x0

    .line 62
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, p1, :cond_0

    .line 63
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 66
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    new-array v2, v3, [B

    .line 67
    .local v2, "raw":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 68
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v5, 0x10

    invoke-static {v3, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 69
    .local v0, "digit":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_1

    .line 70
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " is not a hex string"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 72
    :cond_1
    div-int/lit8 v5, v1, 0x2

    aget-byte v6, v2, v5

    rem-int/lit8 v3, v1, 0x2

    if-nez v3, :cond_2

    const/4 v3, 0x4

    :goto_1
    shl-int v3, v0, v3

    or-int/2addr v3, v6

    int-to-byte v3, v3

    aput-byte v3, v2, v5

    .line 67
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    move v3, v4

    .line 72
    goto :goto_1

    .line 74
    .end local v0    # "digit":I
    :cond_3
    return-object v2
.end method


# virtual methods
.method public getInstance()Ljava/security/MessageDigest;
    .locals 2

    .prologue
    .line 30
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/network/download/Verifier;->mAlgorithm:Ljava/lang/String;

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const-string/jumbo v1, "Verifier"

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    const/4 v1, 0x0

    return-object v1
.end method

.method public final verify([B)Z
    .locals 1
    .param p1, "hash"    # [B

    .prologue
    .line 25
    iget-object v0, p0, Lcom/android/camera/network/download/Verifier;->mHash:[B

    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    return v0
.end method
