package com.android.camera.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable;

public class CameraSnapView extends View {
    private CameraSnapAnimateDrawable cameraSnapAnimateDrawable;
    private int mCurrentMode;
    private Bitmap mExtraBitmap;
    private Matrix mExtraBitmapMatrix;
    private Paint mExtraBitmapPaint;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    CameraSnapView.this.mSnapListener.onSnapClick();
                    return;
                case 2:
                    CameraSnapView.this.mSnapListener.onSnapLongPress();
                    return;
                case 3:
                    CameraSnapView.this.mSnapListener.onSnapLongPressCancelOut();
                    return;
                case 4:
                    CameraSnapView.this.mSnapListener.onSnapLongPressCancelIn();
                    return;
                default:
                    return;
            }
        }
    };
    private int mHeight;
    private boolean mMissTaken;
    private long mPressDownTime;
    private long mPressUpTime;
    private SnapListener mSnapListener;
    private int mWidth;

    public interface SnapListener {
        boolean canSnap();

        void onSnapClick();

        void onSnapLongPress();

        void onSnapLongPressCancelIn();

        void onSnapLongPressCancelOut();

        void onSnapPrepare();

        void onTrackSnapMissTaken(long j);

        void onTrackSnapTaken(long j);
    }

    public void setSnapListener(SnapListener snapListener) {
        this.mSnapListener = snapListener;
    }

    public CameraSnapView(Context context) {
        super(context);
        initView();
    }

    public CameraSnapView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public CameraSnapView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        switch (MeasureSpec.getMode(widthMeasureSpec)) {
            case 1073741824:
                this.mWidth = MeasureSpec.getSize(widthMeasureSpec);
                this.mHeight = MeasureSpec.getSize(heightMeasureSpec);
                setMeasuredDimension(this.mWidth, this.mHeight);
                if (this.cameraSnapAnimateDrawable != null) {
                    this.cameraSnapAnimateDrawable.setWidthHeight((float) this.mWidth, (float) this.mHeight);
                    return;
                }
                return;
            default:
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                return;
        }
    }

    private void initView() {
    }

    private void setImageBitmap(Bitmap baseBitmap) {
        float baseScale;
        this.mExtraBitmap = baseBitmap;
        float selfWidth = ((float) getWidth()) * 0.75f;
        float selfHeight = ((float) getHeight()) * 0.75f;
        if (selfWidth / selfHeight > ((float) baseBitmap.getWidth()) / ((float) baseBitmap.getHeight())) {
            baseScale = selfHeight / ((float) baseBitmap.getHeight());
        } else {
            baseScale = selfWidth / ((float) baseBitmap.getWidth());
        }
        this.mExtraBitmapMatrix = new Matrix();
        this.mExtraBitmapMatrix.postScale(baseScale, baseScale);
        this.mExtraBitmapMatrix.postTranslate((((float) getWidth()) - selfWidth) / 2.0f, (((float) getHeight()) - selfHeight) / 2.0f);
        this.mExtraBitmapPaint = new Paint();
        this.mExtraBitmapPaint.setAntiAlias(true);
        this.mExtraBitmapPaint.setFilterBitmap(true);
    }

    public void setCurrentMode(int currentMode, boolean animation) {
        this.mPressUpTime = 0;
        this.mCurrentMode = currentMode;
        if (this.cameraSnapAnimateDrawable == null) {
            this.cameraSnapAnimateDrawable = new CameraSnapAnimateDrawable(getContext());
            this.cameraSnapAnimateDrawable.setCallback(this);
            this.cameraSnapAnimateDrawable.initMode(currentMode);
        } else if (animation) {
            this.cameraSnapAnimateDrawable.initTargetValues(currentMode);
            this.cameraSnapAnimateDrawable.startModeChangeAnimation();
        } else {
            this.cameraSnapAnimateDrawable.initMode(currentMode);
        }
    }

    public void triggerAnimation(int currentMode, boolean start) {
        switch (currentMode) {
            case 161:
            case 168:
            case 169:
                if (this.cameraSnapAnimateDrawable != null) {
                    this.cameraSnapAnimateDrawable.startRecordAnimation(start, currentMode);
                    return;
                }
                return;
            case 162:
            case 166:
            case 170:
                if (!start && this.cameraSnapAnimateDrawable != null) {
                    this.cameraSnapAnimateDrawable.startRecordAnimation(start, currentMode);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void prepareRecording() {
        this.cameraSnapAnimateDrawable.prepareRecording(this.mCurrentMode);
    }

    public void pauseRecording() {
        this.cameraSnapAnimateDrawable.pauseRecording();
    }

    public void resumeRecording() {
        this.cameraSnapAnimateDrawable.resumeRecording();
    }

    public void invalidateDrawable(Drawable who) {
        invalidate();
    }

    public boolean onTouchEvent(MotionEvent event) {
        if (!isEnabled()) {
            return super.onTouchEvent(event);
        }
        switch (event.getAction()) {
            case 0:
                switch (this.mCurrentMode) {
                    case 161:
                    case 162:
                    case 166:
                    case 168:
                    case 169:
                    case 170:
                        break;
                    default:
                        if (this.mSnapListener.canSnap()) {
                            this.cameraSnapAnimateDrawable.startScaleDownAnimation();
                            break;
                        }
                        if (!this.mMissTaken) {
                            this.mMissTaken = true;
                            if (this.mPressUpTime > 0) {
                                this.mSnapListener.onTrackSnapMissTaken(System.currentTimeMillis() - this.mPressUpTime);
                            }
                        }
                        return false;
                }
                this.mMissTaken = false;
                this.mSnapListener.onSnapPrepare();
                this.mPressDownTime = System.currentTimeMillis();
                if (this.mPressUpTime > 0) {
                    this.mSnapListener.onTrackSnapTaken(this.mPressDownTime - this.mPressUpTime);
                }
                this.mHandler.sendEmptyMessageDelayed(2, 800);
                break;
            case 1:
                this.mHandler.removeCallbacksAndMessages(null);
                this.mPressUpTime = System.currentTimeMillis();
                if (this.mPressUpTime - this.mPressDownTime < 800 && inRegion((int) event.getRawX(), (int) event.getRawY())) {
                    this.mHandler.sendEmptyMessage(1);
                    break;
                }
            case 2:
                return false;
            case 3:
            case 6:
                break;
        }
        this.mPressUpTime = System.currentTimeMillis();
        long timeDiffer = this.mPressUpTime - this.mPressDownTime;
        if (timeDiffer > 800) {
            if (inRegion((int) event.getRawX(), (int) event.getRawY())) {
                this.mHandler.sendEmptyMessage(4);
            } else {
                this.mHandler.sendEmptyMessage(3);
            }
        }
        long animationDelayTime = timeDiffer > 120 ? 0 : 120 - timeDiffer;
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 166:
            case 168:
            case 169:
            case 170:
                break;
            default:
                this.cameraSnapAnimateDrawable.startScaleUpAnimation(animationDelayTime, null);
                break;
        }
        return true;
    }

    private boolean inRegion(int x, int y) {
        Rect tempRect = new Rect();
        getGlobalVisibleRect(tempRect);
        return tempRect.contains(x, y);
    }

    public void startRing() {
        setImageBitmap(BitmapFactory.decodeResource(getResources(), R.drawable.v6_ic_audio_shutter_button_normal));
        this.cameraSnapAnimateDrawable.startRingAnimation();
    }

    public void stopRing() {
        recycleBitmap();
        this.cameraSnapAnimateDrawable.stopRingAnimation();
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.cameraSnapAnimateDrawable != null) {
            this.cameraSnapAnimateDrawable.draw(canvas);
        }
        if (this.mExtraBitmap != null) {
            canvas.drawBitmap(this.mExtraBitmap, this.mExtraBitmapMatrix, this.mExtraBitmapPaint);
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.cameraSnapAnimateDrawable != null) {
            this.cameraSnapAnimateDrawable.cancelAnimation();
            this.cameraSnapAnimateDrawable.setCallback(null);
        }
        recycleBitmap();
    }

    private void recycleBitmap() {
        if (this.mExtraBitmap != null) {
            this.mExtraBitmap.recycle();
            this.mExtraBitmap = null;
        }
    }

    public boolean performClick() {
        if (!Util.isAccessible()) {
            return super.performClick();
        }
        super.performClick();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler.sendEmptyMessage(1);
        return true;
    }
}
