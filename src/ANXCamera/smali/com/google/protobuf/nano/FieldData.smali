.class Lcom/google/protobuf/nano/FieldData;
.super Ljava/lang/Object;
.source "FieldData.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private cachedExtension:Lcom/google/protobuf/nano/Extension;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/nano/Extension",
            "<**>;"
        }
    .end annotation
.end field

.field private unknownFieldData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/nano/UnknownFieldData;",
            ">;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    .line 56
    return-void
.end method

.method constructor <init>(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/nano/Extension",
            "<*TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<*TT;>;"
    .local p2, "newValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    .line 51
    iput-object p2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    .line 52
    return-void
.end method

.method private toByteArray()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/google/protobuf/nano/FieldData;->computeSerializedSize()I

    move-result v2

    new-array v1, v2, [B

    .line 235
    .local v1, "result":[B
    invoke-static {v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->newInstance([B)Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    move-result-object v0

    .line 236
    .local v0, "output":Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/FieldData;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 237
    return-object v1
.end method


# virtual methods
.method addUnknownField(Lcom/google/protobuf/nano/UnknownFieldData;)V
    .locals 10
    .param p1, "unknownField"    # Lcom/google/protobuf/nano/UnknownFieldData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 60
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    if-nez v7, :cond_0

    .line 64
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, Lcom/google/protobuf/nano/MessageNano;

    if-nez v7, :cond_1

    .line 73
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [Lcom/google/protobuf/nano/MessageNano;

    if-nez v7, :cond_3

    .line 81
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/google/protobuf/nano/Extension;->getValueFrom(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    .line 83
    .local v6, "newValue":Ljava/lang/Object;
    :goto_0
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    invoke-virtual {p0, v7, v6}, Lcom/google/protobuf/nano/FieldData;->setValue(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)V

    .line 85
    .end local v6    # "newValue":Ljava/lang/Object;
    :goto_1
    return-void

    .line 61
    :cond_0
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-interface {v7, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 65
    :cond_1
    iget-object v1, p1, Lcom/google/protobuf/nano/UnknownFieldData;->bytes:[B

    .line 66
    .local v1, "bytes":[B
    array-length v7, v1

    .line 67
    invoke-static {v1, v9, v7}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->newInstance([BII)Lcom/google/protobuf/nano/CodedInputByteBufferNano;

    move-result-object v2

    .line 68
    .local v2, "input":Lcom/google/protobuf/nano/CodedInputByteBufferNano;
    invoke-virtual {v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v3

    .line 69
    .local v3, "length":I
    array-length v7, v1

    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32SizeNoTag(I)I

    move-result v8

    sub-int/2addr v7, v8

    if-ne v3, v7, :cond_2

    .line 72
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, Lcom/google/protobuf/nano/MessageNano;

    invoke-virtual {v7, v2}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;

    move-result-object v6

    .restart local v6    # "newValue":Ljava/lang/Object;
    goto :goto_0

    .line 70
    .end local v6    # "newValue":Ljava/lang/Object;
    :cond_2
    invoke-static {}, Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;->truncatedMessage()Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;

    move-result-object v7

    throw v7

    .line 74
    .end local v1    # "bytes":[B
    .end local v2    # "input":Lcom/google/protobuf/nano/CodedInputByteBufferNano;
    .end local v3    # "length":I
    :cond_3
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    .line 75
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/google/protobuf/nano/Extension;->getValueFrom(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/google/protobuf/nano/MessageNano;

    .line 76
    .local v5, "newElements":[Lcom/google/protobuf/nano/MessageNano;
    iget-object v0, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v0, [Lcom/google/protobuf/nano/MessageNano;

    .line 77
    .local v0, "array":[Lcom/google/protobuf/nano/MessageNano;
    array-length v7, v0

    array-length v8, v5

    add-int/2addr v7, v8

    invoke-static {v0, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/google/protobuf/nano/MessageNano;

    .line 78
    .local v4, "newArray":[Lcom/google/protobuf/nano/MessageNano;
    array-length v7, v0

    array-length v8, v5

    invoke-static {v5, v9, v4, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    move-object v6, v4

    .restart local v6    # "newValue":Ljava/lang/Object;
    goto :goto_0
.end method

.method public final clone()Lcom/google/protobuf/nano/FieldData;
    .locals 9

    .prologue
    .line 242
    new-instance v0, Lcom/google/protobuf/nano/FieldData;

    invoke-direct {v0}, Lcom/google/protobuf/nano/FieldData;-><init>()V

    .line 244
    .local v0, "clone":Lcom/google/protobuf/nano/FieldData;
    :try_start_0
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    .line 245
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    if-eqz v7, :cond_1

    .line 248
    iget-object v7, v0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    iget-object v8, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 254
    :goto_0
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-eqz v7, :cond_0

    .line 256
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, Lcom/google/protobuf/nano/MessageNano;

    if-nez v7, :cond_2

    .line 258
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [B

    if-nez v7, :cond_3

    .line 260
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [[B

    if-nez v7, :cond_4

    .line 267
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [Z

    if-nez v7, :cond_5

    .line 269
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [I

    if-nez v7, :cond_6

    .line 271
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [J

    if-nez v7, :cond_7

    .line 273
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [F

    if-nez v7, :cond_8

    .line 275
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [D

    if-nez v7, :cond_9

    .line 277
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v7, v7, [Lcom/google/protobuf/nano/MessageNano;

    if-nez v7, :cond_a

    .line 285
    :cond_0
    :goto_1
    return-object v0

    .line 246
    :cond_1
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 286
    :catch_0
    move-exception v3

    .line 287
    .local v3, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v7

    .line 257
    .end local v3    # "e":Ljava/lang/CloneNotSupportedException;
    :cond_2
    :try_start_1
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, Lcom/google/protobuf/nano/MessageNano;

    invoke-virtual {v7}, Lcom/google/protobuf/nano/MessageNano;->clone()Lcom/google/protobuf/nano/MessageNano;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 259
    :cond_3
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [B

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 261
    :cond_4
    iget-object v6, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v6, [[B

    .line 262
    .local v6, "valueArray":[[B
    array-length v7, v6

    new-array v2, v7, [[B

    .line 263
    .local v2, "cloneArray":[[B
    iput-object v2, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    .line 264
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    array-length v7, v6

    if-ge v4, v7, :cond_0

    .line 265
    aget-object v7, v6, v4

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    aput-object v7, v2, v4

    .line 264
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 268
    .end local v2    # "cloneArray":[[B
    .end local v4    # "i":I
    .end local v6    # "valueArray":[[B
    :cond_5
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [Z

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 270
    :cond_6
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [I

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 272
    :cond_7
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [J

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 274
    :cond_8
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [F

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 276
    :cond_9
    iget-object v7, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v7, [D

    invoke-virtual {v7}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    goto :goto_1

    .line 278
    :cond_a
    iget-object v5, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v5, [Lcom/google/protobuf/nano/MessageNano;

    .line 279
    .local v5, "valueArray":[Lcom/google/protobuf/nano/MessageNano;
    array-length v7, v5

    new-array v1, v7, [Lcom/google/protobuf/nano/MessageNano;

    .line 280
    .local v1, "cloneArray":[Lcom/google/protobuf/nano/MessageNano;
    iput-object v1, v0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    .line 281
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    array-length v7, v5

    if-ge v4, v7, :cond_0

    .line 282
    aget-object v7, v5, v4

    invoke-virtual {v7}, Lcom/google/protobuf/nano/MessageNano;->clone()Lcom/google/protobuf/nano/MessageNano;

    move-result-object v7

    aput-object v7, v1, v4
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 281
    add-int/lit8 v4, v4, 0x1

    goto :goto_3
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/google/protobuf/nano/FieldData;->clone()Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    return-object v0
.end method

.method computeSerializedSize()I
    .locals 5

    .prologue
    .line 125
    const/4 v1, 0x0

    .line 126
    .local v1, "size":I
    iget-object v3, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-nez v3, :cond_0

    .line 129
    iget-object v3, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 133
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    :goto_1
    return v1

    .line 127
    :cond_0
    iget-object v3, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    iget-object v4, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Lcom/google/protobuf/nano/Extension;->computeSerializedSize(Ljava/lang/Object;)I

    move-result v1

    goto :goto_1

    .line 129
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/nano/UnknownFieldData;

    .line 130
    .local v2, "unknownField":Lcom/google/protobuf/nano/UnknownFieldData;
    invoke-virtual {v2}, Lcom/google/protobuf/nano/UnknownFieldData;->computeSerializedSize()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 172
    if-eq p1, p0, :cond_2

    .line 175
    instance-of v2, p1, Lcom/google/protobuf/nano/FieldData;

    if-eqz v2, :cond_3

    move-object v1, p1

    .line 179
    check-cast v1, Lcom/google/protobuf/nano/FieldData;

    .line 180
    .local v1, "other":Lcom/google/protobuf/nano/FieldData;
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-nez v2, :cond_4

    .line 207
    :cond_0
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    if-nez v2, :cond_d

    .line 213
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/google/protobuf/nano/FieldData;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1}, Lcom/google/protobuf/nano/FieldData;->toByteArray()[B

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 173
    .end local v1    # "other":Lcom/google/protobuf/nano/FieldData;
    :cond_2
    const/4 v2, 0x1

    return v2

    .line 176
    :cond_3
    return v4

    .line 180
    .restart local v1    # "other":Lcom/google/protobuf/nano/FieldData;
    :cond_4
    iget-object v2, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-eqz v2, :cond_0

    .line 184
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    if-ne v2, v3, :cond_5

    .line 187
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    iget-object v2, v2, Lcom/google/protobuf/nano/Extension;->clazz:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 191
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [B

    if-nez v2, :cond_7

    .line 193
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [I

    if-nez v2, :cond_8

    .line 195
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [J

    if-nez v2, :cond_9

    .line 197
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [F

    if-nez v2, :cond_a

    .line 199
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [D

    if-nez v2, :cond_b

    .line 201
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    instance-of v2, v2, [Z

    if-nez v2, :cond_c

    .line 204
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/Object;

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 185
    :cond_5
    return v4

    .line 189
    :cond_6
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 192
    :cond_7
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [B

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    return v2

    .line 194
    :cond_8
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [I

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    return v2

    .line 196
    :cond_9
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [J

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [J

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v2

    return v2

    .line 198
    :cond_a
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [F

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [F

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v2

    return v2

    .line 200
    :cond_b
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [D

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [D

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([D[D)Z

    move-result v2

    return v2

    .line 202
    :cond_c
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v2, [Z

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    check-cast v3, [Z

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Z[Z)Z

    move-result v2

    return v2

    .line 207
    :cond_d
    iget-object v2, v1, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    if-eqz v2, :cond_1

    .line 209
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    iget-object v3, v1, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 214
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method getValue(Lcom/google/protobuf/nano/Extension;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/nano/Extension",
            "<*TT;>;)TT;"
        }
    .end annotation

    .prologue
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<*TT;>;"
    const/4 v1, 0x0

    .line 105
    iget-object v0, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-nez v0, :cond_1

    .line 111
    iput-object p1, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    .line 112
    iget-object v0, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/Extension;->getValueFrom(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    .line 113
    iput-object v1, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    return-object v0

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/nano/Extension;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Tried to getExtension with a different Extension."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 222
    const/16 v1, 0x11

    .line 225
    .local v1, "result":I
    :try_start_0
    invoke-direct {p0}, Lcom/google/protobuf/nano/FieldData;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    add-int/lit16 v1, v2, 0x20f

    .line 230
    return v1

    .line 226
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method setValue(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/nano/Extension",
            "<*TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<*TT;>;"
    .local p2, "newValue":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    .line 120
    iput-object p2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    .line 122
    return-void
.end method

.method writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 4
    .param p1, "output"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 153
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->unknownFieldData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 157
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    :goto_1
    return-void

    .line 151
    :cond_0
    iget-object v2, p0, Lcom/google/protobuf/nano/FieldData;->cachedExtension:Lcom/google/protobuf/nano/Extension;

    iget-object v3, p0, Lcom/google/protobuf/nano/FieldData;->value:Ljava/lang/Object;

    invoke-virtual {v2, v3, p1}, Lcom/google/protobuf/nano/Extension;->writeTo(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    goto :goto_1

    .line 153
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/protobuf/nano/UnknownFieldData;

    .line 154
    .local v1, "unknownField":Lcom/google/protobuf/nano/UnknownFieldData;
    invoke-virtual {v1, p1}, Lcom/google/protobuf/nano/UnknownFieldData;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    goto :goto_0
.end method
