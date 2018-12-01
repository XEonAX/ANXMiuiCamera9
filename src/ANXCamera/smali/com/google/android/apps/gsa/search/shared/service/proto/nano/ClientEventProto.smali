.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "ClientEventProto.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano",
        "<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private eventId_:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    .line 47
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->clear()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    .line 48
    return-void
.end method


# virtual methods
.method public clear()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 51
    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    .line 52
    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->eventId_:I

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->cachedSize:I

    .line 55
    return-object p0
.end method

.method public clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    .locals 3

    .prologue
    .line 61
    :try_start_0
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->clone()Lcom/google/protobuf/nano/ExtendableMessageNano;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .local v0, "cloned":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    return-object v0

    .line 62
    .end local v0    # "cloned":Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    :catch_0
    move-exception v1

    .line 63
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/ExtendableMessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 5
    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->clone()Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    return-object v0
.end method

.method protected computeSerializedSize()I
    .locals 3

    .prologue
    .line 80
    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    .line 81
    .local v0, "size":I
    iget v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    .line 85
    :goto_0
    return v0

    .line 82
    :cond_0
    iget v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->eventId_:I

    const/4 v2, 0x1

    .line 83
    invoke-static {v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    .locals 2
    .param p1, "input"    # Lcom/google/protobuf/nano/CodedInputByteBufferNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    .line 94
    .local v0, "tag":I
    sparse-switch v0, :sswitch_data_0

    .line 98
    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 99
    return-object p0

    .line 96
    :sswitch_0
    return-object p0

    .line 104
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v1

    iput v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->eventId_:I

    .line 105
    iget v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    goto :goto_0

    .line 94
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;

    move-result-object v0

    return-object v0
.end method

.method public setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    .line 40
    iput p1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->eventId_:I

    .line 41
    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .param p1, "output"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 75
    :goto_0
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 76
    return-void

    .line 73
    :cond_0
    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;->eventId_:I

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    goto :goto_0
.end method
