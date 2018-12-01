.class Lmiui/app/DatePickerDialog$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/DatePickerDialog;-><init>(Landroid/content/Context;ILmiui/app/DatePickerDialog$OnDateSetListener;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic ES:Lmiui/app/DatePickerDialog;


# direct methods
.method constructor <init>(Lmiui/app/DatePickerDialog;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/app/DatePickerDialog$2;->ES:Lmiui/app/DatePickerDialog;

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .prologue
    .line 97
    iget-object v0, p0, Lmiui/app/DatePickerDialog$2;->ES:Lmiui/app/DatePickerDialog;

    invoke-static {v0}, Lmiui/app/DatePickerDialog;->pF(Lmiui/app/DatePickerDialog;)V

    .line 98
    return-void
.end method
