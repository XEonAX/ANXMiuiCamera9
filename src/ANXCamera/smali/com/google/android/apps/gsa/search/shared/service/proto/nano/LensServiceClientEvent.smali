.class public abstract Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEvent;
.super Ljava/lang/Object;
.source "LensServiceClientEvent.java"


# static fields
.field public static final lensServiceClientEventData:Lcom/google/protobuf/nano/Extension;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/nano/Extension",
            "<",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ClientEventProto;",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 15
    const/16 v0, 0xb

    const-class v1, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEventData;

    const-wide/32 v2, 0x48cc184a

    .line 16
    invoke-static {v0, v1, v2, v3}, Lcom/google/protobuf/nano/Extension;->createMessageTyped(ILjava/lang/Class;J)Lcom/google/protobuf/nano/Extension;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/LensServiceClientEvent;->lensServiceClientEventData:Lcom/google/protobuf/nano/Extension;

    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
