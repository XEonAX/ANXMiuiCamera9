.class Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;
.super Ljava/lang/Object;
.source "V6GestureRecognizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/V6GestureRecognizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraGestureDetector"
.end annotation


# instance fields
.field private mStartPoint:Landroid/graphics/Point;

.field final synthetic this$0:Lcom/android/camera/ui/V6GestureRecognizer;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/V6GestureRecognizer;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/ui/V6GestureRecognizer;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->mStartPoint:Landroid/graphics/Point;

    .line 206
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 10
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 209
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    sparse-switch v5, :sswitch_data_0

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 211
    :sswitch_0
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->mStartPoint:Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Point;->set(II)V

    goto :goto_0

    .line 214
    :sswitch_1
    const-string/jumbo v5, "GESTURE_"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "CameraGestureDetector ACTION_MOVE mGesture="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v7}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v5

    div-int/lit8 v5, v5, 0x64

    if-nez v5, :cond_1

    .line 216
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    iget-object v6, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->mStartPoint:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    iget-object v7, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->mStartPoint:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    float-to-int v8, v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    float-to-int v9, v9

    invoke-static {v5, v6, v7, v8, v9}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap0(Lcom/android/camera/ui/V6GestureRecognizer;IIII)Landroid/graphics/Point;

    move-result-object v2

    .line 217
    .local v2, "point":Landroid/graphics/Point;
    const-string/jumbo v6, "CameraGestureRecognizer"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "mGesture="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v7}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, " orientation="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v5, v2, Landroid/graphics/Point;->x:I

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    iget v8, v2, Landroid/graphics/Point;->y:I

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v5, v8, :cond_2

    const-string/jumbo v5, "h"

    :goto_1
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 218
    const-string/jumbo v7, " dx="

    .line 217
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 218
    iget v7, v2, Landroid/graphics/Point;->x:I

    .line 217
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 218
    const-string/jumbo v7, " dy="

    .line 217
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 218
    iget v7, v2, Landroid/graphics/Point;->y:I

    .line 217
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->-get0(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v5

    iget v6, v2, Landroid/graphics/Point;->x:I

    iget v7, v2, Landroid/graphics/Point;->x:I

    mul-int/2addr v6, v7

    iget v7, v2, Landroid/graphics/Point;->y:I

    iget v8, v2, Landroid/graphics/Point;->y:I

    mul-int/2addr v7, v8

    add-int/2addr v6, v7

    if-gt v5, v6, :cond_1

    .line 220
    iget-object v6, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v6}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v7

    iget v5, v2, Landroid/graphics/Point;->x:I

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    iget v8, v2, Landroid/graphics/Point;->y:I

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v5, v8, :cond_3

    const/16 v5, 0x64

    :goto_2
    add-int/2addr v5, v7

    invoke-static {v6, v5}, Lcom/android/camera/ui/V6GestureRecognizer;->-set2(Lcom/android/camera/ui/V6GestureRecognizer;I)I

    .line 223
    .end local v2    # "point":Landroid/graphics/Point;
    :cond_1
    const-string/jumbo v5, "GESTURE_"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "CameraGestureDetector ACTION_MOVE end mGesture="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v7}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 217
    .restart local v2    # "point":Landroid/graphics/Point;
    :cond_2
    const-string/jumbo v5, "v"

    goto :goto_1

    .line 220
    :cond_3
    const/16 v5, 0xc8

    goto :goto_2

    .line 226
    .end local v2    # "point":Landroid/graphics/Point;
    :sswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5, v7}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap1(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 228
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_4

    .line 229
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    .line 230
    .local v1, "l":F
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 236
    .local v3, "r":F
    :goto_3
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_5

    .line 237
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    .line 238
    .local v4, "t":F
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    .line 243
    .local v0, "b":F
    :goto_4
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5, v7}, Lcom/android/camera/ui/V6GestureRecognizer;->-wrap1(Lcom/android/camera/ui/V6GestureRecognizer;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 244
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->-get5(Lcom/android/camera/ui/V6GestureRecognizer;)I

    move-result v6

    add-int/lit8 v6, v6, 0xa

    invoke-static {v5, v6}, Lcom/android/camera/ui/V6GestureRecognizer;->-set2(Lcom/android/camera/ui/V6GestureRecognizer;I)I

    .line 245
    iget-object v5, p0, Lcom/android/camera/ui/V6GestureRecognizer$CameraGestureDetector;->this$0:Lcom/android/camera/ui/V6GestureRecognizer;

    invoke-static {v5}, Lcom/android/camera/ui/V6GestureRecognizer;->-get2(Lcom/android/camera/ui/V6GestureRecognizer;)Lcom/android/camera/module/Module;

    move-result-object v5

    new-instance v6, Landroid/graphics/RectF;

    invoke-direct {v6, v1, v4, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v5, v6, v8}, Lcom/android/camera/module/Module;->onGestureTrack(Landroid/graphics/RectF;Z)Z

    goto/16 :goto_0

    .line 232
    .end local v0    # "b":F
    .end local v1    # "l":F
    .end local v3    # "r":F
    .end local v4    # "t":F
    :cond_4
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    .line 233
    .restart local v1    # "l":F
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .restart local v3    # "r":F
    goto :goto_3

    .line 240
    :cond_5
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    .line 241
    .restart local v4    # "t":F
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    .restart local v0    # "b":F
    goto :goto_4

    .line 209
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x2 -> :sswitch_1
        0x6 -> :sswitch_2
    .end sparse-switch
.end method
