.class public Lcom/google/protobuf/nano/Extension;
.super Ljava/lang/Object;
.source "Extension.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Lcom/google/protobuf/nano/ExtendableMessageNano",
        "<TM;>;T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/GeneratedMessageLite",
            "<**>;"
        }
    .end annotation
.end field

.field protected final repeated:Z

.field public final tag:I

.field protected final type:I


# direct methods
.method private constructor <init>(ILjava/lang/Class;IZ)V
    .locals 6
    .param p1, "type"    # I
    .param p3, "tag"    # I
    .param p4, "repeated"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class",
            "<TT;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/nano/Extension;-><init>(ILjava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;IZ)V

    .line 193
    return-void
.end method

.method private constructor <init>(ILjava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;IZ)V
    .locals 0
    .param p1, "type"    # I
    .param p4, "tag"    # I
    .param p5, "repeated"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/google/protobuf/GeneratedMessageLite",
            "<**>;IZ)V"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "defaultInstance":Lcom/google/protobuf/GeneratedMessageLite;, "Lcom/google/protobuf/GeneratedMessageLite<**>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput p1, p0, Lcom/google/protobuf/nano/Extension;->type:I

    .line 198
    iput-object p2, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    .line 199
    iput p4, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    .line 200
    iput-boolean p5, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    .line 201
    iput-object p3, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 202
    return-void
.end method

.method public static createMessageTyped(ILjava/lang/Class;J)Lcom/google/protobuf/nano/Extension;
    .locals 4
    .param p0, "type"    # I
    .param p2, "tag"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<M:",
            "Lcom/google/protobuf/nano/ExtendableMessageNano",
            "<TM;>;T:",
            "Lcom/google/protobuf/nano/MessageNano;",
            ">(I",
            "Ljava/lang/Class",
            "<TT;>;J)",
            "Lcom/google/protobuf/nano/Extension",
            "<TM;TT;>;"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/google/protobuf/nano/Extension;

    long-to-int v1, p2

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/google/protobuf/nano/Extension;-><init>(ILjava/lang/Class;IZ)V

    return-object v0
.end method

.method private getRepeatedValueFrom(Ljava/util/List;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/nano/UnknownFieldData;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p1, "unknownFields":Ljava/util/List;, "Ljava/util/List<Lcom/google/protobuf/nano/UnknownFieldData;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 247
    .local v3, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lt v1, v5, :cond_0

    .line 254
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .line 255
    .local v4, "resultSize":I
    if-eqz v4, :cond_2

    .line 258
    iget-object v5, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    iget-object v6, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 259
    .local v2, "result":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    :goto_1
    if-lt v1, v4, :cond_3

    .line 262
    return-object v2

    .line 248
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    .end local v4    # "resultSize":I
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/nano/UnknownFieldData;

    .line 249
    .local v0, "data":Lcom/google/protobuf/nano/UnknownFieldData;
    iget-object v5, v0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    array-length v5, v5

    if-nez v5, :cond_1

    .line 247
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 250
    :cond_1
    invoke-virtual {p0, v0, v3}, Lcom/google/protobuf/nano/Extension;->readDataInto(Lcom/google/protobuf/nano/UnknownFieldData;Ljava/util/List;)V

    goto :goto_2

    .line 256
    .end local v0    # "data":Lcom/google/protobuf/nano/UnknownFieldData;
    .restart local v4    # "resultSize":I
    :cond_2
    const/4 v5, 0x0

    return-object v5

    .line 260
    .restart local v2    # "result":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v2, v1, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 259
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private getSingularValueFrom(Ljava/util/List;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/nano/UnknownFieldData;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p1, "unknownFields":Ljava/util/List;, "Ljava/util/List<Lcom/google/protobuf/nano/UnknownFieldData;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/nano/UnknownFieldData;

    .line 272
    .local v0, "lastData":Lcom/google/protobuf/nano/UnknownFieldData;
    iget-object v1, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    iget-object v2, v0, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-static {v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->newInstance([B)Lcom/google/protobuf/nano/CodedInputByteBufferNano;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/protobuf/nano/Extension;->readData(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 269
    .end local v0    # "lastData":Lcom/google/protobuf/nano/UnknownFieldData;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method protected computeRepeatedSerializedSize(Ljava/lang/Object;)I
    .locals 5
    .param p1, "array"    # Ljava/lang/Object;

    .prologue
    .line 403
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    const/4 v3, 0x0

    .line 404
    .local v3, "size":I
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 405
    .local v0, "arrayLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 411
    return v3

    .line 406
    :cond_0
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 407
    .local v1, "element":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 405
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 408
    :cond_1
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/google/protobuf/nano/Extension;->computeSingularSerializedSize(Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_1
.end method

.method computeSerializedSize(Ljava/lang/Object;)I
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 386
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    iget-boolean v0, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-nez v0, :cond_0

    .line 389
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/Extension;->computeSingularSerializedSize(Ljava/lang/Object;)I

    move-result v0

    return v0

    .line 387
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/Extension;->computeRepeatedSerializedSize(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected computeSingularSerializedSize(Ljava/lang/Object;)I
    .locals 8
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 416
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    iget v5, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v5}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v1

    .line 417
    .local v1, "fieldNumber":I
    iget v5, p0, Lcom/google/protobuf/nano/Extension;->type:I

    packed-switch v5, :pswitch_data_0

    .line 435
    new-instance v5, Ljava/lang/IllegalArgumentException;

    iget v0, p0, Lcom/google/protobuf/nano/Extension;->type:I

    .local v0, "-l_3_I":I
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x18

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v7, "Unknown type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 419
    .end local v0    # "-l_3_I":I
    :pswitch_0
    iget-object v5, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    if-eqz v5, :cond_0

    move-object v3, p1

    .line 423
    check-cast v3, Lcom/google/protobuf/MessageLite;

    .line 424
    .local v3, "messageValue":Lcom/google/protobuf/MessageLite;
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->computeGroupSize(ILcom/google/protobuf/MessageLite;)I

    move-result v5

    return v5

    .end local v3    # "messageValue":Lcom/google/protobuf/MessageLite;
    :cond_0
    move-object v2, p1

    .line 420
    check-cast v2, Lcom/google/protobuf/nano/MessageNano;

    .line 421
    .local v2, "groupValue":Lcom/google/protobuf/nano/MessageNano;
    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeGroupSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v5

    return v5

    .line 427
    .end local v2    # "groupValue":Lcom/google/protobuf/nano/MessageNano;
    :pswitch_1
    iget-object v5, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    if-eqz v5, :cond_1

    move-object v3, p1

    .line 431
    check-cast v3, Lcom/google/protobuf/MessageLite;

    .line 432
    .restart local v3    # "messageValue":Lcom/google/protobuf/MessageLite;
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v5

    return v5

    .end local v3    # "messageValue":Lcom/google/protobuf/MessageLite;
    :cond_1
    move-object v4, p1

    .line 428
    check-cast v4, Lcom/google/protobuf/nano/MessageNano;

    .line 429
    .local v4, "messageValue":Lcom/google/protobuf/nano/MessageNano;
    invoke-static {v1, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v5

    return v5

    .line 417
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 206
    if-eq p0, p1, :cond_2

    .line 209
    instance-of v3, p1, Lcom/google/protobuf/nano/Extension;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 213
    check-cast v0, Lcom/google/protobuf/nano/Extension;

    .line 214
    .local v0, "that":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<**>;"
    iget v3, p0, Lcom/google/protobuf/nano/Extension;->type:I

    iget v4, v0, Lcom/google/protobuf/nano/Extension;->type:I

    if-eq v3, v4, :cond_4

    :cond_0
    :goto_0
    move v1, v2

    :cond_1
    return v1

    .line 207
    .end local v0    # "that":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<**>;"
    :cond_2
    return v1

    .line 210
    :cond_3
    return v2

    .line 214
    .restart local v0    # "that":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<**>;"
    :cond_4
    iget-object v3, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    iget-object v4, v0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    if-ne v3, v4, :cond_0

    iget v3, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    iget v4, v0, Lcom/google/protobuf/nano/Extension;->tag:I

    if-ne v3, v4, :cond_0

    iget-boolean v3, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    iget-boolean v4, v0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-eq v3, v4, :cond_1

    goto :goto_0
.end method

.method final getValueFrom(Ljava/util/List;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/nano/UnknownFieldData;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p1, "unknownFields":Ljava/util/List;, "Ljava/util/List<Lcom/google/protobuf/nano/UnknownFieldData;>;"
    const/4 v0, 0x0

    .line 238
    if-eqz p1, :cond_0

    .line 241
    iget-boolean v0, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Lcom/google/protobuf/nano/Extension;->getSingularValueFrom(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    .line 239
    :cond_0
    return-object v0

    .line 241
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/protobuf/nano/Extension;->getRepeatedValueFrom(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    const/4 v1, 0x0

    .line 222
    const/16 v0, 0x25

    .line 223
    .local v0, "result":I
    iget v2, p0, Lcom/google/protobuf/nano/Extension;->type:I

    add-int/lit16 v0, v2, 0x47b

    .line 224
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 225
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    add-int v0, v2, v3

    .line 226
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v3, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-nez v3, :cond_0

    :goto_0
    add-int v0, v2, v1

    .line 227
    return v0

    .line 226
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected readData(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Ljava/lang/Object;
    .locals 11
    .param p1, "input"    # Lcom/google/protobuf/nano/CodedInputByteBufferNano;

    .prologue
    .line 277
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    iget-boolean v8, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-nez v8, :cond_0

    iget-object v7, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    .line 279
    .local v7, "messageType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    :try_start_0
    iget v8, p0, Lcom/google/protobuf/nano/Extension;->type:I

    packed-switch v8, :pswitch_data_0

    .line 293
    new-instance v8, Ljava/lang/IllegalArgumentException;

    iget v0, p0, Lcom/google/protobuf/nano/Extension;->type:I

    .local v0, "-l_4_I":I
    new-instance v9, Ljava/lang/StringBuilder;

    const/16 v10, 0x18

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v10, "Unknown type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 295
    .end local v0    # "-l_4_I":I
    :catch_0
    move-exception v4

    .line 296
    .local v4, "e":Ljava/lang/InstantiationException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x21

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v9, "Error creating instance of class "

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 277
    .end local v1    # "-l_4_R":Ljava/lang/Object;
    .end local v4    # "e":Ljava/lang/InstantiationException;
    .end local v7    # "messageType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    iget-object v8, p0, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    goto :goto_0

    .line 281
    .restart local v7    # "messageType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :pswitch_0
    :try_start_1
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/nano/MessageNano;

    .line 282
    .local v5, "group":Lcom/google/protobuf/nano/MessageNano;
    iget v8, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v8}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v8

    invoke-virtual {p1, v5, v8}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readGroup(Lcom/google/protobuf/nano/MessageNano;I)V

    .line 283
    return-object v5

    .line 285
    .end local v5    # "group":Lcom/google/protobuf/nano/MessageNano;
    :pswitch_1
    iget-object v8, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    if-nez v8, :cond_1

    .line 288
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/protobuf/nano/MessageNano;

    .line 289
    .local v6, "message":Lcom/google/protobuf/nano/MessageNano;
    invoke-virtual {p1, v6}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    .line 290
    return-object v6

    .line 286
    .end local v6    # "message":Lcom/google/protobuf/nano/MessageNano;
    :cond_1
    iget-object v8, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    invoke-virtual {v8}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v8

    invoke-virtual {p1, v8}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessageLite(Lcom/google/protobuf/Parser;)Lcom/google/protobuf/GeneratedMessageLite;
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v8

    return-object v8

    .line 297
    :catch_1
    move-exception v3

    .line 298
    .local v3, "e":Ljava/lang/IllegalAccessException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "-l_4_R":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x21

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v9, "Error creating instance of class "

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 299
    .end local v1    # "-l_4_R":Ljava/lang/Object;
    .end local v3    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v2

    .line 300
    .local v2, "e":Ljava/io/IOException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v9, "Error reading extension field"

    invoke-direct {v8, v9, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 279
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected readDataInto(Lcom/google/protobuf/nano/UnknownFieldData;Ljava/util/List;)V
    .locals 1
    .param p1, "data"    # Lcom/google/protobuf/nano/UnknownFieldData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/nano/UnknownFieldData;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p2, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v0, p1, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    invoke-static {v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->newInstance([B)Lcom/google/protobuf/nano/CodedInputByteBufferNano;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/Extension;->readData(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    return-void
.end method

.method protected writeRepeatedData(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .param p1, "array"    # Ljava/lang/Object;
    .param p2, "output"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    .prologue
    .line 364
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 365
    .local v0, "arrayLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 371
    return-void

    .line 366
    :cond_0
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 367
    .local v1, "element":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 365
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 368
    :cond_1
    invoke-virtual {p0, v1, p2}, Lcom/google/protobuf/nano/Extension;->writeSingularData(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    goto :goto_1
.end method

.method protected writeSingularData(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "out"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    .prologue
    .line 328
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    :try_start_0
    iget v3, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-virtual {p2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 329
    iget v3, p0, Lcom/google/protobuf/nano/Extension;->type:I

    packed-switch v3, :pswitch_data_0

    .line 348
    new-instance v3, Ljava/lang/IllegalArgumentException;

    iget v0, p0, Lcom/google/protobuf/nano/Extension;->type:I

    .local v0, "-l_4_I":I
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v5, 0x18

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "Unknown type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    .end local v0    # "-l_4_I":I
    .end local p1    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 352
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 331
    .end local v1    # "e":Ljava/io/IOException;
    .restart local p1    # "value":Ljava/lang/Object;
    :pswitch_0
    :try_start_1
    iget v3, p0, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v3}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v2

    .line 332
    .local v2, "fieldNumber":I
    iget-object v3, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    if-eqz v3, :cond_0

    .line 335
    check-cast p1, Lcom/google/protobuf/MessageLite;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p2, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeGroupNoTag(Lcom/google/protobuf/MessageLite;)V

    .line 338
    :goto_0
    const/4 v3, 0x4

    invoke-virtual {p2, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeTag(II)V

    .line 354
    .end local v2    # "fieldNumber":I
    :goto_1
    return-void

    .line 333
    .restart local v2    # "fieldNumber":I
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_0
    check-cast p1, Lcom/google/protobuf/nano/MessageNano;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p2, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeGroupNoTag(Lcom/google/protobuf/nano/MessageNano;)V

    goto :goto_0

    .line 341
    .end local v2    # "fieldNumber":I
    .restart local p1    # "value":Ljava/lang/Object;
    :pswitch_1
    iget-object v3, p0, Lcom/google/protobuf/nano/Extension;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    if-eqz v3, :cond_1

    .line 344
    check-cast p1, Lcom/google/protobuf/MessageLite;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p2, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessageNoTag(Lcom/google/protobuf/MessageLite;)V

    goto :goto_1

    .line 342
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lcom/google/protobuf/nano/MessageNano;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p2, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessageNoTag(Lcom/google/protobuf/nano/MessageNano;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 329
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method writeTo(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "output"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    .local p0, "this":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    iget-boolean v0, p0, Lcom/google/protobuf/nano/Extension;->repeated:Z

    if-nez v0, :cond_0

    .line 313
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/nano/Extension;->writeSingularData(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 315
    :goto_0
    return-void

    .line 311
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/nano/Extension;->writeRepeatedData(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    goto :goto_0
.end method
