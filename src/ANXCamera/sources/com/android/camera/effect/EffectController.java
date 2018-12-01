package com.android.camera.effect;

import android.graphics.PointF;
import android.graphics.RectF;
import android.support.v7.recyclerview.R;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.EffectChangedListenerController;
import com.android.camera.Util;
import com.android.camera.effect.renders.BeautificationWrapperRender;
import com.android.camera.effect.renders.FocusPeakingRender;
import com.android.camera.effect.renders.GaussianMaskEffectRender;
import com.android.camera.effect.renders.GradienterEffectRender;
import com.android.camera.effect.renders.GradienterSnapshotEffectRender;
import com.android.camera.effect.renders.NoneEffectRender;
import com.android.camera.effect.renders.PipeRenderPair;
import com.android.camera.effect.renders.Render;
import com.android.camera.effect.renders.RenderGroup;
import com.android.camera.effect.renders.StickerRender;
import com.android.camera.effect.renders.TiltShiftMaskEffectRender;
import com.android.camera.effect.renders.WrapperRender;
import com.android.camera.effect.renders.XBlurEffectRender;
import com.android.camera.effect.renders.XGaussianEffectRender;
import com.android.camera.effect.renders.XTiltShiftEffectRender;
import com.android.camera.effect.renders.YBlurEffectRender;
import com.android.camera.effect.renders.YGaussianEffectRender;
import com.android.camera.effect.renders.YTiltShiftEffectRender;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.filter.NewBeautificationFilter;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.filtersdk.filter.helper.FilterFactory;
import com.miui.filtersdk.filter.helper.FilterFactory.FilterScene;
import com.miui.filtersdk.filter.helper.FilterType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import miui.util.FeatureParser;

public class EffectController {
    /* renamed from: -com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues */
    private static final /* synthetic */ int[] f1-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues = null;
    public static final int[] EFFECT_ALL_CHANGE_TYPES = new int[]{1, 2, 3, 4, 5, 6};
    private static final String TAG = EffectController.class.getSimpleName();
    private static EffectController sInstance;
    private boolean mBeautyEnable = false;
    private boolean mBeautyFrameReady = false;
    private boolean mBlur = false;
    private int mBlurStep = -1;
    private List<EffectChangedListener> mChangedListeners = new ArrayList();
    private String mCurrentSticker;
    private float mDeviceRotation;
    private boolean mDrawGradienter;
    private boolean mDrawPeaking;
    private boolean mDrawTilt;
    private int mEffectId = FilterInfo.FILTER_ID_NONE;
    private EffectRectAttribute mEffectRectAttribute = new EffectRectAttribute();
    private SparseArray<ArrayList<FilterInfo>> mFilterInfoMap;
    private boolean mIsDrawMainFrame = true;
    private boolean mNeedDestroyMakeup = false;
    private int mOrientation;
    private int mOverrideAiEffectIndex = -1;
    private int mOverrideEffectIndex = -1;
    private float mTiltShiftMaskAlpha;

    @Retention(RetentionPolicy.SOURCE)
    public @interface EffectChangeType {
    }

    public interface EffectChangedListener {
        void onEffectChanged(int... iArr);
    }

    public static class EffectRectAttribute {
        public int mInvertFlag;
        public PointF mPoint1;
        public PointF mPoint2;
        public float mRangeWidth;
        public RectF mRectF;

        /* synthetic */ EffectRectAttribute(EffectRectAttribute -this0, EffectRectAttribute -this1) {
            this();
        }

        /* synthetic */ EffectRectAttribute(EffectRectAttribute e, EffectRectAttribute -this1, EffectRectAttribute -this2) {
            this(e);
        }

        private EffectRectAttribute() {
            this.mRectF = new RectF();
            this.mPoint1 = new PointF();
            this.mPoint2 = new PointF();
        }

        private EffectRectAttribute(EffectRectAttribute e) {
            this.mRectF = new RectF();
            this.mPoint1 = new PointF();
            this.mPoint2 = new PointF();
            this.mRectF.set(e.mRectF);
            this.mPoint1.set(e.mPoint1);
            this.mPoint2.set(e.mPoint2);
            this.mInvertFlag = e.mInvertFlag;
            this.mRangeWidth = e.mRangeWidth;
        }

        public String toString() {
            return "mRectF=" + this.mRectF + " mPoint1=" + this.mPoint1 + " mPoint2=" + this.mPoint2 + " mInvertFlag=" + this.mInvertFlag + " mRangeWidth=" + this.mRangeWidth;
        }
    }

    /* renamed from: -getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues */
    private static /* synthetic */ int[] m0-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues() {
        if (f1-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues != null) {
            return f1-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues;
        }
        int[] iArr = new int[FilterType.values().length];
        try {
            iArr[FilterType.A10_NIGHT.ordinal()] = 28;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[FilterType.A11_SNOW.ordinal()] = 29;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[FilterType.A12_SEA.ordinal()] = 30;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[FilterType.A13_AUTUMN.ordinal()] = 31;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[FilterType.A14_CANDLELIGHT.ordinal()] = 32;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[FilterType.A15_CAR.ordinal()] = 33;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[FilterType.A16_GRASS.ordinal()] = 34;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[FilterType.A17_MAPLE_LEAVES.ordinal()] = 35;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[FilterType.A18_SUCCULENT.ordinal()] = 36;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[FilterType.A19_BUILDING.ordinal()] = 37;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[FilterType.A1_DOC.ordinal()] = 38;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr[FilterType.A20_CITY.ordinal()] = 39;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr[FilterType.A21_CLOUD.ordinal()] = 40;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr[FilterType.A22_OVERCAST.ordinal()] = 41;
        } catch (NoSuchFieldError e14) {
        }
        try {
            iArr[FilterType.A23_BACKLIGHT.ordinal()] = 42;
        } catch (NoSuchFieldError e15) {
        }
        try {
            iArr[FilterType.A24_SILHOUETTE.ordinal()] = 43;
        } catch (NoSuchFieldError e16) {
        }
        try {
            iArr[FilterType.A25_HUMAN.ordinal()] = 44;
        } catch (NoSuchFieldError e17) {
        }
        try {
            iArr[FilterType.A26_JEWELRY.ordinal()] = 45;
        } catch (NoSuchFieldError e18) {
        }
        try {
            iArr[FilterType.A27_BUDDHA.ordinal()] = 46;
        } catch (NoSuchFieldError e19) {
        }
        try {
            iArr[FilterType.A28_COW.ordinal()] = 47;
        } catch (NoSuchFieldError e20) {
        }
        try {
            iArr[FilterType.A29_CURRY.ordinal()] = 48;
        } catch (NoSuchFieldError e21) {
        }
        try {
            iArr[FilterType.A2_FLOWER.ordinal()] = 49;
        } catch (NoSuchFieldError e22) {
        }
        try {
            iArr[FilterType.A30_MOTORBIKE.ordinal()] = 50;
        } catch (NoSuchFieldError e23) {
        }
        try {
            iArr[FilterType.A31_TEMPLE.ordinal()] = 51;
        } catch (NoSuchFieldError e24) {
        }
        try {
            iArr[FilterType.A3_FOOD.ordinal()] = 52;
        } catch (NoSuchFieldError e25) {
        }
        try {
            iArr[FilterType.A4_PPT.ordinal()] = 53;
        } catch (NoSuchFieldError e26) {
        }
        try {
            iArr[FilterType.A5_SKY.ordinal()] = 54;
        } catch (NoSuchFieldError e27) {
        }
        try {
            iArr[FilterType.A6_SUNRISE_SUNSET.ordinal()] = 55;
        } catch (NoSuchFieldError e28) {
        }
        try {
            iArr[FilterType.A7_CAT.ordinal()] = 56;
        } catch (NoSuchFieldError e29) {
        }
        try {
            iArr[FilterType.A8_DOG.ordinal()] = 57;
        } catch (NoSuchFieldError e30) {
        }
        try {
            iArr[FilterType.A9_GREEN_PLANTS.ordinal()] = 58;
        } catch (NoSuchFieldError e31) {
        }
        try {
            iArr[FilterType.BI_MEMORY.ordinal()] = 59;
        } catch (NoSuchFieldError e32) {
        }
        try {
            iArr[FilterType.BI_MONO.ordinal()] = 60;
        } catch (NoSuchFieldError e33) {
        }
        try {
            iArr[FilterType.BI_PINK.ordinal()] = 61;
        } catch (NoSuchFieldError e34) {
        }
        try {
            iArr[FilterType.BI_PORTRAIT.ordinal()] = 62;
        } catch (NoSuchFieldError e35) {
        }
        try {
            iArr[FilterType.BI_RETRO.ordinal()] = 63;
        } catch (NoSuchFieldError e36) {
        }
        try {
            iArr[FilterType.BI_ROMANTIC.ordinal()] = 64;
        } catch (NoSuchFieldError e37) {
        }
        try {
            iArr[FilterType.BI_STRONG.ordinal()] = 65;
        } catch (NoSuchFieldError e38) {
        }
        try {
            iArr[FilterType.BI_SUNNY.ordinal()] = 66;
        } catch (NoSuchFieldError e39) {
        }
        try {
            iArr[FilterType.BI_SWEET.ordinal()] = 67;
        } catch (NoSuchFieldError e40) {
        }
        try {
            iArr[FilterType.BI_WARM.ordinal()] = 68;
        } catch (NoSuchFieldError e41) {
        }
        try {
            iArr[FilterType.BI_YOUNG.ordinal()] = 69;
        } catch (NoSuchFieldError e42) {
        }
        try {
            iArr[FilterType.B_FAIRYTALE.ordinal()] = 1;
        } catch (NoSuchFieldError e43) {
        }
        try {
            iArr[FilterType.B_JAPANESE.ordinal()] = 2;
        } catch (NoSuchFieldError e44) {
        }
        try {
            iArr[FilterType.B_MAZE.ordinal()] = 3;
        } catch (NoSuchFieldError e45) {
        }
        try {
            iArr[FilterType.B_MINT.ordinal()] = 4;
        } catch (NoSuchFieldError e46) {
        }
        try {
            iArr[FilterType.B_MOOD.ordinal()] = 5;
        } catch (NoSuchFieldError e47) {
        }
        try {
            iArr[FilterType.B_MOVIE.ordinal()] = 70;
        } catch (NoSuchFieldError e48) {
        }
        try {
            iArr[FilterType.B_NATURE.ordinal()] = 6;
        } catch (NoSuchFieldError e49) {
        }
        try {
            iArr[FilterType.B_PINK.ordinal()] = 7;
        } catch (NoSuchFieldError e50) {
        }
        try {
            iArr[FilterType.B_RIDDLE.ordinal()] = 71;
        } catch (NoSuchFieldError e51) {
        }
        try {
            iArr[FilterType.B_ROMANCE.ordinal()] = 8;
        } catch (NoSuchFieldError e52) {
        }
        try {
            iArr[FilterType.B_STORY.ordinal()] = 72;
        } catch (NoSuchFieldError e53) {
        }
        try {
            iArr[FilterType.B_WHITEANDBLACK.ordinal()] = 73;
        } catch (NoSuchFieldError e54) {
        }
        try {
            iArr[FilterType.N_BERRY.ordinal()] = 9;
        } catch (NoSuchFieldError e55) {
        }
        try {
            iArr[FilterType.N_COOKIE.ordinal()] = 10;
        } catch (NoSuchFieldError e56) {
        }
        try {
            iArr[FilterType.N_DELICACY.ordinal()] = 11;
        } catch (NoSuchFieldError e57) {
        }
        try {
            iArr[FilterType.N_FADE.ordinal()] = 12;
        } catch (NoSuchFieldError e58) {
        }
        try {
            iArr[FilterType.N_FILM.ordinal()] = 13;
        } catch (NoSuchFieldError e59) {
        }
        try {
            iArr[FilterType.N_KOIZORA.ordinal()] = 14;
        } catch (NoSuchFieldError e60) {
        }
        try {
            iArr[FilterType.N_LATTE.ordinal()] = 15;
        } catch (NoSuchFieldError e61) {
        }
        try {
            iArr[FilterType.N_LIGHT.ordinal()] = 16;
        } catch (NoSuchFieldError e62) {
        }
        try {
            iArr[FilterType.N_LIVELY.ordinal()] = 17;
        } catch (NoSuchFieldError e63) {
        }
        try {
            iArr[FilterType.N_QUIET.ordinal()] = 18;
        } catch (NoSuchFieldError e64) {
        }
        try {
            iArr[FilterType.N_SODA.ordinal()] = 19;
        } catch (NoSuchFieldError e65) {
        }
        try {
            iArr[FilterType.N_WARM.ordinal()] = 20;
        } catch (NoSuchFieldError e66) {
        }
        try {
            iArr[FilterType.N_WHITEANDBLACK.ordinal()] = 21;
        } catch (NoSuchFieldError e67) {
        }
        try {
            iArr[FilterType.S_BYGONE.ordinal()] = 22;
        } catch (NoSuchFieldError e68) {
        }
        try {
            iArr[FilterType.S_FILM.ordinal()] = 23;
        } catch (NoSuchFieldError e69) {
        }
        try {
            iArr[FilterType.S_FOREST.ordinal()] = 24;
        } catch (NoSuchFieldError e70) {
        }
        try {
            iArr[FilterType.S_POLAROID.ordinal()] = 25;
        } catch (NoSuchFieldError e71) {
        }
        try {
            iArr[FilterType.S_WHITEANDBLACK.ordinal()] = 26;
        } catch (NoSuchFieldError e72) {
        }
        try {
            iArr[FilterType.S_YEARS.ordinal()] = 27;
        } catch (NoSuchFieldError e73) {
        }
        f1-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues = iArr;
        return iArr;
    }

    public void addChangeListener(EffectChangedListener effectChangedListener) {
        this.mChangedListeners.add(effectChangedListener);
        EffectChangedListenerController.addEffectChangedListener(effectChangedListener);
    }

    public boolean removeChangeListener(EffectChangedListener effectChangedListener) {
        if (this.mChangedListeners.size() == 0) {
            return true;
        }
        return this.mChangedListeners.remove(effectChangedListener);
    }

    private void postNotifyEffectChanged(int... changeType) {
        for (EffectChangedListener listener : this.mChangedListeners) {
            listener.onEffectChanged(changeType);
        }
    }

    public void reset() {
        this.mBeautyEnable = false;
        this.mNeedDestroyMakeup = true;
        this.mCurrentSticker = null;
        this.mDrawPeaking = false;
        this.mDrawTilt = false;
        this.mDrawGradienter = false;
        postNotifyEffectChanged(EFFECT_ALL_CHANGE_TYPES);
    }

    private EffectController() {
        initialize();
    }

    public static synchronized EffectController getInstance() {
        EffectController effectController;
        synchronized (EffectController.class) {
            if (sInstance == null) {
                sInstance = new EffectController();
            }
            effectController = sInstance;
        }
        return effectController;
    }

    public static synchronized void releaseInstance() {
        synchronized (EffectController.class) {
            if (sInstance != null && sInstance.mChangedListeners.size() == 0) {
                sInstance = null;
            }
        }
    }

    public void setEffect(int effect) {
        synchronized (this) {
            this.mEffectId = effect;
            postNotifyEffectChanged(1);
        }
    }

    public void setAiSceneEffect(int effect) {
        if (FilterInfo.getCategory(effect) == 5) {
            this.mOverrideAiEffectIndex = effect;
        } else if (effect == FilterInfo.FILTER_ID_NONE) {
            this.mOverrideAiEffectIndex = -1;
        }
        setEffect(effect);
    }

    public int getBlurAnimationValue() {
        if (this.mBlurStep >= 0 && this.mBlurStep <= 8) {
            this.mBlurStep = (this.mBlur ? 1 : -1) + this.mBlurStep;
            if (8 <= this.mBlurStep && this.mBlur) {
                this.mOverrideEffectIndex = FilterInfo.FILTER_ID_BLUR;
            }
            if (this.mBlurStep >= 0 && this.mBlurStep <= 8) {
                return (this.mBlurStep * 212) / 8;
            }
        }
        return -1;
    }

    public int getEffect(boolean includeOverride) {
        synchronized (this) {
            int i;
            if (includeOverride) {
                if (this.mOverrideEffectIndex != -1) {
                    i = this.mOverrideEffectIndex;
                    return i;
                }
            }
            if (this.mEffectId != FilterInfo.FILTER_ID_NONE || this.mOverrideAiEffectIndex == -1) {
                i = this.mEffectId;
                return i;
            }
            i = this.mOverrideAiEffectIndex;
            return i;
        }
    }

    public void setCurrentSticker(String sticker) {
        this.mCurrentSticker = sticker;
        postNotifyEffectChanged(2);
    }

    public String getCurrentSticker() {
        return this.mCurrentSticker;
    }

    public boolean isStickerEnable() {
        return TextUtils.isEmpty(this.mCurrentSticker) ^ 1;
    }

    public boolean isMakeupEnable() {
        return this.mBeautyEnable;
    }

    public boolean isBeautyFrameReady() {
        return this.mBeautyFrameReady;
    }

    public boolean needDestroyMakeup() {
        return this.mNeedDestroyMakeup;
    }

    public void setDestroyMakeup(boolean destroyMakeup) {
        this.mNeedDestroyMakeup = destroyMakeup;
    }

    public void enableMakeup(boolean enable) {
        this.mBeautyEnable = enable;
        if (!enable) {
            this.mNeedDestroyMakeup = true;
        }
        postNotifyEffectChanged(3);
    }

    public void setDrawPeaking(boolean drawPeaking) {
        this.mDrawPeaking = drawPeaking;
        postNotifyEffectChanged(4);
    }

    public boolean isNeedDrawPeaking() {
        return this.mDrawPeaking;
    }

    public boolean isDrawTilt() {
        return this.mDrawTilt;
    }

    public void setDrawTilt(boolean drawTilt) {
        this.mDrawTilt = drawTilt;
        postNotifyEffectChanged(5);
    }

    public boolean isDrawGradienter() {
        return this.mDrawGradienter;
    }

    public void setDrawGradienter(boolean drawGradienter) {
        this.mDrawGradienter = drawGradienter;
        postNotifyEffectChanged(6);
    }

    public boolean hasEffect() {
        boolean z;
        synchronized (this) {
            if (!Device.isSupportedShaderEffect()) {
                z = false;
            } else if (this.mEffectId != FilterInfo.FILTER_ID_NONE || ModuleManager.isSquareModule() || CameraSettings.isGradienterOn()) {
                z = true;
            } else {
                z = CameraSettings.isTiltShiftOn();
            }
        }
        return z;
    }

    public boolean isMainFrameDisplay() {
        return this.mIsDrawMainFrame;
    }

    public void setTiltShiftMaskAlpha(float alpha) {
        this.mTiltShiftMaskAlpha = alpha;
    }

    public float getTiltShiftMaskAlpha() {
        return this.mTiltShiftMaskAlpha;
    }

    public void setEffectAttribute(RectF rectF, PointF point1, PointF point2, float range) {
        this.mEffectRectAttribute.mRectF.set(rectF);
        this.mEffectRectAttribute.mPoint1.set(point1);
        this.mEffectRectAttribute.mPoint2.set(point2);
        this.mEffectRectAttribute.mRangeWidth = range;
    }

    public EffectRectAttribute getEffectAttribute() {
        return this.mEffectRectAttribute;
    }

    public void clearEffectAttribute() {
        this.mEffectRectAttribute.mRectF.set(0.0f, 0.0f, 0.0f, 0.0f);
        this.mEffectRectAttribute.mPoint1.set(0.0f, 0.0f);
        this.mEffectRectAttribute.mPoint2.set(0.0f, 0.0f);
        this.mEffectRectAttribute.mRangeWidth = 0.0f;
    }

    public RectF getEffectRectF() {
        return new RectF(this.mEffectRectAttribute.mRectF);
    }

    public EffectRectAttribute copyEffectRectAttribute() {
        return new EffectRectAttribute(this.mEffectRectAttribute, null, null);
    }

    public void setInvertFlag(int invert) {
        this.mEffectRectAttribute.mInvertFlag = invert;
    }

    public int getInvertFlag() {
        return this.mEffectRectAttribute.mInvertFlag;
    }

    public void setOrientation(int orientation) {
        this.mOrientation = orientation;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public void setDeviceRotation(boolean isLying, float rotation) {
        if (isLying) {
            rotation = -1.0f;
        }
        this.mDeviceRotation = rotation;
    }

    public float getDeviceRotation() {
        return this.mDeviceRotation;
    }

    public boolean isBackGroundBlur() {
        return getEffect(true) == FilterInfo.FILTER_ID_BLUR;
    }

    public boolean isNeedRect(int renderId) {
        ArrayList<FilterInfo> infoList = (ArrayList) this.mFilterInfoMap.get(FilterInfo.getCategory(renderId));
        if (infoList != null) {
            for (FilterInfo info : infoList) {
                if (info.getId() == renderId) {
                    return info.isNeedRect();
                }
            }
        }
        return false;
    }

    public int getEffectCount(int category) {
        ArrayList<FilterInfo> infoList = (ArrayList) this.mFilterInfoMap.get(category);
        if (infoList == null) {
            return 0;
        }
        return infoList.size();
    }

    public ArrayList<FilterInfo> getFilterInfo(int category) {
        return (ArrayList) this.mFilterInfoMap.get(category);
    }

    private void initialize() {
        this.mFilterInfoMap = new SparseArray(4);
        this.mFilterInfoMap.put(5, initAiSceneFilterInfo());
        this.mFilterInfoMap.put(0, initPrivateFilterInfo());
        this.mFilterInfoMap.put(1, initNormalFilterInfoNew());
        if (Device.isIndiaBeautyFilter()) {
            this.mFilterInfoMap.put(2, BeautyInfoFactory.initIndiaBeautyFilterInfo());
        } else {
            this.mFilterInfoMap.put(2, BeautyInfoFactory.initBeautyFilterInfo());
        }
        this.mFilterInfoMap.put(3, initStickerFilterInfo());
    }

    private ArrayList<FilterInfo> initAiSceneFilterInfo() {
        int i = 0;
        ArrayList<FilterInfo> filters = new ArrayList();
        FilterType[] types = FilterFactory.getFiltersByScene(FilterScene.AI);
        filters.add(new FilterInfo(FilterInfo.AI_SCENE_FILTER_ID_0_NONE, 0));
        int length = types.length;
        int order = 1;
        while (i < length) {
            int order2 = order + 1;
            filters.add(new FilterInfo(FilterInfo.getId(5, types[i].ordinal()), order));
            i++;
            order = order2;
        }
        return filters;
    }

    private ArrayList<FilterInfo> initPrivateFilterInfo() {
        ArrayList<FilterInfo> filters = new ArrayList();
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_BLUR, 0));
        int order = 1 + 1;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_GRADIENTER, 1));
        int order2 = order + 1;
        FilterInfo info = new FilterInfo(FilterInfo.FILTER_ID_TILTSHIFT, order);
        info.setNeedRect(true);
        filters.add(info);
        order = order2 + 1;
        info = new FilterInfo(FilterInfo.FILTER_ID_GAUSSIAN, order2);
        info.setNeedRect(true);
        filters.add(info);
        order2 = order + 1;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_PEAKINGMF, order));
        order = order2 + 1;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_STICKER, order2));
        return filters;
    }

    private ArrayList<FilterInfo> initNormalFilterInfoNew() {
        ArrayList<FilterInfo> filters = new ArrayList();
        int order = 0;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.color_effect_image_none, 0));
        int nameResId = 0;
        int iconResId = 0;
        for (FilterType type : FilterFactory.getFiltersByScene(FilterScene.NORMAL)) {
            switch (m0-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[type.ordinal()]) {
                case R.styleable.ToggleSwitch_textOff /*9*/:
                    order = 110;
                    nameResId = R.string.color_effect_entry_berry;
                    iconResId = R.drawable.color_effect_image_berry;
                    break;
                case R.styleable.ToggleSwitch_textOffColor /*10*/:
                    order = 60;
                    nameResId = R.string.color_effect_entry_cookie;
                    iconResId = R.drawable.color_effect_image_cookie;
                    break;
                case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                    order = 90;
                    nameResId = R.string.color_effect_entry_delicacy;
                    iconResId = R.drawable.color_effect_image_delicacy;
                    break;
                case R.styleable.ToggleSwitch_textSize /*12*/:
                    order = 130;
                    nameResId = R.string.color_effect_entry_fade;
                    iconResId = R.drawable.color_effect_image_fade;
                    break;
                case R.styleable.ToggleSwitch_textOffShadowRadius /*13*/:
                    order = 20;
                    nameResId = R.string.color_effect_entry_film;
                    iconResId = R.drawable.color_effect_image_film;
                    break;
                case R.styleable.ToggleSwitch_duration /*14*/:
                    order = 30;
                    nameResId = R.string.color_effect_entry_koizora;
                    iconResId = R.drawable.color_effect_image_koizora;
                    break;
                case R.styleable.ToggleSwitch_checked /*15*/:
                    order = 40;
                    nameResId = R.string.color_effect_entry_latte;
                    iconResId = R.drawable.color_effect_image_latte;
                    break;
                case 16:
                    order = 100;
                    nameResId = R.string.color_effect_entry_glimmer;
                    iconResId = R.drawable.color_effect_image_glimmer;
                    break;
                case 17:
                    order = 10;
                    nameResId = R.string.color_effect_entry_vivid;
                    iconResId = R.drawable.color_effect_image_vivid;
                    break;
                case 18:
                    order = 70;
                    nameResId = R.string.color_effect_entry_quiet;
                    iconResId = R.drawable.color_effect_image_quiet;
                    break;
                case 19:
                    order = 80;
                    nameResId = R.string.color_effect_entry_soda;
                    iconResId = R.drawable.color_effect_image_soda;
                    break;
                case 20:
                    order = 50;
                    nameResId = R.string.color_effect_entry_warm;
                    iconResId = R.drawable.color_effect_image_warm;
                    break;
                case 21:
                    order = 120;
                    nameResId = R.string.color_effect_entry_blackwhite;
                    iconResId = R.drawable.color_effect_image_blackwhite;
                    break;
            }
            if (!(nameResId == 0 || iconResId == 0)) {
                filters.add(new FilterInfo(1, type.ordinal(), nameResId, iconResId, order));
                nameResId = 0;
                iconResId = 0;
            }
        }
        Collections.sort(filters);
        return filters;
    }

    private ArrayList<FilterInfo> initStickerFilterInfo() {
        ArrayList<FilterInfo> filters = new ArrayList();
        int order = 0;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.video_effect_image_none, 0));
        int nameResId = 0;
        int iconResId = 0;
        for (FilterType type : FilterFactory.getFiltersByScene(FilterScene.STICKER)) {
            switch (m0-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[type.ordinal()]) {
                case 22:
                    order = 45;
                    nameResId = R.string.video_effect_entry_bygone;
                    iconResId = R.drawable.video_effect_image_bygone;
                    break;
                case 23:
                    order = 10;
                    nameResId = R.string.video_effect_entry_film;
                    iconResId = R.drawable.video_effect_image_film;
                    break;
                case 24:
                    order = 40;
                    nameResId = R.string.video_effect_entry_forest;
                    iconResId = R.drawable.video_effect_image_forest;
                    break;
                case 25:
                    order = 30;
                    nameResId = R.string.video_effect_entry_polaroid;
                    iconResId = R.drawable.video_effect_image_polaroid;
                    break;
                case 26:
                    order = 50;
                    nameResId = R.string.video_effect_entry_blackwhite;
                    iconResId = R.drawable.video_effect_image_blackwhite;
                    break;
                case 27:
                    order = 20;
                    nameResId = R.string.video_effect_entry_holiday;
                    iconResId = R.drawable.video_effect_image_holiday;
                    break;
            }
            if (!(nameResId == 0 || iconResId == 0)) {
                filters.add(new FilterInfo(3, type.ordinal(), nameResId, iconResId, order));
                nameResId = 0;
                iconResId = 0;
            }
        }
        Collections.sort(filters);
        return filters;
    }

    public RenderGroup getEffectGroup(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, boolean isSnapshot, int renderId) {
        if (!Device.isSupportedShaderEffect()) {
            return null;
        }
        if (!isWhole && (renderGroup.isNeedInit(renderId) ^ 1) != 0) {
            return renderGroup;
        }
        int category = 1;
        if (renderId > -1) {
            category = FilterInfo.getCategory(renderId);
        }
        Log.d(TAG, "getEffectGroup: renderId = " + renderId);
        Log.d(TAG, "getEffectGroup: category = " + category);
        switch (category) {
            case 0:
                getPrivateRender(canvas, renderGroup, isWhole, isSnapshot, renderId);
                break;
            case 1:
                getNormalRenderNew(canvas, renderGroup, isWhole, isSnapshot, renderId);
                break;
            case 2:
                getBeautyRender(canvas, renderGroup, isWhole, renderId);
                break;
            case 3:
                getStickerRender(canvas, renderGroup, isWhole, renderId);
                break;
            case 4:
                getMakeupRender(canvas, renderGroup);
                break;
            case 5:
                getAiSceneRenderNew(canvas, renderGroup, isWhole, isSnapshot, renderId);
                break;
            default:
                Log.w(TAG, "invalid renderId " + Integer.toHexString(renderId));
                break;
        }
        return renderGroup;
    }

    private RenderGroup getPrivateRender(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, boolean isSnapshot, int id) {
        boolean initOne = false;
        if (renderGroup.getRender(FilterInfo.FILTER_ID_BLUR) == null && (isWhole || id == FilterInfo.FILTER_ID_BLUR || id < 0)) {
            if (isWhole || id == FilterInfo.FILTER_ID_BLUR || renderGroup.isPartComplete(2)) {
                boolean matchPartRender0;
                boolean matchPartRender1;
                if (renderGroup.getPartRender(0) != null) {
                    matchPartRender0 = renderGroup.getPartRender(0) instanceof XBlurEffectRender;
                } else {
                    matchPartRender0 = false;
                }
                if (renderGroup.getPartRender(1) != null) {
                    matchPartRender1 = renderGroup.getPartRender(1) instanceof YBlurEffectRender;
                } else {
                    matchPartRender1 = false;
                }
                renderGroup.addRender(new PipeRenderPair(canvas, FilterInfo.FILTER_ID_BLUR, matchPartRender0 ? renderGroup.getPartRender(0) : new XBlurEffectRender(canvas), matchPartRender1 ? renderGroup.getPartRender(1) : new YBlurEffectRender(canvas), false));
                if (matchPartRender0 || matchPartRender1) {
                    renderGroup.clearPartRenders();
                }
            } else if (renderGroup.getPartRender(0) == null) {
                renderGroup.addPartRender(new XBlurEffectRender(canvas));
            } else if (renderGroup.getPartRender(1) == null) {
                renderGroup.addPartRender(new YBlurEffectRender(canvas));
            }
            initOne = true;
        }
        if (renderGroup.getRender(FilterInfo.FILTER_ID_GRADIENTER) == null && (isWhole || id == FilterInfo.FILTER_ID_GRADIENTER || (id < 0 && (initOne ^ 1) != 0))) {
            Render gradienterSnapshotEffectRender;
            if (isSnapshot) {
                gradienterSnapshotEffectRender = new GradienterSnapshotEffectRender(canvas, FilterInfo.FILTER_ID_GRADIENTER);
            } else {
                gradienterSnapshotEffectRender = new GradienterEffectRender(canvas, FilterInfo.FILTER_ID_GRADIENTER);
            }
            renderGroup.addRender(gradienterSnapshotEffectRender);
            initOne = true;
        }
        if (renderGroup.getRender(FilterInfo.FILTER_ID_TILTSHIFT) == null && Device.isSupportedTiltShift() && (isWhole || id == FilterInfo.FILTER_ID_TILTSHIFT || (id < 0 && (initOne ^ 1) != 0))) {
            if (isWhole || id == FilterInfo.FILTER_ID_TILTSHIFT || renderGroup.isPartComplete(3)) {
                renderGroup.addRender(new PipeRenderPair(canvas, FilterInfo.FILTER_ID_TILTSHIFT, new PipeRenderPair(canvas, renderGroup.getPartRender(0) != null ? renderGroup.getPartRender(0) : new XTiltShiftEffectRender(canvas), renderGroup.getPartRender(1) != null ? renderGroup.getPartRender(1) : new YTiltShiftEffectRender(canvas), false), renderGroup.getPartRender(2) != null ? renderGroup.getPartRender(2) : new TiltShiftMaskEffectRender(canvas), false));
                renderGroup.clearPartRenders();
            } else if (renderGroup.getPartRender(0) == null) {
                renderGroup.addPartRender(new XTiltShiftEffectRender(canvas));
            } else if (renderGroup.getPartRender(1) == null) {
                renderGroup.addPartRender(new YTiltShiftEffectRender(canvas));
            } else if (renderGroup.getPartRender(2) == null) {
                renderGroup.addPartRender(new TiltShiftMaskEffectRender(canvas));
            }
            initOne = true;
        }
        if (!FeatureParser.getBoolean("is_camera_replace_higher_cost_effect", false) && renderGroup.getRender(FilterInfo.FILTER_ID_GAUSSIAN) == null && (isWhole || id == FilterInfo.FILTER_ID_GAUSSIAN || (id < 0 && (initOne ^ 1) != 0))) {
            if (isWhole || id == FilterInfo.FILTER_ID_GAUSSIAN || renderGroup.isPartComplete(3)) {
                renderGroup.addRender(new PipeRenderPair(canvas, FilterInfo.FILTER_ID_GAUSSIAN, new PipeRenderPair(canvas, renderGroup.getPartRender(0) != null ? renderGroup.getPartRender(0) : new XGaussianEffectRender(canvas), renderGroup.getPartRender(1) != null ? renderGroup.getPartRender(1) : new YGaussianEffectRender(canvas), false), renderGroup.getPartRender(2) != null ? renderGroup.getPartRender(2) : new GaussianMaskEffectRender(canvas), false));
                renderGroup.clearPartRenders();
            } else if (renderGroup.getPartRender(0) == null) {
                renderGroup.addPartRender(new XGaussianEffectRender(canvas));
            } else if (renderGroup.getPartRender(1) == null) {
                renderGroup.addPartRender(new YGaussianEffectRender(canvas));
            } else if (renderGroup.getPartRender(2) == null) {
                renderGroup.addPartRender(new GaussianMaskEffectRender(canvas));
            }
            initOne = true;
        }
        if (renderGroup.getRender(FilterInfo.FILTER_ID_PEAKINGMF) == null && Device.isSupportedPeakingMF() && (isSnapshot ^ 1) != 0 && (isWhole || id == FilterInfo.FILTER_ID_PEAKINGMF || (id < 0 && (initOne ^ 1) != 0))) {
            renderGroup.addRender(new FocusPeakingRender(canvas, FilterInfo.FILTER_ID_PEAKINGMF));
        }
        if (renderGroup.getRender(FilterInfo.FILTER_ID_STICKER) == null && (isWhole || id == FilterInfo.FILTER_ID_STICKER || (id < 0 && (initOne ^ 1) != 0))) {
            StickerRender render = new StickerRender(canvas, FilterInfo.FILTER_ID_STICKER, getCurrentSticker());
            BeautyParameters.getInstance().setStickerMakeupProcessor(render.getMakeupProcessor());
            renderGroup.addRender(render);
        }
        return renderGroup;
    }

    private RenderGroup getAiSceneRenderNew(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, boolean isSnapshot, int renderId) {
        if (isWhole) {
            return getRenderByCategory(canvas, renderGroup, 5, isSnapshot);
        }
        return getRenderById(canvas, renderGroup, isSnapshot, renderId);
    }

    private RenderGroup getNormalRenderNew(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, boolean isSnapshot, int renderId) {
        if (isWhole) {
            return getRenderByCategory(canvas, renderGroup, 1, isSnapshot);
        }
        return getRenderById(canvas, renderGroup, isSnapshot, renderId);
    }

    private RenderGroup getBeautyRender(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, int renderId) {
        if (isWhole) {
            return getRenderByCategory(canvas, renderGroup, 2, false);
        }
        return getRenderById(canvas, renderGroup, false, renderId);
    }

    private RenderGroup getStickerRender(GLCanvas canvas, RenderGroup renderGroup, boolean isWhole, int renderId) {
        if (isWhole) {
            return getRenderByCategory(canvas, renderGroup, 3, false);
        }
        return getRenderById(canvas, renderGroup, false, renderId);
    }

    private RenderGroup getMakeupRender(GLCanvas canvas, RenderGroup renderGroup) {
        NewBeautificationFilter filter = new NewBeautificationFilter();
        ArcsoftBeautyProcessor beautyProcessor = new ArcsoftBeautyProcessor();
        beautyProcessor.setRotation(CameraSettings.isFrontCamera() ? 270 : 90);
        BeautyParameters.getInstance().setMakeupProcessor(beautyProcessor);
        filter.setBeautyProcessor(beautyProcessor);
        filter.initBeautyProcessor(Util.sWindowWidth, Util.sWindowHeight);
        renderGroup.addRender(new BeautificationWrapperRender(canvas, FilterInfo.RENDER_ID_MAKEUP, filter, CameraSettings.isFrontCamera()));
        return renderGroup;
    }

    private RenderGroup getRenderByCategory(GLCanvas canvas, RenderGroup renderGroup, int category, boolean isSnapshot) {
        if (convertToFilterScene(category) == FilterScene.NONE) {
            return renderGroup;
        }
        ArrayList<FilterInfo> infoList = getFilterInfo(category);
        if (infoList != null) {
            for (FilterInfo info : infoList) {
                getRenderById(canvas, renderGroup, isSnapshot, info.getId());
            }
        }
        return renderGroup;
    }

    private RenderGroup getRenderById(GLCanvas canvas, RenderGroup renderGroup, boolean isSnapshot, int renderId) {
        Render render = null;
        if (renderId < 0) {
            return renderGroup;
        }
        if (renderId == FilterInfo.FILTER_ID_NONE && renderGroup.isNeedInit(FilterInfo.FILTER_ID_NONE)) {
            if (isSnapshot) {
                render = new NoneEffectRender(canvas, FilterInfo.FILTER_ID_NONE);
            }
            renderGroup.addRender(render);
            return renderGroup;
        } else if (renderId == FilterInfo.AI_SCENE_FILTER_ID_0_NONE && renderGroup.isNeedInit(FilterInfo.AI_SCENE_FILTER_ID_0_NONE)) {
            if (isSnapshot) {
                render = new NoneEffectRender(canvas, FilterInfo.AI_SCENE_FILTER_ID_0_NONE);
            }
            renderGroup.addRender(render);
            return renderGroup;
        } else {
            if (renderGroup.getRender(renderId) == null) {
                int index = FilterInfo.getIndex(renderId);
                Log.d(TAG, "getRenderById: index = " + index);
                if (index > -1 && index < FilterType.values().length) {
                    FilterType type = FilterType.values()[index];
                    BaseOriginalFilter filter = FilterFactory.getFilterByType(type);
                    if (filter != null) {
                        filter.setDegree(getDegree(type));
                    }
                    renderGroup.addRender(new WrapperRender(canvas, renderId, filter));
                }
            }
            return renderGroup;
        }
    }

    private int getDegree(FilterType type) {
        switch (m0-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[type.ordinal()]) {
            case 1:
            case 5:
                return 60;
            case 2:
            case 3:
            case 4:
            case 8:
                return 50;
            case 6:
                return 80;
            case 7:
                return 70;
            case R.styleable.ToggleSwitch_textOff /*9*/:
            case R.styleable.ToggleSwitch_textOffColor /*10*/:
            case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
            case R.styleable.ToggleSwitch_textOffShadowRadius /*13*/:
            case R.styleable.ToggleSwitch_duration /*14*/:
            case 18:
                return 80;
            case 17:
                return 60;
            case 19:
                return 70;
            default:
                return 100;
        }
    }

    private FilterScene convertToFilterScene(int category) {
        switch (category) {
            case 1:
                return FilterScene.NORMAL;
            case 2:
                return FilterScene.BEAUTY;
            case 3:
                return FilterScene.STICKER;
            case 5:
                return FilterScene.AI;
            default:
                return FilterScene.NONE;
        }
    }
}
