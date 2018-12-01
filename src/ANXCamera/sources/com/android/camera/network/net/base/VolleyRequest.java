package com.android.camera.network.net.base;

import com.android.camera.network.net.HttpManager;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.concurrent.CountDownLatch;

public abstract class VolleyRequest<T, E> extends BaseRequest<E> implements Listener<T>, ErrorListener {
    private Request<T> mRequest;
    private CountDownLatch mSyncExecuteLock = null;

    protected abstract Request<T> createVolleyRequest(Listener<T> listener, ErrorListener errorListener);

    protected abstract void handleResponse(T t);

    public void execute() {
        this.mRequest = createVolleyRequest(this, this);
        if (this.mRequest != null) {
            this.mRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 1, 1.0f));
            this.mRequest.setShouldCache(isUseCache());
            Object tag = getTag();
            if (this.mRequest.getTag() == null && tag != null) {
                this.mRequest.setTag(tag);
            }
            HttpManager.getInstance().addToRequestQueue(this.mRequest);
        }
    }

    private void releaseSyncExecuteLock() {
        if (this.mSyncExecuteLock != null) {
            this.mSyncExecuteLock.countDown();
            this.mSyncExecuteLock = null;
        }
    }

    public final void onResponse(T response) {
        handleResponse(response);
        releaseSyncExecuteLock();
        if (this.mRequest instanceof Cacheable) {
            Cacheable cache = this.mRequest;
            if (this.mCacheExpires > 0 && (cache.isFromCache() ^ 1) != 0) {
                HttpManager.getInstance().putToCache(this.mRequest.getCacheKey(), cache.getData(), this.mCacheExpires, this.mCacheSoftTtl);
            }
        }
    }

    public final void onErrorResponse(VolleyError error) {
        ErrorCode code = ErrorCode.NET_ERROR;
        if (error instanceof RequestError) {
            code = ((RequestError) error).getErrorCode();
        }
        Throwable cause = error.getCause();
        if (cause == null) {
            cause = error;
        }
        handleError(code, cause.getMessage(), cause);
        releaseSyncExecuteLock();
    }

    protected final void handleError(ErrorCode errorCode, String errorMessage, Object responseData) {
        this.mCacheExpires = -1;
        onRequestError(errorCode, errorMessage, responseData);
    }
}
