.class Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;
.super Ljava/lang/Object;
.source "ConfigChangeImpl.java"

# interfaces
.implements Lcom/android/camera/fragment/manually/ManuallyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configScene(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/ConfigChangeImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/ConfigChangeImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;->this$0:Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    .line 453
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;
    .param p4, "isCustomValue"    # Z

    .prologue
    .line 460
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;->this$0:Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 461
    return-void
.end method
