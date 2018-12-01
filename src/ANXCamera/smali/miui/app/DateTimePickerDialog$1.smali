.class Lmiui/app/DateTimePickerDialog$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/DateTimePickerDialog;->px(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic EP:Lmiui/app/DateTimePickerDialog;


# direct methods
.method constructor <init>(Lmiui/app/DateTimePickerDialog;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/app/DateTimePickerDialog$1;->EP:Lmiui/app/DateTimePickerDialog;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7

    .prologue
    .line 45
    iget-object v0, p0, Lmiui/app/DateTimePickerDialog$1;->EP:Lmiui/app/DateTimePickerDialog;

    invoke-static {v0}, Lmiui/app/DateTimePickerDialog;->py(Lmiui/app/DateTimePickerDialog;)Lmiui/app/DateTimePickerDialog$OnTimeSetListener;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 46
    iget-object v0, p0, Lmiui/app/DateTimePickerDialog$1;->EP:Lmiui/app/DateTimePickerDialog;

    invoke-static {v0}, Lmiui/app/DateTimePickerDialog;->py(Lmiui/app/DateTimePickerDialog;)Lmiui/app/DateTimePickerDialog$OnTimeSetListener;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/DateTimePickerDialog$1;->EP:Lmiui/app/DateTimePickerDialog;

    iget-object v2, p0, Lmiui/app/DateTimePickerDialog$1;->EP:Lmiui/app/DateTimePickerDialog;

    invoke-static {v2}, Lmiui/app/DateTimePickerDialog;->pz(Lmiui/app/DateTimePickerDialog;)Lmiui/widget/DateTimePicker;

    move-result-object v2

    invoke-virtual {v2}, Lmiui/widget/DateTimePicker;->getTimeInMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lmiui/app/DateTimePickerDialog$OnTimeSetListener;->onTimeSet(Lmiui/app/DateTimePickerDialog;J)V

    .line 48
    :cond_1d
    return-void
.end method
