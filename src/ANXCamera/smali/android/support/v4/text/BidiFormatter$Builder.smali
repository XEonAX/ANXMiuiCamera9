.class public final Landroid/support/v4/text/BidiFormatter$Builder;
.super Ljava/lang/Object;
.source "BidiFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/BidiFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mFlags:I

.field private mIsRtlContext:Z

.field private mTextDirectionHeuristicCompat:Landroid/support/v4/text/TextDirectionHeuristicCompat;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/text/BidiFormatter;->access$000(Ljava/util/Locale;)Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v4/text/BidiFormatter$Builder;->initialize(Z)V

    .line 139
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    invoke-static {p1}, Landroid/support/v4/text/BidiFormatter;->access$000(Ljava/util/Locale;)Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v4/text/BidiFormatter$Builder;->initialize(Z)V

    .line 157
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "rtlContext"    # Z

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    invoke-direct {p0, p1}, Landroid/support/v4/text/BidiFormatter$Builder;->initialize(Z)V

    .line 148
    return-void
.end method

.method private static getDefaultInstanceFromContext(Z)Landroid/support/v4/text/BidiFormatter;
    .registers 2
    .param p0, "isRtlContext"    # Z

    .prologue
    .line 196
    if-nez p0, :cond_7

    # getter for: Landroid/support/v4/text/BidiFormatter;->DEFAULT_LTR_INSTANCE:Landroid/support/v4/text/BidiFormatter;
    invoke-static {}, Landroid/support/v4/text/BidiFormatter;->access$300()Landroid/support/v4/text/BidiFormatter;

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    # getter for: Landroid/support/v4/text/BidiFormatter;->DEFAULT_RTL_INSTANCE:Landroid/support/v4/text/BidiFormatter;
    invoke-static {}, Landroid/support/v4/text/BidiFormatter;->access$200()Landroid/support/v4/text/BidiFormatter;

    move-result-object v0

    goto :goto_6
.end method

.method private initialize(Z)V
    .registers 3
    .param p1, "isRtlContext"    # Z

    .prologue
    .line 165
    iput-boolean p1, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mIsRtlContext:Z

    .line 166
    invoke-static {}, Landroid/support/v4/text/BidiFormatter;->access$100()Landroid/support/v4/text/TextDirectionHeuristicCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mTextDirectionHeuristicCompat:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 167
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    .line 168
    return-void
.end method


# virtual methods
.method public build()Landroid/support/v4/text/BidiFormatter;
    .registers 6

    .prologue
    .line 203
    iget v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_12

    .line 207
    :cond_5
    new-instance v0, Landroid/support/v4/text/BidiFormatter;

    iget-boolean v1, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mIsRtlContext:Z

    iget v2, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    iget-object v3, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mTextDirectionHeuristicCompat:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/support/v4/text/BidiFormatter;-><init>(ZILandroid/support/v4/text/TextDirectionHeuristicCompat;Landroid/support/v4/text/BidiFormatter$1;)V

    return-object v0

    .line 203
    :cond_12
    iget-object v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mTextDirectionHeuristicCompat:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    invoke-static {}, Landroid/support/v4/text/BidiFormatter;->access$100()Landroid/support/v4/text/TextDirectionHeuristicCompat;

    move-result-object v1

    if-ne v0, v1, :cond_5

    .line 205
    iget-boolean v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mIsRtlContext:Z

    invoke-static {v0}, Landroid/support/v4/text/BidiFormatter$Builder;->getDefaultInstanceFromContext(Z)Landroid/support/v4/text/BidiFormatter;

    move-result-object v0

    return-object v0
.end method

.method public setTextDirectionHeuristic(Landroid/support/v4/text/TextDirectionHeuristicCompat;)Landroid/support/v4/text/BidiFormatter$Builder;
    .registers 2
    .param p1, "heuristic"    # Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .prologue
    .line 191
    iput-object p1, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mTextDirectionHeuristicCompat:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    .line 192
    return-object p0
.end method

.method public stereoReset(Z)Landroid/support/v4/text/BidiFormatter$Builder;
    .registers 3
    .param p1, "stereoReset"    # Z

    .prologue
    .line 175
    if-nez p1, :cond_9

    .line 178
    iget v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    .line 180
    :goto_8
    return-object p0

    .line 176
    :cond_9
    iget v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/support/v4/text/BidiFormatter$Builder;->mFlags:I

    goto :goto_8
.end method
