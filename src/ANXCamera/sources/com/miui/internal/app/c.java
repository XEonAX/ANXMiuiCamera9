package com.miui.internal.app;

import android.app.Fragment;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import miui.app.ActionBar.FragmentViewPagerChangeListener;
import miui.util.ViewUtils;
import miui.view.ViewPager;

class c implements FragmentViewPagerChangeListener {
    int afL = -1;
    boolean afM = true;
    int afN = -1;
    ViewGroup afO = null;
    b afP;
    int afQ = -1;
    ViewPager afR;
    ArrayList<View> afS = new ArrayList();
    Rect afT = new Rect();

    public c(ViewPager viewPager, b bVar) {
        this.afR = viewPager;
        this.afP = bVar;
    }

    public void onPageScrolled(int i, float f, boolean z, boolean z2) {
        boolean z3 = true;
        if (f == 0.0f) {
            this.afL = i;
            this.afM = true;
            if (this.afO != null) {
                AE(this.afO);
            }
        }
        if (this.afQ != i) {
            if (this.afL < i) {
                this.afL = i;
            } else if (this.afL > i + 1) {
                this.afL = i + 1;
            }
            this.afQ = i;
            this.afM = true;
            if (this.afO != null) {
                AE(this.afO);
            }
        }
        if (f > 0.0f) {
            float f2;
            if (this.afM) {
                this.afM = false;
                if (this.afL != i || i >= this.afP.getCount() - 1) {
                    this.afN = i;
                } else {
                    this.afN = i + 1;
                }
                Fragment Ax = this.afP.Ax(this.afN, false);
                this.afO = null;
                if (!(Ax == null || Ax.getView() == null)) {
                    View findViewById = Ax.getView().findViewById(16908298);
                    if (findViewById instanceof ViewGroup) {
                        this.afO = (ViewGroup) findViewById;
                    }
                }
            }
            if (this.afN == i) {
                f2 = 1.0f - f;
            } else {
                f2 = f;
            }
            if (this.afO != null) {
                ViewGroup viewGroup = this.afO;
                int width = this.afO.getWidth();
                int height = this.afO.getHeight();
                if (this.afN == i) {
                    z3 = false;
                }
                AI(viewGroup, width, height, f2, z3);
            }
        }
    }

    public void onPageSelected(int i) {
    }

    public void onPageScrollStateChanged(int i) {
        if (i == 0) {
            this.afL = this.afR.getCurrentItem();
            this.afM = true;
            if (this.afO != null) {
                AE(this.afO);
            }
        }
    }

    void AH(ViewGroup viewGroup, ArrayList<View> arrayList) {
        AF(arrayList, viewGroup);
        arrayList.clear();
        ViewUtils.getContentRect(viewGroup, this.afT);
        if (!this.afT.isEmpty()) {
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = viewGroup.getChildAt(i);
                if (childAt.getVisibility() != 8 || childAt.getHeight() > 0) {
                    arrayList.add(childAt);
                }
            }
        }
    }

    void AF(ArrayList<View> arrayList, ViewGroup viewGroup) {
        for (View view : arrayList) {
            if (viewGroup.indexOfChild(view) == -1 && view.getTranslationX() != 0.0f) {
                view.setTranslationX(0.0f);
            }
        }
    }

    void AE(ViewGroup viewGroup) {
        AH(viewGroup, this.afS);
        if (!this.afS.isEmpty()) {
            for (View translationX : this.afS) {
                translationX.setTranslationX(0.0f);
            }
        }
    }

    void AI(ViewGroup viewGroup, int i, int i2, float f, boolean z) {
        int i3 = 0;
        AH(viewGroup, this.afS);
        if (!this.afS.isEmpty()) {
            int top = ((View) this.afS.get(0)).getTop();
            int i4 = Integer.MAX_VALUE;
            for (View view : this.afS) {
                if (i4 != view.getTop()) {
                    i4 = view.getTop();
                    i3 = AG(i4 - top, i, i2, f);
                    if (!z) {
                        i3 = -i3;
                    }
                }
                view.setTranslationX((float) i3);
            }
        }
    }

    int AG(int i, int i2, int i3, float f) {
        int i4;
        if (i < i3) {
            i4 = (i * i2) / i3;
        } else {
            i4 = i2;
        }
        float f2 = ((float) i4) + ((0.1f - ((f * f) / 0.9f)) * ((float) i2));
        return f2 > 0.0f ? (int) f2 : 0;
    }
}
