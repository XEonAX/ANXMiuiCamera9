package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import java.util.ArrayList;
import java.util.List;

public class LegacyBeautyLevelFragment extends BeautyLevelFragment {
    protected List<LevelItem> initItems() {
        List<LevelItem> items = new ArrayList();
        items.add(new LevelItem(R.drawable.ff));
        items.add(new LevelItem(R.drawable.f1));
        items.add(new LevelItem(R.drawable.f2));
        items.add(new LevelItem(R.drawable.f3));
        return items;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.legacy_beauty_level_item_margin);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                LegacyBeautyLevelFragment.this.setBeautyLevel(position);
            }
        };
    }

    protected int beautyLevelToPosition(int beautyLevel, int maxPosition) {
        return Util.clamp(beautyLevel, 0, maxPosition);
    }
}
