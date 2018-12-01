package com.android.camera.effect;

import android.support.v7.recyclerview.R;
import com.miui.filtersdk.filter.helper.FilterFactory;
import com.miui.filtersdk.filter.helper.FilterFactory.FilterScene;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.ArrayList;
import java.util.Collections;

public class BeautyInfoFactory {
    /* renamed from: -com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues */
    private static final /* synthetic */ int[] f6-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues = null;

    /* renamed from: -getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues */
    private static /* synthetic */ int[] m5-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues() {
        if (f6-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues != null) {
            return f6-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues;
        }
        int[] iArr = new int[FilterType.values().length];
        try {
            iArr[FilterType.A10_NIGHT.ordinal()] = 32;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[FilterType.A11_SNOW.ordinal()] = 33;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[FilterType.A12_SEA.ordinal()] = 34;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[FilterType.A13_AUTUMN.ordinal()] = 35;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[FilterType.A14_CANDLELIGHT.ordinal()] = 36;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[FilterType.A15_CAR.ordinal()] = 37;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[FilterType.A16_GRASS.ordinal()] = 38;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[FilterType.A17_MAPLE_LEAVES.ordinal()] = 39;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[FilterType.A18_SUCCULENT.ordinal()] = 40;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[FilterType.A19_BUILDING.ordinal()] = 41;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[FilterType.A1_DOC.ordinal()] = 42;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr[FilterType.A20_CITY.ordinal()] = 43;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr[FilterType.A21_CLOUD.ordinal()] = 44;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr[FilterType.A22_OVERCAST.ordinal()] = 45;
        } catch (NoSuchFieldError e14) {
        }
        try {
            iArr[FilterType.A23_BACKLIGHT.ordinal()] = 46;
        } catch (NoSuchFieldError e15) {
        }
        try {
            iArr[FilterType.A24_SILHOUETTE.ordinal()] = 47;
        } catch (NoSuchFieldError e16) {
        }
        try {
            iArr[FilterType.A25_HUMAN.ordinal()] = 48;
        } catch (NoSuchFieldError e17) {
        }
        try {
            iArr[FilterType.A26_JEWELRY.ordinal()] = 49;
        } catch (NoSuchFieldError e18) {
        }
        try {
            iArr[FilterType.A27_BUDDHA.ordinal()] = 50;
        } catch (NoSuchFieldError e19) {
        }
        try {
            iArr[FilterType.A28_COW.ordinal()] = 51;
        } catch (NoSuchFieldError e20) {
        }
        try {
            iArr[FilterType.A29_CURRY.ordinal()] = 52;
        } catch (NoSuchFieldError e21) {
        }
        try {
            iArr[FilterType.A2_FLOWER.ordinal()] = 53;
        } catch (NoSuchFieldError e22) {
        }
        try {
            iArr[FilterType.A30_MOTORBIKE.ordinal()] = 54;
        } catch (NoSuchFieldError e23) {
        }
        try {
            iArr[FilterType.A31_TEMPLE.ordinal()] = 55;
        } catch (NoSuchFieldError e24) {
        }
        try {
            iArr[FilterType.A3_FOOD.ordinal()] = 56;
        } catch (NoSuchFieldError e25) {
        }
        try {
            iArr[FilterType.A4_PPT.ordinal()] = 57;
        } catch (NoSuchFieldError e26) {
        }
        try {
            iArr[FilterType.A5_SKY.ordinal()] = 58;
        } catch (NoSuchFieldError e27) {
        }
        try {
            iArr[FilterType.A6_SUNRISE_SUNSET.ordinal()] = 59;
        } catch (NoSuchFieldError e28) {
        }
        try {
            iArr[FilterType.A7_CAT.ordinal()] = 60;
        } catch (NoSuchFieldError e29) {
        }
        try {
            iArr[FilterType.A8_DOG.ordinal()] = 61;
        } catch (NoSuchFieldError e30) {
        }
        try {
            iArr[FilterType.A9_GREEN_PLANTS.ordinal()] = 62;
        } catch (NoSuchFieldError e31) {
        }
        try {
            iArr[FilterType.BI_MEMORY.ordinal()] = 1;
        } catch (NoSuchFieldError e32) {
        }
        try {
            iArr[FilterType.BI_MONO.ordinal()] = 2;
        } catch (NoSuchFieldError e33) {
        }
        try {
            iArr[FilterType.BI_PINK.ordinal()] = 3;
        } catch (NoSuchFieldError e34) {
        }
        try {
            iArr[FilterType.BI_PORTRAIT.ordinal()] = 4;
        } catch (NoSuchFieldError e35) {
        }
        try {
            iArr[FilterType.BI_RETRO.ordinal()] = 5;
        } catch (NoSuchFieldError e36) {
        }
        try {
            iArr[FilterType.BI_ROMANTIC.ordinal()] = 6;
        } catch (NoSuchFieldError e37) {
        }
        try {
            iArr[FilterType.BI_STRONG.ordinal()] = 7;
        } catch (NoSuchFieldError e38) {
        }
        try {
            iArr[FilterType.BI_SUNNY.ordinal()] = 8;
        } catch (NoSuchFieldError e39) {
        }
        try {
            iArr[FilterType.BI_SWEET.ordinal()] = 9;
        } catch (NoSuchFieldError e40) {
        }
        try {
            iArr[FilterType.BI_WARM.ordinal()] = 10;
        } catch (NoSuchFieldError e41) {
        }
        try {
            iArr[FilterType.BI_YOUNG.ordinal()] = 11;
        } catch (NoSuchFieldError e42) {
        }
        try {
            iArr[FilterType.B_FAIRYTALE.ordinal()] = 12;
        } catch (NoSuchFieldError e43) {
        }
        try {
            iArr[FilterType.B_JAPANESE.ordinal()] = 13;
        } catch (NoSuchFieldError e44) {
        }
        try {
            iArr[FilterType.B_MAZE.ordinal()] = 14;
        } catch (NoSuchFieldError e45) {
        }
        try {
            iArr[FilterType.B_MINT.ordinal()] = 15;
        } catch (NoSuchFieldError e46) {
        }
        try {
            iArr[FilterType.B_MOOD.ordinal()] = 16;
        } catch (NoSuchFieldError e47) {
        }
        try {
            iArr[FilterType.B_MOVIE.ordinal()] = 17;
        } catch (NoSuchFieldError e48) {
        }
        try {
            iArr[FilterType.B_NATURE.ordinal()] = 18;
        } catch (NoSuchFieldError e49) {
        }
        try {
            iArr[FilterType.B_PINK.ordinal()] = 19;
        } catch (NoSuchFieldError e50) {
        }
        try {
            iArr[FilterType.B_RIDDLE.ordinal()] = 20;
        } catch (NoSuchFieldError e51) {
        }
        try {
            iArr[FilterType.B_ROMANCE.ordinal()] = 21;
        } catch (NoSuchFieldError e52) {
        }
        try {
            iArr[FilterType.B_STORY.ordinal()] = 22;
        } catch (NoSuchFieldError e53) {
        }
        try {
            iArr[FilterType.B_WHITEANDBLACK.ordinal()] = 23;
        } catch (NoSuchFieldError e54) {
        }
        try {
            iArr[FilterType.N_BERRY.ordinal()] = 24;
        } catch (NoSuchFieldError e55) {
        }
        try {
            iArr[FilterType.N_COOKIE.ordinal()] = 25;
        } catch (NoSuchFieldError e56) {
        }
        try {
            iArr[FilterType.N_DELICACY.ordinal()] = 26;
        } catch (NoSuchFieldError e57) {
        }
        try {
            iArr[FilterType.N_FADE.ordinal()] = 63;
        } catch (NoSuchFieldError e58) {
        }
        try {
            iArr[FilterType.N_FILM.ordinal()] = 27;
        } catch (NoSuchFieldError e59) {
        }
        try {
            iArr[FilterType.N_KOIZORA.ordinal()] = 28;
        } catch (NoSuchFieldError e60) {
        }
        try {
            iArr[FilterType.N_LATTE.ordinal()] = 64;
        } catch (NoSuchFieldError e61) {
        }
        try {
            iArr[FilterType.N_LIGHT.ordinal()] = 65;
        } catch (NoSuchFieldError e62) {
        }
        try {
            iArr[FilterType.N_LIVELY.ordinal()] = 29;
        } catch (NoSuchFieldError e63) {
        }
        try {
            iArr[FilterType.N_QUIET.ordinal()] = 30;
        } catch (NoSuchFieldError e64) {
        }
        try {
            iArr[FilterType.N_SODA.ordinal()] = 31;
        } catch (NoSuchFieldError e65) {
        }
        try {
            iArr[FilterType.N_WARM.ordinal()] = 66;
        } catch (NoSuchFieldError e66) {
        }
        try {
            iArr[FilterType.N_WHITEANDBLACK.ordinal()] = 67;
        } catch (NoSuchFieldError e67) {
        }
        try {
            iArr[FilterType.S_BYGONE.ordinal()] = 68;
        } catch (NoSuchFieldError e68) {
        }
        try {
            iArr[FilterType.S_FILM.ordinal()] = 69;
        } catch (NoSuchFieldError e69) {
        }
        try {
            iArr[FilterType.S_FOREST.ordinal()] = 70;
        } catch (NoSuchFieldError e70) {
        }
        try {
            iArr[FilterType.S_POLAROID.ordinal()] = 71;
        } catch (NoSuchFieldError e71) {
        }
        try {
            iArr[FilterType.S_WHITEANDBLACK.ordinal()] = 72;
        } catch (NoSuchFieldError e72) {
        }
        try {
            iArr[FilterType.S_YEARS.ordinal()] = 73;
        } catch (NoSuchFieldError e73) {
        }
        f6-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues = iArr;
        return iArr;
    }

    public static ArrayList<FilterInfo> initBeautyFilterInfo() {
        ArrayList<FilterInfo> filters = new ArrayList();
        int order = 0;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portait_effect_image_none, 0));
        int nameResId = 0;
        int iconResId = 0;
        for (FilterType type : FilterFactory.getFiltersByScene(FilterScene.BEAUTY)) {
            switch (m5-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[type.ordinal()]) {
                case R.styleable.ToggleSwitch_textSize /*12*/:
                    order = 50;
                    nameResId = R.string.portait_effect_entry_fairytale;
                    iconResId = R.drawable.portait_effect_image_fairytale;
                    break;
                case R.styleable.ToggleSwitch_textOffShadowRadius /*13*/:
                    order = 20;
                    nameResId = R.string.portait_effect_entry_japanese;
                    iconResId = R.drawable.portait_effect_image_japanese;
                    break;
                case R.styleable.ToggleSwitch_duration /*14*/:
                    order = 80;
                    nameResId = R.string.portait_effect_entry_maze;
                    iconResId = R.drawable.portait_effect_image_maze;
                    break;
                case R.styleable.ToggleSwitch_checked /*15*/:
                    order = 90;
                    nameResId = R.string.portait_effect_entry_cool;
                    iconResId = R.drawable.portait_effect_image_cool;
                    break;
                case 16:
                    order = 60;
                    nameResId = R.string.portait_effect_entry_mood;
                    iconResId = R.drawable.portait_effect_image_mood;
                    break;
                case 17:
                    order = 110;
                    nameResId = R.string.portait_effect_entry_movie;
                    iconResId = R.drawable.portait_effect_image_movie;
                    break;
                case 18:
                    order = 10;
                    nameResId = R.string.portait_effect_entry_nature;
                    iconResId = R.drawable.portait_effect_image_nature;
                    break;
                case 19:
                    order = 30;
                    nameResId = R.string.portait_effect_entry_pink;
                    iconResId = R.drawable.portait_effect_image_pink;
                    break;
                case 20:
                    order = 100;
                    nameResId = R.string.portait_effect_entry_riddle;
                    iconResId = R.drawable.portait_effect_image_riddle;
                    break;
                case 21:
                    order = 70;
                    nameResId = R.string.portait_effect_entry_romance;
                    iconResId = R.drawable.portait_effect_image_romance;
                    break;
                case 22:
                    order = 40;
                    nameResId = R.string.portait_effect_entry_story;
                    iconResId = R.drawable.portait_effect_image_story;
                    break;
                case 23:
                    order = 120;
                    nameResId = R.string.portait_effect_entry_blackwhite;
                    iconResId = R.drawable.portait_effect_image_blackwhite;
                    break;
            }
            if (!(nameResId == 0 || iconResId == 0)) {
                filters.add(new FilterInfo(2, type.ordinal(), nameResId, iconResId, order));
                nameResId = 0;
                iconResId = 0;
            }
        }
        Collections.sort(filters);
        return filters;
    }

    public static ArrayList<FilterInfo> initIndiaBeautyFilterInfo() {
        ArrayList<FilterInfo> filters = new ArrayList();
        int order = 0;
        filters.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portrait_india_effect_image_none, 0));
        int nameResId = 0;
        int iconResId = 0;
        for (FilterType type : FilterFactory.getFiltersByScene(FilterScene.BEAUTY_INDIA)) {
            switch (m5-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[type.ordinal()]) {
                case 1:
                    order = 30;
                    nameResId = R.string.portrait_india_effect_entry_memory;
                    iconResId = R.drawable.portrait_india_effect_image_memory;
                    break;
                case 2:
                    order = 110;
                    nameResId = R.string.portrait_india_effect_entry_mono;
                    iconResId = R.drawable.portrait_india_effect_image_mono;
                    break;
                case 3:
                    order = 20;
                    nameResId = R.string.portrait_india_effect_entry_pink;
                    iconResId = R.drawable.portrait_india_effect_image_pink;
                    break;
                case 4:
                    order = 70;
                    nameResId = R.string.portrait_india_effect_entry_portrait;
                    iconResId = R.drawable.portrait_india_effect_image_portrait;
                    break;
                case 5:
                    order = 80;
                    nameResId = R.string.portrait_india_effect_entry_retro;
                    iconResId = R.drawable.portrait_india_effect_image_retro;
                    break;
                case 6:
                    order = 100;
                    nameResId = R.string.portrait_india_effect_entry_romantic;
                    iconResId = R.drawable.portrait_india_effect_image_romantic;
                    break;
                case 7:
                    order = 40;
                    nameResId = R.string.portrait_india_effect_entry_strong;
                    iconResId = R.drawable.portrait_india_effect_image_strong;
                    break;
                case 8:
                    order = 10;
                    nameResId = R.string.portrait_india_effect_entry_sunny;
                    iconResId = R.drawable.portrait_india_effect_image_sunny;
                    break;
                case R.styleable.ToggleSwitch_textOff /*9*/:
                    order = 60;
                    nameResId = R.string.portrait_india_effect_entry_sweet;
                    iconResId = R.drawable.portrait_india_effect_image_sweet;
                    break;
                case R.styleable.ToggleSwitch_textOffColor /*10*/:
                    order = 50;
                    nameResId = R.string.portrait_india_effect_entry_warm;
                    iconResId = R.drawable.portrait_india_effect_image_warm;
                    break;
                case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                    order = 90;
                    nameResId = R.string.portrait_india_effect_entry_young;
                    iconResId = R.drawable.portrait_india_effect_image_young;
                    break;
            }
            if (!(nameResId == 0 || iconResId == 0)) {
                filters.add(new FilterInfo(2, type.ordinal(), nameResId, iconResId, order));
                nameResId = 0;
                iconResId = 0;
            }
        }
        Collections.sort(filters);
        return filters;
    }
}
