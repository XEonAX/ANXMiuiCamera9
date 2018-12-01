package com.android.camera.network.net;

import com.android.camera.fragment.CtaNoticeFragment.CTA;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.json.BaseJsonRequest;
import com.android.camera.network.util.NetworkUtils;
import org.json.JSONObject;

public class BaseGalleryRequest extends BaseJsonRequest<GalleryResponse> {
    public BaseGalleryRequest(int method, String url) {
        super(method, url);
    }

    protected final void handleResponse(JSONObject response) {
        if (response != null) {
            try {
                if (response.has("code")) {
                    if (response.getInt("code") != ErrorCode.SUCCESS.CODE) {
                        handleError(ErrorCode.SERVER_ERROR, response.optString("description"), response);
                        return;
                    } else if (response.isNull("data")) {
                        handleError(ErrorCode.BODY_EMPTY, "response empty data", response);
                        return;
                    } else {
                        GalleryResponse resp = new GalleryResponse();
                        resp.data = response.optJSONObject("data");
                        resp.syncTag = response.optString("syncTag", null);
                        resp.syncToken = response.optString("syncToken", null);
                        resp.isLastPage = response.optBoolean("lastPage", true);
                        onRequestSuccess(resp);
                        return;
                    }
                }
            } catch (Exception e) {
                handleError(ErrorCode.HANDLE_ERROR, e.getMessage(), e);
                return;
            }
        }
        handleError(ErrorCode.PARSE_ERROR, "response has no code", null);
    }

    protected void onRequestSuccess(GalleryResponse response) throws Exception {
        onRequestSuccess(response.data);
    }

    protected void onRequestSuccess(JSONObject data) throws Exception {
        deliverResponse(data);
    }

    public final void execute() {
        if (checkExecuteCondition()) {
            super.execute();
        }
    }

    private boolean checkExecuteCondition() {
        if (!CTA.canConnectNetwork()) {
            handleError(ErrorCode.NETWORK_NOT_CONNECTED, "CTA not confirmed.", null);
            return false;
        } else if (isUseCache() || NetworkUtils.isNetworkConnected()) {
            return true;
        } else {
            handleError(ErrorCode.NETWORK_NOT_CONNECTED, "Network not connected.", null);
            return false;
        }
    }

    public void onRequestError(ErrorCode errorCode, String errorMessage, Object responseData) {
        deliverError(errorCode, errorMessage, responseData);
        Log.w("BaseGalleryRequest", String.format("%s onRequestError:%s | %s ", new Object[]{getClass().getSimpleName(), errorCode, errorMessage}));
        if (responseData instanceof Throwable) {
            Log.w("BaseGalleryRequest", (Throwable) responseData);
        } else if (responseData != null) {
            Log.d("BaseGalleryRequest", responseData.toString());
        }
    }
}
