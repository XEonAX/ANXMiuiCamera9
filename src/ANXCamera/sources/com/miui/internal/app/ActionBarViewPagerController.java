package com.miui.internal.app;

import android.animation.ObjectAnimator;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import com.miui.internal.app.ActionBarImpl.TabImpl;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.widget.ActionBarContainer;
import com.miui.internal.widget.ActionBarOverlayLayout;
import java.util.ArrayList;
import miui.R;
import miui.app.ActionBar.FragmentViewPagerChangeListener;
import miui.view.ViewPager;
import miui.view.ViewPager.LayoutParams;
import miui.view.ViewPager.OnPageChangeListener;

public class ActionBarViewPagerController {
    private ActionBarImpl afp;
    private ObjectAnimator afq;
    private ActionMenuChangeAnimatorObject afr;
    private ArrayList<FragmentViewPagerChangeListener> afs;
    private b aft;
    private TabListener afu = new TabListener() {
        public void onTabUnselected(Tab tab, FragmentTransaction fragmentTransaction) {
        }

        public void onTabSelected(Tab tab, FragmentTransaction fragmentTransaction) {
            int count = ActionBarViewPagerController.this.aft.getCount();
            for (int i = 0; i < count; i++) {
                if (ActionBarViewPagerController.this.aft.getTabAt(i) == tab) {
                    ActionBarViewPagerController.this.afv.setCurrentItem(i, true);
                    return;
                }
            }
        }

        public void onTabReselected(Tab tab, FragmentTransaction fragmentTransaction) {
        }
    };
    private ViewPager afv;
    private View afw;

    class ActionMenuChangeAnimatorObject {
        private int afx;
        private boolean afy;

        ActionMenuChangeAnimatorObject() {
        }

        void At(int i, boolean z) {
            this.afx = i;
            this.afy = z;
        }

        public void setValue(float f) {
            if (ActionBarViewPagerController.this.afs != null) {
                for (FragmentViewPagerChangeListener fragmentViewPagerChangeListener : ActionBarViewPagerController.this.afs) {
                    if (fragmentViewPagerChangeListener instanceof ActionBarContainer) {
                        fragmentViewPagerChangeListener.onPageScrolled(this.afx, 1.0f - f, this.afy, this.afy ^ 1);
                    }
                }
            }
        }
    }

    ActionBarViewPagerController(ActionBarImpl actionBarImpl, FragmentManager fragmentManager, boolean z) {
        this.afp = actionBarImpl;
        ActionBarOverlayLayout zO = this.afp.zO();
        Context context = zO.getContext();
        View findViewById = zO.findViewById(R.id.view_pager);
        if (findViewById instanceof ViewPager) {
            this.afv = (ViewPager) findViewById;
        } else {
            this.afv = new ViewPager(context);
            this.afv.setId(R.id.view_pager);
            ((ViewGroup) zO.findViewById(16908290)).addView(this.afv);
        }
        this.aft = new b(context, fragmentManager, this.afv);
        this.afv.setInternalPageChangeListener(new OnPageChangeListener() {
            public void onPageScrolled(int i, float f, int i2) {
                boolean hasActionMenu;
                boolean hasActionMenu2 = ActionBarViewPagerController.this.aft.hasActionMenu(i);
                if (i + 1 < ActionBarViewPagerController.this.aft.getCount()) {
                    hasActionMenu = ActionBarViewPagerController.this.aft.hasActionMenu(i + 1);
                } else {
                    hasActionMenu = false;
                }
                if (ActionBarViewPagerController.this.afs != null) {
                    for (FragmentViewPagerChangeListener onPageScrolled : ActionBarViewPagerController.this.afs) {
                        onPageScrolled.onPageScrolled(i, f, hasActionMenu2, hasActionMenu);
                    }
                }
            }

            public void onPageSelected(int i) {
                ActionBarViewPagerController.this.afp.setSelectedNavigationItem(i);
                ActionBarViewPagerController.this.aft.setPrimaryItem(ActionBarViewPagerController.this.afv, i, ActionBarViewPagerController.this.aft.Ax(i, true));
                if (ActionBarViewPagerController.this.afs != null) {
                    for (FragmentViewPagerChangeListener onPageSelected : ActionBarViewPagerController.this.afs) {
                        onPageSelected.onPageSelected(i);
                    }
                }
            }

            public void onPageScrollStateChanged(int i) {
                if (ActionBarViewPagerController.this.afs != null) {
                    for (FragmentViewPagerChangeListener onPageScrollStateChanged : ActionBarViewPagerController.this.afs) {
                        onPageScrollStateChanged.onPageScrollStateChanged(i);
                    }
                }
            }
        });
        if (z && DeviceHelper.FEATURE_WHOLE_ANIM) {
            addOnFragmentViewPagerChangeListener(new c(this.afv, this.aft));
        }
    }

    int addFragmentTab(String str, Tab tab, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        ((TabImpl) tab).setInternalTabListener(this.afu);
        this.afp.zT(tab);
        return this.aft.Au(str, cls, bundle, tab, z);
    }

    int addFragmentTab(String str, Tab tab, int i, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        ((TabImpl) tab).setInternalTabListener(this.afu);
        this.afp.zV(tab, i);
        return this.aft.Av(str, i, cls, bundle, tab, z);
    }

    void An(int i) {
        this.aft.AC(i);
        this.afp.zZ(i);
    }

    void removeFragmentTab(String str) {
        int Aw = this.aft.Aw(str);
        if (Aw >= 0) {
            An(Aw);
        }
    }

    void removeFragmentTab(Tab tab) {
        this.afp.zY(tab);
        this.aft.AA(tab);
    }

    void removeAllFragmentTab() {
        this.afp.zX();
        this.aft.Ay();
    }

    Fragment getFragmentAt(int i) {
        return this.aft.Ax(i, true);
    }

    int getFragmentTabCount() {
        return this.aft.getCount();
    }

    void Ao(Fragment fragment) {
        int AB = this.aft.AB(fragment);
        if (AB >= 0) {
            this.afp.zZ(AB);
        }
    }

    void setFragmentActionMenuAt(int i, boolean z) {
        this.aft.setFragmentActionMenuAt(i, z);
        if (i == this.afv.getCurrentItem()) {
            if (this.afr == null) {
                int integer;
                this.afr = new ActionMenuChangeAnimatorObject();
                this.afq = ObjectAnimator.ofFloat(this.afr, "Value", new float[]{0.0f, 1.0f});
                ObjectAnimator objectAnimator = this.afq;
                if (DeviceHelper.FEATURE_WHOLE_ANIM) {
                    integer = this.afv.getContext().getResources().getInteger(17694720);
                } else {
                    integer = 0;
                }
                objectAnimator.setDuration((long) integer);
            }
            this.afr.At(i, z);
            this.afq.start();
        }
    }

    void addOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        if (this.afs == null) {
            this.afs = new ArrayList();
        }
        this.afs.add(fragmentViewPagerChangeListener);
    }

    void removeOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        if (this.afs != null) {
            this.afs.remove(fragmentViewPagerChangeListener);
        }
    }

    int getViewPagerOffscreenPageLimit() {
        return this.afv.getOffscreenPageLimit();
    }

    void setViewPagerOffscreenPageLimit(int i) {
        this.afv.setOffscreenPageLimit(i);
    }

    void setViewPagerDecor(View view) {
        if (this.afw != null) {
            this.afv.removeView(this.afw);
        }
        if (view != null) {
            this.afw = view;
            LayoutParams layoutParams = new LayoutParams();
            layoutParams.isDecor = true;
            this.afv.addView(this.afw, -1, layoutParams);
        }
    }
}
