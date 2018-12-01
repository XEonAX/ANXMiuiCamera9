.class public final Lcom/android/camera/module/loader/NullHolder;
.super Ljava/lang/Object;
.source "NullHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mException:I

.field private final mValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;I)V
    .locals 0
    .param p2, "exception"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/android/camera/module/loader/NullHolder;->mValue:Ljava/lang/Object;

    .line 30
    iput p2, p0, Lcom/android/camera/module/loader/NullHolder;->mException:I

    .line 31
    return-void
.end method

.method private static of(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;
    .locals 1
    .param p1, "exception"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;I)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/android/camera/module/loader/NullHolder;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/module/loader/NullHolder;-><init>(Ljava/lang/Object;I)V

    return-object v0
.end method

.method public static final ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 12
    .local p0, "value":Ljava/lang/Object;, "TT;"
    const/16 v0, 0xe0

    invoke-static {p0, v0}, Lcom/android/camera/module/loader/NullHolder;->of(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method

.method public static final ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;
    .locals 1
    .param p1, "exception"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;I)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 17
    .local p0, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p0, p1}, Lcom/android/camera/module/loader/NullHolder;->of(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 21
    .local p0, "this":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<TT;>;"
    iget-object v0, p0, Lcom/android/camera/module/loader/NullHolder;->mValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getException()I
    .locals 1

    .prologue
    .line 39
    .local p0, "this":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<TT;>;"
    iget v0, p0, Lcom/android/camera/module/loader/NullHolder;->mException:I

    return v0
.end method

.method public isPresent()Z
    .locals 1

    .prologue
    .line 34
    .local p0, "this":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<TT;>;"
    iget-object v0, p0, Lcom/android/camera/module/loader/NullHolder;->mValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
