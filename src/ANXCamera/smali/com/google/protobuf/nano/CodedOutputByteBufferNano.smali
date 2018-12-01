.class public final Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
.super Ljava/lang/Object;
.source "CodedOutputByteBufferNano.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;
    }
.end annotation


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private codedOutputStream:Lcom/google/protobuf/CodedOutputStream;

.field private codedOutputStreamPosition:I


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    .line 70
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 71
    return-void
.end method

.method private constructor <init>([BII)V
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 65
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;-><init>(Ljava/nio/ByteBuffer;)V

    .line 66
    return-void
.end method

.method public static computeGroupSize(ILcom/google/protobuf/nano/MessageNano;)I
    .locals 2
    .param p0, "fieldNumber"    # I
    .param p1, "value"    # Lcom/google/protobuf/nano/MessageNano;

    .prologue
    .line 673
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeTagSize(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeGroupSizeNoTag(Lcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static computeGroupSizeNoTag(Lcom/google/protobuf/nano/MessageNano;)I
    .locals 1
    .param p0, "value"    # Lcom/google/protobuf/nano/MessageNano;

    .prologue
    .line 831
    invoke-virtual {p0}, Lcom/google/protobuf/nano/MessageNano;->getSerializedSize()I

    move-result v0

    return v0
.end method

.method public static computeInt32Size(II)I
    .locals 2
    .param p0, "fieldNumber"    # I
    .param p1, "value"    # I

    .prologue
    .line 634
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeTagSize(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32SizeNoTag(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static computeInt32SizeNoTag(I)I
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 800
    if-gez p0, :cond_0

    .line 804
    const/16 v0, 0xa

    return v0

    .line 801
    :cond_0
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v0

    return v0
.end method

.method public static computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I
    .locals 2
    .param p0, "fieldNumber"    # I
    .param p1, "value"    # Lcom/google/protobuf/nano/MessageNano;

    .prologue
    .line 681
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeTagSize(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSizeNoTag(Lcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static computeMessageSizeNoTag(Lcom/google/protobuf/nano/MessageNano;)I
    .locals 2
    .param p0, "value"    # Lcom/google/protobuf/nano/MessageNano;

    .prologue
    .line 836
    invoke-virtual {p0}, Lcom/google/protobuf/nano/MessageNano;->getSerializedSize()I

    move-result v0

    .line 837
    .local v0, "size":I
    invoke-static {v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public static computeRawVarint32Size(I)I
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 996
    and-int/lit8 v0, p0, -0x80

    if-eqz v0, :cond_0

    .line 997
    and-int/lit16 v0, p0, -0x4000

    if-eqz v0, :cond_1

    .line 998
    const/high16 v0, -0x200000

    and-int/2addr v0, p0

    if-eqz v0, :cond_2

    .line 999
    const/high16 v0, -0x10000000

    and-int/2addr v0, p0

    if-eqz v0, :cond_3

    .line 1000
    const/4 v0, 0x5

    return v0

    .line 996
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 997
    :cond_1
    const/4 v0, 0x2

    return v0

    .line 998
    :cond_2
    const/4 v0, 0x3

    return v0

    .line 999
    :cond_3
    const/4 v0, 0x4

    return v0
.end method

.method public static computeStringSize(ILjava/lang/String;)I
    .locals 2
    .param p0, "fieldNumber"    # I
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 665
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeTagSize(I)I

    move-result v0

    invoke-static {p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSizeNoTag(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static computeStringSizeNoTag(Ljava/lang/String;)I
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 825
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encodedLength(Ljava/lang/CharSequence;)I

    move-result v0

    .line 826
    .local v0, "length":I
    invoke-static {v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public static computeTagSize(I)I
    .locals 1
    .param p0, "fieldNumber"    # I

    .prologue
    .line 972
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/protobuf/nano/WireFormatNano;->makeTag(II)I

    move-result v0

    invoke-static {v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v0

    return v0
.end method

.method private static encode(Ljava/lang/CharSequence;[BII)I
    .locals 13
    .param p0, "sequence"    # Ljava/lang/CharSequence;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 482
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v9

    .line 483
    .local v9, "utf16Length":I
    move v5, p2

    .line 484
    .local v5, "j":I
    const/4 v4, 0x0

    .line 485
    .local v4, "i":I
    add-int v7, p2, p3

    .line 488
    .local v7, "limit":I
    :goto_0
    if-lt v4, v9, :cond_1

    .line 491
    :cond_0
    if-eq v4, v9, :cond_2

    .line 494
    add-int v5, p2, v4

    move v6, v5

    .line 495
    .end local v5    # "j":I
    .local v6, "j":I
    :goto_1
    if-lt v4, v9, :cond_3

    .line 523
    return v6

    .line 488
    .end local v6    # "j":I
    .restart local v5    # "j":I
    :cond_1
    add-int v10, v4, p2

    if-ge v10, v7, :cond_0

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .local v2, "c":C
    const/16 v10, 0x80

    if-ge v2, v10, :cond_0

    .line 489
    add-int v10, p2, v4

    int-to-byte v11, v2

    int-to-byte v11, v11

    aput-byte v11, p1, v10

    .line 488
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 492
    .end local v2    # "c":C
    :cond_2
    add-int v10, p2, v9

    return v10

    .line 496
    .end local v5    # "j":I
    .restart local v6    # "j":I
    :cond_3
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 497
    .restart local v2    # "c":C
    const/16 v10, 0x80

    if-lt v2, v10, :cond_7

    .line 499
    :cond_4
    const/16 v10, 0x800

    if-lt v2, v10, :cond_8

    .line 502
    :cond_5
    const v10, 0xd800

    if-ge v2, v10, :cond_9

    :cond_6
    add-int/lit8 v10, v7, -0x3

    if-le v6, v10, :cond_a

    .line 507
    :goto_2
    add-int/lit8 v10, v7, -0x4

    if-le v6, v10, :cond_b

    .line 520
    new-instance v10, Ljava/lang/ArrayIndexOutOfBoundsException;

    move v1, v2

    .local v1, "-l_9_I":I
    move v0, v6

    .local v0, "-l_10_I":I
    new-instance v11, Ljava/lang/StringBuilder;

    const/16 v12, 0x25

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v12, "Failed writing "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " at index "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 497
    .end local v0    # "-l_10_I":I
    .end local v1    # "-l_9_I":I
    :cond_7
    if-ge v6, v7, :cond_4

    .line 498
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    int-to-byte v10, v2

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    .line 495
    :goto_3
    add-int/lit8 v4, v4, 0x1

    move v6, v5

    .end local v5    # "j":I
    .restart local v6    # "j":I
    goto :goto_1

    .line 499
    :cond_8
    add-int/lit8 v10, v7, -0x2

    if-gt v6, v10, :cond_5

    .line 500
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    ushr-int/lit8 v10, v2, 0x6

    or-int/lit16 v10, v10, 0x3c0

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    .line 501
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .restart local v6    # "j":I
    and-int/lit8 v10, v2, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v5

    move v5, v6

    .end local v6    # "j":I
    .restart local v5    # "j":I
    goto :goto_3

    .line 502
    .end local v5    # "j":I
    .restart local v6    # "j":I
    :cond_9
    const v10, 0xdfff

    if-lt v10, v2, :cond_6

    goto :goto_2

    .line 504
    :cond_a
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    ushr-int/lit8 v10, v2, 0xc

    or-int/lit16 v10, v10, 0x1e0

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    .line 505
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .restart local v6    # "j":I
    ushr-int/lit8 v10, v2, 0x6

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v5

    .line 506
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    and-int/lit8 v10, v2, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    goto :goto_3

    .line 510
    .end local v5    # "j":I
    .restart local v6    # "j":I
    :cond_b
    add-int/lit8 v10, v4, 0x1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v11

    if-ne v10, v11, :cond_d

    .line 512
    :cond_c
    new-instance v10, Ljava/lang/IllegalArgumentException;

    add-int/lit8 v0, v4, -0x1

    .restart local v0    # "-l_10_I":I
    new-instance v11, Ljava/lang/StringBuilder;

    const/16 v12, 0x27

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v12, "Unpaired surrogate at index "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 510
    .end local v0    # "-l_10_I":I
    :cond_d
    add-int/lit8 v4, v4, 0x1

    .line 511
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    .local v8, "low":C
    invoke-static {v2, v8}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 514
    invoke-static {v2, v8}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v3

    .line 515
    .local v3, "codePoint":I
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    ushr-int/lit8 v10, v3, 0x12

    or-int/lit16 v10, v10, 0xf0

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    .line 516
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .restart local v6    # "j":I
    ushr-int/lit8 v10, v3, 0xc

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v5

    .line 517
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    ushr-int/lit8 v10, v3, 0x6

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v6

    .line 518
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .restart local v6    # "j":I
    and-int/lit8 v10, v3, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    int-to-byte v10, v10

    aput-byte v10, p1, v5

    move v5, v6

    .line 519
    .end local v6    # "j":I
    .restart local v5    # "j":I
    goto/16 :goto_3
.end method

.method private static encode(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p0, "sequence"    # Ljava/lang/CharSequence;
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 431
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isReadOnly()Z

    move-result v3

    if-nez v3, :cond_0

    .line 433
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v3

    if-nez v3, :cond_1

    .line 448
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encodeDirect(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V

    .line 450
    :goto_0
    return-void

    .line 432
    :cond_0
    new-instance v3, Ljava/nio/ReadOnlyBufferException;

    invoke-direct {v3}, Ljava/nio/ReadOnlyBufferException;-><init>()V

    throw v3

    .line 438
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    .line 439
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v4, v5

    .line 440
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 436
    invoke-static {p0, v3, v4, v5}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encode(Ljava/lang/CharSequence;[BII)I

    move-result v2

    .line 441
    .local v2, "encoded":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    sub-int v3, v2, v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 442
    .end local v2    # "encoded":I
    :catch_0
    move-exception v1

    .line 443
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v0, Ljava/nio/BufferOverflowException;

    invoke-direct {v0}, Ljava/nio/BufferOverflowException;-><init>()V

    .line 444
    .local v0, "boe":Ljava/nio/BufferOverflowException;
    invoke-virtual {v0, v1}, Ljava/nio/BufferOverflowException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 445
    throw v0
.end method

.method private static encodeDirect(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V
    .locals 9
    .param p0, "sequence"    # Ljava/lang/CharSequence;
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v8, 0x80

    .line 453
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 454
    .local v5, "utf16Length":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v5, :cond_0

    .line 479
    return-void

    .line 455
    :cond_0
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 456
    .local v1, "c":C
    if-lt v1, v8, :cond_2

    .line 458
    const/16 v6, 0x800

    if-lt v1, v6, :cond_3

    .line 461
    const v6, 0xd800

    if-ge v1, v6, :cond_4

    .line 463
    :cond_1
    ushr-int/lit8 v6, v1, 0xc

    or-int/lit16 v6, v6, 0x1e0

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 464
    ushr-int/lit8 v6, v1, 0x6

    and-int/lit8 v6, v6, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 465
    and-int/lit8 v6, v1, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 454
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 457
    :cond_2
    int-to-byte v6, v1

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 459
    :cond_3
    ushr-int/lit8 v6, v1, 0x6

    or-int/lit16 v6, v6, 0x3c0

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 460
    and-int/lit8 v6, v1, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 461
    :cond_4
    const v6, 0xdfff

    if-lt v6, v1, :cond_1

    .line 468
    add-int/lit8 v6, v3, 0x1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-ne v6, v7, :cond_6

    .line 470
    :cond_5
    new-instance v6, Ljava/lang/IllegalArgumentException;

    add-int/lit8 v0, v3, -0x1

    .local v0, "-l_6_I":I
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x27

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v8, "Unpaired surrogate at index "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 468
    .end local v0    # "-l_6_I":I
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 469
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .local v4, "low":C
    invoke-static {v1, v4}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 472
    invoke-static {v1, v4}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v2

    .line 473
    .local v2, "codePoint":I
    ushr-int/lit8 v6, v2, 0x12

    or-int/lit16 v6, v6, 0xf0

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 474
    ushr-int/lit8 v6, v2, 0xc

    and-int/lit8 v6, v6, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 475
    ushr-int/lit8 v6, v2, 0x6

    and-int/lit8 v6, v6, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 476
    and-int/lit8 v6, v2, 0x3f

    or-int/lit16 v6, v6, 0x80

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method

.method private static encodedLength(Ljava/lang/CharSequence;)I
    .locals 12
    .param p0, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 363
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 364
    .local v4, "utf16Length":I
    move v5, v4

    .line 365
    .local v5, "utf8Length":I
    const/4 v3, 0x0

    .line 368
    .local v3, "i":I
    :goto_0
    if-lt v3, v4, :cond_1

    .line 373
    :cond_0
    :goto_1
    if-lt v3, v4, :cond_2

    .line 383
    :goto_2
    if-lt v5, v4, :cond_4

    .line 388
    return v5

    .line 368
    :cond_1
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0x80

    if-ge v6, v7, :cond_0

    .line 369
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 374
    :cond_2
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 375
    .local v2, "c":C
    const/16 v6, 0x800

    if-lt v2, v6, :cond_3

    .line 378
    invoke-static {p0, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encodedLengthGeneral(Ljava/lang/CharSequence;I)I

    move-result v6

    add-int/2addr v5, v6

    goto :goto_2

    .line 376
    :cond_3
    rsub-int/lit8 v6, v2, 0x7f

    ushr-int/lit8 v6, v6, 0x1f

    add-int/2addr v5, v6

    .line 373
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 385
    .end local v2    # "c":C
    :cond_4
    new-instance v6, Ljava/lang/IllegalArgumentException;

    int-to-long v8, v5

    const-wide v10, 0x100000000L

    add-long v0, v8, v10

    .local v0, "-l_4_J":J
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x36

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v8, "UTF-8 length does not fit in int: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private static encodedLengthGeneral(Ljava/lang/CharSequence;I)I
    .locals 9
    .param p0, "sequence"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I

    .prologue
    .line 392
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 393
    .local v4, "utf16Length":I
    const/4 v5, 0x0

    .line 394
    .local v5, "utf8Length":I
    move v3, p1

    .local v3, "i":I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 411
    return v5

    .line 395
    :cond_0
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 396
    .local v1, "c":C
    const/16 v6, 0x800

    if-lt v1, v6, :cond_2

    .line 399
    add-int/lit8 v5, v5, 0x2

    .line 401
    const v6, 0xd800

    if-le v6, v1, :cond_3

    .line 394
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 397
    :cond_2
    rsub-int/lit8 v6, v1, 0x7f

    ushr-int/lit8 v6, v6, 0x1f

    add-int/2addr v5, v6

    goto :goto_1

    .line 401
    :cond_3
    const v6, 0xdfff

    if-gt v1, v6, :cond_1

    .line 403
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v2

    .line 404
    .local v2, "cp":I
    const/high16 v6, 0x10000

    if-lt v2, v6, :cond_4

    .line 407
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 405
    :cond_4
    new-instance v6, Ljava/lang/IllegalArgumentException;

    move v0, v3

    .local v0, "-l_7_I":I
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x27

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v8, "Unpaired surrogate at index "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private getCodedOutputStream()Lcom/google/protobuf/CodedOutputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStream:Lcom/google/protobuf/CodedOutputStream;

    if-eqz v0, :cond_0

    .line 100
    iget v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 106
    :goto_0
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStream:Lcom/google/protobuf/CodedOutputStream;

    return-object v0

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/google/protobuf/CodedOutputStream;->newInstance(Ljava/nio/ByteBuffer;)Lcom/google/protobuf/CodedOutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStream:Lcom/google/protobuf/CodedOutputStream;

    .line 99
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    goto :goto_0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStream:Lcom/google/protobuf/CodedOutputStream;

    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    .line 103
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget v2, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    iget-object v3, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    iget v4, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    sub-int/2addr v3, v4

    .line 102
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->write([BII)V

    .line 104
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    goto :goto_0
.end method

.method public static newInstance([B)Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .locals 2
    .param p0, "flatArray"    # [B

    .prologue
    .line 79
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->newInstance([BII)Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance([BII)Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .locals 1
    .param p0, "flatArray"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 89
    new-instance v0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;-><init>([BII)V

    return-object v0
.end method


# virtual methods
.method public checkNoSpaceLeft()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 895
    invoke-virtual {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->spaceLeft()I

    move-result v0

    if-nez v0, :cond_0

    .line 900
    return-void

    .line 896
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "Did not write as much data as expected, %s bytes remaining."

    .line 898
    invoke-virtual {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->spaceLeft()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v4

    .line 897
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public spaceLeft()I
    .locals 1

    .prologue
    .line 885
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public writeGroupNoTag(Lcom/google/protobuf/MessageLite;)V
    .locals 2
    .param p1, "value"    # Lcom/google/protobuf/MessageLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 535
    invoke-direct {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->getCodedOutputStream()Lcom/google/protobuf/CodedOutputStream;

    move-result-object v0

    .line 536
    .local v0, "codedOutputStream":Lcom/google/protobuf/CodedOutputStream;
    invoke-interface {p1, v0}, Lcom/google/protobuf/MessageLite;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 537
    invoke-virtual {v0}, Lcom/google/protobuf/CodedOutputStream;->flush()V

    .line 538
    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iput v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    .line 539
    return-void
.end method

.method public writeGroupNoTag(Lcom/google/protobuf/nano/MessageNano;)V
    .locals 0
    .param p1, "value"    # Lcom/google/protobuf/nano/MessageNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    invoke-virtual {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 531
    return-void
.end method

.method public writeInt32(II)V
    .locals 1
    .param p1, "fieldNumber"    # I
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeTag(II)V

    .line 138
    invoke-virtual {p0, p2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32NoTag(I)V

    .line 139
    return-void
.end method

.method public writeInt32NoTag(I)V
    .locals 2
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 295
    if-gez p1, :cond_0

    .line 299
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint64(J)V

    .line 301
    :goto_0
    return-void

    .line 296
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    goto :goto_0
.end method

.method public writeMessageNoTag(Lcom/google/protobuf/MessageLite;)V
    .locals 2
    .param p1, "value"    # Lcom/google/protobuf/MessageLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 549
    invoke-interface {p1}, Lcom/google/protobuf/MessageLite;->getSerializedSize()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 550
    invoke-direct {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->getCodedOutputStream()Lcom/google/protobuf/CodedOutputStream;

    move-result-object v0

    .line 551
    .local v0, "codedOutputStream":Lcom/google/protobuf/CodedOutputStream;
    invoke-interface {p1, v0}, Lcom/google/protobuf/MessageLite;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 552
    invoke-virtual {v0}, Lcom/google/protobuf/CodedOutputStream;->flush()V

    .line 553
    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iput v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->codedOutputStreamPosition:I

    .line 554
    return-void
.end method

.method public writeMessageNoTag(Lcom/google/protobuf/nano/MessageNano;)V
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/nano/MessageNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 543
    invoke-virtual {p1}, Lcom/google/protobuf/nano/MessageNano;->getCachedSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 544
    invoke-virtual {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 545
    return-void
.end method

.method public writeRawByte(B)V
    .locals 3
    .param p1, "value"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 937
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 942
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 943
    return-void

    .line 939
    :cond_0
    new-instance v0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;

    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;-><init>(II)V

    throw v0
.end method

.method public writeRawByte(I)V
    .locals 1
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 947
    int-to-byte v0, p1

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawByte(B)V

    .line 948
    return-void
.end method

.method public writeRawBytes([B)V
    .locals 2
    .param p1, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 952
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawBytes([BII)V

    .line 953
    return-void
.end method

.method public writeRawBytes([BII)V
    .locals 3
    .param p1, "value"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 957
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-ge v0, p3, :cond_0

    .line 961
    new-instance v0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;

    iget-object v1, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;-><init>(II)V

    throw v0

    .line 958
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 963
    return-void
.end method

.method public writeRawVarint32(I)V
    .locals 1
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 981
    :goto_0
    and-int/lit8 v0, p1, -0x80

    if-eqz v0, :cond_0

    .line 985
    and-int/lit8 v0, p1, 0x7f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawByte(I)V

    .line 986
    ushr-int/lit8 p1, p1, 0x7

    goto :goto_0

    .line 982
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawByte(I)V

    .line 983
    return-void
.end method

.method public writeRawVarint64(J)V
    .locals 5
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1006
    :goto_0
    const-wide/16 v0, -0x80

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1007
    long-to-int v0, p1

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawByte(I)V

    .line 1008
    return-void

    .line 1010
    :cond_0
    long-to-int v0, p1

    and-int/lit8 v0, v0, 0x7f

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawByte(I)V

    .line 1011
    const/4 v0, 0x7

    ushr-long/2addr p1, v0

    goto :goto_0
.end method

.method public writeString(ILjava/lang/String;)V
    .locals 1
    .param p1, "fieldNumber"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeTag(II)V

    .line 162
    invoke-virtual {p0, p2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeStringNoTag(Ljava/lang/String;)V

    .line 163
    return-void
.end method

.method public writeStringNoTag(Ljava/lang/String;)V
    .locals 9
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v2

    .line 325
    .local v2, "minLengthVarIntSize":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    mul-int/lit8 v6, v6, 0x3

    invoke-static {v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeRawVarint32Size(I)I

    move-result v1

    .line 326
    .local v1, "maxLengthVarIntSize":I
    if-eq v2, v1, :cond_0

    .line 341
    invoke-static {p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encodedLength(Ljava/lang/CharSequence;)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 342
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encode(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V

    .line 350
    :goto_0
    return-void

    .line 327
    :cond_0
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    .line 331
    .local v4, "oldPosition":I
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-lt v6, v2, :cond_1

    .line 334
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    add-int v7, v4, v2

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 335
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->encode(Ljava/lang/CharSequence;Ljava/nio/ByteBuffer;)V

    .line 336
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 337
    .local v3, "newPosition":I
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 338
    sub-int v6, v3, v4

    sub-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 339
    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catch Ljava/nio/BufferOverflowException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 344
    .end local v1    # "maxLengthVarIntSize":I
    .end local v2    # "minLengthVarIntSize":I
    .end local v3    # "newPosition":I
    .end local v4    # "oldPosition":I
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/nio/BufferOverflowException;
    new-instance v5, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;

    iget-object v6, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    .line 346
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    iget-object v7, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;-><init>(II)V

    .line 347
    .local v5, "outOfSpaceException":Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;
    invoke-virtual {v5, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 348
    throw v5

    .line 332
    .end local v0    # "e":Ljava/nio/BufferOverflowException;
    .end local v5    # "outOfSpaceException":Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;
    .restart local v1    # "maxLengthVarIntSize":I
    .restart local v2    # "minLengthVarIntSize":I
    .restart local v4    # "oldPosition":I
    :cond_1
    :try_start_1
    new-instance v6, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;

    add-int v7, v4, v2

    iget-object v8, p0, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->limit()I

    move-result v8

    invoke-direct {v6, v7, v8}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano$OutOfSpaceException;-><init>(II)V

    throw v6
    :try_end_1
    .catch Ljava/nio/BufferOverflowException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public writeTag(II)V
    .locals 1
    .param p1, "fieldNumber"    # I
    .param p2, "wireType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 967
    invoke-static {p1, p2}, Lcom/google/protobuf/nano/WireFormatNano;->makeTag(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeRawVarint32(I)V

    .line 968
    return-void
.end method
