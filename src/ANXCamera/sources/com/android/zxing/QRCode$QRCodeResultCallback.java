package com.android.zxing;

import com.google.zxing.Result;

public interface QRCode$QRCodeResultCallback {
    void onDecodeTimeOut();

    void onFailed();

    void onFindQRCode(Result result);

    void onStart();

    void onStop();
}
