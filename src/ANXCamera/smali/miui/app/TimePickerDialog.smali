.class public Lmiui/app/TimePickerDialog;
.super Landroid/app/AlertDialog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/TimePickerDialog$OnTimeSetListener;
    }
.end annotation


# static fields
.field private static final Eu:Ljava/lang/String; = "miui:hour"

.field private static final Ev:Ljava/lang/String; = "miui:is24hour"

.field private static final Ew:Ljava/lang/String; = "miui:minute"


# instance fields
.field EA:Z

.field private final EB:Lmiui/widget/TimePicker;

.field private final Ex:Lmiui/app/TimePickerDialog$OnTimeSetListener;

.field Ey:I

.field Ez:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILmiui/app/TimePickerDialog$OnTimeSetListener;IIZ)V
    .registers 12

    .prologue
    const/4 v1, 0x0

    .line 71
    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 72
    iput-object p3, p0, Lmiui/app/TimePickerDialog;->Ex:Lmiui/app/TimePickerDialog$OnTimeSetListener;

    .line 73
    iput p4, p0, Lmiui/app/TimePickerDialog;->Ey:I

    .line 74
    iput p5, p0, Lmiui/app/TimePickerDialog;->Ez:I

    .line 75
    iput-boolean p6, p0, Lmiui/app/TimePickerDialog;->EA:Z

    .line 77
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/TimePickerDialog;->setIcon(I)V

    .line 78
    sget v0, Lcom/miui/internal/R$string;->time_picker_dialog_title:I

    invoke-virtual {p0, v0}, Lmiui/app/TimePickerDialog;->setTitle(I)V

    .line 80
    invoke-virtual {p0}, Lmiui/app/TimePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 81
    const v0, 0x104000a

    invoke-virtual {v2, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v3, Lmiui/app/TimePickerDialog$1;

    invoke-direct {v3, p0}, Lmiui/app/TimePickerDialog$1;-><init>(Lmiui/app/TimePickerDialog;)V

    const/4 v4, -0x1

    invoke-virtual {p0, v4, v0, v3}, Lmiui/app/TimePickerDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 87
    invoke-virtual {p0}, Lmiui/app/TimePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v3, 0x1040000

    invoke-virtual {v0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    move-object v0, v1

    .line 88
    check-cast v0, Landroid/content/DialogInterface$OnClickListener;

    .line 87
    const/4 v4, -0x2

    invoke-virtual {p0, v4, v3, v0}, Lmiui/app/TimePickerDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 91
    const-string/jumbo v0, "layout_inflater"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 92
    sget v2, Lcom/miui/internal/R$layout;->time_picker_dialog:I

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Lmiui/app/TimePickerDialog;->setView(Landroid/view/View;)V

    .line 94
    sget v2, Lcom/miui/internal/R$id;->timePicker:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lmiui/widget/TimePicker;

    iput-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    .line 97
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    iget-boolean v2, p0, Lmiui/app/TimePickerDialog;->EA:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lmiui/widget/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 98
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    iget v2, p0, Lmiui/app/TimePickerDialog;->Ey:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lmiui/widget/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 99
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    iget v2, p0, Lmiui/app/TimePickerDialog;->Ez:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lmiui/widget/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 100
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v0, v1}, Lmiui/widget/TimePicker;->setOnTimeChangedListener(Lmiui/widget/TimePicker$OnTimeChangedListener;)V

    .line 101
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/TimePickerDialog$OnTimeSetListener;IIZ)V
    .registers 13

    .prologue
    .line 56
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lmiui/app/TimePickerDialog;-><init>(Landroid/content/Context;ILmiui/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 57
    return-void
.end method

.method private pA()V
    .registers 5

    .prologue
    .line 114
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->Ex:Lmiui/app/TimePickerDialog$OnTimeSetListener;

    if-eqz v0, :cond_24

    .line 115
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v0}, Lmiui/widget/TimePicker;->clearFocus()V

    .line 116
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->Ex:Lmiui/app/TimePickerDialog$OnTimeSetListener;

    iget-object v1, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v2}, Lmiui/widget/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 117
    iget-object v3, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v3}, Lmiui/widget/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 116
    invoke-interface {v0, v1, v2, v3}, Lmiui/app/TimePickerDialog$OnTimeSetListener;->onTimeSet(Lmiui/widget/TimePicker;II)V

    .line 119
    :cond_24
    return-void
.end method

.method static synthetic pB(Lmiui/app/TimePickerDialog;)V
    .registers 1

    invoke-direct {p0}, Lmiui/app/TimePickerDialog;->pA()V

    return-void
.end method


# virtual methods
.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 6

    .prologue
    .line 132
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 133
    const-string/jumbo v0, "miui:hour"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 134
    const-string/jumbo v1, "miui:minute"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 135
    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    const-string/jumbo v3, "miui:is24hour"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Lmiui/widget/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    .line 136
    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Lmiui/widget/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 137
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/widget/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 138
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .registers 4

    .prologue
    .line 123
    invoke-super {p0}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    .line 124
    const-string/jumbo v1, "miui:hour"

    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v2}, Lmiui/widget/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 125
    const-string/jumbo v1, "miui:minute"

    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v2}, Lmiui/widget/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 126
    const-string/jumbo v1, "miui:is24hour"

    iget-object v2, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-virtual {v2}, Lmiui/widget/TimePicker;->is24HourView()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 127
    return-object v0
.end method

.method public updateTime(II)V
    .registers 5

    .prologue
    .line 109
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/widget/TimePicker;->setCurrentHour(Ljava/lang/Integer;)V

    .line 110
    iget-object v0, p0, Lmiui/app/TimePickerDialog;->EB:Lmiui/widget/TimePicker;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/widget/TimePicker;->setCurrentMinute(Ljava/lang/Integer;)V

    .line 111
    return-void
.end method
