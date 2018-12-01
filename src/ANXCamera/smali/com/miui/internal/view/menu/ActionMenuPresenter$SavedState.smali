.class Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public Pr:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 461
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState$1;

    invoke-direct {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState$1;-><init>()V

    .line 460
    sput-object v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 439
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 444
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .registers 3

    .prologue
    .line 446
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 447
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->Pr:I

    .line 448
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 452
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    .prologue
    .line 457
    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->Pr:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 458
    return-void
.end method
