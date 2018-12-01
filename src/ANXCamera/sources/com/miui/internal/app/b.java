package com.miui.internal.app;

import android.app.ActionBar.Tab;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import miui.view.PagerAdapter;
import miui.view.ViewPager;

class b extends PagerAdapter {
    private FragmentTransaction afA = null;
    private Fragment afB = null;
    private ArrayList<DynamicFragmentPagerAdapter$FragmentInfo> afC = new ArrayList();
    private FragmentManager afD;
    private Context mContext;

    public b(Context context, FragmentManager fragmentManager, ViewPager viewPager) {
        this.mContext = context;
        this.afD = fragmentManager;
        viewPager.setAdapter(this);
    }

    public void startUpdate(ViewGroup viewGroup) {
    }

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        if (this.afA == null) {
            this.afA = this.afD.beginTransaction();
        }
        this.afA.detach((Fragment) obj);
    }

    public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
        Fragment fragment = (Fragment) obj;
        if (fragment != this.afB) {
            if (this.afB != null) {
                this.afB.setMenuVisibility(false);
                this.afB.setUserVisibleHint(false);
            }
            if (fragment != null) {
                fragment.setMenuVisibility(true);
                fragment.setUserVisibleHint(true);
            }
            this.afB = fragment;
        }
    }

    public void finishUpdate(ViewGroup viewGroup) {
        if (this.afA != null) {
            this.afA.commitAllowingStateLoss();
            this.afA = null;
            this.afD.executePendingTransactions();
        }
    }

    public boolean isViewFromObject(View view, Object obj) {
        return ((Fragment) obj).getView() == view;
    }

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        if (this.afA == null) {
            this.afA = this.afD.beginTransaction();
        }
        Fragment Ax = Ax(i, true);
        if (Ax.getFragmentManager() != null) {
            this.afA.attach(Ax);
        } else {
            this.afA.add(viewGroup.getId(), Ax, ((DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i)).afJ);
        }
        if (Ax != this.afB) {
            Ax.setMenuVisibility(false);
            Ax.setUserVisibleHint(false);
        }
        return Ax;
    }

    public int getCount() {
        return this.afC.size();
    }

    public boolean hasActionMenu(int i) {
        return ((DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i)).afH;
    }

    public int getItemPosition(Object obj) {
        int size = this.afC.size();
        for (int i = 0; i < size; i++) {
            if (obj == ((DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i)).afG) {
                return i;
            }
        }
        return -2;
    }

    Tab getTabAt(int i) {
        return ((DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i)).afI;
    }

    Fragment Ax(int i, boolean z) {
        DynamicFragmentPagerAdapter$FragmentInfo dynamicFragmentPagerAdapter$FragmentInfo = (DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i);
        if (dynamicFragmentPagerAdapter$FragmentInfo.afG == null) {
            dynamicFragmentPagerAdapter$FragmentInfo.afG = this.afD.findFragmentByTag(dynamicFragmentPagerAdapter$FragmentInfo.afJ);
            if (dynamicFragmentPagerAdapter$FragmentInfo.afG == null && z) {
                dynamicFragmentPagerAdapter$FragmentInfo.afG = Fragment.instantiate(this.mContext, dynamicFragmentPagerAdapter$FragmentInfo.afF.getName(), dynamicFragmentPagerAdapter$FragmentInfo.afE);
                dynamicFragmentPagerAdapter$FragmentInfo.afF = null;
                dynamicFragmentPagerAdapter$FragmentInfo.afE = null;
            }
        }
        return dynamicFragmentPagerAdapter$FragmentInfo.afG;
    }

    int Au(String str, Class<? extends Fragment> cls, Bundle bundle, Tab tab, boolean z) {
        this.afC.add(new DynamicFragmentPagerAdapter$FragmentInfo(this, str, cls, bundle, tab, z));
        notifyDataSetChanged();
        return this.afC.size() - 1;
    }

    int Av(String str, int i, Class<? extends Fragment> cls, Bundle bundle, Tab tab, boolean z) {
        this.afC.add(i, new DynamicFragmentPagerAdapter$FragmentInfo(this, str, cls, bundle, tab, z));
        notifyDataSetChanged();
        return i;
    }

    void AC(int i) {
        AD(Ax(i, false));
        this.afC.remove(i);
        notifyDataSetChanged();
    }

    int Aw(String str) {
        int size = this.afC.size();
        for (int i = 0; i < size; i++) {
            if (((DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i)).afJ.equals(str)) {
                return i;
            }
        }
        return -1;
    }

    int AA(Tab tab) {
        int size = this.afC.size();
        for (int i = 0; i < size; i++) {
            DynamicFragmentPagerAdapter$FragmentInfo dynamicFragmentPagerAdapter$FragmentInfo = (DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i);
            if (dynamicFragmentPagerAdapter$FragmentInfo.afI == tab) {
                AD(dynamicFragmentPagerAdapter$FragmentInfo.afG);
                this.afC.remove(i);
                notifyDataSetChanged();
                return i;
            }
        }
        return -1;
    }

    int AB(Fragment fragment) {
        int size = this.afC.size();
        for (int i = 0; i < size; i++) {
            if (Ax(i, false) == fragment) {
                AD(fragment);
                this.afC.remove(i);
                notifyDataSetChanged();
                return i;
            }
        }
        return -1;
    }

    void Ay() {
        Az();
        this.afC.clear();
        notifyDataSetChanged();
    }

    void setFragmentActionMenuAt(int i, boolean z) {
        DynamicFragmentPagerAdapter$FragmentInfo dynamicFragmentPagerAdapter$FragmentInfo = (DynamicFragmentPagerAdapter$FragmentInfo) this.afC.get(i);
        if (dynamicFragmentPagerAdapter$FragmentInfo.afH != z) {
            dynamicFragmentPagerAdapter$FragmentInfo.afH = z;
            notifyDataSetChanged();
        }
    }

    private void Az() {
        FragmentTransaction beginTransaction = this.afD.beginTransaction();
        int size = this.afC.size();
        for (int i = 0; i < size; i++) {
            beginTransaction.remove(Ax(i, false));
        }
        beginTransaction.commitAllowingStateLoss();
        this.afD.executePendingTransactions();
    }

    private void AD(Fragment fragment) {
        if (fragment != null) {
            FragmentManager fragmentManager = fragment.getFragmentManager();
            if (fragmentManager != null) {
                FragmentTransaction beginTransaction = fragmentManager.beginTransaction();
                beginTransaction.remove(fragment);
                beginTransaction.commitAllowingStateLoss();
                fragmentManager.executePendingTransactions();
            }
        }
    }
}
