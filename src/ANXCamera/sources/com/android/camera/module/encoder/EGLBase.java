package com.android.camera.module.encoder;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.os.Build.VERSION;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import com.android.camera.log.Log;

@TargetApi(18)
public class EGLBase {
    private static final String TAG = EGLBase.class.getSimpleName();
    private EGLContext mDefaultContext = EGL14.EGL_NO_CONTEXT;
    private EGLConfig mEglConfig = null;
    private EGLContext mEglContext = EGL14.EGL_NO_CONTEXT;
    private EGLDisplay mEglDisplay = EGL14.EGL_NO_DISPLAY;

    public static class EglSurface {
        private final EGLBase mEgl;
        private EGLSurface mEglSurface = EGL14.EGL_NO_SURFACE;
        private final int mHeight;
        private final int mWidth;

        EglSurface(EGLBase egl, Object surface) {
            Log.v(EGLBase.TAG, "EglSurface");
            if ((surface instanceof SurfaceView) || ((surface instanceof Surface) ^ 1) == 0 || ((surface instanceof SurfaceHolder) ^ 1) == 0 || ((surface instanceof SurfaceTexture) ^ 1) == 0) {
                this.mEgl = egl;
                this.mEglSurface = this.mEgl.createWindowSurface(surface);
                this.mWidth = this.mEgl.querySurface(this.mEglSurface, 12375);
                this.mHeight = this.mEgl.querySurface(this.mEglSurface, 12374);
                Log.v(EGLBase.TAG, String.format("EglSurface: size(%d, %d)", new Object[]{Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight)}));
                return;
            }
            throw new IllegalArgumentException("unsupported surface");
        }

        public void makeCurrent() {
            this.mEgl.makeCurrent(this.mEglSurface);
        }

        public void swap() {
            this.mEgl.swap(this.mEglSurface);
        }

        public void release() {
            Log.v(EGLBase.TAG, "EglSurface:release");
            this.mEgl.makeDefault();
            this.mEgl.destroyWindowSurface(this.mEglSurface);
            this.mEglSurface = EGL14.EGL_NO_SURFACE;
        }
    }

    public EGLBase(EGLContext sharedContext, boolean withDepthBuffer, boolean isRecordable) {
        Log.v(TAG, "EGLBase");
        init(sharedContext, withDepthBuffer, isRecordable);
    }

    public void release() {
        Log.v(TAG, "release");
        if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
            destroyContext();
            EGL14.eglTerminate(this.mEglDisplay);
            EGL14.eglReleaseThread();
        }
        this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
    }

    public EglSurface createFromSurface(Object surface) {
        Log.v(TAG, "createFromSurface");
        EglSurface eglSurface = new EglSurface(this, surface);
        eglSurface.makeCurrent();
        return eglSurface;
    }

    public int querySurface(EGLSurface eglSurface, int what) {
        int[] value = new int[1];
        EGL14.eglQuerySurface(this.mEglDisplay, eglSurface, what, value, 0);
        return value[0];
    }

    private void init(EGLContext sharedContext, boolean withDepthBuffer, boolean isRecordable) {
        Log.v(TAG, "init");
        if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
            throw new RuntimeException("EGL already set up");
        }
        this.mEglDisplay = EGL14.eglGetDisplay(0);
        if (this.mEglDisplay == EGL14.EGL_NO_DISPLAY) {
            throw new RuntimeException("eglGetDisplay failed");
        }
        int[] version = new int[2];
        if (EGL14.eglInitialize(this.mEglDisplay, version, 0, version, 1)) {
            if (sharedContext == null) {
                sharedContext = EGL14.EGL_NO_CONTEXT;
            }
            if (this.mEglContext == EGL14.EGL_NO_CONTEXT) {
                this.mEglConfig = getConfig(withDepthBuffer, isRecordable);
                if (this.mEglConfig == null) {
                    throw new RuntimeException("chooseConfig failed");
                }
                this.mEglContext = createContext(sharedContext);
            }
            int[] values = new int[1];
            EGL14.eglQueryContext(this.mEglDisplay, this.mEglContext, 12440, values, 0);
            Log.d(TAG, "EGLContext created, client version " + values[0]);
            makeDefault();
            return;
        }
        this.mEglDisplay = null;
        throw new RuntimeException("eglInitialize failed");
    }

    private boolean makeCurrent(EGLSurface surface) {
        if (this.mEglDisplay == null) {
            Log.e(TAG, "makeCurrent: eglDisplay not initialized");
        }
        if (surface == null || surface == EGL14.EGL_NO_SURFACE) {
            if (EGL14.eglGetError() == 12299) {
                Log.e(TAG, "makeCurrent: returned EGL_BAD_NATIVE_WINDOW.");
            }
            return false;
        } else if (EGL14.eglMakeCurrent(this.mEglDisplay, surface, surface, this.mEglContext)) {
            return true;
        } else {
            Log.e(TAG, "eglMakeCurrent: err=" + EGL14.eglGetError());
            return false;
        }
    }

    private void makeDefault() {
        Log.v(TAG, "makeDefault");
        if (!EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            Log.w(TAG, "makeDefault: err=" + EGL14.eglGetError());
        }
    }

    private int swap(EGLSurface surface) {
        if (EGL14.eglSwapBuffers(this.mEglDisplay, surface)) {
            return 12288;
        }
        int err = EGL14.eglGetError();
        Log.w(TAG, "swap: err=" + err);
        return err;
    }

    private EGLContext createContext(EGLContext sharedContext) {
        Log.v(TAG, "createContext");
        EGLContext context = EGL14.eglCreateContext(this.mEglDisplay, this.mEglConfig, sharedContext, new int[]{12440, 2, 12344}, 0);
        checkEglError("eglCreateContext");
        return context;
    }

    private void destroyContext() {
        Log.v(TAG, "destroyContext");
        if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mEglContext)) {
            Log.e(TAG, "destroyContext: display=" + this.mEglDisplay + " context=" + this.mEglContext);
            Log.e(TAG, "destroyContext: err=" + EGL14.eglGetError());
        }
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
        if (this.mDefaultContext != EGL14.EGL_NO_CONTEXT) {
            if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mDefaultContext)) {
                Log.e(TAG, "destroyDefaultContext: display=" + this.mEglDisplay + " context=" + this.mDefaultContext);
                Log.e(TAG, "destroyDefaultContext: err=" + EGL14.eglGetError());
            }
            this.mDefaultContext = EGL14.EGL_NO_CONTEXT;
        }
    }

    private EGLSurface createWindowSurface(Object nativeWindow) {
        Log.v(TAG, "createWindowSurface: nativeWindow=" + nativeWindow);
        EGLSurface result = null;
        try {
            return EGL14.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, nativeWindow, new int[]{12344}, 0);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "eglCreateWindowSurface", e);
            return result;
        }
    }

    private void destroyWindowSurface(EGLSurface surface) {
        Log.v(TAG, "destroySurface>>>");
        if (surface != EGL14.EGL_NO_SURFACE) {
            EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            EGL14.eglDestroySurface(this.mEglDisplay, surface);
        }
        surface = EGL14.EGL_NO_SURFACE;
        Log.v(TAG, "destroySurface<<<");
    }

    private void checkEglError(String msg) {
        int error = EGL14.eglGetError();
        if (error != 12288) {
            throw new RuntimeException(msg + ": EGL error: 0x" + Integer.toHexString(error));
        }
    }

    private EGLConfig getConfig(boolean withDepthBuffer, boolean isRecordable) {
        int offset;
        int offset2;
        int[] attribList = new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12344, 12344, 12344, 12344, 12344, 12344, 12344};
        if (withDepthBuffer) {
            attribList[10] = 12325;
            offset = 11 + 1;
            attribList[11] = 16;
        } else {
            offset = 10;
        }
        if (!isRecordable || VERSION.SDK_INT < 18) {
            offset2 = offset;
        } else {
            offset2 = offset + 1;
            attribList[offset] = 12610;
            offset = offset2 + 1;
            attribList[offset2] = 1;
            offset2 = offset;
        }
        for (int i = attribList.length - 1; i >= offset2; i--) {
            attribList[i] = 12344;
        }
        EGLConfig[] configs = new EGLConfig[1];
        if (EGL14.eglChooseConfig(this.mEglDisplay, attribList, 0, configs, 0, configs.length, new int[1], 0)) {
            return configs[0];
        }
        Log.w(TAG, "unable to find RGBA8888 /  EGLConfig");
        return null;
    }
}
