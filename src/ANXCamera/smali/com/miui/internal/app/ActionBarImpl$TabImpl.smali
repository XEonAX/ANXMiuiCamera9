.class public Lcom/miui/internal/app/ActionBarImpl$TabImpl;
.super Landroid/app/ActionBar$Tab;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/app/ActionBarImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TabImpl"
.end annotation


# instance fields
.field private afg:Landroid/app/ActionBar$TabListener;

.field private afh:Ljava/lang/CharSequence;

.field private afi:Landroid/view/View;

.field private afj:Landroid/graphics/drawable/Drawable;

.field private afk:Landroid/app/ActionBar$TabListener;

.field private afl:I

.field private afm:Ljava/lang/Object;

.field private afn:Ljava/lang/CharSequence;

.field final synthetic afo:Lcom/miui/internal/app/ActionBarImpl;


# direct methods
.method public constructor <init>(Lcom/miui/internal/app/ActionBarImpl;)V
    .registers 3

    .prologue
    .line 1280
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-direct {p0}, Landroid/app/ActionBar$Tab;-><init>()V

    .line 1294
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    .line 1280
    return-void
.end method

.method static synthetic Al(Lcom/miui/internal/app/ActionBarImpl$TabImpl;)Landroid/app/ActionBar$TabListener;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afg:Landroid/app/ActionBar$TabListener;

    return-object v0
.end method

.method static synthetic Am(Lcom/miui/internal/app/ActionBarImpl$TabImpl;)Landroid/app/ActionBar$TabListener;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afk:Landroid/app/ActionBar$TabListener;

    return-object v0
.end method


# virtual methods
.method public getCallback()Landroid/app/ActionBar$TabListener;
    .registers 2

    .prologue
    .line 1310
    invoke-static {}, Lcom/miui/internal/app/ActionBarImpl;->Ak()Landroid/app/ActionBar$TabListener;

    move-result-object v0

    return-object v0
.end method

.method public getContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1413
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afh:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1326
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afi:Landroid/view/View;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 1346
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afj:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 1351
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1300
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afm:Ljava/lang/Object;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1360
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public select()V
    .registers 2

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0, p0}, Lcom/miui/internal/app/ActionBarImpl;->selectTab(Landroid/app/ActionBar$Tab;)V

    .line 1394
    return-void
.end method

.method public setContentDescription(I)Landroid/app/ActionBar$Tab;
    .registers 3

    .prologue
    .line 1399
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Ag(Lcom/miui/internal/app/ActionBarImpl;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 1398
    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setContentDescription(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;
    .registers 4

    .prologue
    .line 1404
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afh:Ljava/lang/CharSequence;

    .line 1405
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    if-ltz v0, :cond_11

    .line 1406
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Aj(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1408
    :cond_11
    return-object p0
.end method

.method public setCustomView(I)Landroid/app/ActionBar$Tab;
    .registers 4

    .prologue
    .line 1340
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActionBarImpl;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 1341
    const/4 v1, 0x0

    .line 1340
    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setCustomView(Landroid/view/View;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setCustomView(Landroid/view/View;)Landroid/app/ActionBar$Tab;
    .registers 4

    .prologue
    .line 1331
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afi:Landroid/view/View;

    .line 1332
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    if-ltz v0, :cond_11

    .line 1333
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Aj(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1335
    :cond_11
    return-object p0
.end method

.method public setIcon(I)Landroid/app/ActionBar$Tab;
    .registers 3

    .prologue
    .line 1374
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Ag(Lcom/miui/internal/app/ActionBarImpl;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/app/ActionBar$Tab;
    .registers 4

    .prologue
    .line 1365
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afj:Landroid/graphics/drawable/Drawable;

    .line 1366
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    if-ltz v0, :cond_11

    .line 1367
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Aj(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1369
    :cond_11
    return-object p0
.end method

.method public setInternalTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;
    .registers 2

    .prologue
    .line 1320
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afk:Landroid/app/ActionBar$TabListener;

    .line 1321
    return-object p0
.end method

.method public setPosition(I)V
    .registers 2

    .prologue
    .line 1355
    iput p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    .line 1356
    return-void
.end method

.method public setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;
    .registers 2

    .prologue
    .line 1315
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afg:Landroid/app/ActionBar$TabListener;

    .line 1316
    return-object p0
.end method

.method public setTag(Ljava/lang/Object;)Landroid/app/ActionBar$Tab;
    .registers 2

    .prologue
    .line 1305
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afm:Ljava/lang/Object;

    .line 1306
    return-object p0
.end method

.method public setText(I)Landroid/app/ActionBar$Tab;
    .registers 3

    .prologue
    .line 1388
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Ag(Lcom/miui/internal/app/ActionBarImpl;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;
    .registers 4

    .prologue
    .line 1379
    iput-object p1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afn:Ljava/lang/CharSequence;

    .line 1380
    iget v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    if-ltz v0, :cond_11

    .line 1381
    iget-object v0, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afo:Lcom/miui/internal/app/ActionBarImpl;

    invoke-static {v0}, Lcom/miui/internal/app/ActionBarImpl;->Aj(Lcom/miui/internal/app/ActionBarImpl;)Lcom/miui/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Lcom/miui/internal/app/ActionBarImpl$TabImpl;->afl:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1383
    :cond_11
    return-object p0
.end method
