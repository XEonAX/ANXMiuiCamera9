package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;

public class LensDirtyDetectDialogFragment extends DialogFragment implements OnKeyListener, OnClickListener, ModeProtocol$HandleBackTrace {
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        int i;
        View view = inflater.inflate(R.layout.fragment_dialog_lens_dirty_detect_hint, container, false);
        view.setOnClickListener(this);
        TextView title = (TextView) view.findViewById(R.id.lens_dirty_detected_title);
        if (DataRepository.dataItemGlobal().getCurrentCameraId() == 1) {
            i = R.string.lens_dirty_detected_title_front;
        } else {
            i = R.string.lens_dirty_detected_title_back;
        }
        title.setText(i);
        adjustView(view.findViewById(R.id.lens_dirty_detected_cover));
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

    private void adjustView(View view) {
        Rect rect = Util.getDisplayRect(getContext());
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        layoutParams.topMargin = rect.top;
        layoutParams.width = rect.width();
        layoutParams.height = (rect.width() * 4) / 3;
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
        onBackEvent(5);
    }

    public boolean onBackEvent(int callingFrom) {
        dismissAllowingStateLoss();
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
