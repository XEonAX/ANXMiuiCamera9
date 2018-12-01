.class public final Lcom/miui/internal/R$bool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "bool"
.end annotation


# static fields
.field public static abc_action_bar_expanded_action_views_exclusive:I

.field public static abc_config_allowActionMenuItemTextWithIcon:I

.field public static abc_config_showMenuShortcutsWhenKeyboardPresent:I

.field public static abc_split_action_bar_is_narrow:I

.field public static action_bar_embed_tabs:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1389
    const v0, 0x10100006

    sput v0, Lcom/miui/internal/R$bool;->abc_action_bar_expanded_action_views_exclusive:I

    .line 1394
    const v0, 0x10100002

    sput v0, Lcom/miui/internal/R$bool;->abc_config_allowActionMenuItemTextWithIcon:I

    .line 1397
    const v0, 0x10100008

    sput v0, Lcom/miui/internal/R$bool;->abc_config_showMenuShortcutsWhenKeyboardPresent:I

    .line 1400
    const v0, 0x10100007

    sput v0, Lcom/miui/internal/R$bool;->abc_split_action_bar_is_narrow:I

    .line 1404
    const v0, 0x10100004

    sput v0, Lcom/miui/internal/R$bool;->action_bar_embed_tabs:I

    .line 1386
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
