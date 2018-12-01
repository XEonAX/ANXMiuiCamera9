package com.android.camera.ui;

import android.graphics.Point;
import android.graphics.RectF;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.SimpleOnScaleGestureListener;
import android.view.ViewConfiguration;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$FilterSwitcher;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.protocol.ModeProtocol$ModeChangeController;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.EdgeGestureDetector.EdgeGestureListener;

public class V6GestureRecognizer {
    private static V6GestureRecognizer sV6GestureRecognizer;
    private final int MIN_DETECT_DISTANCE;
    private final Camera mActivity;
    private final CameraGestureDetector mCameraGestureDetector;
    private Module mCurrentModule;
    private float mDistanceX;
    private float mDistanceY;
    private int mEdgeGesture = 0;
    private final EdgeGestureDetector mEdgeGestureDetector;
    private int mGesture = 0;
    private final GestureDetector mGestureDetector;
    private boolean mInScaling;
    private final ScaleGestureDetector mScaleDetector;
    private boolean mScaleDetectorEnable = true;
    private int mScrollDirection;
    private boolean mScrolled;
    private boolean mTouchDown;

    private class CameraGestureDetector {
        private Point mStartPoint = new Point();

        public void onTouchEvent(MotionEvent ev) {
            switch (ev.getAction() & 255) {
                case 0:
                    this.mStartPoint.set((int) ev.getX(), (int) ev.getY());
                    return;
                case 2:
                    Log.v("GESTURE_", "CameraGestureDetector ACTION_MOVE mGesture=" + V6GestureRecognizer.this.mGesture);
                    if (V6GestureRecognizer.this.mGesture / 100 == 0) {
                        Point point = V6GestureRecognizer.this.getMoveVector(this.mStartPoint.x, this.mStartPoint.y, (int) ev.getX(), (int) ev.getY());
                        Log.v("CameraGestureRecognizer", "mGesture=" + V6GestureRecognizer.this.mGesture + " orientation=" + (Math.abs(point.x) > Math.abs(point.y) ? "h" : "v") + " dx=" + point.x + " dy=" + point.y);
                        if (V6GestureRecognizer.this.MIN_DETECT_DISTANCE <= (point.x * point.x) + (point.y * point.y)) {
                            V6GestureRecognizer v6GestureRecognizer = V6GestureRecognizer.this;
                            v6GestureRecognizer.mGesture = (Math.abs(point.x) > Math.abs(point.y) ? 100 : Callback.DEFAULT_DRAG_ANIMATION_DURATION) + v6GestureRecognizer.mGesture;
                        }
                    }
                    Log.v("GESTURE_", "CameraGestureDetector ACTION_MOVE end mGesture=" + V6GestureRecognizer.this.mGesture);
                    return;
                case 6:
                    if (ev.getPointerCount() == 2 && V6GestureRecognizer.this.couldNotifyGesture(false)) {
                        float l;
                        float r;
                        float t;
                        float b;
                        if (ev.getX(0) < ev.getX(1)) {
                            l = ev.getX(0);
                            r = ev.getX(1);
                        } else {
                            l = ev.getX(1);
                            r = ev.getX(0);
                        }
                        if (ev.getY(0) < ev.getY(1)) {
                            t = ev.getY(0);
                            b = ev.getY(1);
                        } else {
                            t = ev.getY(1);
                            b = ev.getY(0);
                        }
                        if (V6GestureRecognizer.this.couldNotifyGesture(false)) {
                            V6GestureRecognizer v6GestureRecognizer2 = V6GestureRecognizer.this;
                            v6GestureRecognizer2.mGesture = v6GestureRecognizer2.mGesture + 10;
                            V6GestureRecognizer.this.mCurrentModule.onGestureTrack(new RectF(l, t, r, b), true);
                            return;
                        }
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    private class MyEdgeGestureListener implements EdgeGestureListener {
        /* synthetic */ MyEdgeGestureListener(V6GestureRecognizer this$0, MyEdgeGestureListener -this1) {
            this();
        }

        private MyEdgeGestureListener() {
        }

        public boolean onEdgeTap(int x, int y) {
            Log.v("CameraGestureRecognizer", "MyEdgeGestureListener onEdgeTap x=" + x + " y=" + y);
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || (V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent() ^ 1) == 0 || !ModuleManager.isCameraModule()) {
                return false;
            }
            Log.v("CameraGestureRecognizer", "EdgeGesture detectTap success");
            return V6GestureRecognizer.this.mActivity.getEdgeShutterView().onEdgeTap(x, y);
        }

        public boolean onEdgeTouch(int x, int y) {
            Log.v("CameraGestureRecognizer", "MyEdgeGestureListener onEdgeTouch x=" + x + " y=" + y);
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || (V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent() ^ 1) == 0 || !ModuleManager.isCameraModule()) {
                return false;
            }
            Log.v("CameraGestureRecognizer", "EdgeGesture detectTouch success");
            return V6GestureRecognizer.this.mActivity.getEdgeShutterView().onEdgeTouch(x, y);
        }
    }

    private class MyGestureListener extends SimpleOnGestureListener {
        private boolean mHandleConfirmTap;

        /* synthetic */ MyGestureListener(V6GestureRecognizer this$0, MyGestureListener -this1) {
            this();
        }

        private MyGestureListener() {
        }

        private boolean handleSingleTap(MotionEvent e) {
            if (!V6GestureRecognizer.this.couldNotifyGesture(false)) {
                return false;
            }
            V6GestureRecognizer.this.mCurrentModule.onSingleTapUp((int) e.getX(), (int) e.getY());
            return true;
        }

        public boolean onSingleTapUp(MotionEvent e) {
            Log.v("CameraGestureRecognizer", "onSingleTapUp");
            ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (p == null || !p.isEffectViewVisible()) {
                return handleSingleTap(e);
            }
            this.mHandleConfirmTap = V6GestureRecognizer.this.couldNotifyGesture(false);
            return false;
        }

        public boolean onDoubleTap(MotionEvent e) {
            int i = 0;
            if (!this.mHandleConfirmTap) {
                return false;
            }
            int invert = EffectController.getInstance().getInvertFlag();
            EffectController instance = EffectController.getInstance();
            if (invert == 0) {
                i = 1;
            }
            instance.setInvertFlag(i);
            return true;
        }

        public boolean onSingleTapConfirmed(MotionEvent e) {
            ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (p != null && p.isEffectViewVisible() && this.mHandleConfirmTap) {
                return handleSingleTap(e);
            }
            return false;
        }

        public void onLongPress(MotionEvent e) {
            Log.v("CameraGestureRecognizer", "onLongPress");
            if (V6GestureRecognizer.this.couldNotifyGesture(false)) {
                V6GestureRecognizer.this.mCurrentModule.onLongPress((int) e.getX(), (int) e.getY());
            }
        }

        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            if (V6GestureRecognizer.this.mInScaling || V6GestureRecognizer.this.mScrolled) {
                return false;
            }
            Log.d("CameraGestureRecognizer", "onScroll: " + e1.getX() + "|" + e1.getY() + "|" + e2.getX() + "|" + e2.getY());
            V6GestureRecognizer v6GestureRecognizer = V6GestureRecognizer.this;
            v6GestureRecognizer.mDistanceY = v6GestureRecognizer.mDistanceY + (-distanceY);
            if (Math.abs(V6GestureRecognizer.this.mDistanceY) > ((float) Util.dpToPixel(80.0f)) || V6GestureRecognizer.this.getCurrentGesture() == 7 || V6GestureRecognizer.this.getCurrentGesture() == 6) {
                return false;
            }
            v6GestureRecognizer = V6GestureRecognizer.this;
            v6GestureRecognizer.mDistanceX = v6GestureRecognizer.mDistanceX + (-distanceX);
            if (V6GestureRecognizer.this.mScrollDirection == 0 && ((float) V6GestureRecognizer.this.MIN_DETECT_DISTANCE) <= (V6GestureRecognizer.this.mDistanceX * V6GestureRecognizer.this.mDistanceX) + (V6GestureRecognizer.this.mDistanceY * V6GestureRecognizer.this.mDistanceY)) {
                V6GestureRecognizer.this.mScrollDirection = Math.abs(V6GestureRecognizer.this.mDistanceX) > Math.abs(V6GestureRecognizer.this.mDistanceY) ? 100 : Callback.DEFAULT_DRAG_ANIMATION_DURATION;
            }
            if (V6GestureRecognizer.this.mScrollDirection != 100) {
                return false;
            }
            int gravity = -1;
            if (V6GestureRecognizer.this.mDistanceX > ((float) Util.dpToPixel(35.0f))) {
                gravity = 3;
                V6GestureRecognizer.this.mScrolled = true;
            } else if (V6GestureRecognizer.this.mDistanceX < ((float) (-Util.dpToPixel(35.0f)))) {
                gravity = 5;
                V6GestureRecognizer.this.mScrolled = true;
            }
            ModeProtocol$FilterSwitcher filterSwitcher = (ModeProtocol$FilterSwitcher) ModeCoordinatorImpl.getInstance().getAttachProtocol(183);
            if (filterSwitcher != null && filterSwitcher.switchFilter(gravity)) {
                return true;
            }
            ModeProtocol$ModeChangeController controller = (ModeProtocol$ModeChangeController) ModeCoordinatorImpl.getInstance().getAttachProtocol(179);
            if (controller == null) {
                return false;
            }
            controller.selectMode(gravity, 0);
            return true;
        }
    }

    private class MyScaleListener extends SimpleOnScaleGestureListener {
        private boolean mZoomScaled;

        /* synthetic */ MyScaleListener(V6GestureRecognizer this$0, MyScaleListener -this1) {
            this();
        }

        private MyScaleListener() {
        }

        public boolean onScaleBegin(ScaleGestureDetector detector) {
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent()) {
                return false;
            }
            this.mZoomScaled = false;
            return V6GestureRecognizer.this.mCurrentModule.onScaleBegin(detector.getFocusX(), detector.getFocusY());
        }

        public boolean onScale(ScaleGestureDetector detector) {
            if (!V6GestureRecognizer.this.isCurrentModuleAlive()) {
                return false;
            }
            if (!V6GestureRecognizer.this.couldNotifyGesture(false) && V6GestureRecognizer.this.getCurrentGesture() != 9) {
                return false;
            }
            V6GestureRecognizer.this.setGesture(9);
            boolean scaled = V6GestureRecognizer.this.mCurrentModule.onScale(detector.getFocusX(), detector.getFocusY(), detector.getScaleFactor());
            if (!this.mZoomScaled) {
                this.mZoomScaled = scaled;
            }
            return scaled;
        }

        public void onScaleEnd(ScaleGestureDetector detector) {
            if (this.mZoomScaled) {
                CameraStatUtil.trackZoomAdjusted("手势");
                this.mZoomScaled = false;
            }
            if (V6GestureRecognizer.this.isCurrentModuleAlive()) {
                V6GestureRecognizer.this.mCurrentModule.onScaleEnd();
            }
        }
    }

    private V6GestureRecognizer(ActivityBase activity) {
        this.mActivity = (Camera) activity;
        this.MIN_DETECT_DISTANCE = ViewConfiguration.get(this.mActivity).getScaledTouchSlop() * ViewConfiguration.get(this.mActivity).getScaledTouchSlop();
        this.mGestureDetector = new GestureDetector(activity, new MyGestureListener(this, null), null, true);
        this.mEdgeGestureDetector = new EdgeGestureDetector(new MyEdgeGestureListener(this, null));
        this.mScaleDetector = new ScaleGestureDetector(activity, new MyScaleListener(this, null));
        this.mCameraGestureDetector = new CameraGestureDetector();
    }

    public static synchronized V6GestureRecognizer getInstance(ActivityBase activity) {
        V6GestureRecognizer v6GestureRecognizer;
        synchronized (V6GestureRecognizer.class) {
            if (sV6GestureRecognizer == null || activity != sV6GestureRecognizer.mActivity) {
                sV6GestureRecognizer = new V6GestureRecognizer(activity);
            }
            v6GestureRecognizer = sV6GestureRecognizer;
        }
        return v6GestureRecognizer;
    }

    public boolean onEdgeTouchEvent(MotionEvent event) {
        Log.v("CameraGestureRecognizer", "onEdgeTouchEvent mGesture=" + this.mGesture + " maskAction=" + event.getActionMasked());
        this.mEdgeGestureDetector.onTouchEvent(event);
        return true;
    }

    public void setCurrentModule(Module currentModule) {
        this.mCurrentModule = currentModule;
    }

    public void setScaleDetectorEnable(boolean enable) {
        this.mScaleDetectorEnable = enable;
    }

    private boolean isCurrentModuleAlive() {
        return (this.mCurrentModule == null || !this.mCurrentModule.isCreated()) ? false : this.mCurrentModule.isDeparted() ^ 1;
    }

    public boolean onTouchEvent(MotionEvent e) {
        Log.v("CameraGestureRecognizer", "onTouchEvent mGesture=" + this.mGesture + " action=" + e.getAction());
        if (e.getActionMasked() == 0) {
            this.mGesture = 0;
        }
        if (e.getActionMasked() == 0) {
            this.mTouchDown = true;
            this.mInScaling = false;
        } else if (!this.mTouchDown) {
            return false;
        } else {
            if (e.getActionMasked() == 3 || e.getActionMasked() == 1) {
                this.mTouchDown = false;
            }
        }
        if (e.getActionMasked() == 0 || e.getActionMasked() == 5) {
            this.mScrolled = false;
            this.mScrollDirection = 0;
            this.mDistanceX = 0.0f;
            this.mDistanceY = 0.0f;
        }
        Log.v("CameraGestureRecognizer", "set to detector mScaleDetectorEnable = " + this.mScaleDetectorEnable);
        if (this.mScaleDetectorEnable) {
            this.mScaleDetector.onTouchEvent(e);
            if (this.mScaleDetector.isInProgress()) {
                this.mInScaling = true;
            }
        } else {
            this.mInScaling = false;
        }
        this.mCameraGestureDetector.onTouchEvent(e);
        checkControlView(e);
        this.mGestureDetector.onTouchEvent(e);
        boolean result = isGestureDetecting() ^ 1;
        if (e.getAction() == 1 || e.getAction() == 3) {
            this.mGesture = 0;
            this.mInScaling = false;
            this.mScrolled = false;
            this.mScrollDirection = 0;
            this.mDistanceX = 0.0f;
            this.mDistanceY = 0.0f;
        }
        return result;
    }

    private boolean checkControlView(MotionEvent e) {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (p != null) {
            if (p.isEffectViewVisible()) {
                p.onViewTouchEvent(R.id.v6_effect_crop_view, e);
                if (p.isEffectViewMoved()) {
                    if (isGestureDetecting()) {
                        this.mGesture += 6;
                    }
                } else if (!p.isEffectViewMoved() && getCurrentGesture() == 6) {
                    setGesture(0);
                }
            }
            if (p.isIndicatorVisible(2)) {
                boolean adjustEv = p.isEvAdjusted(false);
                p.onViewTouchEvent(R.id.v6_focus_view, e);
                if (p.isEvAdjusted(false)) {
                    if (isGestureDetecting()) {
                        this.mGesture += 7;
                    }
                } else if (!adjustEv && getCurrentGesture() == 7) {
                    setGesture(0);
                }
            }
        }
        return isGestureDetecting() ^ 1;
    }

    public void setGesture(int gesture) {
        this.mGesture = ((this.mGesture / 100) * 100) + gesture;
    }

    private Point getMoveVector(int e1x, int e1y, int e2x, int e2y) {
        Point vector = new Point();
        vector.x = e1x - e2x;
        vector.y = e1y - e2y;
        return vector;
    }

    private boolean couldNotifyGesture(boolean isEdge) {
        return isGestureDetecting(isEdge) ? isCurrentModuleAlive() : false;
    }

    private boolean isGestureDetecting(boolean isEdge) {
        return (isEdge ? this.mEdgeGesture : this.mGesture) % 100 == 0;
    }

    public boolean isGestureDetecting() {
        return this.mGesture % 100 == 0;
    }

    public int getGestureOrientation() {
        return (this.mGesture / 100) * 100;
    }

    public int getCurrentGesture() {
        return this.mGesture % 100;
    }

    public static void onDestroy(ActivityBase activity) {
        if (sV6GestureRecognizer != null && sV6GestureRecognizer.mActivity == activity) {
            sV6GestureRecognizer = null;
        }
    }
}
