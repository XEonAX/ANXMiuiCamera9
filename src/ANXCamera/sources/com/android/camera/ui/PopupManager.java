package com.android.camera.ui;

import android.content.Context;
import android.view.View;
import java.util.ArrayList;
import java.util.HashMap;

public class PopupManager {
    private static HashMap<Context, PopupManager> sMap = new HashMap();
    private OnOtherPopupShowedListener mLastListener;
    private ArrayList<OnOtherPopupShowedListener> mListeners = new ArrayList();

    public interface OnOtherPopupShowedListener {
        boolean onOtherPopupShowed(int i);
    }

    private PopupManager() {
    }

    public void notifyShowPopup(View view, int level) {
        for (OnOtherPopupShowedListener listener : this.mListeners) {
            if (((View) listener) != view && listener.onOtherPopupShowed(level)) {
                this.mLastListener = listener;
            }
        }
    }

    public static PopupManager getInstance(Context context) {
        PopupManager instance = (PopupManager) sMap.get(context);
        if (instance != null) {
            return instance;
        }
        instance = new PopupManager();
        sMap.put(context, instance);
        return instance;
    }

    public static void removeInstance(Context context) {
        if (((PopupManager) sMap.get(context)) != null) {
            sMap.remove(context);
        }
    }
}
