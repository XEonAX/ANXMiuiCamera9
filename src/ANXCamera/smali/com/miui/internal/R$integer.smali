.class public final Lcom/miui/internal/R$integer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "integer"
.end annotation


# static fields
.field public static abc_max_action_buttons:I

.field public static action_bar_appear_duration:I

.field public static action_bar_disappear_duration:I

.field public static action_bar_tab_layout_weight:I

.field public static action_menu_item_anim_delay:I

.field public static action_menu_item_appear_duration:I

.field public static button_exit_fade_duration:I

.field public static window_translucent_status:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2252
    const/high16 v0, 0x10080000

    sput v0, Lcom/miui/internal/R$integer;->abc_max_action_buttons:I

    .line 2253
    const v0, 0x10080009

    sput v0, Lcom/miui/internal/R$integer;->action_bar_appear_duration:I

    .line 2254
    const v0, 0x10080008

    sput v0, Lcom/miui/internal/R$integer;->action_bar_disappear_duration:I

    .line 2255
    const v0, 0x10080005

    sput v0, Lcom/miui/internal/R$integer;->action_bar_tab_layout_weight:I

    .line 2256
    const v0, 0x1008000b

    sput v0, Lcom/miui/internal/R$integer;->action_menu_item_anim_delay:I

    .line 2257
    const v0, 0x1008000a

    sput v0, Lcom/miui/internal/R$integer;->action_menu_item_appear_duration:I

    .line 2260
    const v0, 0x10080001

    sput v0, Lcom/miui/internal/R$integer;->button_exit_fade_duration:I

    .line 2263
    const v0, 0x10080007

    sput v0, Lcom/miui/internal/R$integer;->window_translucent_status:I

    .line 2247
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
