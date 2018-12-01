package com.android.camera.network.net.json;

import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.VolleyRequest;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;

public abstract class BaseJsonRequest<T> extends VolleyRequest<JSONObject, T> {
    private Map<String, String> mHeaders;
    private int mMethod = 1;
    private String mUrl = null;

    public BaseJsonRequest(int method, String url) {
        this.mMethod = method;
        this.mUrl = url;
    }

    public void onRequestError(ErrorCode errorCode, String errorMessage, Object responseData) {
        deliverError(errorCode, errorMessage, responseData);
    }

    protected final Request<JSONObject> createVolleyRequest(Listener<JSONObject> listener, ErrorListener errorListener) {
        String url = this.mUrl;
        String urlWithParam = appendUrlParams();
        if (this.mMethod == 0) {
            url = urlWithParam;
        }
        JsonObjectRequest request = new JsonObjectRequest(this.mMethod, url, listener, errorListener);
        if (this.mParams != null) {
            request.setParams(this.mParams);
        }
        if (this.mHeaders != null) {
            request.setHeaders(this.mHeaders);
        }
        request.setCacheKey(getCacheKey());
        return request;
    }

    public String getCacheKey() {
        return appendUrlParams();
    }

    private String appendUrlParams() {
        if (this.mUrl == null || this.mParams == null || (this.mParams.isEmpty() ^ 1) == 0) {
            return this.mUrl;
        }
        StringBuilder url = new StringBuilder(this.mUrl);
        if (this.mUrl.indexOf(63) <= 0) {
            return url.append("?").append(encodeParameters(this.mParams, "UTF-8")).toString();
        }
        if (!(this.mUrl.endsWith("?") || (this.mUrl.endsWith("&") ^ 1) == 0)) {
            url.append("&");
        }
        return url.append(encodeParameters(this.mParams, "UTF-8")).toString();
    }

    private String encodeParameters(Map<String, String> params, String paramsEncoding) {
        StringBuilder encodedParams = new StringBuilder();
        try {
            for (Entry<String, String> entry : params.entrySet()) {
                encodedParams.append(URLEncoder.encode((String) entry.getKey(), paramsEncoding));
                encodedParams.append('=');
                encodedParams.append(URLEncoder.encode((String) entry.getValue(), paramsEncoding));
                encodedParams.append('&');
            }
            return encodedParams.toString();
        } catch (UnsupportedEncodingException uee) {
            throw new RuntimeException("Encoding not supported: " + paramsEncoding, uee);
        }
    }
}
