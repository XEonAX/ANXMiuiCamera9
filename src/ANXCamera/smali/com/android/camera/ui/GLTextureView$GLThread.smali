.class Lcom/android/camera/ui/GLTextureView$GLThread;
.super Ljava/lang/Thread;
.source "GLTextureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GLThread"
.end annotation


# instance fields
.field private mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mFinishedCreatingEglSurface:Z

.field private mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera/ui/GLTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mSizeChanged:Z

.field private mSurfaceIsBad:Z

.field private mWaitingForSurface:Z

.field private mWidth:I


# direct methods
.method static synthetic -set0(Lcom/android/camera/ui/GLTextureView$GLThread;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/GLTextureView$GLThread;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z

    return p1
.end method

.method constructor <init>(Ljava/lang/ref/WeakReference;II)V
    .locals 2
    .param p2, "width"    # I
    .param p3, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera/ui/GLTextureView;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .local p1, "glTextureViewWeakRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/android/camera/ui/GLTextureView;>;"
    const/4 v1, 0x1

    .line 1011
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1543
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 1544
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1012
    iput p2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWidth:I

    .line 1013
    iput p3, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHeight:I

    .line 1014
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    .line 1015
    iput v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderMode:I

    .line 1016
    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 1017
    return-void
.end method

.method private guardedRun()V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1058
    new-instance v20, Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v21, v0

    invoke-direct/range {v20 .. v21}, Lcom/android/camera/ui/GLTextureView$EglHelper;-><init>(Ljava/lang/ref/WeakReference;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    .line 1059
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1060
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1062
    const/4 v9, 0x0

    .line 1063
    .local v9, "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v3, 0x0

    .line 1064
    .local v3, "createEglContext":Z
    const/4 v4, 0x0

    .line 1065
    .local v4, "createEglSurface":Z
    const/4 v5, 0x0

    .line 1066
    .local v5, "createGlInterface":Z
    const/4 v11, 0x0

    .line 1067
    .local v11, "lostEglContext":Z
    const/4 v14, 0x0

    .line 1068
    .local v14, "sizeChanged":Z
    const/16 v19, 0x0

    .line 1069
    .local v19, "wantRenderNotification":Z
    const/4 v6, 0x0

    .line 1070
    .local v6, "doRenderNotification":Z
    const/4 v2, 0x0

    .line 1071
    .local v2, "askedToReleaseEglContext":Z
    const/16 v18, 0x0

    .line 1072
    .local v18, "w":I
    const/4 v10, 0x0

    .line 1073
    .local v10, "h":I
    const/4 v8, 0x0

    .line 1076
    .end local v9    # "gl":Ljavax/microedition/khronos/opengles/GL10;
    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 1078
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mShouldExit:Z

    move/from16 v20, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v20, :cond_1

    :try_start_2
    monitor-exit v21
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 1347
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21

    .line 1348
    :try_start_3
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1349
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v21

    .line 1079
    return-void

    .line 1347
    :catchall_0
    move-exception v20

    monitor-exit v21

    throw v20

    .line 1082
    :cond_1
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v20

    if-nez v20, :cond_2

    .line 1083
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Ljava/lang/Runnable;

    move-object v8, v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_2
    :try_start_5
    monitor-exit v21

    .line 1249
    if-eqz v8, :cond_14

    .line 1250
    invoke-interface {v8}, Ljava/lang/Runnable;->run()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 1251
    const/4 v8, 0x0

    .local v8, "event":Ljava/lang/Runnable;
    goto :goto_0

    .line 1088
    .end local v8    # "event":Ljava/lang/Runnable;
    :cond_2
    const/4 v12, 0x0

    .line 1089
    .local v12, "pausing":Z
    :try_start_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestPaused:Z

    move/from16 v22, v0

    move/from16 v0, v20

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    .line 1090
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1091
    .local v12, "pausing":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestPaused:Z

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z

    .line 1092
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1099
    .end local v12    # "pausing":Z
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_4

    .line 1103
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1104
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1105
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 1106
    const/4 v2, 0x1

    .line 1110
    :cond_4
    if-eqz v11, :cond_5

    .line 1111
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1112
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1113
    const/4 v11, 0x0

    .line 1117
    :cond_5
    if-eqz v12, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_6

    .line 1121
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1125
    :cond_6
    if-eqz v12, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_8

    .line 1126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/camera/ui/GLTextureView;

    .line 1127
    .local v17, "view":Lcom/android/camera/ui/GLTextureView;
    if-nez v17, :cond_11

    .line 1128
    const/4 v13, 0x0

    .line 1129
    :goto_3
    if-eqz v13, :cond_7

    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v20

    if-eqz v20, :cond_8

    .line 1130
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1138
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :cond_8
    if-eqz v12, :cond_9

    .line 1139
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v20

    if-eqz v20, :cond_9

    .line 1140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$EglHelper;->finish()V

    .line 1148
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHasSurface:Z

    move/from16 v20, v0

    if-nez v20, :cond_b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    move/from16 v20, v0

    xor-int/lit8 v20, v20, 0x1

    if-eqz v20, :cond_b

    .line 1152
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_a

    .line 1153
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1155
    :cond_a
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 1156
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1157
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1161
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHasSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_c

    .line 1165
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 1166
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1169
    :cond_c
    if-eqz v6, :cond_d

    .line 1173
    const/16 v19, 0x0

    .line 1174
    const/4 v6, 0x0

    .line 1175
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1176
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1180
    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->readyToDraw()Z

    move-result v20

    if-eqz v20, :cond_13

    .line 1183
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-nez v20, :cond_e

    .line 1184
    if-eqz v2, :cond_12

    .line 1185
    const/4 v2, 0x0

    .line 1200
    :cond_e
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v20, v0

    if-eqz v20, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    xor-int/lit8 v20, v20, 0x1

    if-eqz v20, :cond_f

    .line 1201
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1202
    const/4 v4, 0x1

    .line 1203
    const/4 v5, 0x1

    .line 1204
    const/4 v14, 0x1

    .line 1207
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v20, v0

    if-eqz v20, :cond_13

    .line 1208
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mSizeChanged:Z

    move/from16 v20, v0

    if-eqz v20, :cond_10

    .line 1209
    const/4 v14, 0x1

    .line 1210
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWidth:I

    move/from16 v18, v0

    .line 1211
    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHeight:I

    .line 1212
    const/16 v19, 0x1

    .line 1220
    const/4 v4, 0x1

    .line 1222
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1224
    :cond_10
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    .line 1225
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto/16 :goto_2

    .line 1076
    :catchall_1
    move-exception v20

    :try_start_7
    monitor-exit v21

    throw v20
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 1341
    :catch_0
    move-exception v7

    .line 1342
    .local v7, "e":Ljava/lang/RuntimeException;
    :try_start_8
    const-string/jumbo v20, "GLThread"

    const-string/jumbo v21, "got exception"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 1347
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21

    .line 1348
    :try_start_9
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1349
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    monitor-exit v21

    .line 1352
    return-void

    .line 1128
    .end local v7    # "e":Ljava/lang/RuntimeException;
    .restart local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :cond_11
    :try_start_a
    invoke-static/range {v17 .. v17}, Lcom/android/camera/ui/GLTextureView;->-get6(Lcom/android/camera/ui/GLTextureView;)Z

    move-result v13

    .local v13, "preserveEglContextOnPause":Z
    goto/16 :goto_3

    .line 1186
    .end local v13    # "preserveEglContextOnPause":Z
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :cond_12
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/android/camera/ui/GLTextureView$GLThread;)Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move-result v20

    if-eqz v20, :cond_e

    .line 1188
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$EglHelper;->start()V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1193
    const/16 v20, 0x1

    :try_start_c
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1194
    const/4 v3, 0x1

    .line 1196
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    goto/16 :goto_4

    .line 1189
    :catch_1
    move-exception v16

    .line 1190
    .local v16, "t":Ljava/lang/RuntimeException;
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/android/camera/ui/GLTextureView$GLThread;)V

    .line 1191
    throw v16

    .line 1245
    .end local v16    # "t":Ljava/lang/RuntimeException;
    :cond_13
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto/16 :goto_1

    .line 1255
    :cond_14
    if-eqz v4, :cond_15

    .line 1259
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$EglHelper;->createSurface()Z

    move-result v20

    if-eqz v20, :cond_1c

    .line 1260
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 1261
    const/16 v20, 0x1

    :try_start_e
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1262
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    :try_start_f
    monitor-exit v21

    .line 1272
    const/4 v4, 0x0

    .line 1275
    :cond_15
    if-eqz v5, :cond_16

    .line 1276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$EglHelper;->createGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v9, v0

    .line 1278
    .local v9, "gl":Ljavax/microedition/khronos/opengles/GL10;
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1279
    const/4 v5, 0x0

    .line 1282
    .end local v9    # "gl":Ljavax/microedition/khronos/opengles/GL10;
    :cond_16
    if-eqz v3, :cond_18

    .line 1286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/camera/ui/GLTextureView;

    .line 1287
    .restart local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    if-eqz v17, :cond_17

    .line 1288
    invoke-static/range {v17 .. v17}, Lcom/android/camera/ui/GLTextureView;->-get7(Lcom/android/camera/ui/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v9, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1290
    :cond_17
    const/4 v3, 0x0

    .line 1293
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :cond_18
    if-eqz v14, :cond_1a

    .line 1297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/camera/ui/GLTextureView;

    .line 1298
    .restart local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    if-eqz v17, :cond_19

    .line 1299
    invoke-static/range {v17 .. v17}, Lcom/android/camera/ui/GLTextureView;->-get7(Lcom/android/camera/ui/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v18

    invoke-interface {v0, v9, v1, v10}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1301
    :cond_19
    const/4 v14, 0x0

    .line 1308
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/camera/ui/GLTextureView;

    .line 1309
    .restart local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    if-eqz v17, :cond_1b

    .line 1310
    invoke-static/range {v17 .. v17}, Lcom/android/camera/ui/GLTextureView;->-get7(Lcom/android/camera/ui/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v9}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1313
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$EglHelper;->swap()I

    move-result v15

    .line 1314
    .local v15, "swapError":I
    sparse-switch v15, :sswitch_data_0

    .line 1328
    const-string/jumbo v20, "GLThread"

    const-string/jumbo v21, "eglSwapBuffers"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v15}, Lcom/android/camera/ui/GLTextureView$EglHelper;->logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1330
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 1331
    const/16 v20, 0x1

    :try_start_10
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1332
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    :try_start_11
    monitor-exit v21

    .line 1337
    :goto_5
    :sswitch_0
    if-eqz v19, :cond_0

    .line 1338
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 1260
    .end local v15    # "swapError":I
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :catchall_2
    move-exception v20

    monitor-exit v21

    throw v20
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_0
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 1343
    :catchall_3
    move-exception v20

    .line 1347
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21

    .line 1348
    :try_start_12
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1349
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->stopEglContextLocked()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    monitor-exit v21

    .line 1343
    throw v20

    .line 1265
    :cond_1c
    :try_start_13
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v21

    monitor-enter v21
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    .line 1266
    const/16 v20, 0x1

    :try_start_14
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1267
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/camera/ui/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1268
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    :try_start_15
    monitor-exit v21

    goto/16 :goto_0

    .line 1265
    :catchall_4
    move-exception v20

    monitor-exit v21

    throw v20

    .line 1321
    .restart local v15    # "swapError":I
    .restart local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    :sswitch_1
    const/4 v11, 0x1

    .line 1322
    goto :goto_5

    .line 1330
    :catchall_5
    move-exception v20

    monitor-exit v21

    throw v20
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_0
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    .line 1347
    .end local v15    # "swapError":I
    .end local v17    # "view":Lcom/android/camera/ui/GLTextureView;
    .restart local v7    # "e":Ljava/lang/RuntimeException;
    :catchall_6
    move-exception v20

    monitor-exit v21

    throw v20

    .end local v7    # "e":Ljava/lang/RuntimeException;
    :catchall_7
    move-exception v20

    monitor-exit v21

    throw v20

    .line 1314
    nop

    :sswitch_data_0
    .sparse-switch
        0x3000 -> :sswitch_0
        0x300e -> :sswitch_1
    .end sparse-switch
.end method

.method private readyToDraw()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1359
    iget-boolean v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHasSurface:Z

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mSurfaceIsBad:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 1360
    iget v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWidth:I

    if-lez v2, :cond_2

    iget v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHeight:I

    if-lez v2, :cond_2

    .line 1361
    iget-boolean v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    if-nez v2, :cond_0

    iget v2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderMode:I

    if-ne v2, v0, :cond_1

    .line 1359
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 1361
    goto :goto_0

    :cond_2
    move v0, v1

    .line 1359
    goto :goto_0
.end method

.method private stopEglContextLocked()V
    .locals 1

    .prologue
    .line 1051
    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1052
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$EglHelper;->finish()V

    .line 1053
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1054
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/android/camera/ui/GLTextureView$GLThread;)V

    .line 1056
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .prologue
    .line 1040
    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    .line 1041
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1042
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mEglHelper:Lcom/android/camera/ui/GLTextureView$EglHelper;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$EglHelper;->destroySurface()V

    .line 1044
    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .prologue
    .line 1355
    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->readyToDraw()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRenderMode()I
    .locals 2

    .prologue
    .line 1375
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v0

    monitor-enter v0

    .line 1376
    :try_start_0
    iget v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderMode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    .line 1375
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1425
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1429
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1430
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1431
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1436
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1437
    :catch_0
    move-exception v0

    .line 1438
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1425
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1442
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 1445
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1449
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1450
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    .line 1451
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1452
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1453
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1458
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1459
    :catch_0
    move-exception v0

    .line 1460
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1445
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1464
    return-void
.end method

.method public onWindowResize(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 1467
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1468
    :try_start_0
    iput p1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWidth:I

    .line 1469
    iput p2, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHeight:I

    .line 1470
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1471
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    .line 1472
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1473
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1476
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mPaused:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderComplete:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1477
    invoke-virtual {p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->ableToDraw()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 1476
    if-eqz v1, :cond_0

    .line 1482
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1483
    :catch_0
    move-exception v0

    .line 1484
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1467
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1488
    return-void
.end method

.method public requestExitAndWait()V
    .locals 3

    .prologue
    .line 1493
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1494
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mShouldExit:Z

    .line 1495
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1496
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1498
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1499
    :catch_0
    move-exception v0

    .line 1500
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1493
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1504
    return-void
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    .prologue
    .line 1507
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 1508
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1509
    return-void
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 1381
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1382
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRequestRender:Z

    .line 1383
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1385
    return-void

    .line 1381
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 1021
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GLThread "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/GLTextureView$GLThread;->setName(Ljava/lang/String;)V

    .line 1027
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1031
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->threadExiting(Lcom/android/camera/ui/GLTextureView$GLThread;)V

    .line 1033
    :goto_0
    return-void

    .line 1028
    :catch_0
    move-exception v0

    .line 1031
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->threadExiting(Lcom/android/camera/ui/GLTextureView$GLThread;)V

    goto :goto_0

    .line 1030
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    .line 1031
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->threadExiting(Lcom/android/camera/ui/GLTextureView$GLThread;)V

    .line 1030
    throw v1
.end method

.method public setRenderMode(I)V
    .locals 2
    .param p1, "renderMode"    # I

    .prologue
    .line 1365
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 1366
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1368
    :cond_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1369
    :try_start_0
    iput p1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mRenderMode:I

    .line 1370
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1372
    return-void

    .line 1368
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public surfaceCreated()V
    .locals 3

    .prologue
    .line 1388
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1392
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHasSurface:Z

    .line 1393
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1394
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1395
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    .line 1396
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    xor-int/lit8 v1, v1, 0x1

    .line 1395
    if-eqz v1, :cond_0

    .line 1397
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v1, v1, 0x1

    .line 1395
    if-eqz v1, :cond_0

    .line 1399
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1400
    :catch_0
    move-exception v0

    .line 1401
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1388
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1405
    return-void
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 1408
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1412
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mHasSurface:Z

    .line 1413
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->notifyAll()V

    .line 1414
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1416
    :try_start_1
    invoke-static {}, Lcom/android/camera/ui/GLTextureView;->-get9()Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1417
    :catch_0
    move-exception v0

    .line 1418
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1408
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    :cond_0
    monitor-exit v2

    .line 1422
    return-void
.end method
