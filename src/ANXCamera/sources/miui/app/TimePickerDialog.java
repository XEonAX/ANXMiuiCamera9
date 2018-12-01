package miui.app;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import com.miui.internal.R;
import miui.widget.TimePicker;

public class TimePickerDialog extends AlertDialog {
    private static final String Eu = "miui:hour";
    private static final String Ev = "miui:is24hour";
    private static final String Ew = "miui:minute";
    boolean EA;
    private final TimePicker EB;
    private final OnTimeSetListener Ex;
    int Ey;
    int Ez;

    public interface OnTimeSetListener {
        void onTimeSet(TimePicker timePicker, int i, int i2);
    }

    public TimePickerDialog(Context context, OnTimeSetListener onTimeSetListener, int i, int i2, boolean z) {
        this(context, 0, onTimeSetListener, i, i2, z);
    }

    public TimePickerDialog(Context context, int i, OnTimeSetListener onTimeSetListener, int i2, int i3, boolean z) {
        super(context, i);
        this.Ex = onTimeSetListener;
        this.Ey = i2;
        this.Ez = i3;
        this.EA = z;
        setIcon(0);
        setTitle(R.string.time_picker_dialog_title);
        Context context2 = getContext();
        setButton(-1, context2.getText(17039370), new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                TimePickerDialog.this.pA();
            }
        });
        setButton(-2, getContext().getText(17039360), (OnClickListener) null);
        View inflate = ((LayoutInflater) context2.getSystemService("layout_inflater")).inflate(R.layout.time_picker_dialog, null);
        setView(inflate);
        this.EB = (TimePicker) inflate.findViewById(R.id.timePicker);
        this.EB.setIs24HourView(Boolean.valueOf(this.EA));
        this.EB.setCurrentHour(Integer.valueOf(this.Ey));
        this.EB.setCurrentMinute(Integer.valueOf(this.Ez));
        this.EB.setOnTimeChangedListener(null);
    }

    public void updateTime(int i, int i2) {
        this.EB.setCurrentHour(Integer.valueOf(i));
        this.EB.setCurrentMinute(Integer.valueOf(i2));
    }

    private void pA() {
        if (this.Ex != null) {
            this.EB.clearFocus();
            this.Ex.onTimeSet(this.EB, this.EB.getCurrentHour().intValue(), this.EB.getCurrentMinute().intValue());
        }
    }

    public Bundle onSaveInstanceState() {
        Bundle onSaveInstanceState = super.onSaveInstanceState();
        onSaveInstanceState.putInt(Eu, this.EB.getCurrentHour().intValue());
        onSaveInstanceState.putInt(Ew, this.EB.getCurrentMinute().intValue());
        onSaveInstanceState.putBoolean(Ev, this.EB.is24HourView());
        return onSaveInstanceState;
    }

    public void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        int i = bundle.getInt(Eu);
        int i2 = bundle.getInt(Ew);
        this.EB.setIs24HourView(Boolean.valueOf(bundle.getBoolean(Ev)));
        this.EB.setCurrentHour(Integer.valueOf(i));
        this.EB.setCurrentMinute(Integer.valueOf(i2));
    }
}
