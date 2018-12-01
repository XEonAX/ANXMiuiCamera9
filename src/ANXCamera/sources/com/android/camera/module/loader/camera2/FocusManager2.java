package com.android.camera.module.loader.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.params.MeteringRectangle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.FocusManagerAbstract;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera2.CameraCapabilities;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.util.List;

@TargetApi(21)
public class FocusManager2 extends FocusManagerAbstract {
    private boolean mAeAwbLock;
    private long mCafStartTime;
    private Rect mCamera1FocusArea;
    private Rect mCamera1MeteringArea;
    private boolean mFocusAreaSupported;
    private String mFocusMode;
    private Consumer<FocusTask> mFocusResultConsumer = new Consumer<FocusTask>() {
        public void accept(FocusTask focusTask) throws Exception {
            Log.v("FocusManager", "focusResult: " + focusTask.getFocusTrigger() + "|" + focusTask.isSuccess() + "|" + focusTask.isFocusing() + "|" + FocusManager2.this.mState);
            if (focusTask.getFocusTrigger() == 2 || focusTask.getFocusTrigger() == 3) {
                FocusManager2.this.onAutoFocusMoving(focusTask.isFocusing(), focusTask.isSuccess());
                return;
            }
            int i;
            if (FocusManager2.this.mState == 2) {
                if (focusTask.isSuccess()) {
                    FocusManager2.this.setFocusState(3);
                    FocusManager2.this.setLastFocusState(3);
                } else {
                    FocusManager2.this.setFocusState(4);
                    FocusManager2.this.setLastFocusState(4);
                }
                FocusManager2.this.updateFocusUI();
                if (FocusManager2.this.mPendingMultiCapture) {
                    FocusManager2.this.multiCapture();
                } else {
                    FocusManager2.this.capture();
                }
            } else if (FocusManager2.this.mState == 1) {
                if (focusTask.isSuccess()) {
                    FocusManager2.this.setFocusState(3);
                    FocusManager2.this.setLastFocusState(3);
                    if ("auto".equals(FocusManager2.this.mFocusMode) && FocusManager2.this.mLastFocusFrom != 1) {
                        FocusManager2.this.mListener.playSound(1);
                    }
                } else {
                    FocusManager2 focusManager2 = FocusManager2.this;
                    if (FocusManager2.this.mMirror) {
                        i = 1;
                    } else {
                        i = 4;
                    }
                    focusManager2.setFocusState(i);
                    FocusManager2.this.setLastFocusState(4);
                }
                FocusManager2.this.updateFocusUI();
                FocusManager2.this.mHandler.removeMessages(1);
                FocusManager2.this.mCancelAutoFocusIfMove = true;
            } else {
                i = FocusManager2.this.mState;
            }
        }
    };
    private Disposable mFocusResultDisposable;
    private ObservableEmitter<FocusTask> mFocusResultEmitter;
    private Handler mHandler;
    private boolean mKeepFocusUIState;
    private int mLastFocusFrom = -1;
    private int mLastState = 0;
    private RectF mLatestFocusFace;
    private long mLatestFocusTime;
    private Listener mListener;
    private boolean mLockAeAwbNeeded;
    private boolean mMeteringAreaSupported;
    private String mOverrideFocusMode;
    private boolean mPendingMultiCapture;
    private List<String> mSupportedFocusModes;

    public interface Listener {
        void cancelFocus(boolean z);

        boolean multiCapture();

        void notifyFocusAreaUpdate();

        boolean onWaitingFocusFinished();

        void playSound(int i);

        void startFocus();

        void stopObjectTracking(boolean z);
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                case 1:
                    ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
                    if (p != null) {
                        p.reShowFaceRect();
                    }
                    if (msg.what == 1 && FocusManager2.this.isFocusingSnapOnFinish()) {
                        FocusManager2.this.setFocusState(4);
                        FocusManager2.this.setLastFocusState(4);
                        if (FocusManager2.this.mPendingMultiCapture) {
                            FocusManager2.this.multiCapture();
                            return;
                        } else {
                            FocusManager2.this.capture();
                            return;
                        }
                    }
                    FocusManager2.this.cancelFocus();
                    return;
                default:
                    return;
            }
        }
    }

    public FocusManager2(CameraCapabilities cc, Listener listener, boolean mirror, Looper looper) {
        this.mHandler = new MainHandler(looper);
        setCharacteristics(cc);
        this.mListener = listener;
        setMirror(mirror);
        this.mFocusResultDisposable = Observable.create(new ObservableOnSubscribe<FocusTask>() {
            public void subscribe(ObservableEmitter<FocusTask> observableEmitter) throws Exception {
                FocusManager2.this.mFocusResultEmitter = observableEmitter;
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mFocusResultConsumer);
    }

    public void setCharacteristics(CameraCapabilities cc) {
        this.mFocusAreaSupported = cc.isAFRegionSupported();
        this.mMeteringAreaSupported = cc.isAERegionSupported();
        this.mLockAeAwbNeeded = !cc.isAELockSupported() ? cc.isAWBLockSupported() : true;
        this.mSupportedFocusModes = AutoFocus.convertToLegacyFocusModes(cc.getSupportedFocusModes());
    }

    public void setPreviewSize(int previewWidth, int previewHeight) {
        if (this.mPreviewWidth != previewWidth || this.mPreviewHeight != previewHeight) {
            this.mPreviewWidth = previewWidth;
            this.mPreviewHeight = previewHeight;
            Log.d("FocusManager", "setPreviewSize: " + this.mPreviewWidth + "x" + this.mPreviewHeight);
            setMatrix();
        }
    }

    private void setFocusState(int state) {
        Log.v("FocusManager", "setFocusState: " + state);
        this.mState = state;
    }

    private void setLastFocusState(int state) {
        this.mLastState = state;
    }

    public void prepareCapture(boolean autoFocus, int fromWhat) {
        if (this.mInitialized) {
            boolean tryAutoFocus = true;
            boolean autoFocusCalled = false;
            String focusMode = getFocusMode();
            if (fromWhat == 2 && (("auto".equals(focusMode) || "macro".equals(focusMode)) && (this.mLastState == 3 || (autoFocus ^ 1) != 0))) {
                tryAutoFocus = false;
            }
            Log.v("FocusManager", "prepareCapture: " + autoFocus + "|" + fromWhat + "|" + focusMode);
            boolean isCaf = "continuous-picture".equals(focusMode);
            if (isFocusEnabled() && (isCaf ^ 1) != 0 && tryAutoFocus) {
                if (this.mState != 3 && this.mState != 4) {
                    ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
                    if (p == null || !p.isFaceExists(p.getActiveIndicator())) {
                        resetFocusAreaToCenter();
                        startFocus(0);
                        autoFocusCalled = true;
                    } else {
                        focusFaceArea();
                        autoFocusCalled = true;
                    }
                } else if (!(!autoFocus || this.mCamera1FocusArea == null || (Device.isResetToCCAFAfterCapture() ^ 1) == 0)) {
                    this.mKeepFocusUIState = true;
                    startFocus(this.mLastFocusFrom);
                    this.mKeepFocusUIState = false;
                    autoFocusCalled = true;
                }
            }
            if (!autoFocusCalled && autoFocus && isCaf) {
                if (!Device.isHalDoesCafWhenFlashOn()) {
                    requestAutoFocus();
                } else if (this.mState == 1) {
                    cancelFocus();
                }
            }
        }
    }

    public void doSnap() {
        if (this.mInitialized) {
            if (this.mState == 3 || this.mState == 4 || (needAutoFocusCall() ^ 1) != 0) {
                capture();
            } else if (this.mState == 1) {
                setFocusState(2);
            } else if (this.mState == 0) {
                capture();
            }
        }
    }

    public void doMultiSnap(boolean checkFocusState) {
        if (this.mInitialized) {
            if (!checkFocusState) {
                multiCapture();
            }
            if (this.mState == 3 || this.mState == 4 || (needAutoFocusCall() ^ 1) != 0) {
                multiCapture();
            } else if (this.mState == 1) {
                setFocusState(2);
                this.mPendingMultiCapture = true;
            } else if (this.mState == 0) {
                multiCapture();
            }
        }
    }

    public void onFocusResult(FocusTask focusTask) {
        this.mFocusResultEmitter.onNext(focusTask);
    }

    private void onAutoFocusMoving(boolean moving, boolean isSuccessful) {
        if (this.mInitialized) {
            ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            boolean showFocusIndicator = true;
            if (p.isFaceExists(p.getActiveIndicator())) {
                p.clearFocusView(3);
                showFocusIndicator = false;
            }
            Log.d("FocusManager", "onAutoFocusMoving: mode=" + getFocusMode() + " show=" + showFocusIndicator);
            if (this.mCamera1FocusArea == null && !"auto".equals(getFocusMode())) {
                if (moving) {
                    if (this.mState != 2) {
                        setFocusState(1);
                    }
                    Log.v("FocusManager", "Camera KPI: CAF start");
                    this.mCafStartTime = System.currentTimeMillis();
                    if (showFocusIndicator) {
                        p.showIndicator(2, 1);
                    }
                } else {
                    int state = this.mState;
                    Log.v("FocusManager", "Camera KPI: CAF stop: Focus time: " + (System.currentTimeMillis() - this.mCafStartTime));
                    if (isSuccessful) {
                        setFocusState(3);
                        setLastFocusState(3);
                    } else {
                        setFocusState(4);
                        setLastFocusState(4);
                    }
                    if (showFocusIndicator) {
                        int i;
                        if (isSuccessful) {
                            i = 2;
                        } else {
                            i = 3;
                        }
                        p.showIndicator(2, i);
                    }
                    if (state == 2) {
                        setFocusState(3);
                        if (this.mPendingMultiCapture) {
                            multiCapture();
                        } else {
                            capture();
                        }
                    }
                }
                return;
            }
            return;
        }
        Log.d("FocusManager", "onAutoFocusMoving");
    }

    private boolean resetFocusAreaToFaceArea() {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (p != null && p.isFaceExists(p.getActiveIndicator())) {
            RectF rect = p.getFocusRect(p.getActiveIndicator());
            if (rect != null) {
                this.mLatestFocusFace = rect;
                initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, (int) ((rect.left + rect.right) / 2.0f), (int) ((rect.top + rect.bottom) / 2.0f), this.mPreviewWidth, this.mPreviewHeight);
                return true;
            }
        }
        return false;
    }

    private void resetFocusAreaToCenter() {
        initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, this.mPreviewWidth / 2, this.mPreviewHeight / 2, this.mPreviewWidth, this.mPreviewHeight);
        initializeFocusIndicator(5, this.mPreviewWidth / 2, this.mPreviewHeight / 2);
    }

    private void initializeFocusAreas(int focusWidth, int focusHeight, int x, int y, int previewWidth, int previewHeight) {
        if (this.mCamera1FocusArea == null) {
            this.mCamera1FocusArea = new Rect();
        }
        calculateTapArea(focusWidth, focusHeight, 1.0f, x, y, previewWidth, previewHeight, this.mCamera1FocusArea);
    }

    private void initializeMeteringAreas(int focusWidth, int focusHeight, int x, int y, int previewWidth, int previewHeight, int from) {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (from != 1 || p == null || (p.isNeedExposure(1) ^ 1) == 0) {
            if (this.mCamera1MeteringArea == null) {
                this.mCamera1MeteringArea = new Rect();
            }
            calculateTapArea(focusWidth, focusHeight, 1.8f, x, y, previewWidth, previewHeight, this.mCamera1MeteringArea);
            return;
        }
        this.mCamera1MeteringArea = null;
    }

    private void initializeFocusIndicator(int type, int x, int y) {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (p != null) {
            p.setFocusViewPosition(type, x, y);
        }
    }

    public void resetFocusIndicator(int type) {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (p != null) {
            p.clearFocusView(type);
        }
    }

    private void initializeParameters(int x, int y, int from, boolean onlyAe) {
        if (this.mFocusAreaSupported && (onlyAe ^ 1) != 0) {
            initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, x, y, this.mPreviewWidth, this.mPreviewHeight);
        }
        if (this.mMeteringAreaSupported) {
            initializeMeteringAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, x, y, this.mPreviewWidth, this.mPreviewHeight, from);
        }
    }

    public void onSingleTapUp(int x, int y) {
        focusPoint(x, y, 3, onlyAe());
    }

    private boolean onlyAe() {
        return getTapAction() == 1;
    }

    private void focusPoint(int x, int y, int from, boolean onlyAe) {
        if (this.mInitialized && this.mState != 2 && (this.mOverrideFocusMode == null || (isAutoFocusMode(this.mOverrideFocusMode) ^ 1) == 0)) {
            if (isNeedCancelAutoFocus()) {
                cancelFocus();
            }
            initializeParameters(x, y, from, onlyAe);
            initializeFocusIndicator(1, x, y);
            this.mListener.notifyFocusAreaUpdate();
            if (!this.mFocusAreaSupported || (onlyAe ^ 1) == 0) {
                if (this.mMeteringAreaSupported) {
                    if (3 == from && isFocusValid(from)) {
                        this.mListener.playSound(1);
                        this.mCancelAutoFocusIfMove = true;
                    }
                    this.mLastFocusFrom = from;
                    setFocusState(1);
                    updateFocusUI();
                    setFocusState(3);
                    updateFocusUI();
                    this.mHandler.removeMessages(0);
                }
            } else if (isFocusValid(from)) {
                startFocus(from);
            }
        }
    }

    public void requestAutoFocus() {
        if (needAutoFocusCall() && (this.mInitialized ^ 1) == 0 && this.mState != 2) {
            ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            int from = 4;
            if (isNeedCancelAutoFocus()) {
                this.mListener.cancelFocus(false);
                if (p != null) {
                    p.clearFocusView(2);
                }
                setFocusState(0);
                this.mCancelAutoFocusIfMove = false;
                this.mHandler.removeMessages(0);
                this.mHandler.removeMessages(1);
            }
            if (resetFocusAreaToFaceArea()) {
                if (p != null) {
                    p.clearFocusView(9);
                }
                from = 1;
            } else {
                resetFocusAreaToCenter();
            }
            this.mAeAwbLock = false;
            this.mListener.notifyFocusAreaUpdate();
            startFocus(from);
        }
    }

    public boolean focusFaceArea() {
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (!isAutoFocusMode(getFocusMode()) || (p != null && 2 == p.getActiveIndicator())) {
            return false;
        }
        RectF rect = p != null ? p.getFocusRect(p.getActiveIndicator()) : null;
        if (rect == null || rect.isEmpty()) {
            return false;
        }
        if (this.mLatestFocusFace != null && this.mLastFocusFrom == 1 && Math.abs(rect.left - this.mLatestFocusFace.left) < 80.0f && Math.abs((rect.right - rect.left) - (this.mLatestFocusFace.right - this.mLatestFocusFace.left)) < 80.0f) {
            return false;
        }
        this.mLatestFocusFace = rect;
        focusPoint((int) ((rect.left + rect.right) / 2.0f), (int) ((rect.top + rect.bottom) / 2.0f), 1, false);
        return true;
    }

    public void onShutter() {
        updateFocusUI();
        this.mAeAwbLock = false;
    }

    private boolean isFocusValid(int from) {
        long now = System.currentTimeMillis();
        int i = (this.mLastFocusFrom == 3 || this.mLastFocusFrom == 4) ? 5000 : 4000;
        long timeout = (long) i;
        if (from >= 3 || from >= this.mLastFocusFrom || Util.isTimeout(now, this.mLatestFocusTime, timeout)) {
            this.mLatestFocusTime = System.currentTimeMillis();
            return true;
        }
        if (this.mLastFocusFrom == 1) {
            resetTouchFocus(7);
        }
        return false;
    }

    private void startFocus(int from) {
        Log.d("FocusManager", "startFocus: " + from);
        setFocusMode("auto");
        this.mLastFocusFrom = from;
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (from != 1 || (p != null && 1 == p.getActiveIndicator())) {
            this.mListener.stopObjectTracking(false);
        }
        this.mListener.startFocus();
        setFocusState(1);
        updateFocusUI();
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    public void cancelFocus() {
        setFocusMode(CameraSettings.getFocusMode());
        resetTouchFocus(2);
        if (needAutoFocusCall()) {
            this.mListener.cancelFocus(true);
        } else {
            this.mListener.notifyFocusAreaUpdate();
        }
        if (2 != this.mState) {
            setFocusState(0);
        } else {
            Log.e("FocusManager", "waiting focus timeout!");
        }
        updateFocusUI();
        this.mCancelAutoFocusIfMove = false;
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        Log.d("FocusManager", "cancelFocus");
    }

    private void capture() {
        if (this.mListener.onWaitingFocusFinished()) {
            if (Device.isResetToCCAFAfterCapture()) {
                setFocusState(0);
                this.mCancelAutoFocusIfMove = false;
            }
            this.mPendingMultiCapture = false;
            this.mHandler.removeMessages(0);
        }
    }

    private void multiCapture() {
        if (this.mListener.multiCapture()) {
            setFocusState(0);
            this.mPendingMultiCapture = false;
            this.mHandler.removeMessages(0);
        }
    }

    public void resetFocusStateIfNeeded() {
        this.mCamera1FocusArea = null;
        this.mCamera1MeteringArea = null;
        setFocusState(0);
        setLastFocusState(0);
        this.mCancelAutoFocusIfMove = false;
        if (!this.mHandler.hasMessages(0)) {
            this.mHandler.sendEmptyMessage(0);
        }
    }

    public String setFocusMode(String focusMode) {
        if (focusMode == null) {
            Log.e("FocusManager", "setFocusMode: null focus mode", new RuntimeException());
            return focusMode;
        }
        if ("auto".equals(focusMode) || !Util.isSupported(focusMode, this.mSupportedFocusModes)) {
            this.mFocusMode = "auto";
        } else {
            this.mFocusMode = focusMode;
        }
        if ("continuous-picture".equals(this.mFocusMode) || "continuous-video".equals(this.mFocusMode)) {
            this.mLastFocusFrom = -1;
        }
        return this.mFocusMode;
    }

    public String getFocusMode() {
        if (this.mOverrideFocusMode != null) {
            return this.mOverrideFocusMode;
        }
        if (this.mFocusMode == null) {
            this.mFocusMode = CameraSettings.getFocusMode();
        }
        Log.d("FocusManager", "getFocusMode=" + this.mFocusMode);
        return this.mFocusMode;
    }

    public MeteringRectangle[] getFocusAreas(Rect cropRegion) {
        if (this.mCamera1FocusArea == null) {
            return null;
        }
        return afaeRectangle(this.mCamera1FocusArea, cropRegion);
    }

    public MeteringRectangle[] getMeteringAreas(Rect cropRegion) {
        if (this.mCamera1MeteringArea == null) {
            return null;
        }
        return afaeRectangle(this.mCamera1MeteringArea, cropRegion);
    }

    public void updateFocusUI() {
        int i = 2;
        ModeProtocol$MainContentProtocol p = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (this.mInitialized && !this.mKeepFocusUIState && p != null) {
            int focusIndicator = 2;
            if (1 == this.mLastFocusFrom) {
                focusIndicator = p.getActiveIndicator();
            }
            switch (this.mState) {
                case 0:
                    if (focusIndicator != 2) {
                        p.clearIndicator(focusIndicator);
                        break;
                    } else {
                        p.clearFocusView(7);
                        break;
                    }
                case 1:
                case 2:
                    p.showIndicator(focusIndicator, 1);
                    break;
                case 3:
                    p.showIndicator(focusIndicator, 2);
                    break;
                case 4:
                    if (!("continuous-picture".equals(this.mFocusMode) || "continuous-video".equals(this.mFocusMode))) {
                        i = 3;
                    }
                    p.showIndicator(focusIndicator, i);
                    break;
            }
        }
    }

    public void resetTouchFocus(int type) {
        if (this.mInitialized) {
            this.mCamera1FocusArea = null;
            this.mCamera1MeteringArea = null;
            this.mCancelAutoFocusIfMove = false;
            resetFocusIndicator(type);
        }
    }

    public boolean isFocusingSnapOnFinish() {
        return this.mState == 2;
    }

    public void removeMessages() {
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
    }

    public void setAeAwbLock(boolean lock) {
        this.mAeAwbLock = lock;
    }

    private boolean needAutoFocusCall() {
        return 2 == getTapAction() ? this.mFocusAreaSupported : false;
    }

    private int getTapAction() {
        String focusMode = getFocusMode();
        if (focusMode.equals("edof") || focusMode.equals("manual")) {
            return 1;
        }
        return 2;
    }

    private boolean isAutoFocusMode(String focusMode) {
        if ("auto".equals(focusMode)) {
            return true;
        }
        return "macro".equals(focusMode);
    }

    public boolean isNeedCancelAutoFocus() {
        if (this.mHandler.hasMessages(0) || this.mHandler.hasMessages(1)) {
            return true;
        }
        return this.mCancelAutoFocusIfMove;
    }

    public void onDeviceKeepMoving(double a) {
        if (Util.isTimeout(System.currentTimeMillis(), this.mLatestFocusTime, 3000)) {
            setLastFocusState(0);
            if (this.mCancelAutoFocusIfMove) {
                this.mHandler.sendEmptyMessage(0);
            }
        }
    }

    private boolean isFocusEnabled() {
        if (!this.mInitialized || this.mState == 2 || this.mState == 1) {
            return false;
        }
        return needAutoFocusCall();
    }

    private MeteringRectangle[] afaeRectangle(Rect camera1Region, Rect cropRegion) {
        return new MeteringRectangle[]{new MeteringRectangle(convertToCamera2Coordinates(camera1Region, cropRegion), 1)};
    }

    public boolean canRecord() {
        if (!isFocusing()) {
            return true;
        }
        setFocusState(2);
        return false;
    }

    public boolean isFocusing() {
        return this.mState == 1 || this.mState == 2;
    }

    public void resetFocused() {
        setFocusState(0);
    }

    public void destroy() {
        removeMessages();
        this.mFocusResultDisposable.dispose();
    }
}
