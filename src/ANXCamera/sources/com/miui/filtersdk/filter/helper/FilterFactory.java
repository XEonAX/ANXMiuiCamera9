package com.miui.filtersdk.filter.helper;

import android.support.v7.recyclerview.R;
import android.util.Log;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter;
import com.miui.filtersdk.filter.base.ColorLookupFilter4x4;
import com.sensetime.stmobile.STCommon;
import java.util.ArrayList;
import java.util.List;

public class FilterFactory {
    private static final String TAG = FilterFactory.class.getSimpleName();

    /* renamed from: com.miui.filtersdk.filter.helper.FilterFactory$1 */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$miui$filtersdk$filter$helper$FilterType = new int[FilterType.values().length];

        static {
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A1_DOC.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A2_FLOWER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A3_FOOD.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A4_PPT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A5_SKY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A6_SUNRISE_SUNSET.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A7_CAT.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A8_DOG.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A9_GREEN_PLANTS.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A10_NIGHT.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A11_SNOW.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A12_SEA.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A13_AUTUMN.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A14_CANDLELIGHT.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A15_CAR.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A16_GRASS.ordinal()] = 16;
            } catch (NoSuchFieldError e16) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A17_MAPLE_LEAVES.ordinal()] = 17;
            } catch (NoSuchFieldError e17) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A18_SUCCULENT.ordinal()] = 18;
            } catch (NoSuchFieldError e18) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A19_BUILDING.ordinal()] = 19;
            } catch (NoSuchFieldError e19) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A20_CITY.ordinal()] = 20;
            } catch (NoSuchFieldError e20) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A21_CLOUD.ordinal()] = 21;
            } catch (NoSuchFieldError e21) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A22_OVERCAST.ordinal()] = 22;
            } catch (NoSuchFieldError e22) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A23_BACKLIGHT.ordinal()] = 23;
            } catch (NoSuchFieldError e23) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A24_SILHOUETTE.ordinal()] = 24;
            } catch (NoSuchFieldError e24) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A25_HUMAN.ordinal()] = 25;
            } catch (NoSuchFieldError e25) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A26_JEWELRY.ordinal()] = 26;
            } catch (NoSuchFieldError e26) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A27_BUDDHA.ordinal()] = 27;
            } catch (NoSuchFieldError e27) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A28_COW.ordinal()] = 28;
            } catch (NoSuchFieldError e28) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A29_CURRY.ordinal()] = 29;
            } catch (NoSuchFieldError e29) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A30_MOTORBIKE.ordinal()] = 30;
            } catch (NoSuchFieldError e30) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.A31_TEMPLE.ordinal()] = 31;
            } catch (NoSuchFieldError e31) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_BERRY.ordinal()] = 32;
            } catch (NoSuchFieldError e32) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_COOKIE.ordinal()] = 33;
            } catch (NoSuchFieldError e33) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_DELICACY.ordinal()] = 34;
            } catch (NoSuchFieldError e34) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_FADE.ordinal()] = 35;
            } catch (NoSuchFieldError e35) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_FILM.ordinal()] = 36;
            } catch (NoSuchFieldError e36) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_KOIZORA.ordinal()] = 37;
            } catch (NoSuchFieldError e37) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_LATTE.ordinal()] = 38;
            } catch (NoSuchFieldError e38) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_LIGHT.ordinal()] = 39;
            } catch (NoSuchFieldError e39) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_LIVELY.ordinal()] = 40;
            } catch (NoSuchFieldError e40) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_QUIET.ordinal()] = 41;
            } catch (NoSuchFieldError e41) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_SODA.ordinal()] = 42;
            } catch (NoSuchFieldError e42) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_WARM.ordinal()] = 43;
            } catch (NoSuchFieldError e43) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_FAIRYTALE.ordinal()] = 44;
            } catch (NoSuchFieldError e44) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_JAPANESE.ordinal()] = 45;
            } catch (NoSuchFieldError e45) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_MINT.ordinal()] = 46;
            } catch (NoSuchFieldError e46) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_MOOD.ordinal()] = 47;
            } catch (NoSuchFieldError e47) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_NATURE.ordinal()] = 48;
            } catch (NoSuchFieldError e48) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_PINK.ordinal()] = 49;
            } catch (NoSuchFieldError e49) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_ROMANCE.ordinal()] = 50;
            } catch (NoSuchFieldError e50) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_MAZE.ordinal()] = 51;
            } catch (NoSuchFieldError e51) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_WHITEANDBLACK.ordinal()] = 52;
            } catch (NoSuchFieldError e52) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_STORY.ordinal()] = 53;
            } catch (NoSuchFieldError e53) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_RIDDLE.ordinal()] = 54;
            } catch (NoSuchFieldError e54) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.B_MOVIE.ordinal()] = 55;
            } catch (NoSuchFieldError e55) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_FILM.ordinal()] = 56;
            } catch (NoSuchFieldError e56) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_YEARS.ordinal()] = 57;
            } catch (NoSuchFieldError e57) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_POLAROID.ordinal()] = 58;
            } catch (NoSuchFieldError e58) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_FOREST.ordinal()] = 59;
            } catch (NoSuchFieldError e59) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_WHITEANDBLACK.ordinal()] = 60;
            } catch (NoSuchFieldError e60) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.N_WHITEANDBLACK.ordinal()] = 61;
            } catch (NoSuchFieldError e61) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.S_BYGONE.ordinal()] = 62;
            } catch (NoSuchFieldError e62) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_SUNNY.ordinal()] = 63;
            } catch (NoSuchFieldError e63) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_PINK.ordinal()] = 64;
            } catch (NoSuchFieldError e64) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_MEMORY.ordinal()] = 65;
            } catch (NoSuchFieldError e65) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_STRONG.ordinal()] = 66;
            } catch (NoSuchFieldError e66) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_WARM.ordinal()] = 67;
            } catch (NoSuchFieldError e67) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_SWEET.ordinal()] = 68;
            } catch (NoSuchFieldError e68) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_PORTRAIT.ordinal()] = 69;
            } catch (NoSuchFieldError e69) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_RETRO.ordinal()] = 70;
            } catch (NoSuchFieldError e70) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_YOUNG.ordinal()] = 71;
            } catch (NoSuchFieldError e71) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_ROMANTIC.ordinal()] = 72;
            } catch (NoSuchFieldError e72) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$filter$helper$FilterType[FilterType.BI_MONO.ordinal()] = 73;
            } catch (NoSuchFieldError e73) {
            }
        }
    }

    public enum FilterScene {
        AI,
        NORMAL,
        BEAUTY,
        BEAUTY_INDIA,
        STICKER,
        PORTRAIT,
        NONE
    }

    public static BaseOriginalFilter getFilterByType(FilterType type) {
        Log.d(TAG, "getFilterByType: " + type + "; ordinal = " + type.ordinal());
        switch (AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[type.ordinal()]) {
            case 1:
                return new ColorLookupFilter4x4("filter/aiscene/A-DOC.png");
            case 2:
                return new ColorLookupFilter4x4("filter/aiscene/A-FLOWER.png");
            case 3:
                return new ColorLookupFilter4x4("filter/aiscene/A-FOOD.png");
            case 4:
                return new ColorLookupFilter4x4("filter/aiscene/A-PPT.png");
            case 5:
                return new ColorLookupFilter4x4("filter/aiscene/A-SKY.png");
            case 6:
                return new ColorLookupFilter4x4("filter/aiscene/A-SUNRISE_SUNSET.png");
            case 7:
                return new ColorLookupFilter4x4("filter/aiscene/A-CAT.png");
            case 8:
                return new ColorLookupFilter4x4("filter/aiscene/A-DOG.png");
            case R.styleable.ToggleSwitch_textOff /*9*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-GREEN_PLANTS.png");
            case R.styleable.ToggleSwitch_textOffColor /*10*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-NIGHT.png");
            case R.styleable.ToggleSwitch_textOffShadowColor /*11*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-SNOW.png");
            case R.styleable.ToggleSwitch_textSize /*12*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-SEA.png");
            case R.styleable.ToggleSwitch_textOffShadowRadius /*13*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-AUTUMN.png");
            case R.styleable.ToggleSwitch_duration /*14*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-CANDLELIGHT.png");
            case R.styleable.ToggleSwitch_checked /*15*/:
                return new ColorLookupFilter4x4("filter/aiscene/A-CAR.png");
            case 16:
                return new ColorLookupFilter4x4("filter/aiscene/A-GRASS.png");
            case 17:
                return new ColorLookupFilter4x4("filter/aiscene/A-MAPLE_LEAVES.png");
            case 18:
                return new ColorLookupFilter4x4("filter/aiscene/A-SUCCULENT.png");
            case 19:
                return new ColorLookupFilter4x4("filter/aiscene/A-BUILDING.png");
            case 20:
                return new ColorLookupFilter4x4("filter/aiscene/A-CITY.png");
            case 21:
                return new ColorLookupFilter4x4("filter/aiscene/A-CLOUD.png");
            case 22:
                return new ColorLookupFilter4x4("filter/aiscene/A-OVERCAST.png");
            case 23:
                return new ColorLookupFilter4x4("filter/aiscene/A-GLOBAL-NONE.png");
            case 24:
                return new ColorLookupFilter4x4("filter/aiscene/A-SILHOUETTE.png");
            case 25:
                return new ColorLookupFilter4x4("filter/aiscene/A-HUMAN.png");
            case 26:
                return new ColorLookupFilter4x4("filter/aiscene/A-JEWELRY.png");
            case 27:
                return new ColorLookupFilter4x4("filter/aiscene/A-BUDDHA.png");
            case 28:
                return new ColorLookupFilter4x4("filter/aiscene/A-COW.png");
            case 29:
                return new ColorLookupFilter4x4("filter/aiscene/A-CURRY.png");
            case 30:
                return new ColorLookupFilter4x4("filter/aiscene/A-MOTORBIKE.png");
            case 31:
                return new ColorLookupFilter4x4("filter/aiscene/A-TEMPLE.png");
            case 32:
                return new ColorLookupFilter("filter/normal/N-BERRY.png");
            case 33:
                return new ColorLookupFilter("filter/normal/N-COOKIE.png");
            case 34:
                return new ColorLookupFilter("filter/normal/N-DELICACY.png");
            case 35:
                return new ColorLookupFilter("filter/normal/N-FADE.png");
            case 36:
                return new ColorLookupFilter("filter/normal/N-FILM.png");
            case 37:
                return new ColorLookupFilter("filter/normal/N-KOIZORA.png");
            case 38:
                return new ColorLookupFilter("filter/normal/N-LATTE.png");
            case 39:
                return new ColorLookupFilter("filter/normal/N-LIGHT.png");
            case 40:
                return new ColorLookupFilter("filter/normal/N-LIVELY.png");
            case 41:
                return new ColorLookupFilter("filter/normal/N-QUIET.png");
            case 42:
                return new ColorLookupFilter("filter/normal/N-SODA.png");
            case 43:
                return new ColorLookupFilter("filter/normal/N-WARM.png");
            case 44:
                return new ColorLookupFilter("filter/beauty/B-FAIRYTALE.png");
            case 45:
                return new ColorLookupFilter("filter/beauty/B-JAPANESE.png");
            case 46:
                return new ColorLookupFilter("filter/beauty/B-MINT.png");
            case 47:
                return new ColorLookupFilter("filter/beauty/B-HEART.png");
            case 48:
                return new ColorLookupFilter("filter/beauty/B-NATURE.png");
            case 49:
                return new ColorLookupFilter("filter/beauty/B-PINK.png");
            case 50:
                return new ColorLookupFilter("filter/beauty/B-ROMANCE.png");
            case 51:
                return new ColorLookupFilter("filter/beauty/B-MAZE.png");
            case 52:
                return new ColorLookupFilter("filter/beauty/B-WHITEANDBLACK.png");
            case 53:
                return new ColorLookupFilter("filter/beauty/B-STORY.png");
            case 54:
                return new ColorLookupFilter("filter/beauty/B-RIDDLE.png");
            case 55:
                return new ColorLookupFilter("filter/beauty/B-MOVIE.png");
            case 56:
                return new ColorLookupFilter("filter/video/S-FILM.png");
            case 57:
                return new ColorLookupFilter("filter/video/S-YEARS.png");
            case 58:
                return new ColorLookupFilter("filter/video/S-POLAROID.png");
            case 59:
                return new ColorLookupFilter("filter/video/S-FOREST.png");
            case 60:
            case 61:
                return new ColorLookupFilter("filter/common/WHITEANDBLACK.png");
            case 62:
                return new ColorLookupFilter("filter/video/S-BYGONE.png");
            case 63:
                return new ColorLookupFilter("filter/beauty_india/BI-SUNNY.png");
            case STCommon.ST_MOBILE_ENABLE_FACE_DETECT /*64*/:
                return new ColorLookupFilter("filter/beauty_india/BI-PINK.png");
            case 65:
                return new ColorLookupFilter("filter/beauty_india/BI-MEMORY.png");
            case 66:
                return new ColorLookupFilter("filter/beauty_india/B-INDIA-STRONG.png");
            case 67:
                return new ColorLookupFilter("filter/beauty_india/BI-WARM.png");
            case 68:
                return new ColorLookupFilter("filter/beauty_india/BI-SWEET.png");
            case 69:
                return new ColorLookupFilter("filter/beauty_india/BI-PORTRAIT.png");
            case 70:
                return new ColorLookupFilter("filter/beauty_india/BI-RETRO.png");
            case 71:
                return new ColorLookupFilter("filter/beauty_india/BI-YOUNG.png");
            case 72:
                return new ColorLookupFilter("filter/beauty_india/B-INDIA-ROMANTIC.png");
            case 73:
                return new ColorLookupFilter("filter/beauty_india/BI-MONO.png");
            default:
                return null;
        }
    }

    public static FilterType[] getFiltersByScene(FilterScene scene) {
        List<FilterType> types = new ArrayList();
        for (FilterType filterType : FilterType.values()) {
            if (filterType.getFilterScene() == scene) {
                types.add(filterType);
            }
        }
        return (FilterType[]) types.toArray(new FilterType[types.size()]);
    }
}
