.class public Lcom/android/camera/network/resource/Resource;
.super Ljava/lang/Object;
.source "Resource.java"


# instance fields
.field public category:I

.field public content:Ljava/lang/String;

.field public extra:Ljava/lang/String;

.field public icon:Ljava/lang/String;

.field public id:J

.field public label:Ljava/lang/String;

.field public parent:J

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    const/4 v1, 0x1

    return v1

    .line 20
    :cond_0
    instance-of v2, p1, Lcom/android/camera/network/resource/Resource;

    if-nez v2, :cond_1

    .line 21
    return v1

    :cond_1
    move-object v0, p1

    .line 23
    check-cast v0, Lcom/android/camera/network/resource/Resource;

    .line 24
    .local v0, "that":Lcom/android/camera/network/resource/Resource;
    iget-wide v2, p0, Lcom/android/camera/network/resource/Resource;->id:J

    iget-wide v4, v0, Lcom/android/camera/network/resource/Resource;->id:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 25
    iget-wide v2, p0, Lcom/android/camera/network/resource/Resource;->parent:J

    iget-wide v4, v0, Lcom/android/camera/network/resource/Resource;->parent:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 26
    iget v2, p0, Lcom/android/camera/network/resource/Resource;->category:I

    iget v3, v0, Lcom/android/camera/network/resource/Resource;->category:I

    if-ne v2, v3, :cond_2

    .line 27
    iget-object v2, p0, Lcom/android/camera/network/resource/Resource;->type:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera/network/resource/Resource;->type:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 28
    iget-object v2, p0, Lcom/android/camera/network/resource/Resource;->label:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera/network/resource/Resource;->label:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 29
    iget-object v2, p0, Lcom/android/camera/network/resource/Resource;->icon:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera/network/resource/Resource;->icon:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 30
    iget-object v2, p0, Lcom/android/camera/network/resource/Resource;->extra:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera/network/resource/Resource;->extra:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 31
    iget-object v1, p0, Lcom/android/camera/network/resource/Resource;->content:Ljava/lang/String;

    iget-object v2, v0, Lcom/android/camera/network/resource/Resource;->content:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    .line 24
    :cond_2
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0x27

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Resource{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 38
    iget-wide v2, p0, Lcom/android/camera/network/resource/Resource;->id:J

    .line 37
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 39
    const-string/jumbo v1, ", parent="

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 39
    iget-wide v2, p0, Lcom/android/camera/network/resource/Resource;->parent:J

    .line 37
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 40
    const-string/jumbo v1, ", category="

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 40
    iget v1, p0, Lcom/android/camera/network/resource/Resource;->category:I

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 41
    const-string/jumbo v1, ", type=\'"

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/android/camera/network/resource/Resource;->type:Ljava/lang/String;

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 42
    const-string/jumbo v1, ", label=\'"

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/android/camera/network/resource/Resource;->label:Ljava/lang/String;

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 43
    const/16 v1, 0x7d

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
