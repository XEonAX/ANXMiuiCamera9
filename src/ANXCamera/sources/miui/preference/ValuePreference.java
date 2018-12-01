package miui.preference;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import miui.R;

public class ValuePreference extends Preference {
    private Drawable it;
    private boolean iu;
    private CharSequence iv;
    private int iw;

    public ValuePreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public ValuePreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.valuePreferenceStyle);
    }

    public ValuePreference(Context context) {
        this(context, null);
    }

    public void setValue(String str) {
        if (!TextUtils.equals(str, this.iv)) {
            this.iw = 0;
            this.iv = str;
            notifyChanged();
        }
    }

    public void setValue(int i) {
        setValue(getContext().getString(i));
        this.iw = i;
    }

    public int getValueRes() {
        return this.iw;
    }

    public CharSequence getValue() {
        return this.iv;
    }

    public boolean isShowRightArrow() {
        return this.iu;
    }

    public void setShowRightArrow(boolean z) {
        this.iu = z;
    }

    public void setRightArrowRes(int i) {
        setRightArrowDrawable(getContext().getResources().getDrawable(i));
    }

    public void setRightArrowDrawable(Drawable drawable) {
        if ((drawable == null && this.it != null) || (drawable != null && this.it != drawable)) {
            this.it = drawable;
            setShowRightArrow(drawable != null);
            notifyChanged();
        }
    }

    public Drawable getRightArrowDrawable() {
        return this.it;
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        TextView textView = (TextView) view.findViewById(R.id.value_right);
        if (textView != null) {
            CharSequence value = getValue();
            if (TextUtils.isEmpty(value)) {
                textView.setVisibility(8);
            } else {
                textView.setText(value);
                textView.setVisibility(0);
            }
        }
        ImageView imageView = (ImageView) view.findViewById(com.miui.internal.R.id.arrow_right);
        if (imageView != null) {
            int i;
            if (this.iu) {
                i = 0;
            } else {
                i = 8;
            }
            imageView.setVisibility(i);
            if (this.iu) {
                imageView.setVisibility(0);
                if (this.it != null) {
                    imageView.setImageDrawable(this.it);
                    return;
                } else {
                    this.it = imageView.getDrawable();
                    return;
                }
            }
            imageView.setVisibility(8);
        }
    }
}
