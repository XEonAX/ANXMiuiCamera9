package com.miui.internal.view.menu;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import com.miui.internal.R;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.variable.Android_View_View_class.Factory;
import com.miui.internal.view.menu.ActionMenuView.LayoutParams;
import com.miui.internal.widget.ActionBarOverlayLayout;
import java.lang.reflect.Method;
import miui.util.ActionBarUtils;
import miui.util.ViewUtils;
import miui.view.animation.CubicEaseOutInterpolator;

public class PhoneActionMenuView extends ActionMenuView {
    private static final int[] PW = new int[]{16842964, R.attr.expandBackground, R.attr.splitActionBarOverlayHeight};
    private int PX;
    private Rect PY;
    private View PZ;
    private Drawable Qa;
    private Drawable Qb;
    private int Qc;
    private int Qd;
    private int Qe;
    private OverflowMenuState Qf;
    private View Qg;
    private OverflowMenuViewAnimator Qh;
    private int Qi;

    private enum OverflowMenuState {
        Collapsed,
        Expanding,
        Expanded,
        Collapsing
    }

    private class OverflowMenuViewAnimator implements AnimatorListener, OnClickListener {
        private AnimatorSet Qo;
        private AnimatorSet Qp;
        private ActionBarOverlayLayout Qq;

        /* synthetic */ OverflowMenuViewAnimator(PhoneActionMenuView phoneActionMenuView, OverflowMenuViewAnimator overflowMenuViewAnimator) {
            this();
        }

        private OverflowMenuViewAnimator() {
        }

        public void ty() {
            if (this.Qp == null) {
                this.Qq = (ActionBarOverlayLayout) ActionBarUtils.getActionBarOverlayLayout(PhoneActionMenuView.this);
                AnimatorSet animatorSet = new AnimatorSet();
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(PhoneActionMenuView.this, "Value", new float[]{1.0f, 0.0f});
                animatorSet.playTogether(new Animator[]{ofFloat, this.Qq.getContentMaskAnimator(this).show()});
                animatorSet.setDuration((long) PhoneActionMenuView.this.getResources().getInteger(17694720));
                animatorSet.setInterpolator(new CubicEaseOutInterpolator());
                animatorSet.addListener(this);
                this.Qp = animatorSet;
                animatorSet = new AnimatorSet();
                ofFloat = ObjectAnimator.ofFloat(PhoneActionMenuView.this, "Value", new float[]{0.0f, 1.0f});
                animatorSet.playTogether(new Animator[]{ofFloat, this.Qq.getContentMaskAnimator(null).hide()});
                animatorSet.setDuration((long) PhoneActionMenuView.this.getResources().getInteger(17694720));
                animatorSet.setInterpolator(new CubicEaseOutInterpolator());
                animatorSet.addListener(this);
                this.Qo = animatorSet;
                if (!DeviceHelper.FEATURE_WHOLE_ANIM) {
                    this.Qp.setDuration(0);
                    this.Qo.setDuration(0);
                }
            }
        }

        public void show() {
            ty();
            this.Qo.cancel();
            this.Qp.cancel();
            this.Qp.start();
        }

        public void hide() {
            ty();
            this.Qo.cancel();
            this.Qp.cancel();
            this.Qo.start();
        }

        public void cancel() {
            if (this.Qo != null && this.Qo.isRunning()) {
                this.Qo.cancel();
            }
            if (this.Qp != null && this.Qp.isRunning()) {
                this.Qp.cancel();
            }
        }

        public void tz() {
            Iterable iterable = null;
            if (VERSION.SDK_INT >= 26) {
                try {
                    Method declaredMethod = Class.forName("android.animation.AnimatorSet").getDeclaredMethod("reverse", new Class[0]);
                    if (this.Qp.isRunning()) {
                        declaredMethod.invoke(this.Qp, new Object[0]);
                    }
                    if (this.Qo.isRunning()) {
                        declaredMethod.invoke(this.Qo, new Object[0]);
                    }
                } catch (Throwable e) {
                    Log.e("PhoneActionMenuView", "reverse: ", e);
                }
            } else {
                if (this.Qp.isRunning()) {
                    iterable = this.Qp.getChildAnimations();
                }
                if (this.Qo.isRunning()) {
                    iterable = this.Qo.getChildAnimations();
                }
                if (r0 != null) {
                    for (Animator animator : r0) {
                        ((ValueAnimator) animator).reverse();
                    }
                }
            }
        }

        public void onAnimationStart(Animator animator) {
        }

        public void onAnimationEnd(Animator animator) {
            if (PhoneActionMenuView.this.Qg != null) {
                if (PhoneActionMenuView.this.Qg.getTranslationY() == 0.0f) {
                    PhoneActionMenuView.this.Qf = OverflowMenuState.Expanded;
                    tA(false);
                } else if (PhoneActionMenuView.this.Qg.getTranslationY() == ((float) PhoneActionMenuView.this.getMeasuredHeight())) {
                    PhoneActionMenuView.this.Qf = OverflowMenuState.Collapsed;
                    tA(true);
                    PhoneActionMenuView.this.PZ.setBackground(PhoneActionMenuView.this.Qa);
                }
            }
            PhoneActionMenuView.this.postInvalidateOnAnimation();
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationCancel(Animator animator) {
            if (PhoneActionMenuView.this.Qf == OverflowMenuState.Expanding || PhoneActionMenuView.this.Qf == OverflowMenuState.Expanded) {
                PhoneActionMenuView.this.setValue(0.0f);
                tA(false);
            } else if (PhoneActionMenuView.this.Qf == OverflowMenuState.Collapsing || PhoneActionMenuView.this.Qf == OverflowMenuState.Collapsed) {
                PhoneActionMenuView.this.setValue(1.0f);
                tA(true);
            }
            PhoneActionMenuView.this.postInvalidateOnAnimation();
        }

        private void tA(boolean z) {
            if (z) {
                this.Qq.getContentView().setImportantForAccessibility(0);
            } else {
                Factory.getInstance().get().setImportantForAccessibilityNoHideDescendants(this.Qq.getContentView());
            }
        }

        public void onClick(View view) {
            if (PhoneActionMenuView.this.Qf == OverflowMenuState.Expanded) {
                PhoneActionMenuView.this.getPresenter().hideOverflowMenu(true);
            }
        }
    }

    public PhoneActionMenuView(Context context) {
        this(context, null);
    }

    public PhoneActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.Qf = OverflowMenuState.Collapsed;
        this.Qc = 0;
        this.PX = 0;
        super.setBackground(null);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, PW);
        this.Qa = obtainStyledAttributes.getDrawable(0);
        this.Qb = obtainStyledAttributes.getDrawable(1);
        this.Qi = obtainStyledAttributes.getDimensionPixelSize(2, 0);
        obtainStyledAttributes.recycle();
        tr();
        this.PZ = new View(context);
        addView(this.PZ);
        setChildrenDrawingOrderEnabled(true);
        this.Qc = context.getResources().getDimensionPixelSize(R.dimen.action_button_max_width);
    }

    public void setBackground(Drawable drawable) {
        if (this.Qa != drawable) {
            this.Qa = drawable;
            tr();
        }
    }

    public boolean filterLeftoverView(int i) {
        int i2;
        View childAt = getChildAt(i);
        if (childAt == this.Qg || childAt == this.PZ) {
            i2 = 0;
        } else {
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            i2 = layoutParams != null ? layoutParams.isOverflowButton ^ 1 : 1;
        }
        if (i2 != 0) {
            return super.filterLeftoverView(i);
        }
        return false;
    }

    public void setOverflowMenuView(View view) {
        if (this.Qg != view) {
            if (this.Qg != null) {
                if (this.Qg.getAnimation() != null) {
                    this.Qg.clearAnimation();
                }
                removeView(this.Qg);
            }
            if (view != null) {
                addView(view);
            }
            this.Qg = view;
            tr();
        }
    }

    public boolean showOverflowMenu() {
        OverflowMenuState overflowMenuState = this.Qf;
        if (overflowMenuState == OverflowMenuState.Expanding || overflowMenuState == OverflowMenuState.Expanded || this.Qg == null) {
            return false;
        }
        this.PZ.setBackground(this.Qb);
        OverflowMenuViewAnimator ts = ts();
        if (overflowMenuState == OverflowMenuState.Collapsed) {
            this.Qf = OverflowMenuState.Expanding;
            ts.show();
        } else if (overflowMenuState == OverflowMenuState.Collapsing) {
            ts.tz();
        }
        postInvalidateOnAnimation();
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        return true;
    }

    public boolean isOverflowMenuShowing() {
        return this.Qf == OverflowMenuState.Expanding || this.Qf == OverflowMenuState.Expanded;
    }

    public boolean hideOverflowMenu() {
        OverflowMenuState overflowMenuState = this.Qf;
        if (overflowMenuState == OverflowMenuState.Collapsing || overflowMenuState == OverflowMenuState.Collapsed) {
            return false;
        }
        OverflowMenuViewAnimator ts = ts();
        if (overflowMenuState == OverflowMenuState.Expanded) {
            this.Qf = OverflowMenuState.Collapsing;
            ts.hide();
        } else if (overflowMenuState == OverflowMenuState.Expanding) {
            ts.tz();
        }
        return true;
    }

    private OverflowMenuViewAnimator ts() {
        if (this.Qh == null) {
            this.Qh = new OverflowMenuViewAnimator(this, null);
        }
        return this.Qh;
    }

    public int getCollapsedHeight() {
        if (this.Qd == 0) {
            return 0;
        }
        return (this.Qd + this.PY.top) - this.Qi;
    }

    protected void onMeasure(int i, int i2) {
        int childCount = getChildCount();
        int childCount2 = getChildCount();
        if (indexOfChild(this.Qg) != -1) {
            childCount2--;
        }
        if (indexOfChild(this.PZ) != -1) {
            childCount2--;
        }
        if (childCount == 0 || childCount2 == 0) {
            this.Qd = 0;
            setMeasuredDimension(0, 0);
            return;
        }
        this.PX = Math.min(MeasureSpec.getSize(i) / childCount2, this.Qc);
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.PX, Integer.MIN_VALUE);
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        while (i3 < childCount) {
            int i6;
            View childAt = getChildAt(i3);
            if (childAt == this.Qg || childAt == this.PZ) {
                childCount2 = i4;
                i6 = i5;
            } else {
                measureChildWithMargins(childAt, makeMeasureSpec, 0, i2, 0);
                int measuredWidth = i5 + childAt.getMeasuredWidth();
                childCount2 = Math.max(i4, childAt.getMeasuredHeight());
                i6 = measuredWidth;
            }
            i3++;
            i4 = childCount2;
            i5 = i6;
        }
        this.Qe = i5;
        this.Qd = i4;
        if (this.Qg != null) {
            measureChildWithMargins(this.Qg, i, 0, i2, 0);
            i5 = Math.max(i5, this.Qg.getMeasuredWidth());
            i4 += this.Qg.getMeasuredHeight();
            if (this.Qf == OverflowMenuState.Expanded) {
                this.Qg.setTranslationY(0.0f);
            } else if (this.Qf == OverflowMenuState.Collapsed) {
                this.Qg.setTranslationY((float) i4);
            }
        }
        if (this.Qg == null) {
            i4 += this.PY.top;
        }
        this.PZ.setBackground(this.Qf == OverflowMenuState.Collapsed ? this.Qa : this.Qb);
        setMeasuredDimension(Math.max(i5, MeasureSpec.getSize(i)), i4);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7 = i3 - i;
        int i8 = i4 - i2;
        if (this.Qg != null) {
            int measuredHeight = this.Qg.getMeasuredHeight();
            ViewUtils.layoutChildView(this, this.Qg, 0, 0, i7, measuredHeight);
            i5 = measuredHeight - this.PY.top;
        } else {
            i5 = 0;
        }
        ViewUtils.layoutChildView(this, this.PZ, 0, i5, i7, i8);
        Object obj = null;
        int i9 = 0;
        int childCount = getChildCount();
        int i10 = 0;
        while (i10 < childCount) {
            View childAt = getChildAt(i10);
            if (!(childAt == this.Qg || childAt == this.PZ)) {
                Object obj2;
                if (childAt.getMeasuredWidth() >= this.PX) {
                    obj2 = 1;
                } else {
                    obj2 = obj;
                }
                i9++;
                obj = obj2;
            }
            i10++;
            i9 = i9;
        }
        if (obj != null) {
            i6 = (i7 - (this.PX * i9)) >> 1;
        } else {
            i6 = (i7 - this.Qe) >> 1;
        }
        i10 = i6;
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt2 = getChildAt(i11);
            if (!(childAt2 == this.Qg || childAt2 == this.PZ)) {
                i6 = childAt2.getMeasuredWidth();
                if (obj != null) {
                    int i12 = (this.PX - i6) >> 1;
                    i10 += i12;
                    ViewUtils.layoutChildView(this, childAt2, i10, i5, i10 + i6, i8);
                    i10 = (i10 - i12) + this.PX;
                } else {
                    ViewUtils.layoutChildView(this, childAt2, i10, i5, i10 + i6, i8);
                    i10 += childAt2.getMeasuredWidth();
                }
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        float f;
        float y = motionEvent.getY();
        if (this.Qg == null) {
            f = 0.0f;
        } else {
            f = this.Qg.getTranslationY();
        }
        if (y <= f) {
            return super.onTouchEvent(motionEvent);
        }
        return true;
    }

    public void onPageScrolled(int i, float f, boolean z, boolean z2) {
        if (DeviceHelper.FEATURE_WHOLE_ANIM) {
            setAlpha(computeAlpha(f, z, z2));
        }
        float computeTranslationY = computeTranslationY(f, z, z2);
        for (int i2 = 0; i2 < getChildCount(); i2++) {
            View childAt = getChildAt(i2);
            if (!(childAt == this.Qg || childAt == this.PZ)) {
                childAt.setTranslationY(computeTranslationY);
            }
        }
    }

    private void tr() {
        if (this.PY == null) {
            this.PY = new Rect();
        }
        Drawable drawable = this.Qg == null ? this.Qa : this.Qb;
        if (drawable == null) {
            this.PY.setEmpty();
        } else {
            drawable.getPadding(this.PY);
        }
    }

    public void setValue(float f) {
        if (this.Qg != null) {
            this.Qg.setTranslationY(((float) getMeasuredHeight()) * f);
        }
    }

    protected int getChildDrawingOrder(int i, int i2) {
        int i3 = 0;
        int indexOfChild = indexOfChild(this.Qg);
        int indexOfChild2 = indexOfChild(this.PZ);
        if (i2 == 0) {
            if (indexOfChild != -1) {
                return indexOfChild;
            }
            if (indexOfChild2 != -1) {
                return indexOfChild2;
            }
        } else if (!(i2 != 1 || indexOfChild == -1 || indexOfChild2 == -1)) {
            return indexOfChild2;
        }
        while (i3 < i) {
            if (!(i3 == indexOfChild || i3 == indexOfChild2)) {
                int i4;
                if (i3 < indexOfChild) {
                    i4 = i3 + 1;
                } else {
                    i4 = i3;
                }
                if (i3 < indexOfChild2) {
                    i4++;
                }
                if (i4 == i2) {
                    return i3;
                }
            }
            i3++;
        }
        return super.getChildDrawingOrder(i, i2);
    }

    public boolean hasBackgroundView() {
        return getChildAt(0) == this.PZ;
    }
}
