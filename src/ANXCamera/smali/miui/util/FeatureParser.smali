.class public Lmiui/util/FeatureParser;
.super Ljava/lang/Object;
.source "FeatureParser.java"


# static fields
.field private static final ASSET_DIR:Ljava/lang/String; = "device_features/"

.field private static final SYSTEM_DIR:Ljava/lang/String; = "/sdcard/etc/device_features"

.field private static final TAG:Ljava/lang/String; = "FeatureParser"

.field private static final TAG_BOOL:Ljava/lang/String; = "bool"

.field private static final TAG_FLOAT:Ljava/lang/String; = "float"

.field private static final TAG_INTEGER:Ljava/lang/String; = "integer"

.field private static final TAG_INTEGER_ARRAY:Ljava/lang/String; = "integer-array"

.field private static final TAG_ITEM:Ljava/lang/String; = "item"

.field private static final TAG_STRING:Ljava/lang/String; = "string"

.field private static final TAG_STRING_ARRAY:Ljava/lang/String; = "string-array"

.field public static final TYPE_BOOL:I = 0x1

.field public static final TYPE_FLOAT:I = 0x6

.field public static final TYPE_INTEGER:I = 0x2

.field public static final TYPE_INTEGER_ARRAY:I = 0x5

.field public static final TYPE_STRING:I = 0x3

.field public static final TYPE_STRING_ARRAY:I = 0x4

.field private static sBooleanMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static sFloatMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static sIntArrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sIntMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sStrArrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sStrMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    .line 58
    invoke-static {}, Lmiui/util/FeatureParser;->read()V

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoolean(Ljava/lang/String;Z)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Z

    .prologue
    .line 63
    sget-object v1, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 64
    .local v0, "value":Ljava/lang/Boolean;
    if-eqz v0, :cond_f

    .line 65
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 67
    :cond_f
    return p1
.end method

.method public static getFloat(Ljava/lang/String;F)Ljava/lang/Float;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F

    .prologue
    .line 104
    sget-object v1, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 105
    .local v0, "value":Ljava/lang/Float;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .end local p1    # "defaultValue":F
    :cond_e
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1
.end method

.method public static getIntArray(Ljava/lang/String;)[I
    .registers 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 83
    sget-object v4, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v4, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 84
    .local v2, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v2, :cond_24

    .line 85
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 86
    .local v3, "length":I
    new-array v1, v3, [I

    .line 87
    .local v1, "intArr":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    if-ge v0, v3, :cond_23

    .line 88
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v1, v0

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 90
    :cond_23
    return-object v1

    .line 92
    .end local v0    # "i":I
    .end local v1    # "intArr":[I
    .end local v3    # "length":I
    :cond_24
    return-object v5
.end method

.method public static getInteger(Ljava/lang/String;I)I
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 75
    sget-object v1, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 76
    .local v0, "value":Ljava/lang/Integer;
    if-eqz v0, :cond_f

    .line 77
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 79
    :cond_f
    return p1
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    sget-object v0, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getStringArray(Ljava/lang/String;)[Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 96
    sget-object v1, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 97
    .local v0, "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v0, :cond_15

    .line 98
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 100
    :cond_15
    return-object v2
.end method

.method public static hasFeature(Ljava/lang/String;I)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "type"    # I

    .prologue
    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "result":Z
    packed-switch p1, :pswitch_data_30

    .line 132
    .end local v0    # "result":Z
    :goto_4
    return v0

    .line 112
    .restart local v0    # "result":Z
    :pswitch_5
    sget-object v1, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 115
    .local v0, "result":Z
    :pswitch_c
    sget-object v1, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 118
    .local v0, "result":Z
    :pswitch_13
    sget-object v1, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 121
    .local v0, "result":Z
    :pswitch_1a
    sget-object v1, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 124
    .local v0, "result":Z
    :pswitch_21
    sget-object v1, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 127
    .local v0, "result":Z
    :pswitch_28
    sget-object v1, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_4

    .line 110
    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_5
        :pswitch_c
        :pswitch_13
        :pswitch_21
        :pswitch_1a
        :pswitch_28
    .end packed-switch
.end method

.method private static read()V
    .registers 17

    .prologue
    .line 137
    const/4 v6, 0x0

    .line 139
    .local v6, "inputStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 140
    .local v5, "fileName":Ljava/lang/String;
    :try_start_2
    const-string/jumbo v14, "cancro"

    sget-object v15, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_81

    .line 141
    sget-object v14, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v15, "MI 3"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_72

    .line 142
    const-string/jumbo v5, "cancro_MI3.xml"
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1b} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_1b} :catch_15a
    .catchall {:try_start_2 .. :try_end_1b} :catchall_177

    .line 150
    .end local v5    # "fileName":Ljava/lang/String;
    :cond_1b
    :goto_1b
    :try_start_1b
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "device_features/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_3a} :catch_98
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b .. :try_end_3a} :catch_15a
    .catchall {:try_start_1b .. :try_end_3a} :catchall_177

    move-result-object v6

    .local v6, "inputStream":Ljava/io/InputStream;
    move-object v7, v6

    .line 155
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .local v7, "inputStream":Ljava/io/InputStream;
    :goto_3c
    if-nez v7, :cond_1fd

    .line 156
    :try_start_3e
    new-instance v4, Ljava/io/File;

    const-string/jumbo v14, "/sdcard/etc/device_features"

    invoke-direct {v4, v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_d2

    .line 158
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_51} :catch_1f5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3e .. :try_end_51} :catch_1f9
    .catchall {:try_start_3e .. :try_end_51} :catchall_1f2

    .line 165
    .end local v4    # "file":Ljava/io/File;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :goto_51
    :try_start_51
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v3

    .line 166
    .local v3, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v10

    .line 167
    .local v10, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v14, "UTF-8"

    invoke-interface {v10, v6, v14}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 169
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v13

    .line 170
    .local v13, "type":I
    const/4 v12, 0x0

    .line 171
    .local v12, "tagName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 172
    .local v9, "keyName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 173
    .local v8, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v11, 0x0

    .line 174
    .end local v8    # "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v9    # "keyName":Ljava/lang/String;
    .end local v12    # "tagName":Ljava/lang/String;
    :goto_67
    const/4 v14, 0x1

    if-eq v14, v13, :cond_1e3

    .line 175
    packed-switch v13, :pswitch_data_200

    .line 214
    :cond_6d
    :goto_6d
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v13

    goto :goto_67

    .line 143
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v13    # "type":I
    .restart local v5    # "fileName":Ljava/lang/String;
    .local v6, "inputStream":Ljava/io/InputStream;
    :cond_72
    sget-object v14, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v15, "MI 4"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1b

    .line 144
    const-string/jumbo v5, "cancro_MI4.xml"

    .local v5, "fileName":Ljava/lang/String;
    goto :goto_1b

    .line 146
    .local v5, "fileName":Ljava/lang/String;
    :cond_81
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v15, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ".xml"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .local v5, "fileName":Ljava/lang/String;
    goto :goto_1b

    .line 151
    .end local v5    # "fileName":Ljava/lang/String;
    :catch_98
    move-exception v0

    .line 152
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v14, "FeatureParser"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "can\'t find "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " in assets/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "device_features/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 153
    const-string/jumbo v16, ",it may be in "

    .line 152
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 153
    const-string/jumbo v16, "/sdcard/etc/device_features"

    .line 152
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_cf} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_51 .. :try_end_cf} :catch_15a
    .catchall {:try_start_51 .. :try_end_cf} :catchall_177

    move-object v7, v6

    .restart local v7    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_3c

    .line 160
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "file":Ljava/io/File;
    :cond_d2
    :try_start_d2
    const-string/jumbo v14, "FeatureParser"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "both assets/device_features/ and /sdcard/device_features don\'t exist "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_ec
    .catch Ljava/io/IOException; {:try_start_d2 .. :try_end_ec} :catch_1f5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d2 .. :try_end_ec} :catch_1f9
    .catchall {:try_start_d2 .. :try_end_ec} :catchall_1f2

    .line 220
    if-eqz v7, :cond_f1

    .line 222
    :try_start_ee
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_f1
    .catch Ljava/io/IOException; {:try_start_ee .. :try_end_f1} :catch_f2

    .line 162
    :cond_f1
    :goto_f1
    return-void

    .line 223
    :catch_f2
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    goto :goto_f1

    .line 177
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "file":Ljava/io/File;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .local v6, "inputStream":Ljava/io/InputStream;
    .restart local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v13    # "type":I
    :pswitch_f4
    :try_start_f4
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 178
    .local v12, "tagName":Ljava/lang/String;
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v14

    if-lez v14, :cond_103

    .line 179
    const/4 v14, 0x0

    invoke-interface {v10, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v9

    .line 181
    :cond_103
    const-string/jumbo v14, "integer-array"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_113

    .line 182
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .local v8, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    goto/16 :goto_6d

    .line 183
    .end local v8    # "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_113
    const-string/jumbo v14, "string-array"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_123

    .line 184
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .local v11, "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    goto/16 :goto_6d

    .line 185
    .end local v11    # "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_123
    const-string/jumbo v14, "bool"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_142

    .line 186
    sget-object v14, Lmiui/util/FeatureParser;->sBooleanMap:Ljava/util/HashMap;

    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v14, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_139
    .catch Ljava/io/IOException; {:try_start_f4 .. :try_end_139} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f4 .. :try_end_139} :catch_15a
    .catchall {:try_start_f4 .. :try_end_139} :catchall_177

    goto/16 :goto_6d

    .line 217
    .end local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "tagName":Ljava/lang/String;
    .end local v13    # "type":I
    :catch_13b
    move-exception v0

    .line 220
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_13c
    if-eqz v6, :cond_141

    .line 222
    :try_start_13e
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_141
    .catch Ljava/io/IOException; {:try_start_13e .. :try_end_141} :catch_1ed

    .line 229
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v13    # "type":I
    :cond_141
    :goto_141
    return-void

    .line 187
    .restart local v12    # "tagName":Ljava/lang/String;
    :cond_142
    :try_start_142
    const-string/jumbo v14, "integer"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_163

    .line 188
    sget-object v14, Lmiui/util/FeatureParser;->sIntMap:Ljava/util/HashMap;

    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v14, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_158
    .catch Ljava/io/IOException; {:try_start_142 .. :try_end_158} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_142 .. :try_end_158} :catch_15a
    .catchall {:try_start_142 .. :try_end_158} :catchall_177

    goto/16 :goto_6d

    .line 218
    .end local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "tagName":Ljava/lang/String;
    .end local v13    # "type":I
    :catch_15a
    move-exception v1

    .line 220
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_15b
    if-eqz v6, :cond_141

    .line 222
    :try_start_15d
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_160
    .catch Ljava/io/IOException; {:try_start_15d .. :try_end_160} :catch_161

    goto :goto_141

    .line 223
    :catch_161
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    goto :goto_141

    .line 189
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v12    # "tagName":Ljava/lang/String;
    .restart local v13    # "type":I
    :cond_163
    :try_start_163
    const-string/jumbo v14, "string"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_17e

    .line 190
    sget-object v14, Lmiui/util/FeatureParser;->sStrMap:Ljava/util/HashMap;

    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_175
    .catch Ljava/io/IOException; {:try_start_163 .. :try_end_175} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_163 .. :try_end_175} :catch_15a
    .catchall {:try_start_163 .. :try_end_175} :catchall_177

    goto/16 :goto_6d

    .line 219
    .end local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "tagName":Ljava/lang/String;
    .end local v13    # "type":I
    :catchall_177
    move-exception v14

    .line 220
    :goto_178
    if-eqz v6, :cond_17d

    .line 222
    :try_start_17a
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_17d
    .catch Ljava/io/IOException; {:try_start_17a .. :try_end_17d} :catch_1f0

    .line 219
    :cond_17d
    :goto_17d
    throw v14

    .line 191
    .restart local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v12    # "tagName":Ljava/lang/String;
    .restart local v13    # "type":I
    :cond_17e
    :try_start_17e
    const-string/jumbo v14, "float"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_19a

    .line 192
    sget-object v14, Lmiui/util/FeatureParser;->sFloatMap:Ljava/util/HashMap;

    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v15

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-virtual {v14, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6d

    .line 193
    :cond_19a
    const-string/jumbo v14, "item"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6d

    .line 194
    if-eqz v8, :cond_1b2

    .line 195
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6d

    .line 196
    :cond_1b2
    if-eqz v11, :cond_6d

    .line 197
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6d

    .line 202
    .end local v12    # "tagName":Ljava/lang/String;
    :pswitch_1bd
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "end_tag_name":Ljava/lang/String;
    const-string/jumbo v14, "integer-array"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1d2

    .line 204
    sget-object v14, Lmiui/util/FeatureParser;->sIntArrMap:Ljava/util/HashMap;

    invoke-virtual {v14, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const/4 v8, 0x0

    .local v8, "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    goto/16 :goto_6d

    .line 206
    .end local v8    # "intList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_1d2
    const-string/jumbo v14, "string-array"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6d

    .line 207
    sget-object v14, Lmiui/util/FeatureParser;->sStrArrMap:Ljava/util/HashMap;

    invoke-virtual {v14, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e0
    .catch Ljava/io/IOException; {:try_start_17e .. :try_end_1e0} :catch_13b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_17e .. :try_end_1e0} :catch_15a
    .catchall {:try_start_17e .. :try_end_1e0} :catchall_177

    .line 208
    const/4 v11, 0x0

    .local v11, "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    goto/16 :goto_6d

    .line 220
    .end local v2    # "end_tag_name":Ljava/lang/String;
    .end local v11    # "strList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1e3
    if-eqz v6, :cond_141

    .line 222
    :try_start_1e5
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_1e8
    .catch Ljava/io/IOException; {:try_start_1e5 .. :try_end_1e8} :catch_1ea

    goto/16 :goto_141

    .line 223
    :catch_1ea
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    goto/16 :goto_141

    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .end local v10    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v13    # "type":I
    :catch_1ed
    move-exception v0

    goto/16 :goto_141

    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :catch_1f0
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    goto :goto_17d

    .line 219
    .end local v0    # "e":Ljava/io/IOException;
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :catchall_1f2
    move-exception v14

    move-object v6, v7

    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    goto :goto_178

    .line 217
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :catch_1f5
    move-exception v0

    .restart local v0    # "e":Ljava/io/IOException;
    move-object v6, v7

    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_13c

    .line 218
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :catch_1f9
    move-exception v1

    .restart local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    move-object v6, v7

    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_15b

    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :cond_1fd
    move-object v6, v7

    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_51

    .line 175
    :pswitch_data_200
    .packed-switch 0x2
        :pswitch_f4
        :pswitch_1bd
    .end packed-switch
.end method
