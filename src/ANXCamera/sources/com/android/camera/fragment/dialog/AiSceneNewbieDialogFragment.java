package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v7.recyclerview.R;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import com.android.camera.Camera;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.FunctionDataSetup;
import com.android.camera.module.loader.FunctionUISetup;
import com.android.camera.module.loader.NullHolder;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.statistic.ScenarioTrackUtil;

public class AiSceneNewbieDialogFragment extends DialogFragment implements OnKeyListener, OnClickListener, ModeProtocol$HandleBackTrace {
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dialog_ai_scene_hint, container, false);
        view.findViewById(R.id.ai_scene_use_hint_cover).setOnClickListener(this);
        adjustViewHeight(view.findViewById(R.id.ai_scene_use_hint_layout));
        return view;
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog dialog = super.onCreateDialog(savedInstanceState);
        Window window = dialog.getWindow();
        window.setGravity(48);
        if (Util.isNotchDevice) {
            window.addExtraFlags(1792);
        }
        return dialog;
    }

    private void adjustViewHeight(View view) {
        int newHeight = (int) (((float) getResources().getDisplayMetrics().widthPixels) / 0.75f);
        int topMargin = (Util.sWindowHeight - newHeight) - Util.getBottomHeight(getContext().getResources());
        MarginLayoutParams layoutParams = (MarginLayoutParams) view.getLayoutParams();
        if (layoutParams.height != newHeight) {
            layoutParams.height = newHeight;
            layoutParams.topMargin = topMargin;
        }
    }

    public void onResume() {
        super.onResume();
        getDialog().setOnKeyListener(this);
    }

    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).addInBackStack(this);
    }

    public void onDestroyView() {
        ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).removeBackStack(this);
        super.onDestroyView();
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.ai_scene_use_hint_cover /*2131361831*/:
                onBackEvent(5);
                return;
            default:
                return;
        }
    }

    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        resumeMode();
    }

    private void resumeMode() {
        ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).removeBackStack(this);
        if (isAdded()) {
            Camera camera = (Camera) getActivity();
            if (!camera.isActivityPaused() && !camera.isSwitchingModule()) {
                ScenarioTrackUtil.trackScenarioAbort(ScenarioTrackUtil.sLaunchTimeScenario);
                camera.resetStartTime();
                BaseModule baseModule = (BaseModule) ((Camera) getActivity()).getCurrentModule();
                baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
                baseModule.onCreate(DataRepository.dataItemGlobal().getCurrentMode(), DataRepository.dataItemGlobal().getCurrentCameraId());
                baseModule.onResume();
                baseModule.registerProtocol();
                FunctionDataSetup dataSetup = new FunctionDataSetup(163);
                FunctionUISetup uiSetup = new FunctionUISetup(163, true);
                try {
                    dataSetup.apply(NullHolder.ofNullable(baseModule));
                    uiSetup.apply(NullHolder.ofNullable(baseModule));
                } catch (Exception e) {
                    Log.e("AiSceneHint", e.getMessage());
                }
            }
        }
    }

    public boolean onBackEvent(int callingFrom) {
        dismissAllowingStateLoss();
        resumeMode();
        switch (callingFrom) {
            case 1:
            case 2:
                return true;
            default:
                return false;
        }
    }

    public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
        if (keyCode == 4 && event.getAction() == 1) {
            onBackEvent(5);
            return true;
        } else if (keyCode == 25 || keyCode == 24) {
            return true;
        } else {
            return false;
        }
    }
}
