package com.android.camera.ui;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.util.AttributeSet;
import com.android.camera.ActivityBase;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera2.CameraHardwareFace;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import miui.view.animation.CubicEaseOutInterpolator;

public class FaceView extends FrameView {
    private static Configuration configuration = CameraAppImpl.getAndroidContext().getResources().getConfiguration();
    private int mAgeFemaleHonPadding;
    private int mAgeMaleHonPadding;
    private int mAgeVerPadding;
    private Drawable mBeautyScoreIc;
    private Matrix mCamera2TranslateMatrix = new Matrix();
    private Matrix mCanvasMatrix = new Matrix();
    private RectF mCanvasRect = new RectF();
    private int mCorrection;
    private Rect mCropRegion;
    private CameraHardwareFace[] mDrawingFaces;
    private Paint mEffectRectPaint = new Paint();
    private String mFaceAgeFormat;
    private Paint mFaceInfoNumberPaint;
    private Paint mFaceInfoTextPaint;
    private int mFacePopupBottom;
    private Animator mFaceRectHideAnimator;
    private String mFaceScoreInfoFormat;
    private CameraHardwareFace[] mFaces;
    private Drawable mFemaleAgeInfoPop;
    private int mGap;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    if (FaceView.this.mRectState == 3) {
                        FaceView.this.mRectState = 2;
                        FaceView.this.setFaceRectVisible(8, 600);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };
    private boolean mIsCameraFaceDetectionAutoHidden;
    private int mLatestFaceIndex = -1;
    private CameraHardwareFace[] mLatestFaces = new CameraHardwareFace[6];
    private Drawable mMagicMirrorInfoPop;
    private Drawable mMaleAgeInfoPop;
    private Matrix mMatrix = new Matrix();
    private boolean mMirror;
    private Paint mNormalRectPaint;
    private int mOrientation;
    private int mPopBottomMargin;
    private RectF mRect = new RectF();
    private int mRectState = 1;
    private int mScoreHonPadding;
    private int mScoreVerPadding;
    private Drawable mSexFemaleIc;
    private Drawable mSexMaleIc;
    private boolean mShowGenderAndAge;
    private boolean mShowMagicMirror;
    private boolean mSkipDraw;
    private Pattern mSplitFaceInfoPattern;
    private int mWinnerIndex = -1;
    private float mZoomValue;

    @Retention(RetentionPolicy.SOURCE)
    @interface FaceViewRectState {
    }

    @Retention(RetentionPolicy.SOURCE)
    @interface PopType {
    }

    public FaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mEffectRectPaint.setAntiAlias(true);
        this.mEffectRectPaint.setStrokeWidth((float) getResources().getDimensionPixelSize(R.dimen.face_rect_width));
        this.mEffectRectPaint.setStyle(Style.STROKE);
        this.mNormalRectPaint = new Paint();
        this.mNormalRectPaint.setAntiAlias(true);
        this.mNormalRectPaint.setColor(-1);
        this.mNormalRectPaint.setStyle(Style.STROKE);
        this.mNormalRectPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
    }

    private void initFaceInfoStyle() {
        if (this.mFaceInfoTextPaint == null) {
            this.mSplitFaceInfoPattern = Pattern.compile("(\\D+)|(\\d+\\.?\\d*)");
            Resources res = getResources();
            this.mFaceAgeFormat = res.getString(R.string.face_age_info);
            this.mFaceScoreInfoFormat = res.getString(R.string.face_score_info);
            this.mMaleAgeInfoPop = res.getDrawable(R.drawable.male_age_info_pop);
            this.mFemaleAgeInfoPop = res.getDrawable(R.drawable.female_age_info_pop);
            this.mSexMaleIc = res.getDrawable(R.drawable.ic_sex_male);
            this.mSexFemaleIc = res.getDrawable(R.drawable.ic_sex_female);
            this.mFaceInfoTextPaint = new Paint();
            this.mFaceInfoTextPaint.setAntiAlias(true);
            this.mFaceInfoTextPaint.setColor(-1);
            float textSize = res.getDimension(R.dimen.face_info_magic_textSize);
            this.mFaceInfoTextPaint.setTextSize(textSize);
            this.mFaceInfoTextPaint.setTextAlign(Align.CENTER);
            this.mFaceInfoTextPaint.setFakeBoldText(true);
            this.mFaceInfoNumberPaint = new Paint(this.mFaceInfoTextPaint);
            if (configuration.locale.equals(Locale.SIMPLIFIED_CHINESE) || configuration.locale.equals(Locale.TRADITIONAL_CHINESE)) {
                this.mFaceInfoNumberPaint.setFakeBoldText(false);
                this.mFaceInfoNumberPaint.setTextSize(1.16f * textSize);
            }
            this.mMagicMirrorInfoPop = res.getDrawable(R.drawable.magic_mirror_info_pop);
            this.mBeautyScoreIc = res.getDrawable(R.drawable.ic_beauty_score);
            this.mAgeVerPadding = res.getDimensionPixelSize(R.dimen.face_info_ver_padding);
            this.mGap = res.getDimensionPixelSize(R.dimen.face_info_text_left_dis);
            this.mCorrection = res.getDimensionPixelOffset(R.dimen.face_info_correction);
            this.mPopBottomMargin = res.getDimensionPixelSize(R.dimen.face_pop_bottom_margin);
            this.mScoreHonPadding = res.getDimensionPixelSize(R.dimen.face_info_score_hon_padding);
            this.mScoreVerPadding = res.getDimensionPixelSize(R.dimen.face_info_score_ver_padding);
            this.mAgeMaleHonPadding = res.getDimensionPixelSize(R.dimen.face_info_male_hon_padding);
            this.mAgeFemaleHonPadding = res.getDimensionPixelSize(R.dimen.face_info_female_hon_padding);
            this.mFacePopupBottom = (int) (((double) this.mMagicMirrorInfoPop.getIntrinsicHeight()) * 0.12d);
        }
    }

    public boolean setFaces(CameraHardwareFace[] faces, Rect cropRegion, float zoomValue) {
        Log.c("FaceView", "Num of faces = " + (faces == null ? 0 : faces.length));
        if (this.mPause) {
            return false;
        }
        int newFaceSize = faces != null ? faces.length : 0;
        int currentFaceSize = this.mFaces != null ? this.mFaces.length : 0;
        boolean isFacesChanged = newFaceSize != currentFaceSize;
        if (newFaceSize == 0 && currentFaceSize == 0) {
            return false;
        }
        this.mFaces = faces;
        this.mCropRegion = cropRegion;
        this.mZoomValue = zoomValue;
        updateLatestFaces();
        postInvalidate();
        if (this.mRectState == 4 || this.mShowGenderAndAge || this.mShowMagicMirror) {
            return true;
        }
        if (isFacesChanged && newFaceSize > 0) {
            showNormalFaceRectImmediately();
        }
        if (this.mIsCameraFaceDetectionAutoHidden) {
            if (isFaceStable()) {
                if (!(this.mRectState == 2 || this.mRectState == 3)) {
                    attemptHideFaceRect();
                }
            } else if (this.mRectState != 1) {
                clearAttemptHideFaceRect();
            }
        }
        return true;
    }

    private void showNormalFaceRectImmediately() {
        this.mRectState = 1;
        this.mHandler.removeMessages(1);
        setFaceRectVisible(0, 0);
    }

    private void attemptHideFaceRect() {
        this.mRectState = 3;
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 2000);
    }

    private void clearAttemptHideFaceRect() {
        this.mRectState = 1;
        cancelHideAnimator();
        this.mHandler.removeMessages(1);
    }

    private void cancelHideAnimator() {
        if (this.mFaceRectHideAnimator != null && this.mFaceRectHideAnimator.isRunning()) {
            this.mFaceRectHideAnimator.cancel();
        }
    }

    public void forceHideRect() {
        if (this.mRectState != 4) {
            this.mRectState = 4;
            this.mHandler.removeMessages(1);
            if (this.mNormalRectPaint.getAlpha() > 0) {
                setFaceRectVisible(8, Callback.DEFAULT_DRAG_ANIMATION_DURATION);
            }
        }
    }

    public void reShowFaceRect() {
        if (this.mRectState != 1) {
            showNormalFaceRectImmediately();
        }
    }

    public void setFaceRectVisible(int visible, int duration) {
        int i = 0;
        cancelHideAnimator();
        if (duration == 0) {
            Paint paint = this.mNormalRectPaint;
            if (visible == 0) {
                i = 255;
            }
            paint.setAlpha(i);
            return;
        }
        this.mFaceRectHideAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mFaceRectHideAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float t) {
                float value = super.getInterpolation(t);
                FaceView.this.mNormalRectPaint.setAlpha((int) ((1.0f - value) * 255.0f));
                return value;
            }
        });
        this.mFaceRectHideAnimator.setDuration((long) duration);
        this.mFaceRectHideAnimator.start();
    }

    public CameraHardwareFace[] getFaces() {
        return this.mFaces;
    }

    private void updateLatestFaces() {
        int faceIndex = this.mLatestFaceIndex;
        if (faceIndex >= 5) {
            faceIndex = 0;
        } else {
            faceIndex++;
        }
        if (faceExists()) {
            CameraHardwareFace face = this.mFaces[0];
            for (int i = 1; i < this.mFaces.length; i++) {
                if (this.mFaces[i].rect.right - this.mFaces[i].rect.left > face.rect.right - face.rect.left) {
                    face = this.mFaces[i];
                }
            }
            this.mLatestFaces[faceIndex] = face;
        } else {
            this.mLatestFaces[faceIndex] = null;
        }
        this.mLatestFaceIndex = faceIndex;
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mHandler.removeCallbacksAndMessages(null);
        cancelHideAnimator();
    }

    public RectF getFocusRect() {
        RectF rect = new RectF();
        CameraScreenNail screenNail = ((ActivityBase) getContext()).getCameraScreenNail();
        if (screenNail == null || this.mLatestFaceIndex < 0 || this.mLatestFaceIndex >= 6) {
            return null;
        }
        this.mCamera2TranslateMatrix.reset();
        this.mMatrix.reset();
        Util.scaleCamera2Matrix(this.mCamera2TranslateMatrix, this.mCropRegion, this.mZoomValue);
        Util.prepareMatrix(this.mMatrix, this.mMirror, this.mCameraDisplayOrientation, screenNail.getRenderWidth(), screenNail.getRenderHeight(), getWidth() / 2, getHeight() / 2);
        rect.set(this.mLatestFaces[this.mLatestFaceIndex].rect);
        this.mMatrix.postRotate((float) this.mOrientation);
        this.mCamera2TranslateMatrix.mapRect(rect);
        this.mMatrix.mapRect(rect);
        return rect;
    }

    public boolean isFaceStable() {
        int emptyFacesCount = 0;
        int averageWidth = 0;
        int averageHeight = 0;
        int averageLeft = 0;
        int averageTop = 0;
        for (CameraHardwareFace face : this.mLatestFaces) {
            if (face == null) {
                emptyFacesCount++;
                if (emptyFacesCount >= 3) {
                    return false;
                }
            } else {
                averageWidth += face.rect.right - face.rect.left;
                averageHeight += face.rect.bottom - face.rect.top;
                averageLeft += face.rect.left;
                averageTop += face.rect.top;
            }
        }
        int faceCount = this.mLatestFaces.length - emptyFacesCount;
        averageWidth /= faceCount;
        averageHeight /= faceCount;
        averageLeft /= faceCount;
        averageTop /= faceCount;
        int faceWidthRestrict = averageWidth / 3 > 90 ? averageWidth / 3 : 90;
        for (CameraHardwareFace face2 : this.mLatestFaces) {
            if (face2 != null && (Math.abs((face2.rect.right - face2.rect.left) - averageWidth) > faceWidthRestrict || Math.abs(face2.rect.left - averageLeft) > 120 || Math.abs(face2.rect.top - averageTop) > 120)) {
                return false;
            }
        }
        boolean z = averageWidth > 670 || averageHeight > 670;
        this.mIsBigEnoughRect = z;
        return true;
    }

    public void setCameraDisplayOrientation(int orientation) {
        this.mCameraDisplayOrientation = orientation;
        Log.v("FaceView", "mCameraDisplayOrientation=" + orientation);
    }

    public void setOrientation(int orientation, boolean animation) {
        this.mOrientation = orientation;
        if (!this.mPause && faceExists() && (this.mSkipDraw ^ 1) != 0) {
            invalidate();
        }
    }

    public void setMirror(boolean mirror) {
        this.mMirror = mirror;
        Log.v("FaceView", "mMirror=" + mirror);
    }

    public boolean faceExists() {
        return this.mFaces != null && this.mFaces.length > 0;
    }

    public void showStart() {
        setToVisible();
        invalidate();
    }

    public void showSuccess() {
        setToVisible();
        invalidate();
    }

    public void showFail() {
        setToVisible();
        invalidate();
    }

    public void clear() {
        this.mFaces = null;
        this.mRectState = 1;
        clearPreviousFaces();
        postInvalidate();
    }

    public void clearFaceFlags() {
        this.mShowGenderAndAge = false;
        this.mShowMagicMirror = false;
    }

    public void resume() {
        super.resume();
        this.mIsCameraFaceDetectionAutoHidden = CameraSettings.isCameraFaceDetectionAutoHidden();
    }

    public void clearPreviousFaces() {
        this.mLatestFaceIndex = -1;
        for (int i = 0; i < this.mLatestFaces.length; i++) {
            this.mLatestFaces[i] = null;
        }
    }

    public void setShowGenderAndAge(boolean show) {
        int close = this.mShowGenderAndAge ? show ^ 1 : 0;
        this.mShowGenderAndAge = show;
        if (close != 0) {
            showNormalFaceRectImmediately();
        }
        if (show) {
            setShowMagicMirror(false);
        }
    }

    public void setShowMagicMirror(boolean show) {
        int close = this.mShowMagicMirror ? show ^ 1 : 0;
        this.mShowMagicMirror = show;
        if (close != 0) {
            showNormalFaceRectImmediately();
        }
        if (show) {
            setShowGenderAndAge(false);
        }
    }

    public void setSkipDraw(boolean skipDraw) {
        this.mSkipDraw = skipDraw;
    }

    private String getAgeInfo(CameraHardwareFace face) {
        int age = (int) face.ageMale;
        if (face.gender < 0.4f) {
            age = (int) face.ageFemale;
        }
        return String.format(configuration.locale, this.mFaceAgeFormat, new Object[]{Integer.valueOf(age)});
    }

    private String getScoreInfo(CameraHardwareFace face) {
        return String.format(configuration.locale, this.mFaceScoreInfoFormat, new Object[]{Float.valueOf(face.beautyscore / 10.0f)});
    }

    protected void onDraw(Canvas canvas) {
        if (!this.mSkipDraw) {
            this.mDrawingFaces = getFaces();
            CameraScreenNail screenNail = ((ActivityBase) getContext()).getCameraScreenNail();
            if (!(this.mDrawingFaces == null || this.mDrawingFaces.length <= 0 || screenNail == null || (this.mPause ^ 1) == 0)) {
                this.mCamera2TranslateMatrix.reset();
                this.mMatrix.reset();
                this.mCanvasMatrix.reset();
                Util.scaleCamera2Matrix(this.mCamera2TranslateMatrix, this.mCropRegion, this.mZoomValue);
                int virtualHeight = screenNail.getRenderHeight();
                int virtualWidth = screenNail.getRenderWidth();
                if (this.mCameraDisplayOrientation == 90 || this.mCameraDisplayOrientation == 270) {
                    virtualWidth = (this.mCropRegion.height() * virtualHeight) / this.mCropRegion.width();
                } else {
                    virtualWidth = (this.mCropRegion.width() * virtualHeight) / this.mCropRegion.height();
                }
                Util.prepareMatrix(this.mMatrix, this.mMirror, this.mCameraDisplayOrientation, virtualWidth, virtualHeight, getWidth() / 2, getHeight() / 2);
                this.mMatrix.postRotate((float) this.mOrientation);
                this.mCanvasMatrix.postRotate((float) this.mOrientation);
                canvas.save();
                canvas.rotate((float) (-this.mOrientation));
                int popShowType = getPopShowType(this.mDrawingFaces);
                boolean squareMode = ModuleManager.isSquareModule();
                int i = 0;
                while (i < this.mDrawingFaces.length) {
                    this.mRect.set(this.mDrawingFaces[i].rect);
                    this.mCanvasRect.set(screenNail.getRenderRect());
                    this.mCamera2TranslateMatrix.mapRect(this.mRect);
                    this.mMatrix.mapRect(this.mRect);
                    this.mCanvasMatrix.mapRect(this.mCanvasRect);
                    if (!squareMode || (Util.isContains(this.mCanvasRect, this.mRect) ^ 1) == 0) {
                        drawFaceRect(canvas, this.mRect, popShowType, this.mDrawingFaces[i]);
                        switch (popShowType) {
                            case 1:
                                if (!isValidAGInfo(this.mDrawingFaces[i])) {
                                    break;
                                }
                                initFaceInfoStyle();
                                boolean isFemale = this.mDrawingFaces[i].gender < 0.4f;
                                drawFacePopInfo(canvas, this.mRect, isFemale ? this.mSexFemaleIc : this.mSexMaleIc, isFemale ? this.mFemaleAgeInfoPop : this.mMaleAgeInfoPop, getAgeInfo(this.mDrawingFaces[i]), isFemale ? this.mAgeFemaleHonPadding : this.mAgeMaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                                break;
                            case 2:
                                if (this.mDrawingFaces[i].beautyscore <= 0.0f) {
                                    break;
                                }
                                initFaceInfoStyle();
                                drawFacePopInfo(canvas, this.mRect, this.mBeautyScoreIc, this.mMagicMirrorInfoPop, getScoreInfo(this.mDrawingFaces[i]), this.mAgeFemaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                                break;
                            case 4:
                                if (this.mDrawingFaces[i].beautyscore <= 0.0f) {
                                    break;
                                }
                                initFaceInfoStyle();
                                drawFacePopInfo(canvas, this.mRect, this.mBeautyScoreIc, this.mMagicMirrorInfoPop, getScoreInfo(this.mDrawingFaces[i]), this.mAgeFemaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                                break;
                            default:
                                break;
                        }
                        i++;
                    } else {
                        canvas.restore();
                    }
                }
                canvas.restore();
            }
        }
    }

    private void setToVisible() {
        if (getVisibility() != 0) {
            setVisibility(0);
        }
    }

    private void drawFaceRect(Canvas canvas, RectF faceRectF, int popType, CameraHardwareFace face) {
        switch (popType) {
            case -1:
                return;
            case 0:
                canvas.drawRoundRect(faceRectF, faceRectF.width() * 0.015f, faceRectF.height() * 0.015f, this.mNormalRectPaint);
                break;
            case 1:
                if (isValidAGInfo(face)) {
                    this.mEffectRectPaint.setColor((face.gender > 0.4f ? 1 : (face.gender == 0.4f ? 0 : -1)) < 0 ? -1152383 : -9455628);
                    canvas.drawRoundRect(faceRectF, faceRectF.width() * 0.015f, faceRectF.height() * 0.015f, this.mEffectRectPaint);
                    break;
                }
                return;
            case 2:
            case 4:
                if (face.beautyscore > 0.0f) {
                    this.mEffectRectPaint.setColor(-18377);
                    canvas.drawRoundRect(faceRectF, faceRectF.width() * 0.015f, faceRectF.height() * 0.015f, this.mEffectRectPaint);
                    break;
                }
                return;
        }
    }

    private void drawFacePopInfo(Canvas canvas, RectF faceRectF, Drawable indicator, Drawable background, String info, int honPadding, int verPadding, int popBottom, int bottomMargin) {
        Matcher matcher = this.mSplitFaceInfoPattern.matcher(info);
        float textWidth = 0.0f;
        while (matcher.find()) {
            String content = matcher.group();
            if (content.matches("\\d+\\.?\\d*")) {
                textWidth += this.mFaceInfoNumberPaint.measureText(content);
            } else {
                textWidth += this.mFaceInfoTextPaint.measureText(content);
            }
        }
        int totalWidth = (int) ((((float) ((indicator.getIntrinsicWidth() + honPadding) + this.mGap)) + textWidth) + ((float) honPadding));
        Rect backgroundRect = new Rect(((int) faceRectF.centerX()) - (totalWidth / 2), ((((int) faceRectF.top) - ((int) ((((float) verPadding) * 3.6f) + ((float) indicator.getIntrinsicHeight())))) - bottomMargin) - popBottom, ((int) faceRectF.centerX()) + (totalWidth / 2), ((int) faceRectF.top) - bottomMargin);
        if (background != null) {
            background.setBounds(backgroundRect);
            background.draw(canvas);
        }
        Rect indicatorRect = new Rect();
        indicatorRect.set(backgroundRect.left + honPadding, (int) ((((float) backgroundRect.top) + (((float) verPadding) * 1.8f)) - ((float) this.mCorrection)), (backgroundRect.left + honPadding) + indicator.getIntrinsicWidth(), (int) (((((float) backgroundRect.top) + (((float) verPadding) * 1.8f)) - ((float) this.mCorrection)) + ((float) indicator.getIntrinsicHeight())));
        indicator.setBounds(indicatorRect);
        indicator.draw(canvas);
        if (textWidth != 0.0f) {
            FontMetricsInt fontMetrics = this.mFaceInfoTextPaint.getFontMetricsInt();
            drawFaceInfoText(canvas, info, indicatorRect.right + this.mGap, (((indicatorRect.bottom + indicatorRect.top) - fontMetrics.bottom) - fontMetrics.top) / 2);
        }
    }

    private void drawFaceInfoText(Canvas canvas, String info, int baseX, int baseY) {
        Matcher matcher = this.mSplitFaceInfoPattern.matcher(info);
        while (matcher.find()) {
            float textWidth;
            String content = matcher.group();
            if (content.matches("\\d+\\.?\\d*")) {
                textWidth = this.mFaceInfoNumberPaint.measureText(content);
                canvas.drawText(content, ((float) baseX) + (textWidth / 2.0f), (float) baseY, this.mFaceInfoNumberPaint);
            } else {
                textWidth = this.mFaceInfoTextPaint.measureText(content);
                canvas.drawText(content, ((float) baseX) + (textWidth / 2.0f), (float) baseY, this.mFaceInfoTextPaint);
            }
            baseX = (int) (((float) baseX) + textWidth);
        }
    }

    private int getPopShowType(CameraHardwareFace[] faces) {
        if (faces == null || faces.length <= 0) {
            return 0;
        }
        if (this.mShowMagicMirror) {
            int scoreNo = 0;
            this.mWinnerIndex = -1;
            for (int i = 0; i < this.mFaces.length; i++) {
                CameraHardwareFace face = faces[i];
                if (face.beautyscore > 0.0f) {
                    scoreNo++;
                    if (this.mWinnerIndex == -1 || face.beautyscore > faces[this.mWinnerIndex].beautyscore) {
                        this.mWinnerIndex = i;
                    }
                }
            }
            if (scoreNo > 1) {
                return 2;
            }
            if (scoreNo > 0) {
                return 4;
            }
            return -1;
        } else if (this.mShowGenderAndAge) {
            return 1;
        } else {
            return 0;
        }
    }

    private boolean isValidAGInfo(CameraHardwareFace face) {
        if (0.5f > face.prob || face.gender == 0.0f) {
            return false;
        }
        return face.gender <= 0.4f || 0.6f <= face.gender;
    }
}
