package com.android.camera.fragment;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class FragmentUtils {
    public static void addFragmentWithTag(FragmentManager fragmentManager, int id, Fragment fragment, String tag) {
        if (fragmentManager != null) {
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            fragmentTransaction.replace(id, fragment, tag);
            try {
                fragmentTransaction.commitAllowingStateLoss();
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean removeFragmentByTag(FragmentManager manager, String TAG) {
        if (manager == null || TAG == null) {
            return false;
        }
        Fragment fragment = manager.findFragmentByTag(TAG);
        if (fragment == null) {
            return false;
        }
        FragmentTransaction fragmentManager = manager.beginTransaction();
        fragmentManager.remove(fragment);
        try {
            fragmentManager.commitAllowingStateLoss();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        return true;
    }
}
