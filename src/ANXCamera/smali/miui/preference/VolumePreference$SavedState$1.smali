.class final Lmiui/preference/VolumePreference$SavedState$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/preference/VolumePreference$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lmiui/preference/VolumePreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 232
    invoke-virtual {p0, p1}, Lmiui/preference/VolumePreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lmiui/preference/VolumePreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lmiui/preference/VolumePreference$SavedState;
    .registers 3

    .prologue
    .line 233
    new-instance v0, Lmiui/preference/VolumePreference$SavedState;

    invoke-direct {v0, p1}, Lmiui/preference/VolumePreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 236
    invoke-virtual {p0, p1}, Lmiui/preference/VolumePreference$SavedState$1;->newArray(I)[Lmiui/preference/VolumePreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lmiui/preference/VolumePreference$SavedState;
    .registers 3

    .prologue
    .line 237
    new-array v0, p1, [Lmiui/preference/VolumePreference$SavedState;

    return-object v0
.end method