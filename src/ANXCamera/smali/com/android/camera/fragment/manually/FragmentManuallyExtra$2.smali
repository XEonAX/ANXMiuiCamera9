.class Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;
.super Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;
.source "FragmentManuallyExtra.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initWBRecyclerView(Lcom/android/camera/data/data/ComponentData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    .param p2, "$anonymous0"    # Lcom/android/camera/data/data/ComponentData;
    .param p3, "$anonymous1"    # I
    .param p4, "$anonymous2"    # Lcom/android/camera/fragment/manually/ManuallyListener;
    .param p5, "$anonymous3"    # I

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;->this$0:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    .line 148
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V

    .line 1
    return-void
.end method


# virtual methods
.method protected couldNewValueTakeEffect(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newValue"    # Ljava/lang/String;

    .prologue
    .line 152
    if-eqz p1, :cond_0

    const-string/jumbo v0, "manual"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    const/4 v0, 0x1

    return v0

    .line 155
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;->couldNewValueTakeEffect(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
