package com.android.camera.fragment.dual;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;

public class FragmentDualStereo extends BaseFragment implements OnClickListener, OnLongClickListener, ManuallyListener, ModeProtocol$HandleBackTrace, ModeProtocol$DualController {
    public void onManuallyDataChanged(ComponentData componentData, String oldValue, String newValue, boolean isCustomValue) {
    }

    protected void initView(View v) {
    }

    protected int getLayoutResourceId() {
        return 0;
    }

    public int getFragmentInto() {
        return 4085;
    }

    public boolean onBackEvent(int callingFrom) {
        return false;
    }

    public void updateZoomValue() {
    }

    public boolean isZoomVisible() {
        return false;
    }

    public int visibleHeight() {
        return 0;
    }

    public void onClick(View v) {
    }

    public boolean onLongClick(View v) {
        return false;
    }

    public void hideZoomButton() {
    }

    public void showZoomButton() {
    }
}
