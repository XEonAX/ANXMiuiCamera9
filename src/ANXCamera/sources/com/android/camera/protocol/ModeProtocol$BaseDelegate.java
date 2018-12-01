package com.android.camera.protocol;

import android.support.annotation.IdRes;
import com.android.camera.animation.AnimationComposite;

public interface ModeProtocol$BaseDelegate extends ModeProtocol$BaseProtocol {
    void delegateEvent(int i);

    int getActiveFragment(@IdRes int i);

    AnimationComposite getAnimationComposite();
}
