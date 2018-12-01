package com.android.camera.protocol;

import android.support.annotation.StringRes;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public interface ModeProtocol$BottomPopupTips extends ModeProtocol$BaseProtocol {

    @Retention(RetentionPolicy.SOURCE)
    public @interface TipType {
    }

    boolean containTips(@StringRes int i);

    void directlyHideTips();

    void hideQrCodeTip();

    boolean isPortraitHintVisible();

    void reInitTipImage();

    void setPortraitHintVisible(int i);

    void showQrCodeTip();

    void showTips(int i, @StringRes int i2, int i3);

    void updateTipBottomMargin(int i, boolean z);
}
