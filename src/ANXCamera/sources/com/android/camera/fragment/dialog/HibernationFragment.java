package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.android.camera.Camera;
import com.android.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;

public class HibernationFragment extends DialogFragment implements OnKeyListener, OnClickListener, ModeProtocol$HandleBackTrace {
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dialog_hibernation, container, false);
        view.findViewById(R.id.hibernation_cover).setOnClickListener(this);
        adjustViewSize(view.findViewById(R.id.hibernation_layout));
        return view;
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog dialog = super.onCreateDialog(savedInstanceState);
        dialog.getWindow().setGravity(48);
        return dialog;
    }

    private void adjustViewSize(View view) {
        int screenWidth = getResources().getDisplayMetrics().widthPixels;
        int screenHeight = getResources().getDisplayMetrics().heightPixels;
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams.width != screenWidth || layoutParams.height != screenHeight) {
            layoutParams.width = screenWidth;
            layoutParams.height = screenHeight;
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
            case R.id.hibernation_cover /*2131361833*/:
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
                camera.onAwaken();
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
        if (keyCode != 4 || event.getAction() != 1) {
            return false;
        }
        onBackEvent(5);
        return true;
    }
}
