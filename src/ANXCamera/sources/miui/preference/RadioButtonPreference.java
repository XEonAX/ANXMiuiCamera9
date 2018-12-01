package miui.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CheckedTextView;
import com.miui.internal.R;

public class RadioButtonPreference extends CheckBoxPreference {
    public RadioButtonPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.RadioButtonPreference, i, 0);
        int resourceId = obtainStyledAttributes.getResourceId(R.styleable.RadioButtonPreference_android_layout, R.layout.preference_radiobutton);
        int resourceId2 = obtainStyledAttributes.getResourceId(R.styleable.RadioButtonPreference_android_widgetLayout, 0);
        obtainStyledAttributes.recycle();
        if (getLayoutResource() != resourceId) {
            setLayoutResource(R.layout.preference_radiobutton);
        }
        if (getWidgetLayoutResource() != resourceId2) {
            setWidgetLayoutResource(0);
        }
    }

    public RadioButtonPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, miui.R.attr.radioButtonPreferenceStyle);
    }

    public RadioButtonPreference(Context context) {
        this(context, null);
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        View findViewById = view.findViewById(16908310);
        if (findViewById != null && (findViewById instanceof CheckedTextView)) {
            ((CheckedTextView) findViewById).setCheckMarkDrawable(0);
            ((CheckedTextView) findViewById).setChecked(isChecked());
        }
        View findViewById2 = view.findViewById(16908289);
        if (findViewById2 != null) {
            findViewById2.setImportantForAccessibility(2);
        }
    }
}
