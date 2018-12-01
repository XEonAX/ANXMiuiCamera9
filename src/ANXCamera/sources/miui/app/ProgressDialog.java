package miui.app;

import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.miui.internal.R;
import java.text.NumberFormat;

public class ProgressDialog extends AlertDialog {
    public static final int STYLE_HORIZONTAL = 1;
    public static final int STYLE_SPINNER = 0;
    private boolean DV;
    private int DW;
    private int DX;
    private boolean DY;
    private Drawable DZ;
    private int Ea;
    private CharSequence Eb;
    private TextView Ec;
    private ProgressBar Ed;
    private Drawable Ee;
    private String Ef;
    private NumberFormat Eg;
    private int Eh = 0;
    private int Ei;
    private int Ej;
    private Handler Ek;

    public ProgressDialog(Context context) {
        super(context);
        pq();
    }

    public ProgressDialog(Context context, int i) {
        super(context, i);
        pq();
    }

    private void pq() {
        this.Ef = "%1d/%2d";
        this.Eg = NumberFormat.getPercentInstance();
        this.Eg.setMaximumFractionDigits(0);
    }

    public static ProgressDialog show(Context context, CharSequence charSequence, CharSequence charSequence2) {
        return show(context, charSequence, charSequence2, false);
    }

    public static ProgressDialog show(Context context, CharSequence charSequence, CharSequence charSequence2, boolean z) {
        return show(context, charSequence, charSequence2, z, false, null);
    }

    public static ProgressDialog show(Context context, CharSequence charSequence, CharSequence charSequence2, boolean z, boolean z2) {
        return show(context, charSequence, charSequence2, z, z2, null);
    }

    public static ProgressDialog show(Context context, CharSequence charSequence, CharSequence charSequence2, boolean z, boolean z2, OnCancelListener onCancelListener) {
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setTitle(charSequence);
        progressDialog.setMessage(charSequence2);
        progressDialog.setIndeterminate(z);
        progressDialog.setCancelable(z2);
        progressDialog.setOnCancelListener(onCancelListener);
        progressDialog.show();
        return progressDialog;
    }

    protected void onCreate(Bundle bundle) {
        View inflate;
        LayoutInflater from = LayoutInflater.from(getContext());
        TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(null, R.styleable.AlertDialog, 16842845, 0);
        if (this.Eh == 1) {
            this.Ek = new Handler() {
                public void handleMessage(Message message) {
                    super.handleMessage(message);
                    int progress = ProgressDialog.this.Ed.getProgress();
                    int max = ProgressDialog.this.Ed.getMax();
                    if (ProgressDialog.this.Eg != null) {
                        double d = ((double) progress) / ((double) max);
                        progress = 0;
                        CharSequence spannableStringBuilder = new SpannableStringBuilder();
                        if (!TextUtils.isEmpty(ProgressDialog.this.Eb)) {
                            progress = ProgressDialog.this.Eb.length();
                            spannableStringBuilder.append(ProgressDialog.this.Eb);
                        }
                        Object format = ProgressDialog.this.Eg.format(d);
                        spannableStringBuilder.append(format);
                        spannableStringBuilder.setSpan(new ForegroundColorSpan(ProgressDialog.this.getContext().getResources().getColor(R.color.progress_percent_color)), progress, format.length() + progress, 34);
                        ProgressDialog.this.Ec.setText(spannableStringBuilder);
                    }
                }
            };
            inflate = from.inflate(obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_horizontalProgressLayout, R.layout.alert_dialog_progress), null);
        } else {
            inflate = from.inflate(obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_progressLayout, R.layout.progress_dialog), null);
        }
        this.Ed = (ProgressBar) inflate.findViewById(16908301);
        this.Ec = (TextView) inflate.findViewById(miui.R.id.message);
        setView(inflate);
        obtainStyledAttributes.recycle();
        if (this.Ea > 0) {
            setMax(this.Ea);
        }
        if (this.Ei > 0) {
            setProgress(this.Ei);
        }
        if (this.Ej > 0) {
            setSecondaryProgress(this.Ej);
        }
        if (this.DW > 0) {
            incrementProgressBy(this.DW);
        }
        if (this.DX > 0) {
            incrementSecondaryProgressBy(this.DX);
        }
        if (this.Ee != null) {
            setProgressDrawable(this.Ee);
        }
        if (this.DZ != null) {
            setIndeterminateDrawable(this.DZ);
        }
        if (this.Eb != null) {
            setMessage(this.Eb);
        }
        setIndeterminate(this.DY);
        onProgressChanged();
        super.onCreate(bundle);
    }

    public void onStart() {
        super.onStart();
        this.DV = true;
    }

    protected void onStop() {
        super.onStop();
        this.DV = false;
    }

    public void setProgress(int i) {
        if (this.DV) {
            this.Ed.setProgress(i);
            onProgressChanged();
            return;
        }
        this.Ei = i;
    }

    public void setSecondaryProgress(int i) {
        if (this.Ed != null) {
            this.Ed.setSecondaryProgress(i);
            onProgressChanged();
            return;
        }
        this.Ej = i;
    }

    public int getProgress() {
        if (this.Ed != null) {
            return this.Ed.getProgress();
        }
        return this.Ei;
    }

    public int getSecondaryProgress() {
        if (this.Ed != null) {
            return this.Ed.getSecondaryProgress();
        }
        return this.Ej;
    }

    public int getMax() {
        if (this.Ed != null) {
            return this.Ed.getMax();
        }
        return this.Ea;
    }

    public void setMax(int i) {
        if (this.Ed != null) {
            this.Ed.setMax(i);
            onProgressChanged();
            return;
        }
        this.Ea = i;
    }

    public void incrementProgressBy(int i) {
        if (this.Ed != null) {
            this.Ed.incrementProgressBy(i);
            onProgressChanged();
            return;
        }
        this.DW += i;
    }

    public void incrementSecondaryProgressBy(int i) {
        if (this.Ed != null) {
            this.Ed.incrementSecondaryProgressBy(i);
            onProgressChanged();
            return;
        }
        this.DX += i;
    }

    public void setProgressDrawable(Drawable drawable) {
        if (this.Ed != null) {
            this.Ed.setProgressDrawable(drawable);
        } else {
            this.Ee = drawable;
        }
    }

    public void setIndeterminateDrawable(Drawable drawable) {
        if (this.Ed != null) {
            this.Ed.setIndeterminateDrawable(drawable);
        } else {
            this.DZ = drawable;
        }
    }

    public void setIndeterminate(boolean z) {
        if (this.Ed != null) {
            this.Ed.setIndeterminate(z);
        } else {
            this.DY = z;
        }
    }

    public boolean isIndeterminate() {
        if (this.Ed != null) {
            return this.Ed.isIndeterminate();
        }
        return this.DY;
    }

    public void setMessage(CharSequence charSequence) {
        if (this.Ed != null) {
            if (this.Eh == 1) {
                this.Eb = charSequence;
            }
            this.Ec.setText(charSequence);
            return;
        }
        this.Eb = charSequence;
    }

    public void setProgressStyle(int i) {
        this.Eh = i;
    }

    public void setProgressNumberFormat(String str) {
        this.Ef = str;
        onProgressChanged();
    }

    public void setProgressPercentFormat(NumberFormat numberFormat) {
        this.Eg = numberFormat;
        onProgressChanged();
    }

    private void onProgressChanged() {
        if (this.Eh == 1 && this.Ek != null && (this.Ek.hasMessages(0) ^ 1) != 0) {
            this.Ek.sendEmptyMessage(0);
        }
    }
}
