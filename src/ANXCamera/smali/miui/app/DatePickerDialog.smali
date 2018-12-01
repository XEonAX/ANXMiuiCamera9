.class public Lmiui/app/DatePickerDialog;
.super Landroid/app/AlertDialog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/DatePickerDialog$1;,
        Lmiui/app/DatePickerDialog$OnDateSetListener;
    }
.end annotation


# static fields
.field private static final EC:Ljava/lang/String; = "miui:day"

.field private static final ED:Ljava/lang/String; = "miui:month"

.field private static final EE:Ljava/lang/String; = "miui:year"


# instance fields
.field private final EF:Lmiui/date/Calendar;

.field private final EG:Lmiui/app/DatePickerDialog$OnDateSetListener;

.field private final EH:Lmiui/widget/DatePicker;

.field private EI:Lmiui/widget/DatePicker$OnDateChangedListener;

.field private EJ:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ILmiui/app/DatePickerDialog$OnDateSetListener;III)V
    .registers 12

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/DatePickerDialog;->EJ:Z

    .line 49
    new-instance v0, Lmiui/app/DatePickerDialog$1;

    invoke-direct {v0, p0}, Lmiui/app/DatePickerDialog$1;-><init>(Lmiui/app/DatePickerDialog;)V

    iput-object v0, p0, Lmiui/app/DatePickerDialog;->EI:Lmiui/widget/DatePicker$OnDateChangedListener;

    .line 89
    iput-object p3, p0, Lmiui/app/DatePickerDialog;->EG:Lmiui/app/DatePickerDialog$OnDateSetListener;

    .line 91
    new-instance v0, Lmiui/date/Calendar;

    invoke-direct {v0}, Lmiui/date/Calendar;-><init>()V

    iput-object v0, p0, Lmiui/app/DatePickerDialog;->EF:Lmiui/date/Calendar;

    .line 93
    invoke-virtual {p0}, Lmiui/app/DatePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 94
    const v0, 0x104000a

    invoke-virtual {v2, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v3, Lmiui/app/DatePickerDialog$2;

    invoke-direct {v3, p0}, Lmiui/app/DatePickerDialog$2;-><init>(Lmiui/app/DatePickerDialog;)V

    const/4 v4, -0x1

    invoke-virtual {p0, v4, v0, v3}, Lmiui/app/DatePickerDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 100
    invoke-virtual {p0}, Lmiui/app/DatePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v3, 0x1040000

    invoke-virtual {v0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    move-object v0, v1

    .line 101
    check-cast v0, Landroid/content/DialogInterface$OnClickListener;

    .line 100
    const/4 v4, -0x2

    invoke-virtual {p0, v4, v3, v0}, Lmiui/app/DatePickerDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 103
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/DatePickerDialog;->setIcon(I)V

    .line 106
    const-string/jumbo v0, "layout_inflater"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 107
    sget v2, Lcom/miui/internal/R$layout;->date_picker_dialog:I

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 108
    invoke-virtual {p0, v0}, Lmiui/app/DatePickerDialog;->setView(Landroid/view/View;)V

    .line 109
    sget v1, Lcom/miui/internal/R$id;->datePicker:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lmiui/widget/DatePicker;

    iput-object v0, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    .line 110
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    iget-object v1, p0, Lmiui/app/DatePickerDialog;->EI:Lmiui/widget/DatePicker$OnDateChangedListener;

    invoke-virtual {v0, p4, p5, p6, v1}, Lmiui/widget/DatePicker;->init(IIILmiui/widget/DatePicker$OnDateChangedListener;)V

    .line 111
    invoke-direct {p0, p4, p5, p6}, Lmiui/app/DatePickerDialog;->pD(III)V

    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/DatePickerDialog$OnDateSetListener;III)V
    .registers 13

    .prologue
    .line 70
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lmiui/app/DatePickerDialog;-><init>(Landroid/content/Context;ILmiui/app/DatePickerDialog$OnDateSetListener;III)V

    .line 71
    return-void
.end method

.method private pC()V
    .registers 6

    .prologue
    .line 147
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EG:Lmiui/app/DatePickerDialog$OnDateSetListener;

    if-eqz v0, :cond_22

    .line 148
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v0}, Lmiui/widget/DatePicker;->clearFocus()V

    .line 149
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EG:Lmiui/app/DatePickerDialog$OnDateSetListener;

    iget-object v1, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    iget-object v2, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v2}, Lmiui/widget/DatePicker;->getYear()I

    move-result v2

    .line 150
    iget-object v3, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v3}, Lmiui/widget/DatePicker;->getMonth()I

    move-result v3

    iget-object v4, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v4}, Lmiui/widget/DatePicker;->getDayOfMonth()I

    move-result v4

    .line 149
    invoke-interface {v0, v1, v2, v3, v4}, Lmiui/app/DatePickerDialog$OnDateSetListener;->onDateSet(Lmiui/widget/DatePicker;III)V

    .line 152
    :cond_22
    return-void
.end method

.method private pD(III)V
    .registers 7

    .prologue
    .line 155
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EF:Lmiui/date/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    .line 156
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EF:Lmiui/date/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p2}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    .line 157
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EF:Lmiui/date/Calendar;

    const/16 v1, 0x9

    invoke-virtual {v0, v1, p3}, Lmiui/date/Calendar;->set(II)Lmiui/date/Calendar;

    .line 158
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EF:Lmiui/date/Calendar;

    invoke-virtual {v0}, Lmiui/date/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 159
    const/16 v2, 0x3780

    .line 158
    invoke-static {v0, v1, v2}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object v0

    .line 163
    invoke-super {p0, v0}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 164
    return-void
.end method

.method static synthetic pE(Lmiui/app/DatePickerDialog;)Z
    .registers 2

    iget-boolean v0, p0, Lmiui/app/DatePickerDialog;->EJ:Z

    return v0
.end method

.method static synthetic pF(Lmiui/app/DatePickerDialog;)V
    .registers 1

    invoke-direct {p0}, Lmiui/app/DatePickerDialog;->pC()V

    return-void
.end method

.method static synthetic pG(Lmiui/app/DatePickerDialog;III)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lmiui/app/DatePickerDialog;->pD(III)V

    return-void
.end method


# virtual methods
.method public getDatePicker()Lmiui/widget/DatePicker;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    return-object v0
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 7

    .prologue
    .line 177
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 178
    const-string/jumbo v0, "miui:year"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 179
    const-string/jumbo v1, "miui:month"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 180
    const-string/jumbo v2, "miui:day"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 181
    iget-object v3, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    iget-object v4, p0, Lmiui/app/DatePickerDialog;->EI:Lmiui/widget/DatePicker$OnDateChangedListener;

    invoke-virtual {v3, v0, v1, v2, v4}, Lmiui/widget/DatePicker;->init(IIILmiui/widget/DatePicker$OnDateChangedListener;)V

    .line 182
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .registers 4

    .prologue
    .line 168
    invoke-super {p0}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    .line 169
    const-string/jumbo v1, "miui:year"

    iget-object v2, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v2}, Lmiui/widget/DatePicker;->getYear()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 170
    const-string/jumbo v1, "miui:month"

    iget-object v2, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v2}, Lmiui/widget/DatePicker;->getMonth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 171
    const-string/jumbo v1, "miui:day"

    iget-object v2, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v2}, Lmiui/widget/DatePicker;->getDayOfMonth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 172
    return-object v0
.end method

.method public setTitle(I)V
    .registers 3

    .prologue
    .line 131
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 132
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/DatePickerDialog;->EJ:Z

    .line 133
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .prologue
    .line 125
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 126
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/DatePickerDialog;->EJ:Z

    .line 127
    return-void
.end method

.method public updateDate(III)V
    .registers 5

    .prologue
    .line 143
    iget-object v0, p0, Lmiui/app/DatePickerDialog;->EH:Lmiui/widget/DatePicker;

    invoke-virtual {v0, p1, p2, p3}, Lmiui/widget/DatePicker;->updateDate(III)V

    .line 144
    return-void
.end method
