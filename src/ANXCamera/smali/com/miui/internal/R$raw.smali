.class public final Lcom/miui/internal/R$raw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "raw"
.end annotation


# static fields
.field public static numberpicker_value_change:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2363
    const/high16 v0, 0x100f0000

    sput v0, Lcom/miui/internal/R$raw;->numberpicker_value_change:I

    .line 2362
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
