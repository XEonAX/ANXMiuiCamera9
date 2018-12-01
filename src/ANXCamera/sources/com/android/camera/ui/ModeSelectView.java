package com.android.camera.ui;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import com.android.camera.Util;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.global.ComponentModuleList;
import com.sensetime.stmobile.STCommon;
import io.reactivex.Completable;
import java.util.List;

public class ModeSelectView extends LinearLayout implements OnClickListener {
    private ColorActivateTextView mLastActivateTextView;
    private onModeClickedListener mOnModeClickedListener;

    public interface onModeClickedListener {
        void onModeClicked(int i);
    }

    public ModeSelectView(Context context) {
        super(context);
        initView();
    }

    public ModeSelectView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public ModeSelectView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    public void initView() {
    }

    public void setOnModeClickedListener(onModeClickedListener onModeClickedListener) {
        this.mOnModeClickedListener = onModeClickedListener;
    }

    public void init(ComponentModuleList componentModuleList, int currentMode) {
        removeAllViews();
        List<ComponentDataItem> itemList = componentModuleList.getItems();
        for (ComponentDataItem item : itemList) {
            ColorActivateTextView textView = (ColorActivateTextView) LayoutInflater.from(getContext()).inflate(R.layout.fragment_mode_select_item, this, false);
            textView.setOnClickListener(this);
            textView.setNormalCor(-1711276033);
            int module = Integer.valueOf(item.mValue).intValue();
            textView.setActivateColor(-16733953);
            textView.setText(item.mDisplayNameRes);
            textView.setTag(Integer.valueOf(module));
            addView(textView);
        }
        if (currentMode == 168 || currentMode == 170 || currentMode == 169) {
            currentMode = 162;
        }
        for (int i = 0; i < itemList.size(); i++) {
            if (Integer.valueOf(((ComponentDataItem) itemList.get(i)).mValue).intValue() == currentMode) {
                setSelection(i, null);
                return;
            }
        }
    }

    private void setSelection(int index, List<Completable> animateInElements) {
        if (this.mLastActivateTextView != null) {
            this.mLastActivateTextView.setActivated(false);
        }
        ColorActivateTextView selectedTextView = (ColorActivateTextView) getChildAt(index);
        selectedTextView.setActivated(true);
        if (Util.isAccessible()) {
            selectedTextView.setContentDescription(selectedTextView.getText().toString() + getContext().getString(R.string.accessibility_selected));
            selectedTextView.sendAccessibilityEvent(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
        }
        this.mLastActivateTextView = selectedTextView;
        int leftWidth = 0;
        for (int i = 0; i < index; i++) {
            leftWidth += Util.getChildMeasureWidth(getChildAt(i));
        }
        int distance = (getResources().getDisplayMetrics().widthPixels / 2) - (leftWidth + (getChildMeasureWidth(selectedTextView) / 2));
        if (Util.isLayoutRTL(getContext())) {
            distance = -distance;
        }
        scrollTo(distance, animateInElements);
    }

    private static final int getChildMeasureWidth(View view) {
        MarginLayoutParams layoutParams = (MarginLayoutParams) view.getLayoutParams();
        int margin = layoutParams.leftMargin + layoutParams.rightMargin;
        int measureWidth = view.getMeasuredWidth();
        if (measureWidth > 0) {
            return measureWidth + margin;
        }
        int spec = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(spec, spec);
        return view.getMeasuredWidth() + margin;
    }

    private void scrollTo(int distance, List<Completable> animateInElements) {
        if (animateInElements == null) {
            TranslateXOnSubscribe.directSetResult(this, distance);
        } else {
            animateInElements.add(Completable.create(new TranslateXOnSubscribe(this, distance).setDurationTime(300)));
        }
    }

    public void onClick(View v) {
        if (isEnabled() && this.mOnModeClickedListener != null) {
            this.mOnModeClickedListener.onModeClicked(((Integer) v.getTag()).intValue());
        }
    }

    public void judgePosition(int actualMode, List<Completable> animateInElements) {
        if (this.mLastActivateTextView != null && ((Integer) this.mLastActivateTextView.getTag()).intValue() != actualMode) {
            if (actualMode == 168 || actualMode == 170 || actualMode == 169) {
                actualMode = 162;
            }
            for (int i = 0; i < getChildCount(); i++) {
                if (actualMode == ((Integer) getChildAt(i).getTag()).intValue()) {
                    setSelection(i, animateInElements);
                } else {
                    ColorActivateTextView selectedTextView = (ColorActivateTextView) getChildAt(i);
                    if (Util.isAccessible()) {
                        selectedTextView.setContentDescription(selectedTextView.getText().toString());
                    }
                }
            }
        }
    }
}
