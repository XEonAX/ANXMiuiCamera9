package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import com.android.camera.Util;
import com.android.camera.ui.FocusView;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraFocusPaintEvAdjust extends CameraPaintBase {
    private static final int MARGIN = Util.dpToPixel(12.0f);
    private static final int TRIANGLE_BASE_DIS = Util.dpToPixel(3.0f);
    private static final int TRIANGLE_BASE_HEIGHT = Util.dpToPixel(5.0f);
    private static final int TRIANGLE_BASE_LEN = Util.dpToPixel(8.0f);
    private static final int TRIANGLE_MIN_MARGIN = Util.dpToPixel(25.0f);
    private float mCurrentDistanceY;
    private float mCurrentOffsetY;
    private Rect mDisplayRect;
    private float mEvValue = -1.0f;
    private int mLineHeight = FocusView.MAX_SLIDE_DISTANCE;
    private int mLineMargin = Util.dpToPixel(2.0f);
    private Paint mLinePaint;
    private int mLineWidth = Util.dpToPixel(1.0f);
    private int mRotation;
    private boolean mRtl = false;
    private boolean mShowLine = true;
    private float mStartOffsetY;

    public void setEvValue(float evValue) {
        this.mEvValue = evValue;
    }

    public float getEvValue() {
        return this.mEvValue;
    }

    public CameraFocusPaintEvAdjust(Context context) {
        super(context);
    }

    protected void initPaint(Context context) {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setAntiAlias(true);
        this.mLinePaint = new Paint();
        this.mLinePaint.setAntiAlias(true);
        this.mLinePaint.setStyle(Style.FILL);
        this.mLinePaint.setStrokeWidth((float) this.mLineWidth);
        this.mLinePaint.setColor(Color.argb(102, 255, 255, 255));
    }

    public void updateValue(float interpolatorValue) {
        super.updateValue(interpolatorValue);
        this.mCurrentOffsetY = this.mStartOffsetY - (this.mStartOffsetY * interpolatorValue);
    }

    public void setRtlAndDisplayRect(boolean rtl, Rect rect) {
        this.mRtl = rtl;
        this.mDisplayRect = rect;
    }

    public void setOrientation(int orientation) {
        this.mRotation = orientation;
    }

    public void setStartOffsetY(float startOffsetY) {
        this.mStartOffsetY = startOffsetY;
    }

    public void setDistanceY(float distanceY) {
        this.mCurrentDistanceY = distanceY;
    }

    public void setShowLine(boolean showLine) {
        this.mShowLine = showLine;
    }

    protected void draw(Canvas canvas) {
        float leftx;
        float lineStopY;
        Path path = new Path();
        if (isNearlyOutOfEdge()) {
            leftx = ((this.mMiddleX - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN)) - ((float) (TRIANGLE_BASE_LEN / 2));
        } else {
            leftx = ((this.mMiddleX + ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) + ((float) MARGIN)) - ((float) (TRIANGLE_BASE_LEN / 2));
        }
        float lefty = ((this.mMiddleY - this.mCurrentOffsetY) + this.mCurrentDistanceY) - ((float) (TRIANGLE_BASE_DIS / 2));
        path.moveTo(leftx, lefty);
        path.lineTo(((float) TRIANGLE_BASE_LEN) + leftx, lefty);
        path.lineTo(((float) (TRIANGLE_BASE_LEN / 2)) + leftx, lefty - ((float) TRIANGLE_BASE_HEIGHT));
        path.lineTo(leftx, lefty);
        float lineStartX = leftx + ((float) (TRIANGLE_BASE_LEN / 2));
        float lineStopX = leftx + ((float) (TRIANGLE_BASE_LEN / 2));
        float lineStartY = this.mMiddleY - ((float) (this.mLineHeight / 2));
        if (this.mShowLine && (lefty - ((float) TRIANGLE_BASE_HEIGHT)) - lineStartY > ((float) this.mLineMargin)) {
            lineStopY = (lefty - ((float) TRIANGLE_BASE_HEIGHT)) - ((float) this.mLineMargin);
            this.mLinePaint.setColor(this.mCurrentColor);
            this.mLinePaint.setAlpha(102);
            canvas.drawLine(lineStartX, lineStartY, lineStopX, lineStopY, this.mLinePaint);
        }
        lefty = ((this.mMiddleY + this.mCurrentOffsetY) + this.mCurrentDistanceY) + ((float) (TRIANGLE_BASE_DIS / 2));
        path.moveTo(leftx, lefty);
        path.lineTo(((float) TRIANGLE_BASE_LEN) + leftx, lefty);
        path.lineTo(((float) (TRIANGLE_BASE_LEN / 2)) + leftx, ((float) TRIANGLE_BASE_HEIGHT) + lefty);
        path.lineTo(leftx, lefty);
        canvas.drawPath(path, this.mPaint);
        if (this.mShowLine) {
            lineStopY = this.mMiddleY + ((float) (this.mLineHeight / 2));
            if (lineStopY - ((float) this.mLineMargin) > ((float) TRIANGLE_BASE_HEIGHT) + lefty) {
                lineStartY = (((float) TRIANGLE_BASE_HEIGHT) + lefty) + ((float) this.mLineMargin);
                this.mLinePaint.setColor(this.mCurrentColor);
                this.mLinePaint.setAlpha(102);
                canvas.drawLine(lineStartX, lineStartY, lineStopX, lineStopY, this.mLinePaint);
            }
        }
    }

    private boolean isNearlyOutOfEdge() {
        boolean z = true;
        int width = this.mDisplayRect.width();
        int height = this.mDisplayRect.height();
        if ((this.mRotation / 90) % 2 == 0) {
            if (this.mRtl) {
                if ((this.mMiddleX - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) < ((float) TRIANGLE_MIN_MARGIN)) {
                    z = false;
                }
                return z;
            }
            if (((((float) width) - this.mMiddleX) - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        } else if (this.mRotation == 90) {
            if (((((float) height) - this.mMiddleY) - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        } else if (this.mRotation != 270) {
            return false;
        } else {
            if ((this.mMiddleY - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        }
    }
}
