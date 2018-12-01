.class public abstract Lcom/google/protobuf/nano/ExtendableMessageNano;
.super Lcom/google/protobuf/nano/MessageNano;
.source "ExtendableMessageNano.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Lcom/google/protobuf/nano/ExtendableMessageNano",
        "<TM;>;>",
        "Lcom/google/protobuf/nano/MessageNano;"
    }
.end annotation


# instance fields
.field protected unknownFieldData:Lcom/google/protobuf/nano/FieldArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    invoke-direct {p0}, Lcom/google/protobuf/nano/MessageNano;-><init>()V

    return-void
.end method

.method private storeUnknownFieldData(ILcom/google/protobuf/nano/UnknownFieldData;)V
    .locals 2
    .param p1, "fieldNumber"    # I
    .param p2, "unknownField"    # Lcom/google/protobuf/nano/UnknownFieldData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    const/4 v0, 0x0

    .line 175
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    iget-object v1, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v1, :cond_0

    .line 178
    iget-object v1, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v1, p1}, Lcom/google/protobuf/nano/FieldArray;->get(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 180
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :goto_0
    if-eqz v0, :cond_1

    .line 184
    :goto_1
    invoke-virtual {v0, p2}, Lcom/google/protobuf/nano/FieldData;->addUnknownField(Lcom/google/protobuf/nano/UnknownFieldData;)V

    .line 185
    return-void

    .line 176
    .restart local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_0
    new-instance v1, Lcom/google/protobuf/nano/FieldArray;

    invoke-direct {v1}, Lcom/google/protobuf/nano/FieldArray;-><init>()V

    iput-object v1, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    goto :goto_0

    .line 181
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_1
    new-instance v0, Lcom/google/protobuf/nano/FieldData;

    invoke-direct {v0}, Lcom/google/protobuf/nano/FieldData;-><init>()V

    .line 182
    .restart local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    iget-object v1, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v1, p1, v0}, Lcom/google/protobuf/nano/FieldArray;->put(ILcom/google/protobuf/nano/FieldData;)V

    goto :goto_1
.end method


# virtual methods
.method public clone()Lcom/google/protobuf/nano/ExtendableMessageNano;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    invoke-super {p0}, Lcom/google/protobuf/nano/MessageNano;->clone()Lcom/google/protobuf/nano/MessageNano;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/nano/ExtendableMessageNano;

    .line 232
    .local v0, "cloned":Lcom/google/protobuf/nano/ExtendableMessageNano;, "TM;"
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/InternalNano;->cloneUnknownFieldData(Lcom/google/protobuf/nano/ExtendableMessageNano;Lcom/google/protobuf/nano/ExtendableMessageNano;)V

    .line 233
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
    .line 39
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->clone()Lcom/google/protobuf/nano/ExtendableMessageNano;

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
    .line 39
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->clone()Lcom/google/protobuf/nano/ExtendableMessageNano;

    move-result-object v0

    return-object v0
.end method

.method protected computeSerializedSize()I
    .locals 4

    .prologue
    .line 49
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    const/4 v2, 0x0

    .line 50
    .local v2, "size":I
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-nez v3, :cond_1

    .line 56
    :cond_0
    return v2

    .line 51
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v3}, Lcom/google/protobuf/nano/FieldArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 52
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v3, v1}, Lcom/google/protobuf/nano/FieldArray;->dataAt(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 53
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    invoke-virtual {v0}, Lcom/google/protobuf/nano/FieldData;->computeSerializedSize()I

    move-result v3

    add-int/2addr v2, v3

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public final getExtension(Lcom/google/protobuf/nano/Extension;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/nano/Extension",
            "<TM;TT;>;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    const/4 v1, 0x0

    .line 107
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v2, :cond_1

    .line 110
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    iget v3, p1, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v3}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/google/protobuf/nano/FieldArray;->get(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 111
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/nano/FieldData;->getValue(Lcom/google/protobuf/nano/Extension;)Ljava/lang/Object;

    move-result-object v1

    :cond_0
    return-object v1

    .line 108
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_1
    return-object v1
.end method

.method public final hasExtension(Lcom/google/protobuf/nano/Extension;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/nano/Extension",
            "<TM;*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;*>;"
    const/4 v1, 0x0

    .line 96
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v2, :cond_0

    .line 99
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    iget v3, p1, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v3}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/google/protobuf/nano/FieldArray;->get(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 100
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    if-nez v0, :cond_1

    :goto_0
    return v1

    .line 97
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_0
    return v1

    .line 100
    .restart local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public final setExtension(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)Lcom/google/protobuf/nano/ExtendableMessageNano;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/nano/Extension",
            "<TM;TT;>;TT;)TM;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    .local p1, "extension":Lcom/google/protobuf/nano/Extension;, "Lcom/google/protobuf/nano/Extension<TM;TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x0

    .line 118
    iget v3, p1, Lcom/google/protobuf/nano/Extension;->tag:I

    invoke-static {v3}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v1

    .line 119
    .local v1, "fieldNumber":I
    if-eqz p2, :cond_1

    .line 127
    const/4 v0, 0x0

    .line 128
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v3, :cond_2

    .line 131
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v3, v1}, Lcom/google/protobuf/nano/FieldArray;->get(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 133
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :goto_0
    if-eqz v0, :cond_3

    .line 136
    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/nano/FieldData;->setValue(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)V

    .line 141
    :cond_0
    :goto_1
    move-object v2, p0

    .line 142
    .local v2, "typedThis":Lcom/google/protobuf/nano/ExtendableMessageNano;, "TM;"
    return-object p0

    .line 120
    .end local v2    # "typedThis":Lcom/google/protobuf/nano/ExtendableMessageNano;, "TM;"
    :cond_1
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v3, :cond_0

    .line 121
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v3, v1}, Lcom/google/protobuf/nano/FieldArray;->remove(I)V

    .line 122
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v3}, Lcom/google/protobuf/nano/FieldArray;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 123
    iput-object v4, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    goto :goto_1

    .line 129
    .restart local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_2
    new-instance v3, Lcom/google/protobuf/nano/FieldArray;

    invoke-direct {v3}, Lcom/google/protobuf/nano/FieldArray;-><init>()V

    iput-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    goto :goto_0

    .line 134
    .end local v0    # "field":Lcom/google/protobuf/nano/FieldData;
    :cond_3
    iget-object v3, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    new-instance v4, Lcom/google/protobuf/nano/FieldData;

    invoke-direct {v4, p1, p2}, Lcom/google/protobuf/nano/FieldData;-><init>(Lcom/google/protobuf/nano/Extension;Ljava/lang/Object;)V

    invoke-virtual {v3, v1, v4}, Lcom/google/protobuf/nano/FieldArray;->put(ILcom/google/protobuf/nano/FieldData;)V

    goto :goto_1
.end method

.method protected final storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z
    .locals 6
    .param p1, "input"    # Lcom/google/protobuf/nano/CodedInputByteBufferNano;
    .param p2, "tag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    const/4 v5, 0x0

    .line 161
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v3

    .line 162
    .local v3, "startPos":I
    invoke-virtual {p1, p2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->skipField(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 165
    invoke-static {p2}, Lcom/google/protobuf/nano/WireFormatNano;->getTagFieldNumber(I)I

    move-result v2

    .line 166
    .local v2, "fieldNumber":I
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    .line 167
    .local v1, "endPos":I
    sub-int v4, v1, v3

    invoke-virtual {p1, v3, v4}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getData(II)[B

    move-result-object v0

    .line 168
    .local v0, "bytes":[B
    new-instance v4, Lcom/google/protobuf/nano/UnknownFieldData;

    invoke-direct {v4, p2, v0}, Lcom/google/protobuf/nano/UnknownFieldData;-><init>(I[B)V

    invoke-direct {p0, v2, v4}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownFieldData(ILcom/google/protobuf/nano/UnknownFieldData;)V

    .line 169
    const/4 v4, 0x1

    return v4

    .line 163
    .end local v0    # "bytes":[B
    .end local v1    # "endPos":I
    .end local v2    # "fieldNumber":I
    :cond_0
    return v5
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .param p1, "output"    # Lcom/google/protobuf/nano/CodedOutputByteBufferNano;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/google/protobuf/nano/ExtendableMessageNano;, "Lcom/google/protobuf/nano/ExtendableMessageNano<TM;>;"
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    if-eqz v2, :cond_0

    .line 75
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v2}, Lcom/google/protobuf/nano/FieldArray;->size()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 79
    return-void

    .line 73
    .end local v1    # "i":I
    :cond_0
    return-void

    .line 76
    .restart local v1    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/google/protobuf/nano/ExtendableMessageNano;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    invoke-virtual {v2, v1}, Lcom/google/protobuf/nano/FieldArray;->dataAt(I)Lcom/google/protobuf/nano/FieldData;

    move-result-object v0

    .line 77
    .local v0, "field":Lcom/google/protobuf/nano/FieldData;
    invoke-virtual {v0, p1}, Lcom/google/protobuf/nano/FieldData;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 75
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
