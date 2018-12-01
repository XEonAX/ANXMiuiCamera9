package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.R;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$MakeupProtocol;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class RemodelingParamsFragment extends MakeupParamsFragment {
    private static final HashMap<Type, MakeupItem> MAKEUP_ITEM_MAP = new HashMap();
    private List<Type> mBeautyTypes;

    static {
        MAKEUP_ITEM_MAP.put(Type.SHRINK_FACE_RATIO, new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender));
        MAKEUP_ITEM_MAP.put(Type.ENLARGE_EYE_RATIO, new MakeupItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large));
        MAKEUP_ITEM_MAP.put(Type.NOSE_RATIO, new MakeupItem(R.drawable.icon_nose_n, R.string.edit_nose));
        MAKEUP_ITEM_MAP.put(Type.RISORIUS_RATIO, new MakeupItem(R.drawable.icon_risorius_n, R.string.edit_risorius));
        MAKEUP_ITEM_MAP.put(Type.LIPS_RATIO, new MakeupItem(R.drawable.icon_lips_n, R.string.edit_lips));
        MAKEUP_ITEM_MAP.put(Type.CHIN_RATIO, new MakeupItem(R.drawable.icon_chin_n, R.string.edit_chin));
        MAKEUP_ITEM_MAP.put(Type.NECK_RATIO, new MakeupItem(R.drawable.icon_neck_n, R.string.edit_neck));
        MAKEUP_ITEM_MAP.put(Type.SMILE_RATIO, new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_smile));
        MAKEUP_ITEM_MAP.put(Type.SLIM_NOSE_RATIO, new MakeupItem(R.drawable.icon_slim_nose_n, R.string.edit_slim_nose));
    }

    protected List<MakeupItem> initItems() {
        this.mBeautyTypes = new ArrayList();
        List<MakeupItem> items = new ArrayList();
        for (Type type : BeautyParameters.getInstance().getAdjustableTypes()) {
            if (MAKEUP_ITEM_MAP.containsKey(type)) {
                items.add((MakeupItem) MAKEUP_ITEM_MAP.get(type));
                this.mBeautyTypes.add(type);
            }
        }
        return items;
    }

    protected int provideItemHorizontalMargin() {
        if (this.mBeautyTypes.size() > 4) {
            return getResources().getDimensionPixelSize(R.dimen.beautycamera_remodeling_radiogroup_item_margin_horizontal);
        }
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_radiogroup_item_margin_horizontal);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                RemodelingParamsFragment.this.mSelectedParam = position;
                BeautyParameters.getInstance().setType((Type) RemodelingParamsFragment.this.mBeautyTypes.get(position));
                ((ModeProtocol$MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180)).onMakeupItemSelected();
            }
        };
    }

    protected int beautyTypetoPosition(Type type) {
        return this.mBeautyTypes.indexOf(type);
    }
}
