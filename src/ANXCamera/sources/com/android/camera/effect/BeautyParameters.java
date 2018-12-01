package com.android.camera.effect;

import android.support.v7.recyclerview.R;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class BeautyParameters {
    /* renamed from: -com-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static final /* synthetic */ int[] f5-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = null;
    /* renamed from: -com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static final /* synthetic */ int[] f6-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = null;
    private static final String TAG = BeautyParameters.class.getSimpleName();
    private static final BeautyParameterType[] sAdjustableParamTypes = new BeautyParameterType[]{BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SHRINK_FACE_RATIO, BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SMOOTH_STRENGTH};
    private static final Type[] sAdjustableTypes = (Device.isSupportNewFaceBeauty() ? new Type[]{Type.SHRINK_FACE_RATIO, Type.ENLARGE_EYE_RATIO, Type.NOSE_RATIO, Type.RISORIUS_RATIO, Type.LIPS_RATIO, Type.CHIN_RATIO, Type.NECK_RATIO, Type.SMILE_RATIO, Type.SLIM_NOSE_RATIO} : new Type[]{Type.WHITEN_STRENGTH, Type.SHRINK_FACE_RATIO, Type.ENLARGE_EYE_RATIO, Type.SMOOTH_STRENGTH});
    private static BeautyParameters sInstance;
    private int mBeautyLevel;
    private int[] mBeautyValueRange = CameraSettings.getBeautifyValueRange();
    private float[][] mCameraLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f}, new float[]{1.0f, 1.0f, 1.0f, 1.0f}, new float[]{3.0f, 3.0f, 3.0f, 3.0f}, new float[]{5.0f, 5.0f, 5.0f, 5.0f}, new float[]{7.0f, 7.0f, 7.0f, 7.0f}, new float[]{8.0f, 8.0f, 8.0f, 8.0f}};
    private Type mCurrentType = Type.SHRINK_FACE_RATIO;
    private Map<Type, Integer> mExtraTable = new HashMap();
    private IntelligentBeautyProcessor mMakeupProcessor;
    private OnFaceBeautyChangedListener mOnFaceBeautyChangedListener;
    private IntelligentBeautyProcessor mStickerMakeupProcessor;
    private Type[] mSupportedTypes;

    public interface OnFaceBeautyChangedListener {
        void onBeautyParameterChanged();

        void onBeautyStatusChanged(boolean z);
    }

    public enum Type {
        WHITEN_STRENGTH,
        SHRINK_FACE_RATIO,
        ENLARGE_EYE_RATIO,
        SMOOTH_STRENGTH,
        NOSE_RATIO,
        RISORIUS_RATIO,
        LIPS_RATIO,
        CHIN_RATIO,
        NECK_RATIO,
        SMILE_RATIO,
        SLIM_NOSE_RATIO
    }

    /* renamed from: -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static /* synthetic */ int[] m4xed999735() {
        if (f5-com-android-camera-effect-BeautyParameters$TypeSwitchesValues != null) {
            return f5-com-android-camera-effect-BeautyParameters$TypeSwitchesValues;
        }
        int[] iArr = new int[Type.values().length];
        try {
            iArr[Type.CHIN_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Type.ENLARGE_EYE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Type.LIPS_RATIO.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Type.NECK_RATIO.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Type.NOSE_RATIO.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Type.RISORIUS_RATIO.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Type.SHRINK_FACE_RATIO.ordinal()] = 7;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[Type.SLIM_NOSE_RATIO.ordinal()] = 8;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[Type.SMILE_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[Type.SMOOTH_STRENGTH.ordinal()] = 10;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[Type.WHITEN_STRENGTH.ordinal()] = 11;
        } catch (NoSuchFieldError e11) {
        }
        f5-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = iArr;
        return iArr;
    }

    /* renamed from: -getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static /* synthetic */ int[] m5-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues() {
        if (f6-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues != null) {
            return f6-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues;
        }
        int[] iArr = new int[BeautyParameterType.values().length];
        try {
            iArr[BeautyParameterType.BRIGHT_EYE_RATIO.ordinal()] = 16;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[BeautyParameterType.CONTRAST_STRENGTH.ordinal()] = 17;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[BeautyParameterType.DEBLEMISH.ordinal()] = 18;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[BeautyParameterType.DEPOUCH_RATIO.ordinal()] = 19;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[BeautyParameterType.ENLARGE_EYE_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[BeautyParameterType.IRIS_SHINE_RATIO.ordinal()] = 20;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[BeautyParameterType.LIP_BEAUTY_RATIO.ordinal()] = 21;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[BeautyParameterType.RELIGHTING_RATIO.ordinal()] = 22;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[BeautyParameterType.RUDDY_STRENGTH.ordinal()] = 23;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_FACE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_JAW_RATIO.ordinal()] = 24;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_NOSE_RATIO.ordinal()] = 25;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr[BeautyParameterType.SMOOTH_STRENGTH.ordinal()] = 3;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr[BeautyParameterType.WHITEN_STRENGTH.ordinal()] = 4;
        } catch (NoSuchFieldError e14) {
        }
        f6-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = iArr;
        return iArr;
    }

    private BeautyParameters() {
    }

    private void updateParameters(ProviderEditor configEditor) {
        String defaultBeauty = CameraSettings.getFaceBeautyDefaultValue();
        String value = DataRepository.dataItemConfig().getString("pref_camera_face_beauty_key", defaultBeauty);
        if (!(defaultBeauty.equals(value) || (CameraSettings.isFaceBeautyValid(value) ^ 1) == 0)) {
            Log.e(TAG, "reset invalid face beauty value " + value);
            value = defaultBeauty;
            configEditor.putString("pref_camera_face_beauty_key", defaultBeauty);
        }
        this.mBeautyLevel = CameraSettings.intelligentValueToBeautyLevel(value);
        updateExtraTable();
    }

    public static synchronized BeautyParameters getInstance() {
        BeautyParameters beautyParameters;
        synchronized (BeautyParameters.class) {
            if (sInstance == null) {
                sInstance = new BeautyParameters();
            }
            beautyParameters = sInstance;
        }
        return beautyParameters;
    }

    private static String getFaceBeautyRatioKey(Type type) {
        switch (m4xed999735()[type.ordinal()]) {
            case 1:
                return "pref_beautify_chin_ratio_key";
            case 2:
                return "pref_beautify_enlarge_eye_ratio_key";
            case 3:
                return "pref_beautify_lips_ratio_key";
            case 4:
                return "pref_beautify_neck_ratio_key";
            case 5:
                return "pref_beautify_nose_ratio_key";
            case 6:
                return "pref_beautify_risorius_ratio_key";
            case 7:
                return "pref_beautify_slim_face_ratio_key";
            case 8:
                return "pref_beautify_slim_nose_ratio_key";
            case R.styleable.ToggleSwitch_textOff /*9*/:
                return "pref_beautify_smile_ratio_key";
            case R.styleable.ToggleSwitch_textOffColor /*10*/:
                return "pref_beautify_skin_smooth_ratio_key";
            case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                return "pref_beautify_skin_color_ratio_key";
            default:
                return "";
        }
    }

    public void setMakeupProcessor(IntelligentBeautyProcessor makeupProcessor) {
        synchronized (this) {
            this.mMakeupProcessor = makeupProcessor;
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(makeupProcessor, this.mBeautyLevel));
        }
    }

    private void updateExtraTable() {
        for (Type type : getAdjustableTypes()) {
            int progress = 0;
            String key = getFaceBeautyRatioKey(type);
            if (!"".equals(key)) {
                progress = CameraSettings.getFaceBeautyRatio(key, -1);
                if (progress == -1) {
                    int range = this.mBeautyValueRange[1] - this.mBeautyValueRange[0];
                    if (!Device.isLegacyFaceBeauty() || range == 0) {
                        progress = 0;
                    } else {
                        int defaultValue = CameraSettings.getBeautifyDefaultValue(key);
                        progress = ((defaultValue - this.mBeautyValueRange[0]) * 100) / range;
                        Log.d(TAG, "updateExtraTable: " + defaultValue + "->" + progress + "%");
                    }
                }
            }
            this.mExtraTable.put(type, Integer.valueOf(progress));
        }
    }

    public void initBeauty(int cameraId, int targetMode, ProviderEditor configEditor) {
        boolean isFront = cameraId != 0;
        updateSupportedTypes(cameraId, targetMode);
        if (isFront) {
            updateParameters(configEditor);
        }
    }

    public void setStickerMakeupProcessor(IntelligentBeautyProcessor stickerProcessor) {
        synchronized (this) {
            this.mStickerMakeupProcessor = stickerProcessor;
            this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(stickerProcessor, this.mBeautyLevel));
        }
    }

    public void setLevel(int level) {
        this.mBeautyLevel = level;
        isMakeupStatusChanged();
        onBeautyLevelChanged(level);
        setBeautyParameters();
    }

    public int getCurrentLevel() {
        return this.mBeautyLevel;
    }

    private static Type convert(BeautyParameterType type) {
        switch (m5-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[type.ordinal()]) {
            case 1:
                return Type.ENLARGE_EYE_RATIO;
            case 2:
                return Type.SHRINK_FACE_RATIO;
            case 3:
                return Type.SMOOTH_STRENGTH;
            case 4:
                return Type.WHITEN_STRENGTH;
            default:
                throw new IllegalArgumentException();
        }
    }

    public void setType(BeautyParameterType type) {
        this.mCurrentType = convert(type);
    }

    public void setType(Type type) {
        this.mCurrentType = type;
    }

    public Type getCurrentType() {
        return this.mCurrentType;
    }

    public int getCurrentProgress() {
        if (this.mExtraTable.get(this.mCurrentType) == null) {
            return 0;
        }
        return ((Integer) this.mExtraTable.get(this.mCurrentType)).intValue();
    }

    public void setProgress(int progress) {
        int oldProgress;
        if (this.mExtraTable.get(this.mCurrentType) == null) {
            oldProgress = 0;
        } else {
            oldProgress = ((Integer) this.mExtraTable.get(this.mCurrentType)).intValue();
        }
        this.mExtraTable.put(this.mCurrentType, Integer.valueOf(progress));
        isMakeupStatusChanged();
        if (oldProgress != progress) {
            onBeautyParameterChanged(this.mCurrentType, progress);
        }
        setBeautyParameters();
    }

    public void setOnFaceBeautyChangedListener(OnFaceBeautyChangedListener listener) {
        this.mOnFaceBeautyChangedListener = listener;
    }

    public boolean isFaceBeautyOn() {
        boolean z = true;
        if (!Device.isLegacyFaceBeauty()) {
            if (this.mBeautyLevel <= 0) {
                z = false;
            }
            return z;
        } else if (CameraSettings.isAdvancedBeautyOn()) {
            for (Entry<Type, Integer> entry : this.mExtraTable.entrySet()) {
                if (Type.ENLARGE_EYE_RATIO != entry.getKey() && ((Integer) entry.getValue()).intValue() > 0) {
                    return true;
                }
            }
            return false;
        } else {
            return this.mBeautyLevel > 0;
        }
    }

    private boolean isMakeupStatusChanged() {
        boolean currMakeupStatus = EffectController.getInstance().isMakeupEnable();
        boolean currFaceBeautyOn = isFaceBeautyOn();
        if (currMakeupStatus == currFaceBeautyOn) {
            return false;
        }
        if (this.mOnFaceBeautyChangedListener != null) {
            this.mOnFaceBeautyChangedListener.onBeautyStatusChanged(currFaceBeautyOn);
        }
        return true;
    }

    private void setBeautyParameters() {
        if (EffectController.getInstance().isStickerEnable()) {
            if (this.mStickerMakeupProcessor != null) {
                this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mStickerMakeupProcessor, this.mBeautyLevel));
            }
        } else if (this.mMakeupProcessor != null) {
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mMakeupProcessor, this.mBeautyLevel));
        }
    }

    private Map<BeautyParameterType, Float> getProcessorBeautyParams(IntelligentBeautyProcessor processor, int beautyLevel) {
        if (!Device.isLegacyFaceBeauty()) {
            beautyLevel--;
        }
        Map<BeautyParameterType, Float> params = processor.getIntelligentLevelParams(beautyLevel);
        float extraSpan = processor.getExtraSpan();
        for (BeautyParameterType beautyType : sAdjustableParamTypes) {
            float[] degreeRange = processor.getSupportedParamRange(beautyType);
            if (degreeRange.length >= 2) {
                params.put(beautyType, Float.valueOf(Util.clamp(((Float) params.get(beautyType)).floatValue() + ((((float) ((Integer) this.mExtraTable.get(convert(beautyType))).intValue()) * extraSpan) / 100.0f), degreeRange[0], degreeRange[1])));
            } else {
                Log.w(TAG, processor + " does not support type " + beautyType);
            }
        }
        return params;
    }

    private void onBeautyLevelChanged(int beautyLevel) {
        CameraSettings.setFaceBeautyLevel(beautyLevel);
        Log.d(TAG, "onBeautyLevelChanged: " + beautyLevel);
        if (this.mOnFaceBeautyChangedListener != null) {
            this.mOnFaceBeautyChangedListener.onBeautyParameterChanged();
        }
    }

    private void onBeautyParameterChanged(Type beautyType, int progress) {
        String key = getFaceBeautyRatioKey(beautyType);
        CameraSettings.setFaceBeautyRatio(key, progress);
        Log.v(TAG, "onBeautyParameterChanged: " + key + "=" + progress);
        if (this.mOnFaceBeautyChangedListener != null) {
            this.mOnFaceBeautyChangedListener.onBeautyParameterChanged();
        }
    }

    private void updateSupportedTypes(int cameraId, int targetMode) {
        CameraCapabilities cc = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(cameraId, targetMode);
        ArrayList<Type> list = new ArrayList(sAdjustableTypes.length);
        if (cc == null) {
            Log.w(TAG, "updateSupportedTypes, but CameraCapabilities is null!");
        } else {
            for (Type type : sAdjustableTypes) {
                if (cc.isSupportBeautyType(type)) {
                    list.add(type);
                }
            }
        }
        this.mSupportedTypes = new Type[list.size()];
        for (int i = 0; i < list.size(); i++) {
            this.mSupportedTypes[i] = (Type) list.get(i);
        }
    }

    public Type[] getAdjustableTypes() {
        if (Device.isSupportNewFaceBeauty()) {
            return this.mSupportedTypes;
        }
        return sAdjustableTypes;
    }
}
