.class public interface abstract Lcom/android/camera/data/cloud/DataCloud$CloudFeature;
.super Ljava/lang/Object;
.source "DataCloud.java"


# virtual methods
.method public abstract editor()Landroid/content/SharedPreferences$Editor;
.end method

.method public abstract filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;
.end method

.method public abstract getAllDisabledFeatures()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setReady(Z)V
.end method
