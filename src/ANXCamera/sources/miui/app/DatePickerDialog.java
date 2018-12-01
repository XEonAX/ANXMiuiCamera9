package miui.app;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import com.miui.internal.R;
import miui.date.Calendar;
import miui.date.DateUtils;
import miui.widget.DatePicker;
import miui.widget.DatePicker.OnDateChangedListener;

public class DatePickerDialog extends AlertDialog {
    private static final String EC = "miui:day";
    private static final String ED = "miui:month";
    private static final String EE = "miui:year";
    private final Calendar EF;
    private final OnDateSetListener EG;
    private final DatePicker EH;
    private OnDateChangedListener EI;
    private boolean EJ;

    public interface OnDateSetListener {
        void onDateSet(DatePicker datePicker, int i, int i2, int i3);
    }

    public DatePickerDialog(Context context, OnDateSetListener onDateSetListener, int i, int i2, int i3) {
        this(context, 0, onDateSetListener, i, i2, i3);
    }

    public DatePickerDialog(Context context, int i, OnDateSetListener onDateSetListener, int i2, int i3, int i4) {
        super(context, i);
        this.EJ = true;
        this.EI = new OnDateChangedListener() {
            public void onDateChanged(DatePicker datePicker, int i, int i2, int i3, boolean z) {
                if (DatePickerDialog.this.EJ) {
                    DatePickerDialog.this.pD(i, i2, i3);
                }
            }
        };
        this.EG = onDateSetListener;
        this.EF = new Calendar();
        Context context2 = getContext();
        setButton(-1, context2.getText(17039370), new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                DatePickerDialog.this.pC();
            }
        });
        setButton(-2, getContext().getText(17039360), (OnClickListener) null);
        setIcon(0);
        View inflate = ((LayoutInflater) context2.getSystemService("layout_inflater")).inflate(R.layout.date_picker_dialog, null);
        setView(inflate);
        this.EH = (DatePicker) inflate.findViewById(R.id.datePicker);
        this.EH.init(i2, i3, i4, this.EI);
        pD(i2, i3, i4);
    }

    public DatePicker getDatePicker() {
        return this.EH;
    }

    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        this.EJ = false;
    }

    public void setTitle(int i) {
        super.setTitle(i);
        this.EJ = false;
    }

    public void updateDate(int i, int i2, int i3) {
        this.EH.updateDate(i, i2, i3);
    }

    private void pC() {
        if (this.EG != null) {
            this.EH.clearFocus();
            this.EG.onDateSet(this.EH, this.EH.getYear(), this.EH.getMonth(), this.EH.getDayOfMonth());
        }
    }

    private void pD(int i, int i2, int i3) {
        this.EF.set(1, i);
        this.EF.set(5, i2);
        this.EF.set(9, i3);
        super.setTitle(DateUtils.formatDateTime(this.EF.getTimeInMillis(), 14208));
    }

    public Bundle onSaveInstanceState() {
        Bundle onSaveInstanceState = super.onSaveInstanceState();
        onSaveInstanceState.putInt(EE, this.EH.getYear());
        onSaveInstanceState.putInt(ED, this.EH.getMonth());
        onSaveInstanceState.putInt(EC, this.EH.getDayOfMonth());
        return onSaveInstanceState;
    }

    public void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        this.EH.init(bundle.getInt(EE), bundle.getInt(ED), bundle.getInt(EC), this.EI);
    }
}
