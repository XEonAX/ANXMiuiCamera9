.class public final Lcom/android/camera/data/data/ComponentDataItem;
.super Ljava/lang/Object;
.source "ComponentDataItem.java"


# instance fields
.field public mDisplayNameRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field public mIconRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public mIconSelectedRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIILjava/lang/String;)V
    .locals 0
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "iconSelectedRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "nameRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/android/camera/data/data/ComponentDataItem;->mIconRes:I

    .line 17
    iput p2, p0, Lcom/android/camera/data/data/ComponentDataItem;->mIconSelectedRes:I

    .line 18
    iput p3, p0, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    .line 19
    iput-object p4, p0, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 20
    return-void
.end method
