package com.android.camera;

import android.content.Context;
import android.content.res.Resources;
import android.view.InflateException;
import android.widget.Toast;
import java.lang.ref.WeakReference;

public class ToastUtils {
    private static String oldMsg;
    private static long oneTime = 0;
    protected static Toast toast = null;
    private static long twoTime = 0;

    public static void showToast(Context context, int resID) {
        if (context != null) {
            Resources res = context.getResources();
            if (res != null) {
                showToast(new WeakReference(context), res.getString(resID));
            }
        }
    }

    public static void showToast(WeakReference<Context> activity, String s) {
        if (toast == null) {
            Context context = (Context) activity.get();
            if (context != null) {
                try {
                    toast = Toast.makeText(context.getApplicationContext(), s, 0);
                    toast.setGravity(17, 0, 0);
                    toast.show();
                    oneTime = System.currentTimeMillis();
                } catch (InflateException e) {
                    e.printStackTrace();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
        } else {
            twoTime = System.currentTimeMillis();
            if (s == null || !s.equals(oldMsg)) {
                oldMsg = s;
                toast.setText(s);
                toast.show();
            } else if (twoTime - oneTime > 0) {
                toast.show();
            }
        }
        oneTime = twoTime;
    }
}
