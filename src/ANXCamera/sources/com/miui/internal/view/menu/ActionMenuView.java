package com.miui.internal.view.menu;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewDebug.ExportedProperty;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Animation;
import android.view.animation.LayoutAnimationController;
import android.view.animation.TranslateAnimation;
import android.widget.LinearLayout;
import com.miui.internal.R;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.view.menu.MenuBuilder.ItemInvoker;
import miui.view.animation.CubicEaseOutInterpolator;

public abstract class ActionMenuView extends LinearLayout implements ItemInvoker, MenuView {
    private OpenCloseAnimator Ob;
    private ActionMenuPresenter Oc;
    private boolean Od;
    private MenuBuilder mMenu;

    public interface ActionMenuChildView {
        boolean needsDividerAfter();

        boolean needsDividerBefore();
    }

    public static class LayoutParams extends android.widget.LinearLayout.LayoutParams {
        @ExportedProperty
        public int cellsUsed;
        @ExportedProperty
        public boolean expandable;
        public boolean expanded;
        @ExportedProperty
        public int extraPixels;
        @ExportedProperty
        public boolean isOverflowButton;
        @ExportedProperty
        public boolean preventEdgeOffset;

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(LayoutParams layoutParams) {
            super(layoutParams);
            this.isOverflowButton = layoutParams.isOverflowButton;
        }

        public LayoutParams(int i, int i2) {
            super(i, i2);
            this.isOverflowButton = false;
        }

        public LayoutParams(int i, int i2, boolean z) {
            super(i, i2);
            this.isOverflowButton = z;
        }
    }

    class OpenCloseAnimator implements AnimatorListener {
        Animator Oe;
        Animator Of;
        boolean Og;

        public void sO(float f) {
            for (int i = 0; i < ActionMenuView.this.getChildCount(); i++) {
                ActionMenuView.this.getChildAt(i).setTranslationY(f);
            }
        }

        void initialize() {
            if (this.Oe == null) {
                this.Oe = ObjectAnimator.ofFloat(this, "TranslationY", new float[]{(float) ActionMenuView.this.getHeight()});
                this.Oe.setDuration((long) ActionMenuView.this.getResources().getInteger(17694720));
                this.Oe.addListener(this);
            }
        }

        void sN() {
            cancel();
            this.Og = true;
            sO(0.0f);
            ActionMenuView.this.startLayoutAnimation();
        }

        void close() {
            cancel();
            this.Og = false;
            this.Oe.start();
        }

        void cancel() {
            initialize();
            if (this.Of != null) {
                this.Of.cancel();
                this.Of = null;
            }
        }

        public void onAnimationStart(Animator animator) {
            this.Of = animator;
        }

        public void onAnimationEnd(Animator animator) {
            this.Of = null;
        }

        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationRepeat(Animator animator) {
        }
    }

    public abstract int getCollapsedHeight();

    public ActionMenuView(Context context) {
        this(context, null);
    }

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBaselineAligned(false);
        this.Ob = new OpenCloseAnimator();
        if (DeviceHelper.FEATURE_WHOLE_ANIM) {
            setLayoutAnimation(initLayoutAnimation());
        } else {
            setLayoutAnimation(null);
        }
    }

    protected LayoutAnimationController initLayoutAnimation() {
        Animation translateAnimation = new TranslateAnimation(0, 0.0f, 0, 0.0f, 1, 1.0f, 1, 0.0f);
        long integer = (long) getResources().getInteger(R.integer.action_menu_item_appear_duration);
        translateAnimation.setDuration(integer);
        translateAnimation.setInterpolator(new CubicEaseOutInterpolator());
        LayoutAnimationController layoutAnimationController = new LayoutAnimationController(translateAnimation, (((float) getResources().getInteger(R.integer.action_menu_item_anim_delay)) * 1.0f) / ((float) integer));
        layoutAnimationController.setAnimation(translateAnimation);
        layoutAnimationController.setOrder(0);
        return layoutAnimationController;
    }

    public void setPresenter(ActionMenuPresenter actionMenuPresenter) {
        this.Oc = actionMenuPresenter;
    }

    public ActionMenuPresenter getPresenter() {
        return this.Oc;
    }

    public void onConfigurationChanged(Configuration configuration) {
        if (VERSION.SDK_INT >= 8) {
            super.onConfigurationChanged(configuration);
        }
        if (this.Oc != null) {
            this.Oc.updateMenuView(false);
            if (this.Oc.isOverflowMenuShowing()) {
                this.Oc.hideOverflowMenu(false);
                this.Oc.showOverflowMenu();
            }
        }
    }

    protected void onMeasure(int i, int i2) {
        if (getChildCount() == 0) {
            setMeasuredDimension(0, 0);
        } else {
            super.onMeasure(i, i2);
        }
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.Oc.dismissPopupMenus(false);
    }

    public boolean isOverflowReserved() {
        return this.Od;
    }

    public void setOverflowReserved(boolean z) {
        this.Od = z;
    }

    public boolean filterLeftoverView(int i) {
        View childAt = getChildAt(i);
        childAt.clearAnimation();
        removeView(childAt);
        return true;
    }

    protected LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    protected LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof LayoutParams) {
            return new LayoutParams((LayoutParams) layoutParams);
        }
        return generateDefaultLayoutParams();
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return layoutParams != null ? layoutParams instanceof LayoutParams : false;
    }

    public LayoutParams generateOverflowButtonLayoutParams() {
        LayoutParams generateDefaultLayoutParams = generateDefaultLayoutParams();
        generateDefaultLayoutParams.isOverflowButton = true;
        return generateDefaultLayoutParams;
    }

    public boolean invokeItem(MenuItemImpl menuItemImpl) {
        return this.mMenu.performItemAction(menuItemImpl, 0);
    }

    public int getWindowAnimations() {
        return 0;
    }

    public void initialize(MenuBuilder menuBuilder) {
        this.mMenu = menuBuilder;
    }

    protected boolean hasDividerBeforeChildAt(int i) {
        boolean z = false;
        View childAt = getChildAt(i - 1);
        View childAt2 = getChildAt(i);
        if (i < getChildCount() && (childAt instanceof ActionMenuChildView)) {
            z = ((ActionMenuChildView) childAt).needsDividerAfter();
        }
        if (i <= 0) {
            return z;
        }
        if (childAt2 instanceof ActionMenuChildView) {
            return ((ActionMenuChildView) childAt2).needsDividerBefore() | z;
        }
        return z;
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    public boolean hasBackgroundView() {
        return false;
    }

    public void playOpenAnimator() {
        this.Ob.sN();
    }

    public void playCloseAnimator() {
        this.Ob.close();
    }

    protected float computeTranslationY(float f, boolean z, boolean z2) {
        float collapsedHeight = (float) getCollapsedHeight();
        if (z && z2) {
            if (((double) f) < 0.5d) {
                f *= 2.0f;
            } else {
                f = 2.0f * (1.0f - f);
            }
        } else if (z2) {
            f = 1.0f - f;
        }
        return collapsedHeight * f;
    }

    protected float computeAlpha(float f, boolean z, boolean z2) {
        if (z && z2) {
            return 1.0f;
        }
        if (z) {
            return ((float) ((int) ((1.0f - f) * 10.0f))) / 10.0f;
        }
        if (z2) {
            return ((float) ((int) (f * 10.0f))) / 10.0f;
        }
        return 1.0f;
    }

    public void onPageScrolled(int i, float f, boolean z, boolean z2) {
        if (DeviceHelper.FEATURE_WHOLE_ANIM) {
            setAlpha(computeAlpha(f, z, z2));
        }
        float computeTranslationY = computeTranslationY(f, z, z2);
        if (!(z && (z2 ^ 1) == 0 && getTranslationY() == 0.0f)) {
            setTranslationY(computeTranslationY);
        }
        this.Ob.sO(computeTranslationY);
    }
}
