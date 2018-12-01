.class public final Lcom/google/protobuf/nano/MessageNanoPrinter;
.super Ljava/lang/Object;
.source "MessageNanoPrinter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendQuotedBytes([BLjava/lang/StringBuffer;)V
    .locals 7
    .param p0, "bytes"    # [B
    .param p1, "builder"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v6, 0x5c

    const/16 v5, 0x22

    .line 243
    if-eqz p0, :cond_0

    .line 248
    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 249
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-lt v1, v2, :cond_1

    .line 259
    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 260
    return-void

    .line 244
    .end local v1    # "i":I
    :cond_0
    const-string/jumbo v2, "\"\""

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 245
    return-void

    .line 250
    .restart local v1    # "i":I
    :cond_1
    aget-byte v2, p0, v1

    and-int/lit16 v0, v2, 0xff

    .line 251
    .local v0, "ch":I
    if-ne v0, v6, :cond_3

    .line 252
    :cond_2
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    int-to-char v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 249
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 251
    :cond_3
    if-eq v0, v5, :cond_2

    .line 253
    const/16 v2, 0x20

    if-ge v0, v2, :cond_5

    .line 256
    :cond_4
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string/jumbo v3, "\\%03o"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 253
    :cond_5
    const/16 v2, 0x7f

    if-ge v0, v2, :cond_4

    .line 254
    int-to-char v2, v0

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method private static deCamelCaseify(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "identifier"    # Ljava/lang/String;

    .prologue
    .line 197
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 198
    .local v2, "out":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 208
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 199
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 200
    .local v0, "currentChar":C
    if-eqz v1, :cond_1

    .line 202
    invoke-static {v0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 205
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 198
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 201
    :cond_1
    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 203
    :cond_2
    const/16 v3, 0x5f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method private static escapeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 226
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 227
    .local v3, "strLen":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 228
    .local v0, "b":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v3, :cond_0

    .line 236
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 229
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 230
    .local v2, "original":C
    const/16 v4, 0x20

    if-ge v2, v4, :cond_2

    .line 233
    :cond_1
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string/jumbo v5, "\\u%04x"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 230
    :cond_2
    const/16 v4, 0x7e

    if-gt v2, v4, :cond_1

    const/16 v4, 0x22

    if-eq v2, v4, :cond_1

    const/16 v4, 0x27

    if-eq v2, v4, :cond_1

    .line 231
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static print(Lcom/google/protobuf/nano/MessageNano;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/protobuf/nano/MessageNano;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "message":Lcom/google/protobuf/nano/MessageNano;, "TT;"
    if-eqz p0, :cond_0

    .line 65
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 67
    .local v0, "buf":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v4, 0x0

    invoke-static {v4, p0, v3, v0}, Lcom/google/protobuf/nano/MessageNanoPrinter;->print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 62
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_0
    const-string/jumbo v3, ""

    return-object v3

    .line 68
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const-string/jumbo v5, "Error printing proto: "

    if-nez v4, :cond_1

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object v3

    :cond_1
    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 70
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v2

    .line 71
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const-string/jumbo v5, "Error printing proto: "

    if-nez v4, :cond_2

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_1
    return-object v3

    :cond_2
    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private static print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V
    .locals 28
    .param p0, "identifier"    # Ljava/lang/String;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "indentBuf"    # Ljava/lang/StringBuffer;
    .param p3, "buf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 90
    if-eqz p1, :cond_0

    .line 96
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/google/protobuf/nano/MessageNano;

    move/from16 v25, v0

    if-nez v25, :cond_1

    .line 179
    invoke-static/range {p0 .. p0}, Lcom/google/protobuf/nano/MessageNanoPrinter;->deCamelCaseify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 180
    .local p0, "identifier":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, ": "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 181
    move-object/from16 v0, p1

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v25, v0

    if-nez v25, :cond_e

    .line 184
    move-object/from16 v0, p1

    instance-of v0, v0, [B

    move/from16 v25, v0

    if-nez v25, :cond_f

    .line 187
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 189
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    const-string/jumbo v25, "\n"

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    .end local p0    # "identifier":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 97
    .local p0, "identifier":Ljava/lang/String;
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    invoke-virtual/range {p2 .. p2}, Ljava/lang/StringBuffer;->length()I

    move-result v21

    .line 98
    .local v21, "origIndentBufLength":I
    if-nez p0, :cond_2

    .line 102
    :goto_2
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    .line 108
    .local v8, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v8}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .local v4, "-l_6_R":Ljava/lang/Object;
    array-length v5, v4

    .local v5, "-l_7_I":I
    const/4 v6, 0x0

    .local v6, "-l_8_I":I
    :goto_3
    if-lt v6, v5, :cond_3

    .line 145
    invoke-virtual {v8}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_4
    if-lt v6, v5, :cond_9

    .line 173
    if-eqz p0, :cond_0

    .line 174
    move-object/from16 v0, p2

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 175
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, ">\n"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 99
    .end local v4    # "-l_6_R":Ljava/lang/Object;
    .end local v5    # "-l_7_I":I
    .end local v6    # "-l_8_I":I
    .end local v8    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-static/range {p0 .. p0}, Lcom/google/protobuf/nano/MessageNanoPrinter;->deCamelCaseify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, " <\n"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    const-string/jumbo v25, "  "

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 108
    .restart local v4    # "-l_6_R":Ljava/lang/Object;
    .restart local v5    # "-l_7_I":I
    .restart local v6    # "-l_8_I":I
    .restart local v8    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    aget-object v11, v4, v6

    .line 109
    .local v11, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v19

    .line 110
    .local v19, "modifiers":I
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v12

    .line 111
    .local v12, "fieldName":Ljava/lang/String;
    const-string/jumbo v25, "cachedSize"

    move-object/from16 v0, v25

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_4

    .line 116
    and-int/lit8 v25, v19, 0x1

    const/16 v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-eq v0, v1, :cond_5

    .line 108
    :cond_4
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 116
    :cond_5
    and-int/lit8 v25, v19, 0x8

    const/16 v26, 0x8

    move/from16 v0, v25

    move/from16 v1, v26

    if-eq v0, v1, :cond_4

    const-string/jumbo v25, "_"

    .line 118
    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_4

    const-string/jumbo v25, "_"

    .line 119
    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_4

    .line 120
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 121
    .local v13, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    .line 123
    .local v24, "value":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Class;->isArray()Z

    move-result v25

    if-nez v25, :cond_6

    .line 137
    move-object/from16 v0, v24

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v12, v0, v1, v2}, Lcom/google/protobuf/nano/MessageNanoPrinter;->print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V

    goto :goto_5

    .line 124
    :cond_6
    invoke-virtual {v13}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    .line 127
    .local v7, "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v25, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v25

    if-eq v7, v0, :cond_7

    .line 130
    if-eqz v24, :cond_8

    invoke-static/range {v24 .. v24}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v17

    .line 131
    .local v17, "len":I
    :goto_6
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_7
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_4

    .line 132
    move-object/from16 v0, v24

    move/from16 v1, v16

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v10

    .line 133
    .local v10, "elem":Ljava/lang/Object;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v12, v10, v0, v1}, Lcom/google/protobuf/nano/MessageNanoPrinter;->print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V

    .line 131
    add-int/lit8 v16, v16, 0x1

    goto :goto_7

    .line 128
    .end local v10    # "elem":Ljava/lang/Object;
    .end local v16    # "i":I
    .end local v17    # "len":I
    :cond_7
    move-object/from16 v0, v24

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v12, v0, v1, v2}, Lcom/google/protobuf/nano/MessageNanoPrinter;->print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V

    goto :goto_5

    .line 130
    :cond_8
    const/16 v17, 0x0

    goto :goto_6

    .line 145
    .end local v7    # "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "field":Ljava/lang/reflect/Field;
    .end local v12    # "fieldName":Ljava/lang/String;
    .end local v13    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v19    # "modifiers":I
    .end local v24    # "value":Ljava/lang/Object;
    :cond_9
    aget-object v18, v4, v6

    .line 146
    .local v18, "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v20

    .line 149
    .local v20, "name":Ljava/lang/String;
    const-string/jumbo v25, "set"

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_b

    .line 145
    :cond_a
    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_4

    .line 150
    :cond_b
    const/16 v25, 0x3

    move-object/from16 v0, v20

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v23

    .line 152
    .local v23, "subfieldName":Ljava/lang/String;
    const/4 v15, 0x0

    .line 154
    .local v15, "hazzer":Ljava/lang/reflect/Method;
    :try_start_0
    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v26

    const-string/jumbo v27, "has"

    if-nez v26, :cond_c

    new-instance v25, Ljava/lang/String;

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_9
    const/16 v26, 0x0

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v8, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v15

    .line 159
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v15, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/Boolean;

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_a

    .line 163
    const/4 v14, 0x0

    .line 165
    .local v14, "getter":Ljava/lang/reflect/Method;
    :try_start_1
    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v26

    const-string/jumbo v27, "get"

    if-nez v26, :cond_d

    new-instance v25, Ljava/lang/String;

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_a
    const/16 v26, 0x0

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v8, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v14

    .line 170
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v1, v2, v3}, Lcom/google/protobuf/nano/MessageNanoPrinter;->print(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/lang/StringBuffer;)V

    goto/16 :goto_8

    .line 154
    .end local v14    # "getter":Ljava/lang/reflect/Method;
    :cond_c
    :try_start_2
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v25

    goto :goto_9

    .line 155
    :catch_0
    move-exception v9

    .local v9, "e":Ljava/lang/NoSuchMethodException;
    goto/16 :goto_8

    .line 165
    .end local v9    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v14    # "getter":Ljava/lang/reflect/Method;
    :cond_d
    :try_start_3
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v25

    goto :goto_a

    .line 166
    :catch_1
    move-exception v9

    .restart local v9    # "e":Ljava/lang/NoSuchMethodException;
    goto/16 :goto_8

    .line 182
    .end local v4    # "-l_6_R":Ljava/lang/Object;
    .end local v5    # "-l_7_I":I
    .end local v6    # "-l_8_I":I
    .end local v8    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "e":Ljava/lang/NoSuchMethodException;
    .end local v14    # "getter":Ljava/lang/reflect/Method;
    .end local v15    # "hazzer":Ljava/lang/reflect/Method;
    .end local v18    # "method":Ljava/lang/reflect/Method;
    .end local v20    # "name":Ljava/lang/String;
    .end local v21    # "origIndentBufLength":I
    .end local v23    # "subfieldName":Ljava/lang/String;
    .local p0, "identifier":Ljava/lang/String;
    :cond_e
    check-cast p1, Ljava/lang/String;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/nano/MessageNanoPrinter;->sanitizeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 183
    .local v22, "stringMessage":Ljava/lang/String;
    const-string/jumbo v25, "\""

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    const-string/jumbo v26, "\""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    .line 185
    .end local v22    # "stringMessage":Ljava/lang/String;
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_f
    check-cast p1, [B

    .end local p1    # "object":Ljava/lang/Object;
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/google/protobuf/nano/MessageNanoPrinter;->appendQuotedBytes([BLjava/lang/StringBuffer;)V

    goto/16 :goto_0
.end method

.method private static sanitizeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0xc8

    const/4 v1, 0x0

    .line 215
    const-string/jumbo v0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 219
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/google/protobuf/nano/MessageNanoPrinter;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 215
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v2, :cond_0

    .line 217
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "[...]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .local p0, "str":Ljava/lang/String;
    goto :goto_0
.end method
