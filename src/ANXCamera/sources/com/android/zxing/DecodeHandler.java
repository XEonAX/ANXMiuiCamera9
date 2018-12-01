package com.android.zxing;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.android.camera.R;
import com.android.camera.log.Log;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.ReaderException;
import com.google.zxing.common.HybridBinarizer;
import java.util.Hashtable;

final class DecodeHandler extends Handler {
    private static final String TAG = DecodeHandler.class.getSimpleName();
    private boolean mCancel;
    private final MultiFormatReader mMultiFormatReader = new MultiFormatReader();
    private final QRCodeManager mQRCodeProxy;

    public DecodeHandler(QRCodeManager mProxy, Looper looper, Hashtable<DecodeHintType, Object> hints) {
        super(looper);
        this.mQRCodeProxy = mProxy;
        this.mMultiFormatReader.setHints(hints);
    }

    public void handleMessage(Message message) {
        switch (message.what) {
            case R.id.decode /*2131361793*/:
                decode((byte[]) message.obj, message.arg1, message.arg2);
                return;
            default:
                return;
        }
    }

    public void cancel() {
        this.mCancel = true;
    }

    private void decode(byte[] data, int width, int height) {
        int i = 0;
        if (!this.mCancel) {
            byte[] rotatedData = new byte[(width * height)];
            if (data.length > width * height) {
                System.arraycopy(data, 0, rotatedData, 0, rotatedData.length);
            } else {
                rotatedData = data;
            }
            int decodeTimeMost = 2;
            Object obj = null;
            while (true) {
                decodeTimeMost--;
                if (decodeTimeMost >= 0) {
                    if (!this.mCancel) {
                        boolean z;
                        QRCodeManager qRCodeManager = this.mQRCodeProxy;
                        if (decodeTimeMost == 0) {
                            z = true;
                        } else {
                            z = i;
                        }
                        YUVLuminanceSource source = qRCodeManager.buildLuminanceSource(rotatedData, width, height, z);
                        if (source != null) {
                            try {
                                obj = this.mMultiFormatReader.decodeWithState(new BinaryBitmap(new HybridBinarizer(source)));
                            } catch (ReaderException re) {
                                Log.e(TAG, "decode: ReaderException: ", re);
                            } finally {
                                i = this.mMultiFormatReader;
                                i.reset();
                            }
                            if (obj != null) {
                                if (!this.mCancel) {
                                    this.mQRCodeProxy.getHandler().obtainMessage(R.id.find_qrcode, obj).sendToTarget();
                                    return;
                                }
                                return;
                            }
                        }
                    } else {
                        return;
                    }
                } else if (!this.mCancel) {
                    this.mQRCodeProxy.getHandler().sendEmptyMessage(R.id.decode_fail);
                    return;
                } else {
                    return;
                }
            }
        }
    }
}
