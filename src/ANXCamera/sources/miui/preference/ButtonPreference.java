package miui.preference;

import android.content.Context;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.miui.internal.R;

public class ButtonPreference extends Preference {
    private OnPreferenceClickListener iY;
    private String iZ;

    public ButtonPreference(Context context) {
        this(context, null);
    }

    public ButtonPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public ButtonPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.buttonPreferenceStyle);
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        view.setBackground(null);
        Button button = (Button) view.findViewById(16908313);
        if (button != null) {
            button.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (ButtonPreference.this.iY != null) {
                        ButtonPreference.this.iY.onPreferenceClick(ButtonPreference.this);
                    }
                }
            });
            button.setText(this.iZ);
        }
    }

    public void setOnPreferenceClickListener(OnPreferenceClickListener onPreferenceClickListener) {
        this.iY = onPreferenceClickListener;
    }

    public void setText(String str) {
        this.iZ = str;
        notifyChanged();
    }

    public void setText(int i) {
        setText(getContext().getString(i));
    }
}
