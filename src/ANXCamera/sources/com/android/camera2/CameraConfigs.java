package com.android.camera2;

import android.hardware.camera2.params.MeteringRectangle;
import android.location.Location;
import android.util.Range;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.effect.BeautyValues;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class CameraConfigs {
    private static final String TAG = CameraConfigs.class.getSimpleName();
    private boolean mAELocked;
    private MeteringRectangle[] mAERegions;
    private MeteringRectangle[] mAFRegions;
    private boolean mAWBLocked;
    private boolean mAiSceneDetectEnabled;
    private int mAiSceneDetectPeriod;
    private int mAntiBanding;
    private int mAwbCustomValue;
    private int mAwbMode;
    private BeautyValues mBeautyValues;
    private boolean mBokehEnabled;
    private int mContrastLevel;
    private int mDeviceOrientation;
    private boolean mDualCamWaterMarkEnabled = false;
    private boolean mEISEnabled;
    private int mExposureCompensationIndex;
    private int mExposureMeteringMode;
    private long mExposureTime;
    private boolean mFaceAgeAnalyzeEnabled;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceScoreEnabled;
    private boolean mFaceWaterMarkEnabled = false;
    private String mFaceWaterMarkFormat = null;
    private int mFlashMode;
    private float mFocusDistance;
    private int mFocusMode;
    private boolean mFrontMirror;
    private Location mGpsLocation;
    private boolean mHDRCheckerEnabled;
    private boolean mHDREnabled;
    private boolean mHHTEnabled;
    private int mIso;
    private int mJpegQuality;
    private int mJpegRotation;
    private boolean mLensDirtyDetectEnabled;
    private boolean mMfnrEnabled;
    private boolean mNeedFlash;
    private boolean mNeedPausePreview = true;
    private boolean mOISEnabled;
    private boolean mOptimizedFlash;
    private boolean mParallelEnabled;
    private String mParallelProcessingPath = null;
    private CameraSize mPhotoSize;
    private Range<Integer> mPreviewFpsRange;
    private CameraSize mPreviewSize;
    private int mSaturationLevel;
    private int mSceneMode;
    private int mSharpnessLevel;
    private boolean mSuperResolutionEnabled;
    private CameraSize mThumbnailSize;
    private boolean mTimeWaterMarkEnabled = false;
    private String mTimeWatermarkValue = null;
    private Range<Integer> mVideoFpsRange;
    private CameraSize mVideoSnapshotSize;
    private List<String> mWaterMarkAppliedList = new ArrayList();
    private float mZoomRatio = 1.0f;
    private boolean mZslEnabled;

    public boolean setVideoFpsRange(Range<Integer> fpsRange) {
        if (Objects.equals(this.mVideoFpsRange, fpsRange)) {
            return false;
        }
        this.mVideoFpsRange = fpsRange;
        return true;
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mBeautyValues = beautyValues;
    }

    public BeautyValues getBeautyValues() {
        return this.mBeautyValues;
    }

    public boolean setPreviewFpsRange(Range<Integer> fpsRange) {
        if (Objects.equals(this.mPreviewFpsRange, fpsRange)) {
            return false;
        }
        this.mPreviewFpsRange = fpsRange;
        return true;
    }

    public Range<Integer> getPreviewFpsRange() {
        return this.mPreviewFpsRange;
    }

    public boolean setPreviewSize(CameraSize previewSize) {
        if (Objects.equals(this.mPreviewSize, previewSize)) {
            return false;
        }
        this.mPreviewSize = previewSize;
        return true;
    }

    public CameraSize getPreviewSize() {
        return this.mPreviewSize;
    }

    public boolean setPhotoSize(CameraSize photoSize) {
        if (Objects.equals(this.mPhotoSize, photoSize)) {
            return false;
        }
        this.mPhotoSize = photoSize;
        return true;
    }

    public CameraSize getPhotoSize() {
        return this.mPhotoSize;
    }

    public void setEnableZsl(boolean enable) {
        this.mZslEnabled = enable;
    }

    public boolean isZslEnabled() {
        return this.mZslEnabled;
    }

    public void setEnableOIS(boolean enableOIS) {
        this.mOISEnabled = enableOIS;
    }

    public boolean isOISEnabled() {
        return this.mOISEnabled;
    }

    public boolean setJpegQuality(int quality) {
        if (quality < 1 || quality > 100) {
            Log.w(TAG, "setJpegQuality: invalid jpeg quality " + quality);
            return false;
        } else if (this.mJpegQuality == quality) {
            return false;
        } else {
            this.mJpegQuality = quality;
            return true;
        }
    }

    public int getJpegQuality() {
        return this.mJpegQuality;
    }

    public boolean setJpegRotation(int jpegRotation) {
        if (this.mJpegRotation == jpegRotation) {
            return false;
        }
        this.mJpegRotation = jpegRotation;
        return true;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public boolean setDeviceOrientation(int deviceOrientation) {
        if (this.mDeviceOrientation == deviceOrientation) {
            return false;
        }
        this.mDeviceOrientation = deviceOrientation;
        return true;
    }

    public int getDeviceOrientation() {
        return this.mDeviceOrientation;
    }

    public boolean setZoomRatio(float ratio) {
        if (((double) Math.abs(this.mZoomRatio - ratio)) <= 0.01d) {
            return false;
        }
        this.mZoomRatio = ratio;
        return true;
    }

    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    public boolean setAntiBanding(int antiBanding) {
        if (this.mAntiBanding == antiBanding) {
            return false;
        }
        this.mAntiBanding = antiBanding;
        return true;
    }

    public int getAntiBanding() {
        return this.mAntiBanding;
    }

    public boolean setExposureCompensationIndex(int index) {
        if (this.mExposureCompensationIndex == index) {
            return false;
        }
        this.mExposureCompensationIndex = index;
        return true;
    }

    public int getExposureCompensationIndex() {
        return this.mExposureCompensationIndex;
    }

    public boolean setAELock(boolean locked) {
        if (this.mAELocked == locked) {
            return false;
        }
        this.mAELocked = locked;
        return true;
    }

    public boolean isAELocked() {
        return this.mAELocked;
    }

    public boolean setAERegions(MeteringRectangle[] regions) {
        if (Arrays.equals(this.mAERegions, regions)) {
            return false;
        }
        this.mAERegions = regions;
        return true;
    }

    public MeteringRectangle[] getAERegions() {
        return this.mAERegions;
    }

    public boolean setISO(int iso) {
        if (this.mIso == iso) {
            return false;
        }
        this.mIso = iso;
        return true;
    }

    public int getISO() {
        return this.mIso;
    }

    public boolean setExposureTime(long exposureTime) {
        if (this.mExposureTime == exposureTime) {
            return false;
        }
        this.mExposureTime = exposureTime;
        return true;
    }

    public long getExposureTime() {
        return this.mExposureTime;
    }

    public boolean setFlashMode(int flashMode) {
        if (this.mFlashMode == flashMode) {
            return false;
        }
        this.mFlashMode = flashMode;
        return true;
    }

    public int getFlashMode() {
        return this.mFlashMode;
    }

    public boolean setOptimizedFlash(boolean optimizedFlash) {
        if (this.mOptimizedFlash == optimizedFlash) {
            return false;
        }
        this.mOptimizedFlash = optimizedFlash;
        return true;
    }

    public boolean setNeedFlash(boolean needFlash) {
        if (this.mNeedFlash == needFlash) {
            return false;
        }
        this.mNeedFlash = needFlash;
        return true;
    }

    public boolean isNeedFlash() {
        return this.mNeedFlash;
    }

    public boolean setFocusMode(int focusMode) {
        if (this.mFocusMode == focusMode) {
            return false;
        }
        this.mFocusMode = focusMode;
        return true;
    }

    public int getFocusMode() {
        return this.mFocusMode;
    }

    public boolean setFocusDistance(float focusDistance) {
        if (this.mFocusDistance == focusDistance) {
            return false;
        }
        this.mFocusDistance = focusDistance;
        return true;
    }

    public float getFocusDistance() {
        return this.mFocusDistance;
    }

    public boolean setAFRegions(MeteringRectangle[] regions) {
        if (Arrays.equals(this.mAFRegions, regions)) {
            return false;
        }
        this.mAFRegions = regions;
        return true;
    }

    public MeteringRectangle[] getAFRegions() {
        return this.mAFRegions;
    }

    public boolean setAWBMode(int awbMode) {
        if (this.mAwbMode == awbMode) {
            return false;
        }
        this.mAwbMode = awbMode;
        return true;
    }

    public int getAWBMode() {
        return this.mAwbMode;
    }

    public boolean setCustomAWB(int awbValue) {
        if (this.mAwbCustomValue == awbValue) {
            return false;
        }
        this.mAwbCustomValue = awbValue;
        return true;
    }

    public int getAwbCustomValue() {
        return this.mAwbCustomValue;
    }

    public boolean setAWBLock(boolean locked) {
        if (this.mAWBLocked == locked) {
            return false;
        }
        this.mAWBLocked = locked;
        return true;
    }

    public boolean isAWBLocked() {
        return this.mAWBLocked;
    }

    public boolean setSceneMode(int sceneMode) {
        if (this.mSceneMode == sceneMode) {
            return false;
        }
        this.mSceneMode = sceneMode;
        return true;
    }

    public int getSceneMode() {
        return this.mSceneMode;
    }

    public boolean setEnableEIS(boolean enabled) {
        if (this.mEISEnabled == enabled) {
            return false;
        }
        this.mEISEnabled = enabled;
        return true;
    }

    public boolean isEISEnabled() {
        return this.mEISEnabled;
    }

    public boolean setHHTEnabled(boolean hhtEnabled) {
        if (this.mHHTEnabled == hhtEnabled) {
            return false;
        }
        this.mHHTEnabled = hhtEnabled;
        return true;
    }

    public boolean isHHTEnabled() {
        return this.mHHTEnabled;
    }

    public boolean setHDREnabled(boolean hdrEnabled) {
        if (this.mHDREnabled == hdrEnabled) {
            return false;
        }
        this.mHDREnabled = hdrEnabled;
        return true;
    }

    public boolean isHDREnabled() {
        return this.mHDREnabled;
    }

    public boolean setHDRCheckerEnabled(boolean hdrCheckerEnabled) {
        if (this.mHDRCheckerEnabled == hdrCheckerEnabled) {
            return false;
        }
        this.mHDRCheckerEnabled = hdrCheckerEnabled;
        return true;
    }

    public boolean isHDRCheckerEnabled() {
        return this.mHDRCheckerEnabled;
    }

    public boolean setSuperResolutionEnabled(boolean enabled) {
        if (this.mSuperResolutionEnabled == enabled) {
            return false;
        }
        this.mSuperResolutionEnabled = enabled;
        return true;
    }

    public boolean isSuperResolutionEnabled() {
        return this.mSuperResolutionEnabled;
    }

    public boolean isParallelEnabled() {
        return this.mParallelEnabled;
    }

    public boolean setParallelEnabled(boolean parallelEnabled) {
        if (this.mParallelEnabled == parallelEnabled) {
            return false;
        }
        this.mParallelEnabled = parallelEnabled;
        return true;
    }

    public String getParallelProcessingPath() {
        return this.mParallelProcessingPath;
    }

    public void setParallelProcessingPath(String parallelProcessingPath) {
        this.mParallelProcessingPath = parallelProcessingPath;
    }

    public boolean setMfnrEnabled(boolean mfnrEnabled) {
        if (this.mMfnrEnabled == mfnrEnabled) {
            return false;
        }
        this.mMfnrEnabled = mfnrEnabled;
        return true;
    }

    public boolean isMfnrEnabled() {
        return this.mMfnrEnabled;
    }

    public boolean setBokehEnabled(boolean bokehEnabled) {
        if (this.mBokehEnabled == bokehEnabled) {
            return false;
        }
        this.mBokehEnabled = bokehEnabled;
        return true;
    }

    public boolean isFaceAgeAnalyzeEnabled() {
        return this.mFaceAgeAnalyzeEnabled;
    }

    public boolean setFaceAgeAnalyzeEnabled(boolean faceAgeAnalyzeEnabled) {
        if (this.mFaceAgeAnalyzeEnabled == faceAgeAnalyzeEnabled) {
            return false;
        }
        this.mFaceAgeAnalyzeEnabled = faceAgeAnalyzeEnabled;
        return true;
    }

    public boolean isFaceScoreEnabled() {
        return this.mFaceScoreEnabled;
    }

    public boolean setFaceScoreEnabled(boolean faceScoreEnabled) {
        if (this.mFaceScoreEnabled == faceScoreEnabled) {
            return false;
        }
        this.mFaceScoreEnabled = faceScoreEnabled;
        return true;
    }

    public boolean isBokehEnabled() {
        return this.mBokehEnabled;
    }

    public boolean setLensDirtyDetectEnabled(boolean lensDirtyDetectEnabled) {
        if (this.mLensDirtyDetectEnabled == lensDirtyDetectEnabled) {
            return false;
        }
        this.mLensDirtyDetectEnabled = lensDirtyDetectEnabled;
        return true;
    }

    public boolean isLensDirtyDetectEnabled() {
        return this.mLensDirtyDetectEnabled;
    }

    public boolean setThumbnailSize(CameraSize size) {
        if (Objects.equals(this.mThumbnailSize, size)) {
            return false;
        }
        this.mThumbnailSize = size;
        return true;
    }

    public CameraSize getThumbnailSize() {
        return this.mThumbnailSize;
    }

    public boolean setFaceDetectionEnabled(boolean enable) {
        if (this.mFaceDetectionEnabled == enable) {
            return false;
        }
        this.mFaceDetectionEnabled = enable;
        return true;
    }

    public boolean isFaceDetectionEnabled() {
        return this.mFaceDetectionEnabled;
    }

    public boolean setContrastLevel(int level) {
        if (this.mContrastLevel == level) {
            return false;
        }
        this.mContrastLevel = level;
        return true;
    }

    public int getContrastLevel() {
        return this.mContrastLevel;
    }

    public boolean setSaturationLevel(int level) {
        if (this.mSaturationLevel == level) {
            return false;
        }
        this.mSaturationLevel = level;
        return true;
    }

    public int getSaturationLevel() {
        return this.mSaturationLevel;
    }

    public boolean setSharpnessLevel(int level) {
        if (this.mSharpnessLevel == level) {
            return false;
        }
        this.mSharpnessLevel = level;
        return true;
    }

    public int getSharpnessLevel() {
        return this.mSharpnessLevel;
    }

    public boolean setExposureMeteringMode(int mode) {
        if (this.mExposureMeteringMode == mode) {
            return false;
        }
        this.mExposureMeteringMode = mode;
        return true;
    }

    public int getExposureMeteringMode() {
        return this.mExposureMeteringMode;
    }

    public boolean isAiSceneDetectEnabled() {
        return this.mAiSceneDetectEnabled;
    }

    public boolean setAiSceneDetectEnable(boolean enable) {
        if (this.mAiSceneDetectEnabled == enable) {
            return false;
        }
        this.mAiSceneDetectEnabled = enable;
        return true;
    }

    public int getAiSceneDetectPeriod() {
        return this.mAiSceneDetectPeriod;
    }

    public boolean setAiSceneDetectPeriod(int period) {
        if (this.mAiSceneDetectPeriod == period) {
            return false;
        }
        this.mAiSceneDetectPeriod = period;
        return true;
    }

    public void setGpsLocation(Location loc) {
        this.mGpsLocation = loc;
    }

    public Location getGpsLocation() {
        return this.mGpsLocation;
    }

    public CameraSize getVideoSnapshotSize() {
        return this.mVideoSnapshotSize;
    }

    public void setVideoSnapshotSize(CameraSize size) {
        this.mVideoSnapshotSize = size;
    }

    public List<String> getWaterMarkAppliedList() {
        return this.mWaterMarkAppliedList;
    }

    public boolean setDualCamWaterMarkEnable(boolean enable) {
        boolean contained = Util.isStringValueContained((Object) "device", this.mWaterMarkAppliedList);
        if (enable) {
            if (!contained) {
                this.mWaterMarkAppliedList.add("device");
            }
        } else if (contained) {
            this.mWaterMarkAppliedList.remove("device");
        }
        if (this.mDualCamWaterMarkEnabled == enable) {
            return false;
        }
        this.mDualCamWaterMarkEnabled = enable;
        return true;
    }

    public boolean setTimeWaterMarkEnable(boolean enable) {
        boolean contained = Util.isStringValueContained((Object) "watermark", this.mWaterMarkAppliedList);
        if (enable) {
            if (!contained) {
                this.mWaterMarkAppliedList.add("watermark");
            }
        } else if (contained) {
            this.mWaterMarkAppliedList.remove("watermark");
        }
        if (this.mTimeWaterMarkEnabled == enable) {
            return false;
        }
        this.mTimeWaterMarkEnabled = enable;
        return true;
    }

    public boolean setFaceWaterMarkEnable(boolean enable) {
        boolean contained = Util.isStringValueContained((Object) "beautify", this.mWaterMarkAppliedList);
        if (enable) {
            if (!contained) {
                this.mWaterMarkAppliedList.add("beautify");
            }
        } else if (contained) {
            this.mWaterMarkAppliedList.remove("beautify");
        }
        if (this.mFaceWaterMarkEnabled == enable) {
            return false;
        }
        this.mFaceWaterMarkEnabled = enable;
        return true;
    }

    public void setTimeWaterMarkValue(String time) {
        this.mTimeWatermarkValue = time;
    }

    public String getTimeWaterMarkValue() {
        return this.mTimeWatermarkValue;
    }

    public void setFaceWaterMarkFormat(String format) {
        this.mFaceWaterMarkFormat = format;
    }

    public String getFaceWaterMarkFormat() {
        return this.mFaceWaterMarkFormat;
    }

    public boolean setPausePreview(boolean pausePreview) {
        if (this.mNeedPausePreview == pausePreview) {
            return false;
        }
        this.mNeedPausePreview = pausePreview;
        return true;
    }

    public void setFrontMirror(boolean frontMirror) {
        this.mFrontMirror = frontMirror;
    }

    public boolean isFrontMirror() {
        return this.mFrontMirror;
    }
}
