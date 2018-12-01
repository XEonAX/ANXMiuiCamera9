.class Lmiui/app/DatePickerDialog$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/widget/DatePicker$OnDateChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/DatePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ER:Lmiui/app/DatePickerDialog;


# direct methods
.method constructor <init>(Lmiui/app/DatePickerDialog;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/app/DatePickerDialog$1;->ER:Lmiui/app/DatePickerDialog;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDateChanged(Lmiui/widget/DatePicker;IIIZ)V
    .registers 7

    .prologue
    .line 52
    iget-object v0, p0, Lmiui/app/DatePickerDialog$1;->ER:Lmiui/app/DatePickerDialog;

    invoke-static {v0}, Lmiui/app/DatePickerDialog;->pE(Lmiui/app/DatePickerDialog;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 53
    iget-object v0, p0, Lmiui/app/DatePickerDialog$1;->ER:Lmiui/app/DatePickerDialog;

    invoke-static {v0, p2, p3, p4}, Lmiui/app/DatePickerDialog;->pG(Lmiui/app/DatePickerDialog;III)V

    .line 55
    :cond_d
    return-void
.end method
