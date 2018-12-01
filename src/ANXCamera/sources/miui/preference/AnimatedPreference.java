package miui.preference;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.miui.internal.R;
import miui.widget.AnimatedImageView;

public class AnimatedPreference extends CheckBoxPreference {
    private static final int ja = 4;
    private static final int jb = 0;
    private static final int jc = 1;
    private static final int jd = 2;
    private Drawable je;
    private Drawable jf;
    private int jg;

    public AnimatedPreference(Context context) {
        this(context, null);
    }

    public AnimatedPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.jg = 0;
        setWidgetLayoutResource(R.layout.preference_widget_animated);
    }

    public AnimatedPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.jg = 0;
        setWidgetLayoutResource(R.layout.preference_widget_animated);
    }

    public void onBindView(View view) {
        int i = 0;
        super.onBindView(view);
        AnimatedImageView animatedImageView = (AnimatedImageView) view.findViewById(R.id.animate);
        ImageView imageView = (ImageView) view.findViewById(R.id.animate_finish);
        if (this.je != null) {
            animatedImageView.setImageDrawable(this.je);
        }
        if (this.jf != null) {
            imageView.setImageDrawable(this.jf);
        }
        animatedImageView.setVisibility(isAnimateVisible() ? 0 : 8);
        animatedImageView.setAnimating(isAnimating());
        if (!isAnimateFinish()) {
            i = 8;
        }
        imageView.setVisibility(i);
        ((ImageView) view.findViewById(16908294)).setAlpha(isEnabled() ? 1.0f : 0.3f);
    }

    public void setAnimateVisible(boolean z) {
        eH(1, z);
    }

    public boolean isAnimateVisible() {
        return (this.jg & 1) != 0;
    }

    public void setAnimating(boolean z) {
        eH(3, z);
    }

    public boolean isAnimating() {
        return (this.jg & 2) != 0;
    }

    public void setAnimateFinish(boolean z) {
        eH(4, z);
    }

    public boolean isAnimateFinish() {
        return (this.jg & 4) != 0;
    }

    public void setAnimateDrawable(Drawable drawable) {
        this.je = drawable;
        notifyChanged();
    }

    public void setAnimateDrawable(int i) {
        setAnimateDrawable(getContext().getResources().getDrawable(i));
    }

    public void setAnimateFinishDrawable(Drawable drawable) {
        this.jf = drawable;
        notifyChanged();
    }

    public void setAnimateFinishDrawable(int i) {
        setAnimateFinishDrawable(getContext().getResources().getDrawable(i));
    }

    private void eH(int i, boolean z) {
        if (z) {
            this.jg |= i;
        } else {
            this.jg &= ~i;
        }
        notifyChanged();
    }
}
