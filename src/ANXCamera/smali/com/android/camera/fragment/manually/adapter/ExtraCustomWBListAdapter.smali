.class public Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;
.super Landroid/widget/BaseAdapter;
.source "ExtraCustomWBListAdapter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

.field private mOnCreated:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/ComponentManuallyWB;Lcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 1
    .param p1, "componentData"    # Lcom/android/camera/data/data/config/ComponentManuallyWB;
    .param p2, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    .line 34
    iput-object p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    .line 35
    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    .line 36
    return-void
.end method

.method private changeValue(I)V
    .locals 7
    .param p1, "position"    # I

    .prologue
    .line 99
    mul-int/lit8 v2, p1, 0x64

    add-int/lit16 v0, v2, 0x7d0

    .line 100
    .local v0, "newValue":I
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getCustomWB()I

    move-result v1

    .line 101
    .local v1, "oldValue":I
    if-eq v0, v1, :cond_0

    .line 102
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->setCustomWB(I)V

    .line 103
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz v2, :cond_0

    .line 104
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 107
    :cond_0
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 40
    const/16 v0, 0x3d

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 45
    int-to-long v0, p1

    return-wide v0
.end method

.method public getValuePosition()I
    .locals 2

    .prologue
    .line 110
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mManuallyWB:Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getCustomWB()I

    move-result v0

    .line 111
    .local v0, "custWB":I
    add-int/lit16 v1, v0, -0x7d0

    div-int/lit8 v1, v1, 0x64

    return v1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 56
    if-nez p2, :cond_0

    .line 57
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 58
    const v3, 0x7f040011

    .line 57
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 59
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;

    invoke-direct {v0, v4}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)V

    .line 60
    .local v0, "holder":Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;
    const v2, 0x7f0a0041

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/ColorImageView;

    invoke-static {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->-set0(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;Lcom/android/camera/ui/ColorImageView;)Lcom/android/camera/ui/ColorImageView;

    .line 61
    const v2, 0x7f0a0042

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/ColorActivateTextView;

    invoke-static {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->-set1(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;Lcom/android/camera/ui/ColorActivateTextView;)Lcom/android/camera/ui/ColorActivateTextView;

    .line 62
    invoke-static {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->-get0(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object v2

    const v3, -0x4c000001

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    .line 63
    invoke-static {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->-get0(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object v2

    const v3, -0xff5701

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    .line 64
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 69
    :goto_0
    mul-int/lit8 v2, p1, 0x64

    add-int/lit16 v2, v2, 0x7d0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "value":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;->-get0(Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;)Lcom/android/camera/ui/ColorActivateTextView;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    return-object p2

    .line 66
    .end local v0    # "holder":Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;
    .end local v1    # "value":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;

    .restart local v0    # "holder":Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter$ViewHolder;
    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-boolean v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    if-eqz v0, :cond_0

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->mOnCreated:Z

    .line 81
    return-void

    .line 83
    :cond_0
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 85
    check-cast p1, Lcom/android/camera/ui/HorizontalListView;

    .end local p1    # "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalListView;->isScrolling()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    return-void

    .line 89
    :cond_1
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->changeValue(I)V

    .line 90
    return-void
.end method

.method public onSingleTapDown(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 95
    invoke-direct {p0, p3}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->changeValue(I)V

    .line 96
    return-void
.end method
