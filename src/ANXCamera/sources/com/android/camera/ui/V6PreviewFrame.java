package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnLayoutChangeListener;
import android.widget.RelativeLayout.LayoutParams;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.module.ModuleManager;

public class V6PreviewFrame extends V6RelativeLayout implements OnLayoutChangeListener {
    private float mAspectRatio = 1.7777778f;
    public SplitLineDrawer mReferenceGrid;

    public V6PreviewFrame(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mReferenceGrid = (SplitLineDrawer) findViewById(R.id.v6_reference_grid);
        this.mReferenceGrid.initialize(3, 3);
        this.mReferenceGrid.setBorderVisible(false, false);
        this.mReferenceGrid.setLineColor(-2130706433);
        addOnLayoutChangeListener(this);
    }

    public void setAspectRatio(float ratio) {
        if (((double) ratio) <= 0.0d) {
            throw new IllegalArgumentException();
        } else if (((double) Math.abs(this.mAspectRatio - ratio)) > 0.01d) {
            this.mAspectRatio = ratio;
        }
    }

    public void updateReferenceLineAccordSquare() {
        LayoutParams lp = (LayoutParams) this.mReferenceGrid.getLayoutParams();
        if (ModuleManager.isSquareModule()) {
            int margin = Util.sWindowWidth / 6;
            lp.topMargin = margin;
            lp.bottomMargin = margin;
        } else {
            lp.topMargin = 0;
            lp.bottomMargin = 0;
        }
        if (this.mReferenceGrid.getVisibility() == 0) {
            this.mReferenceGrid.requestLayout();
        }
    }

    public void updatePreviewGrid() {
        if (isReferenceLineEnabled() && (((ActivityBase) getContext()).getCameraIntentManager().isScanQRCodeIntent() ^ 1) != 0 && needReferenceLineMode()) {
            this.mReferenceGrid.setVisibility(0);
        } else {
            this.mReferenceGrid.setVisibility(8);
        }
    }

    public void hidePreviewGrid() {
        if (this.mReferenceGrid.getVisibility() == 0) {
            this.mReferenceGrid.setVisibility(8);
        }
    }

    private boolean needReferenceLineMode() {
        int mode = DataRepository.dataItemGlobal().getCurrentMode();
        if (mode == 163 || mode == 167 || mode == 171 || mode == 165) {
            return true;
        }
        return false;
    }

    private boolean isReferenceLineEnabled() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_referenceline_key", false);
    }

    public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        if (right - left <= bottom - top) {
            this.mAspectRatio = CameraSettings.getPreviewAspectRatio(bottom - top, right - left);
        }
    }

    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
    }
}
