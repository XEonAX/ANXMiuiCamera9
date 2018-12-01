package com.android.camera.fragment.beauty;

import android.support.v7.recyclerview.R;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$MakeupProtocol;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.ArrayList;
import java.util.List;

public class LegacyMakeupParamsFragment extends MakeupParamsFragment {
    /* renamed from: -com-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static final /* synthetic */ int[] f8-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = null;

    /* renamed from: -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static /* synthetic */ int[] m7xed999735() {
        if (f8-com-android-camera-effect-BeautyParameters$TypeSwitchesValues != null) {
            return f8-com-android-camera-effect-BeautyParameters$TypeSwitchesValues;
        }
        int[] iArr = new int[Type.values().length];
        try {
            iArr[Type.CHIN_RATIO.ordinal()] = 4;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Type.ENLARGE_EYE_RATIO.ordinal()] = 5;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Type.LIPS_RATIO.ordinal()] = 6;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Type.NECK_RATIO.ordinal()] = 7;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Type.NOSE_RATIO.ordinal()] = 8;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Type.RISORIUS_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Type.SHRINK_FACE_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[Type.SLIM_NOSE_RATIO.ordinal()] = 10;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[Type.SMILE_RATIO.ordinal()] = 11;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[Type.SMOOTH_STRENGTH.ordinal()] = 2;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[Type.WHITEN_STRENGTH.ordinal()] = 3;
        } catch (NoSuchFieldError e11) {
        }
        f8-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = iArr;
        return iArr;
    }

    protected List<MakeupItem> initItems() {
        List<MakeupItem> items = new ArrayList();
        items.add(new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender));
        items.add(new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white));
        items.add(new MakeupItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth));
        return items;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.legacy_makeup_radiogroup_item_margin_horizontal);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                BeautyParameterType type;
                LegacyMakeupParamsFragment.this.mSelectedParam = position;
                switch (position) {
                    case 0:
                        type = BeautyParameterType.SHRINK_FACE_RATIO;
                        break;
                    case 1:
                        type = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                    case 2:
                        type = BeautyParameterType.SMOOTH_STRENGTH;
                        break;
                    default:
                        type = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                }
                BeautyParameters.getInstance().setType(type);
                ((ModeProtocol$MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180)).onMakeupItemSelected();
            }
        };
    }

    protected int beautyTypetoPosition(Type type) {
        switch (m7xed999735()[type.ordinal()]) {
            case 1:
                return 0;
            case 2:
                return 2;
            case 3:
                return 1;
            default:
                return 0;
        }
    }
}
