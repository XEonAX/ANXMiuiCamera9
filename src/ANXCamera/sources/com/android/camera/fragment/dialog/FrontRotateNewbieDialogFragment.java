package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FrontRotateNewbieDialogFragment extends DialogFragment implements OnKeyListener, OnClickListener, ModeProtocol$HandleBackTrace {
    private AnimationDrawable mAnimationDrawable;

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.front_camera_hint_popup, container, false);
        view.findViewById(R.id.front_camera_hint_cover).setOnClickListener(this);
        this.mAnimationDrawable = (AnimationDrawable) view.findViewById(R.id.front_camera_hint_animation).getBackground();
        if (this.mAnimationDrawable != null) {
            this.mAnimationDrawable.start();
        }
        ViewCompat.setAlpha(view, 0.0f);
        ViewCompat.animate(view).alpha(1.0f).setInterpolator(new CubicEaseInOutInterpolator()).start();
        return view;
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog dialog = super.onCreateDialog(savedInstanceState);
        dialog.getWindow().setGravity(48);
        return dialog;
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
            case R.id.front_camera_hint_cover /*2131361893*/:
                onBackEvent(5);
                return;
            default:
                return;
        }
    }

    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        animateOut(400);
    }

    public boolean onBackEvent(int callingFrom) {
        animateOut(400);
        return true;
    }

    public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
        if (keyCode != 4 || event.getAction() != 1) {
            return false;
        }
        onBackEvent(5);
        return true;
    }

    public void animateOut(int duration) {
        if (this.mAnimationDrawable != null) {
            this.mAnimationDrawable.stop();
        }
        dismissAllowingStateLoss();
    }
}
