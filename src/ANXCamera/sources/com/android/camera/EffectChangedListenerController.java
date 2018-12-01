package com.android.camera;

import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectChangedListener;
import java.util.HashMap;
import java.util.Map;

public class EffectChangedListenerController {
    private static Map<Integer, EffectChangedListener> mEffectChangedListenerMap = new HashMap();
    private static int mHoldKey;

    public static void setHoldKey(int mHoldKey) {
        mHoldKey = mHoldKey;
    }

    public static void addEffectChangedListener(EffectChangedListener mEffectChangedListener) {
        mEffectChangedListenerMap.put(Integer.valueOf(mHoldKey), mEffectChangedListener);
    }

    public static void removeEffectChangedListenerMap(int key) {
        EffectController.getInstance().removeChangeListener((EffectChangedListener) mEffectChangedListenerMap.remove(Integer.valueOf(key)));
        EffectController.releaseInstance();
    }
}
