.class Lmiui/app/TimePickerDialog$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/TimePickerDialog;-><init>(Landroid/content/Context;ILmiui/app/TimePickerDialog$OnTimeSetListener;IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic EQ:Lmiui/app/TimePickerDialog;


# direct methods
.method constructor <init>(Lmiui/app/TimePickerDialog;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/app/TimePickerDialog$1;->EQ:Lmiui/app/TimePickerDialog;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .prologue
    .line 84
    iget-object v0, p0, Lmiui/app/TimePickerDialog$1;->EQ:Lmiui/app/TimePickerDialog;

    invoke-static {v0}, Lmiui/app/TimePickerDialog;->pB(Lmiui/app/TimePickerDialog;)V

    .line 85
    return-void
.end method
