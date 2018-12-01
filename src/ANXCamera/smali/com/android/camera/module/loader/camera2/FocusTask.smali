.class public Lcom/android/camera/module/loader/camera2/FocusTask;
.super Ljava/lang/Object;
.source "FocusTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/FocusTask$1;,
        Lcom/android/camera/module/loader/camera2/FocusTask$FocusTriggerBy;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mElapsedTime:J

.field private mFocusBy:I

.field private mFocusStartTime:J

.field private mSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusTask$1;

    invoke-direct {v0}, Lcom/android/camera/module/loader/camera2/FocusTask$1;-><init>()V

    sput-object v0, Lcom/android/camera/module/loader/camera2/FocusTask;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 14
    return-void
.end method

.method private constructor <init>(I)V
    .locals 2
    .param p1, "focusBy"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusBy:I

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusStartTime:J

    .line 38
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusBy:I

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusStartTime:J

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mElapsedTime:J

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mSuccess:Z

    .line 84
    return-void
.end method

.method public static final create(I)Lcom/android/camera/module/loader/camera2/FocusTask;
    .locals 1
    .param p0, "focusBy"    # I

    .prologue
    .line 32
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/FocusTask;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public getElapsedTime()J
    .locals 4

    .prologue
    .line 58
    iget-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusStartTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unknown focus time"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mElapsedTime:J

    return-wide v0
.end method

.method public getFocusTrigger()I
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusBy:I

    return v0
.end method

.method public isFocusing()Z
    .locals 4

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mElapsedTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mSuccess:Z

    return v0
.end method

.method public setResult(Z)V
    .locals 4
    .param p1, "result"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mSuccess:Z

    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mElapsedTime:J

    .line 47
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 73
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusBy:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    iget-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mFocusStartTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 75
    iget-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mElapsedTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 76
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusTask;->mSuccess:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 77
    return-void

    .line 76
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
