package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.support.v4.widget.ExploreByTouchHelper;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.TriangleIndicatorDrawable;
import java.util.HashMap;

public class PanoMovingIndicatorView extends View {
    private static final int MAX_GAP = Util.dpToPixel(6.0f);
    private static final int SPEED_DEVIATION = (2904 / MAX_GAP);
    private static final int STONE_WIDTH = Util.dpToPixel(10.67f);
    public static final String TAG = PanoMovingIndicatorView.class.getSimpleName();
    private static int[] sBlockWidth = new int[]{Util.dpToPixel(0.67f), Util.dpToPixel(2.0f), Util.dpToPixel(3.34f)};
    private static int[] sGapWidth = new int[]{Util.dpToPixel(2.67f), Util.dpToPixel(2.0f), Util.dpToPixel(1.34f)};
    private static HashMap<Boolean, Integer> sTimesMap = new HashMap(2);
    private int mArrowMargin = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelOffset(R.dimen.pano_arrow_margin);
    private Point mCurrentFramePos = new Point();
    private int mDirection;
    private int mDisplayCenterY;
    private boolean mFast;
    private int mFilterMoveSpeed;
    private int mHalfStoneHeight;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    if (((float) PanoMovingIndicatorView.this.getPointGap(PanoMovingIndicatorView.this.mLatestSpeed)) != PanoMovingIndicatorView.this.mPointGap) {
                        PanoMovingIndicatorView.this.filterSpeed(PanoMovingIndicatorView.this.mLatestSpeed);
                        PanoMovingIndicatorView.this.applyNewGap();
                        sendEmptyMessageDelayed(1, 10);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };
    private int mLatestSpeed;
    private TriangleIndicatorDrawable mMovingDirectionIc = new TriangleIndicatorDrawable();
    private int mOffsetX;
    private float mPointGap = -1.0f;
    private int mPreviewCenterY;
    private StateChangeTrigger<Boolean> mStateChangeTrigger = new StateChangeTrigger(Boolean.valueOf(false), sTimesMap);
    private Paint mTailPaint;

    class StateChangeTrigger<T> {
        private T mCurrentState;
        private T mLatestState;
        private int mLatestTimes = 0;
        private HashMap<T, Integer> mMaxTimesMap;

        public StateChangeTrigger(T dValue, HashMap<T, Integer> timesMap) {
            this.mLatestState = dValue;
            this.mCurrentState = dValue;
            this.mMaxTimesMap = timesMap;
        }

        public void setCurrentState(T state) {
            this.mCurrentState = state;
        }
    }

    static {
        sTimesMap.put(Boolean.valueOf(true), Integer.valueOf(1));
        sTimesMap.put(Boolean.valueOf(false), Integer.valueOf(4));
    }

    public PanoMovingIndicatorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mMovingDirectionIc.setWidth(context.getResources().getDimensionPixelSize(R.dimen.pano_arrow_width));
        this.mMovingDirectionIc.setHeight(context.getResources().getDimensionPixelSize(R.dimen.pano_arrow_height));
        this.mTailPaint = new Paint();
        this.mTailPaint.setColor(-1);
        this.mHalfStoneHeight = context.getResources().getDimensionPixelSize(R.dimen.pano_tail_height);
    }

    public void onDraw(Canvas canvas) {
        Log.v(TAG, "onDraw mPointGap=" + this.mPointGap);
        if (this.mCurrentFramePos.x != ExploreByTouchHelper.INVALID_ID && this.mCurrentFramePos.y != ExploreByTouchHelper.INVALID_ID) {
            int narrowStartX = this.mCurrentFramePos.x;
            int margin = this.mArrowMargin;
            Drawable drawable = this.mMovingDirectionIc;
            if (this.mDirection == 0) {
                narrowStartX += this.mOffsetX + margin;
            } else if (1 == this.mDirection) {
                narrowStartX -= this.mOffsetX + margin;
            }
            int centerY = (this.mDisplayCenterY + this.mCurrentFramePos.y) - this.mPreviewCenterY;
            canvas.save();
            canvas.translate((float) narrowStartX, (float) centerY);
            if (1 == this.mDirection) {
                canvas.rotate(180.0f);
            }
            int left = -drawable.getIntrinsicWidth();
            drawable.setBounds(left, (-drawable.getIntrinsicHeight()) / 2, 0, drawable.getIntrinsicHeight() / 2);
            drawable.draw(canvas);
            canvas.translate((float) drawable.getIntrinsicWidth(), 0.0f);
            left = (int) (((float) left) - (((float) STONE_WIDTH) + this.mPointGap));
            int gap = (int) this.mPointGap;
            for (int i = 0; i < sGapWidth.length && gap > 0; i++) {
                canvas.drawRect((float) left, (float) (-this.mHalfStoneHeight), (float) (sBlockWidth[i] + left), (float) this.mHalfStoneHeight, this.mTailPaint);
                left += sBlockWidth[i];
                if (gap >= sGapWidth[i]) {
                    left += 8;
                    gap -= 8;
                } else {
                    left += gap;
                    gap = 0;
                }
            }
            canvas.drawRect((float) left, (float) (-this.mHalfStoneHeight), (float) (-drawable.getIntrinsicWidth()), (float) this.mHalfStoneHeight, this.mTailPaint);
            if (1 == this.mDirection) {
                canvas.rotate(-180.0f);
            }
            canvas.translate((float) (-narrowStartX), (float) (-centerY));
            canvas.restore();
        }
    }

    public void setPosition(Point attachedPos, int previewRefY) {
        this.mCurrentFramePos.set(attachedPos.x, attachedPos.y);
        this.mPreviewCenterY = previewRefY;
        invalidate();
    }

    public void setMovingAttribute(int direction, int offsetX, int offsetY) {
        this.mDirection = direction & 1;
        this.mOffsetX = offsetX;
        this.mFast = false;
        this.mFilterMoveSpeed = 4096;
        this.mStateChangeTrigger.setCurrentState(Boolean.valueOf(this.mFast));
        this.mCurrentFramePos.set(ExploreByTouchHelper.INVALID_ID, ExploreByTouchHelper.INVALID_ID);
        this.mPointGap = -1.0f;
    }

    public void setTooFast(boolean tooFast, int moveSpeed) {
        Log.i(TAG, "setTooFast moveSpeed=" + moveSpeed + " fastFlag:" + tooFast);
        if (moveSpeed > 7000) {
            moveSpeed = 7000;
        }
        this.mLatestSpeed = moveSpeed;
        if (((float) getPointGap(this.mLatestSpeed)) != this.mPointGap && (this.mHandler.hasMessages(1) ^ 1) != 0) {
            this.mHandler.sendEmptyMessage(1);
        }
    }

    public void setDisplayCenterY(int centerY) {
        this.mDisplayCenterY = centerY;
    }

    private int getPointGap(int speed) {
        if (speed > 4096) {
            return (MAX_GAP * ((speed - 4096) + SPEED_DEVIATION)) / 2904;
        }
        return -1;
    }

    private void applyNewGap() {
        this.mPointGap = (float) getPointGap(this.mFilterMoveSpeed);
        invalidate();
    }

    public boolean isTooFast() {
        return this.mPointGap > 0.0f;
    }

    private void filterSpeed(int moveSpeed) {
        this.mFilterMoveSpeed = (int) ((((float) this.mFilterMoveSpeed) * 0.9f) + (((float) moveSpeed) * 0.1f));
    }

    /* JADX WARNING: Missing block: B:4:0x000d, code:
            return false;
     */
    public boolean isFar() {
        /*
        r4 = this;
        r3 = 0;
        r0 = r4.mCurrentFramePos;
        r0 = r0.y;
        r1 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        if (r0 == r1) goto L_0x000d;
    L_0x0009:
        r0 = r4.mPreviewCenterY;
        if (r0 != 0) goto L_0x000e;
    L_0x000d:
        return r3;
    L_0x000e:
        r0 = r4.mCurrentFramePos;
        r0 = r0.y;
        r1 = r4.mPreviewCenterY;
        r0 = r0 - r1;
        r0 = java.lang.Math.abs(r0);
        r0 = (float) r0;
        r1 = r4.mPreviewCenterY;
        r1 = (float) r1;
        r2 = 1048576000; // 0x3e800000 float:0.25 double:5.180653787E-315;
        r1 = r1 * r2;
        r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1));
        if (r0 < 0) goto L_0x0050;
    L_0x0024:
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "too far current relative y is ";
        r1 = r1.append(r2);
        r2 = r4.mCurrentFramePos;
        r2 = r2.y;
        r1 = r1.append(r2);
        r2 = " refy is ";
        r1 = r1.append(r2);
        r2 = r4.mPreviewCenterY;
        r1 = r1.append(r2);
        r1 = r1.toString();
        com.android.camera.log.Log.e(r0, r1);
        r0 = 1;
        return r0;
    L_0x0050:
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ui.PanoMovingIndicatorView.isFar():boolean");
    }
}
