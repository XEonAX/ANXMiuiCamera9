package com.android.camera.ui;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.GLDebugHelper;
import android.opengl.GLSurfaceView.Renderer;
import android.util.AttributeSet;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.android.camera.log.Log;
import com.sensetime.stmobile.STMobileHumanActionNative;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLTextureView extends TextureView implements SurfaceTextureListener {
    private static final GLThreadManager sGLThreadManager = new GLThreadManager();
    private int mDebugFlags;
    private boolean mDetached;
    private EGLConfigChooser mEGLConfigChooser;
    private int mEGLContextClientVersion;
    private EGLContextFactory mEGLContextFactory;
    private EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private GLThread mGLThread;
    private GLWrapper mGLWrapper;
    private boolean mPreserveEGLContextOnPause;
    private int mPreservedHeight;
    private int mPreservedWidth;
    private Renderer mRenderer;
    private EGLShareContextGetter mShareContextGetter;
    private final WeakReference<GLTextureView> mThisWeakRef = new WeakReference(this);

    public interface EGLShareContextGetter {
        EGLContext getShareContext();
    }

    public interface EGLConfigChooser {
        EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay);
    }

    private abstract class BaseConfigChooser implements EGLConfigChooser {
        protected int[] mConfigSpec;

        abstract EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr);

        public BaseConfigChooser(int[] configSpec) {
            this.mConfigSpec = filterConfigSpec(configSpec);
        }

        public EGLConfig chooseConfig(EGL10 egl, EGLDisplay display) {
            int[] num_config = new int[1];
            if (egl.eglChooseConfig(display, this.mConfigSpec, null, 0, num_config)) {
                int numConfigs = num_config[0];
                if (numConfigs <= 0) {
                    throw new IllegalArgumentException("No configs match configSpec");
                }
                EGLConfig[] configs = new EGLConfig[numConfigs];
                if (egl.eglChooseConfig(display, this.mConfigSpec, configs, numConfigs, num_config)) {
                    EGLConfig config = chooseConfig(egl, display, configs);
                    if (config != null) {
                        return config;
                    }
                    throw new IllegalArgumentException("No config chosen");
                }
                throw new IllegalArgumentException("eglChooseConfig#2 failed");
            }
            throw new IllegalArgumentException("eglChooseConfig failed");
        }

        private int[] filterConfigSpec(int[] configSpec) {
            if (GLTextureView.this.mEGLContextClientVersion != 2) {
                return configSpec;
            }
            int len = configSpec.length;
            int[] newConfigSpec = new int[(len + 2)];
            System.arraycopy(configSpec, 0, newConfigSpec, 0, len - 1);
            newConfigSpec[len - 1] = 12352;
            newConfigSpec[len] = 4;
            newConfigSpec[len + 1] = 12344;
            return newConfigSpec;
        }
    }

    private class ComponentSizeChooser extends BaseConfigChooser {
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue = new int[1];

        public ComponentSizeChooser(int redSize, int greenSize, int blueSize, int alphaSize, int depthSize, int stencilSize) {
            super(new int[]{12324, redSize, 12323, greenSize, 12322, blueSize, 12321, alphaSize, 12325, depthSize, 12326, stencilSize, 12344});
            this.mRedSize = redSize;
            this.mGreenSize = greenSize;
            this.mBlueSize = blueSize;
            this.mAlphaSize = alphaSize;
            this.mDepthSize = depthSize;
            this.mStencilSize = stencilSize;
        }

        public EGLConfig chooseConfig(EGL10 egl, EGLDisplay display, EGLConfig[] configs) {
            for (EGLConfig config : configs) {
                int d = findConfigAttrib(egl, display, config, 12325, 0);
                int s = findConfigAttrib(egl, display, config, 12326, 0);
                if (d >= this.mDepthSize && s >= this.mStencilSize) {
                    int r = findConfigAttrib(egl, display, config, 12324, 0);
                    int g = findConfigAttrib(egl, display, config, 12323, 0);
                    int b = findConfigAttrib(egl, display, config, 12322, 0);
                    int a = findConfigAttrib(egl, display, config, 12321, 0);
                    if (r == this.mRedSize && g == this.mGreenSize && b == this.mBlueSize && a == this.mAlphaSize) {
                        return config;
                    }
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl, EGLDisplay display, EGLConfig config, int attribute, int defaultValue) {
            if (egl.eglGetConfigAttrib(display, config, attribute, this.mValue)) {
                return this.mValue[0];
            }
            return defaultValue;
        }
    }

    public interface EGLContextFactory {
        EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext);

        void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext);
    }

    private class DefaultContextFactory implements EGLContextFactory {
        private int EGL_CONTEXT_CLIENT_VERSION;

        /* synthetic */ DefaultContextFactory(GLTextureView this$0, DefaultContextFactory -this1) {
            this();
        }

        private DefaultContextFactory() {
            this.EGL_CONTEXT_CLIENT_VERSION = 12440;
        }

        public EGLContext createContext(EGL10 egl, EGLDisplay display, EGLConfig config, EGLContext shareContext) {
            int[] attrib_list = new int[]{this.EGL_CONTEXT_CLIENT_VERSION, GLTextureView.this.mEGLContextClientVersion, 12344};
            if (shareContext == null) {
                shareContext = EGL10.EGL_NO_CONTEXT;
            }
            if (GLTextureView.this.mEGLContextClientVersion == 0) {
                attrib_list = null;
            }
            return egl.eglCreateContext(display, config, shareContext, attrib_list);
        }

        public void destroyContext(EGL10 egl, EGLDisplay display, EGLContext context) {
            if (!egl.eglDestroyContext(display, context)) {
                Log.e("DefaultContextFactory", "display:" + display + " context: " + context);
                EglHelper.throwEglException("eglDestroyContex", egl.eglGetError());
            }
        }
    }

    public interface EGLWindowSurfaceFactory {
        EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj);

        void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface);
    }

    private static class DefaultWindowSurfaceFactory implements EGLWindowSurfaceFactory {
        /* synthetic */ DefaultWindowSurfaceFactory(DefaultWindowSurfaceFactory -this0) {
            this();
        }

        private DefaultWindowSurfaceFactory() {
        }

        public EGLSurface createWindowSurface(EGL10 egl, EGLDisplay display, EGLConfig config, Object nativeWindow) {
            EGLSurface result = null;
            try {
                return egl.eglCreateWindowSurface(display, config, nativeWindow, null);
            } catch (IllegalArgumentException e) {
                Log.e("GLTextureView", "eglCreateWindowSurface", e);
                return result;
            }
        }

        public void destroySurface(EGL10 egl, EGLDisplay display, EGLSurface surface) {
            egl.eglDestroySurface(display, surface);
        }
    }

    private static class EglHelper {
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;

        public EglHelper(WeakReference<GLTextureView> glTextureViewWeakRef) {
            this.mGLTextureViewWeakRef = glTextureViewWeakRef;
        }

        public void start() {
            this.mEgl = (EGL10) EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (this.mEglDisplay == EGL10.EGL_NO_DISPLAY) {
                throw new RuntimeException("eglGetDisplay failed");
            }
            if (this.mEgl.eglInitialize(this.mEglDisplay, new int[2])) {
                GLTextureView view = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (view == null) {
                    this.mEglConfig = null;
                    this.mEglContext = null;
                } else {
                    EGLContext shareContext;
                    this.mEglConfig = view.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
                    if (view.mShareContextGetter == null) {
                        shareContext = null;
                    } else {
                        shareContext = view.mShareContextGetter.getShareContext();
                    }
                    this.mEglContext = view.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig, shareContext);
                }
                if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                    this.mEglContext = null;
                    throwEglException("createContext");
                }
                this.mEglSurface = null;
                return;
            }
            throw new RuntimeException("eglInitialize failed");
        }

        public boolean createSurface() {
            if (this.mEgl == null) {
                throw new RuntimeException("egl not initialized");
            } else if (this.mEglDisplay == null) {
                throw new RuntimeException("eglDisplay not initialized");
            } else if (this.mEglConfig == null) {
                throw new RuntimeException("mEglConfig not initialized");
            } else {
                destroySurfaceImp();
                GLTextureView view = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (view != null) {
                    this.mEglSurface = view.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, view.getSurfaceTexture());
                } else {
                    this.mEglSurface = null;
                }
                if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                    if (this.mEgl.eglGetError() == 12299) {
                        Log.e("EglHelper", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                    }
                    return false;
                } else if (this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
                    return true;
                } else {
                    logEglErrorAsWarning("EglHelper", "eglMakeCurrent", this.mEgl.eglGetError());
                    return false;
                }
            }
        }

        GL createGL() {
            GL gl = this.mEglContext.getGL();
            GLTextureView view = (GLTextureView) this.mGLTextureViewWeakRef.get();
            if (view == null) {
                return gl;
            }
            if (view.mGLWrapper != null) {
                gl = view.mGLWrapper.wrap(gl);
            }
            if ((view.mDebugFlags & 3) == 0) {
                return gl;
            }
            int configFlags = 0;
            Writer writer = null;
            if ((view.mDebugFlags & 1) != 0) {
                configFlags = 1;
            }
            if ((view.mDebugFlags & 2) != 0) {
                writer = new LogWriter();
            }
            return GLDebugHelper.wrap(gl, configFlags, writer);
        }

        public int swap() {
            if (this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface)) {
                return 12288;
            }
            return this.mEgl.eglGetError();
        }

        public void destroySurface() {
            destroySurfaceImp();
        }

        private void destroySurfaceImp() {
            if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                GLTextureView view = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (view != null) {
                    view.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
                }
                this.mEglSurface = null;
            }
        }

        public void finish() {
            if (this.mEglContext != null) {
                GLTextureView view = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (view != null) {
                    view.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
                }
                this.mEglContext = null;
            }
            if (this.mEglDisplay != null) {
                this.mEgl.eglTerminate(this.mEglDisplay);
                this.mEglDisplay = null;
            }
        }

        private void throwEglException(String function) {
            throwEglException(function, this.mEgl.eglGetError());
        }

        public static void throwEglException(String function, int error) {
            throw new RuntimeException(formatEglError(function, error));
        }

        public static void logEglErrorAsWarning(String tag, String function, int error) {
            Log.w(tag, formatEglError(function, error));
        }

        public static String formatEglError(String function, int error) {
            return function + " failed";
        }
    }

    static class GLThread extends Thread {
        private EglHelper mEglHelper;
        private ArrayList<Runnable> mEventQueue = new ArrayList();
        private boolean mExited;
        private boolean mFinishedCreatingEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;
        private boolean mHasSurface;
        private boolean mHaveEglContext;
        private boolean mHaveEglSurface;
        private int mHeight;
        private boolean mPaused;
        private boolean mRenderComplete;
        private int mRenderMode;
        private boolean mRequestPaused;
        private boolean mRequestRender;
        private boolean mShouldExit;
        private boolean mShouldReleaseEglContext;
        private boolean mSizeChanged = true;
        private boolean mSurfaceIsBad;
        private boolean mWaitingForSurface;
        private int mWidth;

        GLThread(WeakReference<GLTextureView> glTextureViewWeakRef, int width, int height) {
            this.mWidth = width;
            this.mHeight = height;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mGLTextureViewWeakRef = glTextureViewWeakRef;
        }

        public void run() {
            setName("GLThread " + getId());
            try {
                guardedRun();
            } catch (InterruptedException e) {
            } finally {
                GLTextureView.sGLThreadManager.threadExiting(this);
            }
        }

        private void stopEglSurfaceLocked() {
            if (this.mHaveEglSurface) {
                this.mHaveEglSurface = false;
                this.mEglHelper.destroySurface();
            }
        }

        private void stopEglContextLocked() {
            if (this.mHaveEglContext) {
                this.mEglHelper.finish();
                this.mHaveEglContext = false;
                GLTextureView.sGLThreadManager.releaseEglContextLocked(this);
            }
        }

        /* JADX WARNING: Missing block: B:24:0x006f, code:
            if (r8 == null) goto L_0x0239;
     */
        /* JADX WARNING: Missing block: B:25:0x0071, code:
            r8.run();
     */
        /* JADX WARNING: Missing block: B:26:0x0074, code:
            r8 = null;
     */
        /* JADX WARNING: Missing block: B:114:0x0239, code:
            if (r4 == false) goto L_0x025d;
     */
        /* JADX WARNING: Missing block: B:117:0x0245, code:
            if (r23.mEglHelper.createSurface() == false) goto L_0x0318;
     */
        /* JADX WARNING: Missing block: B:118:0x0247, code:
            r21 = com.android.camera.ui.GLTextureView.-get9();
     */
        /* JADX WARNING: Missing block: B:119:0x024b, code:
            monitor-enter(r21);
     */
        /* JADX WARNING: Missing block: B:122:?, code:
            r23.mFinishedCreatingEglSurface = true;
            com.android.camera.ui.GLTextureView.-get9().notifyAll();
     */
        /* JADX WARNING: Missing block: B:124:?, code:
            monitor-exit(r21);
     */
        /* JADX WARNING: Missing block: B:125:0x025c, code:
            r4 = false;
     */
        /* JADX WARNING: Missing block: B:126:0x025d, code:
            if (r5 == false) goto L_0x0278;
     */
        /* JADX WARNING: Missing block: B:127:0x025f, code:
            r9 = (javax.microedition.khronos.opengles.GL10) r23.mEglHelper.createGL();
            com.android.camera.ui.GLTextureView.-get9().checkGLDriver(r9);
            r5 = false;
     */
        /* JADX WARNING: Missing block: B:128:0x0278, code:
            if (r3 == false) goto L_0x02a0;
     */
        /* JADX WARNING: Missing block: B:129:0x027a, code:
            r17 = (com.android.camera.ui.GLTextureView) r23.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:130:0x0286, code:
            if (r17 == null) goto L_0x029f;
     */
        /* JADX WARNING: Missing block: B:131:0x0288, code:
            com.android.camera.ui.GLTextureView.-get7(r17).onSurfaceCreated(r9, r23.mEglHelper.mEglConfig);
     */
        /* JADX WARNING: Missing block: B:132:0x029f, code:
            r3 = false;
     */
        /* JADX WARNING: Missing block: B:133:0x02a0, code:
            if (r14 == false) goto L_0x02bc;
     */
        /* JADX WARNING: Missing block: B:134:0x02a2, code:
            r17 = (com.android.camera.ui.GLTextureView) r23.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:135:0x02ae, code:
            if (r17 == null) goto L_0x02bb;
     */
        /* JADX WARNING: Missing block: B:136:0x02b0, code:
            com.android.camera.ui.GLTextureView.-get7(r17).onSurfaceChanged(r9, r18, r10);
     */
        /* JADX WARNING: Missing block: B:137:0x02bb, code:
            r14 = false;
     */
        /* JADX WARNING: Missing block: B:138:0x02bc, code:
            r17 = (com.android.camera.ui.GLTextureView) r23.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:139:0x02c8, code:
            if (r17 == null) goto L_0x02d3;
     */
        /* JADX WARNING: Missing block: B:140:0x02ca, code:
            com.android.camera.ui.GLTextureView.-get7(r17).onDrawFrame(r9);
     */
        /* JADX WARNING: Missing block: B:141:0x02d3, code:
            r15 = r23.mEglHelper.swap();
     */
        /* JADX WARNING: Missing block: B:142:0x02dd, code:
            switch(r15) {
                case 12288: goto L_0x0302;
                case 12302: goto L_0x033a;
                default: goto L_0x02e0;
            };
     */
        /* JADX WARNING: Missing block: B:143:0x02e0, code:
            com.android.camera.ui.GLTextureView.EglHelper.logEglErrorAsWarning("GLThread", "eglSwapBuffers", r15);
            r21 = com.android.camera.ui.GLTextureView.-get9();
     */
        /* JADX WARNING: Missing block: B:144:0x02f1, code:
            monitor-enter(r21);
     */
        /* JADX WARNING: Missing block: B:147:?, code:
            r23.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.-get9().notifyAll();
     */
        /* JADX WARNING: Missing block: B:149:?, code:
            monitor-exit(r21);
     */
        /* JADX WARNING: Missing block: B:150:0x0302, code:
            if (r19 == false) goto L_0x002f;
     */
        /* JADX WARNING: Missing block: B:151:0x0304, code:
            r6 = true;
     */
        /* JADX WARNING: Missing block: B:163:?, code:
            r21 = com.android.camera.ui.GLTextureView.-get9();
     */
        /* JADX WARNING: Missing block: B:164:0x031c, code:
            monitor-enter(r21);
     */
        /* JADX WARNING: Missing block: B:167:?, code:
            r23.mFinishedCreatingEglSurface = true;
            r23.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.-get9().notifyAll();
     */
        /* JADX WARNING: Missing block: B:169:?, code:
            monitor-exit(r21);
     */
        /* JADX WARNING: Missing block: B:174:0x033a, code:
            r11 = true;
     */
        private void guardedRun() throws java.lang.InterruptedException {
            /*
            r23 = this;
            r20 = new com.android.camera.ui.GLTextureView$EglHelper;
            r0 = r23;
            r0 = r0.mGLTextureViewWeakRef;
            r21 = r0;
            r20.<init>(r21);
            r0 = r20;
            r1 = r23;
            r1.mEglHelper = r0;
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mHaveEglContext = r0;
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mHaveEglSurface = r0;
            r9 = 0;
            r3 = 0;
            r4 = 0;
            r5 = 0;
            r11 = 0;
            r14 = 0;
            r19 = 0;
            r6 = 0;
            r2 = 0;
            r18 = 0;
            r10 = 0;
            r8 = 0;
        L_0x002f:
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x01d9 }
            monitor-enter(r21);	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x0034:
            r0 = r23;
            r0 = r0.mShouldExit;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x004d;
        L_0x003c:
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r21);
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x004a }
            r23.stopEglContextLocked();	 Catch:{ all -> 0x004a }
            monitor-exit(r21);
            return;
        L_0x004a:
            r20 = move-exception;
            monitor-exit(r21);
            throw r20;
        L_0x004d:
            r0 = r23;
            r0 = r0.mEventQueue;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r20 = r20.isEmpty();	 Catch:{ all -> 0x01d6 }
            if (r20 != 0) goto L_0x0076;
        L_0x0059:
            r0 = r23;
            r0 = r0.mEventQueue;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r22 = 0;
            r0 = r20;
            r1 = r22;
            r20 = r0.remove(r1);	 Catch:{ all -> 0x01d6 }
            r0 = r20;
            r0 = (java.lang.Runnable) r0;	 Catch:{ all -> 0x01d6 }
            r8 = r0;
        L_0x006e:
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            if (r8 == 0) goto L_0x0239;
        L_0x0071:
            r8.run();	 Catch:{ RuntimeException -> 0x01d9 }
            r8 = 0;
            goto L_0x002f;
        L_0x0076:
            r12 = 0;
            r0 = r23;
            r0 = r0.mPaused;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r0 = r23;
            r0 = r0.mRequestPaused;	 Catch:{ all -> 0x01d6 }
            r22 = r0;
            r0 = r20;
            r1 = r22;
            if (r0 == r1) goto L_0x00a0;
        L_0x0089:
            r0 = r23;
            r12 = r0.mRequestPaused;	 Catch:{ all -> 0x01d6 }
            r0 = r23;
            r0 = r0.mRequestPaused;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r0 = r20;
            r1 = r23;
            r1.mPaused = r0;	 Catch:{ all -> 0x01d6 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
        L_0x00a0:
            r0 = r23;
            r0 = r0.mShouldReleaseEglContext;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x00b7;
        L_0x00a8:
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x01d6 }
            r23.stopEglContextLocked();	 Catch:{ all -> 0x01d6 }
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mShouldReleaseEglContext = r0;	 Catch:{ all -> 0x01d6 }
            r2 = 1;
        L_0x00b7:
            if (r11 == 0) goto L_0x00c0;
        L_0x00b9:
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x01d6 }
            r23.stopEglContextLocked();	 Catch:{ all -> 0x01d6 }
            r11 = 0;
        L_0x00c0:
            if (r12 == 0) goto L_0x00cd;
        L_0x00c2:
            r0 = r23;
            r0 = r0.mHaveEglSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x00cd;
        L_0x00ca:
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x01d6 }
        L_0x00cd:
            if (r12 == 0) goto L_0x00f5;
        L_0x00cf:
            r0 = r23;
            r0 = r0.mHaveEglContext;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x00f5;
        L_0x00d7:
            r0 = r23;
            r0 = r0.mGLTextureViewWeakRef;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r17 = r20.get();	 Catch:{ all -> 0x01d6 }
            r17 = (com.android.camera.ui.GLTextureView) r17;	 Catch:{ all -> 0x01d6 }
            if (r17 != 0) goto L_0x01f4;
        L_0x00e5:
            r13 = 0;
        L_0x00e6:
            if (r13 == 0) goto L_0x00f2;
        L_0x00e8:
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20 = r20.shouldReleaseEGLContextWhenPausing();	 Catch:{ all -> 0x01d6 }
            if (r20 == 0) goto L_0x00f5;
        L_0x00f2:
            r23.stopEglContextLocked();	 Catch:{ all -> 0x01d6 }
        L_0x00f5:
            if (r12 == 0) goto L_0x010a;
        L_0x00f7:
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20 = r20.shouldTerminateEGLWhenPausing();	 Catch:{ all -> 0x01d6 }
            if (r20 == 0) goto L_0x010a;
        L_0x0101:
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r20.finish();	 Catch:{ all -> 0x01d6 }
        L_0x010a:
            r0 = r23;
            r0 = r0.mHasSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 != 0) goto L_0x013e;
        L_0x0112:
            r0 = r23;
            r0 = r0.mWaitingForSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r20 = r20 ^ 1;
            if (r20 == 0) goto L_0x013e;
        L_0x011c:
            r0 = r23;
            r0 = r0.mHaveEglSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x0127;
        L_0x0124:
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x01d6 }
        L_0x0127:
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mWaitingForSurface = r0;	 Catch:{ all -> 0x01d6 }
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x01d6 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
        L_0x013e:
            r0 = r23;
            r0 = r0.mHasSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x015d;
        L_0x0146:
            r0 = r23;
            r0 = r0.mWaitingForSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x015d;
        L_0x014e:
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mWaitingForSurface = r0;	 Catch:{ all -> 0x01d6 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
        L_0x015d:
            if (r6 == 0) goto L_0x0171;
        L_0x015f:
            r19 = 0;
            r6 = 0;
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mRenderComplete = r0;	 Catch:{ all -> 0x01d6 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
        L_0x0171:
            r20 = r23.readyToDraw();	 Catch:{ all -> 0x01d6 }
            if (r20 == 0) goto L_0x0230;
        L_0x0177:
            r0 = r23;
            r0 = r0.mHaveEglContext;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 != 0) goto L_0x0182;
        L_0x017f:
            if (r2 == 0) goto L_0x01fa;
        L_0x0181:
            r2 = 0;
        L_0x0182:
            r0 = r23;
            r0 = r0.mHaveEglContext;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x019f;
        L_0x018a:
            r0 = r23;
            r0 = r0.mHaveEglSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            r20 = r20 ^ 1;
            if (r20 == 0) goto L_0x019f;
        L_0x0194:
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mHaveEglSurface = r0;	 Catch:{ all -> 0x01d6 }
            r4 = 1;
            r5 = 1;
            r14 = 1;
        L_0x019f:
            r0 = r23;
            r0 = r0.mHaveEglSurface;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x0230;
        L_0x01a7:
            r0 = r23;
            r0 = r0.mSizeChanged;	 Catch:{ all -> 0x01d6 }
            r20 = r0;
            if (r20 == 0) goto L_0x01c5;
        L_0x01af:
            r14 = 1;
            r0 = r23;
            r0 = r0.mWidth;	 Catch:{ all -> 0x01d6 }
            r18 = r0;
            r0 = r23;
            r10 = r0.mHeight;	 Catch:{ all -> 0x01d6 }
            r19 = 1;
            r4 = 1;
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mSizeChanged = r0;	 Catch:{ all -> 0x01d6 }
        L_0x01c5:
            r20 = 0;
            r0 = r20;
            r1 = r23;
            r1.mRequestRender = r0;	 Catch:{ all -> 0x01d6 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
            goto L_0x006e;
        L_0x01d6:
            r20 = move-exception;
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            throw r20;	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x01d9:
            r7 = move-exception;
            r20 = "GLThread";
            r21 = "got exception";
            r0 = r20;
            r1 = r21;
            com.android.camera.log.Log.d(r0, r1, r7);	 Catch:{ all -> 0x030a }
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r21);
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x033f }
            r23.stopEglContextLocked();	 Catch:{ all -> 0x033f }
            monitor-exit(r21);
            return;
        L_0x01f4:
            r13 = r17.mPreserveEGLContextOnPause;	 Catch:{ all -> 0x01d6 }
            goto L_0x00e6;
        L_0x01fa:
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r0 = r20;
            r1 = r23;
            r20 = r0.tryAcquireEglContextLocked(r1);	 Catch:{ all -> 0x01d6 }
            if (r20 == 0) goto L_0x0182;
        L_0x0208:
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ RuntimeException -> 0x0223 }
            r20 = r0;
            r20.start();	 Catch:{ RuntimeException -> 0x0223 }
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mHaveEglContext = r0;	 Catch:{ all -> 0x01d6 }
            r3 = 1;
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.notifyAll();	 Catch:{ all -> 0x01d6 }
            goto L_0x0182;
        L_0x0223:
            r16 = move-exception;
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r0 = r20;
            r1 = r23;
            r0.releaseEglContextLocked(r1);	 Catch:{ all -> 0x01d6 }
            throw r16;	 Catch:{ all -> 0x01d6 }
        L_0x0230:
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01d6 }
            r20.wait();	 Catch:{ all -> 0x01d6 }
            goto L_0x0034;
        L_0x0239:
            if (r4 == 0) goto L_0x025d;
        L_0x023b:
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r20 = r20.createSurface();	 Catch:{ RuntimeException -> 0x01d9 }
            if (r20 == 0) goto L_0x0318;
        L_0x0247:
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x01d9 }
            monitor-enter(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mFinishedCreatingEglSurface = r0;	 Catch:{ all -> 0x0307 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0307 }
            r20.notifyAll();	 Catch:{ all -> 0x0307 }
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            r4 = 0;
        L_0x025d:
            if (r5 == 0) goto L_0x0278;
        L_0x025f:
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r20 = r20.createGL();	 Catch:{ RuntimeException -> 0x01d9 }
            r0 = r20;
            r0 = (javax.microedition.khronos.opengles.GL10) r0;	 Catch:{ RuntimeException -> 0x01d9 }
            r9 = r0;
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x01d9 }
            r0 = r20;
            r0.checkGLDriver(r9);	 Catch:{ RuntimeException -> 0x01d9 }
            r5 = 0;
        L_0x0278:
            if (r3 == 0) goto L_0x02a0;
        L_0x027a:
            r0 = r23;
            r0 = r0.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r17 = r20.get();	 Catch:{ RuntimeException -> 0x01d9 }
            r17 = (com.android.camera.ui.GLTextureView) r17;	 Catch:{ RuntimeException -> 0x01d9 }
            if (r17 == 0) goto L_0x029f;
        L_0x0288:
            r20 = r17.mRenderer;	 Catch:{ RuntimeException -> 0x01d9 }
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ RuntimeException -> 0x01d9 }
            r21 = r0;
            r0 = r21;
            r0 = r0.mEglConfig;	 Catch:{ RuntimeException -> 0x01d9 }
            r21 = r0;
            r0 = r20;
            r1 = r21;
            r0.onSurfaceCreated(r9, r1);	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x029f:
            r3 = 0;
        L_0x02a0:
            if (r14 == 0) goto L_0x02bc;
        L_0x02a2:
            r0 = r23;
            r0 = r0.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r17 = r20.get();	 Catch:{ RuntimeException -> 0x01d9 }
            r17 = (com.android.camera.ui.GLTextureView) r17;	 Catch:{ RuntimeException -> 0x01d9 }
            if (r17 == 0) goto L_0x02bb;
        L_0x02b0:
            r20 = r17.mRenderer;	 Catch:{ RuntimeException -> 0x01d9 }
            r0 = r20;
            r1 = r18;
            r0.onSurfaceChanged(r9, r1, r10);	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x02bb:
            r14 = 0;
        L_0x02bc:
            r0 = r23;
            r0 = r0.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r17 = r20.get();	 Catch:{ RuntimeException -> 0x01d9 }
            r17 = (com.android.camera.ui.GLTextureView) r17;	 Catch:{ RuntimeException -> 0x01d9 }
            if (r17 == 0) goto L_0x02d3;
        L_0x02ca:
            r20 = r17.mRenderer;	 Catch:{ RuntimeException -> 0x01d9 }
            r0 = r20;
            r0.onDrawFrame(r9);	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x02d3:
            r0 = r23;
            r0 = r0.mEglHelper;	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = r0;
            r15 = r20.swap();	 Catch:{ RuntimeException -> 0x01d9 }
            switch(r15) {
                case 12288: goto L_0x0302;
                case 12302: goto L_0x033a;
                default: goto L_0x02e0;
            };	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x02e0:
            r20 = "GLThread";
            r21 = "eglSwapBuffers";
            r0 = r20;
            r1 = r21;
            com.android.camera.ui.GLTextureView.EglHelper.logEglErrorAsWarning(r0, r1, r15);	 Catch:{ RuntimeException -> 0x01d9 }
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x01d9 }
            monitor-enter(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x033c }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x033c }
            r20.notifyAll();	 Catch:{ all -> 0x033c }
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x0302:
            if (r19 == 0) goto L_0x002f;
        L_0x0304:
            r6 = 1;
            goto L_0x002f;
        L_0x0307:
            r20 = move-exception;
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            throw r20;	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x030a:
            r20 = move-exception;
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r21);
            r23.stopEglSurfaceLocked();	 Catch:{ all -> 0x0342 }
            r23.stopEglContextLocked();	 Catch:{ all -> 0x0342 }
            monitor-exit(r21);
            throw r20;
        L_0x0318:
            r21 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x01d9 }
            monitor-enter(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mFinishedCreatingEglSurface = r0;	 Catch:{ all -> 0x0337 }
            r20 = 1;
            r0 = r20;
            r1 = r23;
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x0337 }
            r20 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0337 }
            r20.notifyAll();	 Catch:{ all -> 0x0337 }
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            goto L_0x002f;
        L_0x0337:
            r20 = move-exception;
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            throw r20;	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x033a:
            r11 = 1;
            goto L_0x0302;
        L_0x033c:
            r20 = move-exception;
            monitor-exit(r21);	 Catch:{ RuntimeException -> 0x01d9 }
            throw r20;	 Catch:{ RuntimeException -> 0x01d9 }
        L_0x033f:
            r20 = move-exception;
            monitor-exit(r21);
            throw r20;
        L_0x0342:
            r20 = move-exception;
            monitor-exit(r21);
            throw r20;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ui.GLTextureView.GLThread.guardedRun():void");
        }

        public boolean ableToDraw() {
            return (this.mHaveEglContext && this.mHaveEglSurface) ? readyToDraw() : false;
        }

        private boolean readyToDraw() {
            if (this.mPaused || !this.mHasSurface || (this.mSurfaceIsBad ^ 1) == 0 || this.mWidth <= 0 || this.mHeight <= 0) {
                return false;
            }
            return this.mRequestRender || this.mRenderMode == 1;
        }

        public void setRenderMode(int renderMode) {
            if (renderMode < 0 || renderMode > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRenderMode = renderMode;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public int getRenderMode() {
            int i;
            synchronized (GLTextureView.sGLThreadManager) {
                i = this.mRenderMode;
            }
            return i;
        }

        public void requestRender() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestRender = true;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public void surfaceCreated() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = true;
                this.mFinishedCreatingEglSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (this.mWaitingForSurface && (this.mFinishedCreatingEglSurface ^ 1) != 0 && (this.mExited ^ 1) != 0) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void surfaceDestroyed() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mWaitingForSurface && (this.mExited ^ 1) != 0) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onPause() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && (this.mPaused ^ 1) != 0) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onResume() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = false;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && this.mPaused && (this.mRenderComplete ^ 1) != 0) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onWindowResize(int w, int h) {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mWidth = w;
                this.mHeight = h;
                this.mSizeChanged = true;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && (this.mPaused ^ 1) != 0 && (this.mRenderComplete ^ 1) != 0 && ableToDraw()) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestExitAndWait() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mShouldExit = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestReleaseEglContextLocked() {
            this.mShouldReleaseEglContext = true;
            GLTextureView.sGLThreadManager.notifyAll();
        }
    }

    private static class GLThreadManager {
        private static String TAG = "GLThreadManager";
        private GLThread mEglOwner;
        private boolean mGLESDriverCheckComplete;
        private int mGLESVersion;
        private boolean mGLESVersionCheckComplete;
        private boolean mLimitedGLESContexts;
        private boolean mMultipleGLESContextsAllowed;

        /* synthetic */ GLThreadManager(GLThreadManager -this0) {
            this();
        }

        private GLThreadManager() {
        }

        public synchronized void threadExiting(GLThread thread) {
            thread.mExited = true;
            if (this.mEglOwner == thread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public boolean tryAcquireEglContextLocked(GLThread thread) {
            if (this.mEglOwner == thread || this.mEglOwner == null) {
                this.mEglOwner = thread;
                notifyAll();
                return true;
            }
            checkGLESVersion();
            if (this.mMultipleGLESContextsAllowed) {
                return true;
            }
            if (this.mEglOwner != null) {
                this.mEglOwner.requestReleaseEglContextLocked();
            }
            return false;
        }

        public void releaseEglContextLocked(GLThread thread) {
            if (this.mEglOwner == thread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public synchronized boolean shouldReleaseEGLContextWhenPausing() {
            return this.mLimitedGLESContexts;
        }

        public synchronized boolean shouldTerminateEGLWhenPausing() {
            checkGLESVersion();
            return this.mMultipleGLESContextsAllowed ^ 1;
        }

        public synchronized void checkGLDriver(GL10 gl) {
            if (!this.mGLESDriverCheckComplete) {
                checkGLESVersion();
                String renderer = gl.glGetString(7937);
                if (this.mGLESVersion < STMobileHumanActionNative.ST_MOBILE_HAND_CONGRATULATE) {
                    this.mMultipleGLESContextsAllowed = renderer.startsWith("Q3Dimension MSM7500 ") ^ 1;
                    notifyAll();
                }
                this.mLimitedGLESContexts = this.mMultipleGLESContextsAllowed ^ 1;
                this.mGLESDriverCheckComplete = true;
            }
        }

        private void checkGLESVersion() {
            if (!this.mGLESVersionCheckComplete) {
                this.mMultipleGLESContextsAllowed = true;
                this.mGLESVersionCheckComplete = true;
            }
        }
    }

    public interface GLWrapper {
        GL wrap(GL gl);
    }

    static class LogWriter extends Writer {
        private StringBuilder mBuilder = new StringBuilder();

        LogWriter() {
        }

        public void close() {
            flushBuilder();
        }

        public void flush() {
            flushBuilder();
        }

        public void write(char[] buf, int offset, int count) {
            for (int i = 0; i < count; i++) {
                char c = buf[offset + i];
                if (c == 10) {
                    flushBuilder();
                } else {
                    this.mBuilder.append(c);
                }
            }
        }

        private void flushBuilder() {
            if (this.mBuilder.length() > 0) {
                Log.v("CONTINUAL_", this.mBuilder.toString());
                this.mBuilder.delete(0, this.mBuilder.length());
            }
        }
    }

    private class SimpleEGLConfigChooser extends ComponentSizeChooser {
        public SimpleEGLConfigChooser(boolean withDepthBuffer) {
            int i;
            if (withDepthBuffer) {
                i = 16;
            } else {
                i = 0;
            }
            super(8, 8, 8, 0, i, 0);
        }
    }

    public GLTextureView(Context context) {
        super(context);
        init();
    }

    public GLTextureView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    protected void finalize() throws Throwable {
        try {
            if (this.mGLThread != null) {
                this.mGLThread.requestExitAndWait();
            }
            super.finalize();
        } catch (Throwable th) {
            super.finalize();
        }
    }

    private void init() {
        setSurfaceTextureListener(this);
    }

    public void setRenderer(Renderer renderer) {
        checkRenderThreadState();
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        if (this.mEGLContextFactory == null) {
            this.mEGLContextFactory = new DefaultContextFactory(this, null);
        }
        if (this.mEGLWindowSurfaceFactory == null) {
            this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
        }
        this.mRenderer = renderer;
        this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
        this.mGLThread.start();
    }

    public Renderer getRenderer() {
        return this.mRenderer;
    }

    public void setEGLShareContextGetter(EGLShareContextGetter getter) {
        this.mShareContextGetter = getter;
    }

    public void setEGLContextClientVersion(int version) {
        checkRenderThreadState();
        this.mEGLContextClientVersion = version;
    }

    public void setRenderMode(int renderMode) {
        this.mGLThread.setRenderMode(renderMode);
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int width, int height) {
        this.mGLThread.surfaceCreated();
    }

    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int width, int height) {
        this.mPreservedWidth = width;
        this.mPreservedHeight = height;
        this.mGLThread.onWindowResize(width, height);
    }

    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.mPreservedWidth = w;
        this.mPreservedHeight = h;
        this.mGLThread.onWindowResize(w, h);
    }

    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        this.mGLThread.surfaceDestroyed();
        return true;
    }

    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mDetached && this.mRenderer != null) {
            int renderMode = 1;
            if (this.mGLThread != null) {
                renderMode = this.mGLThread.getRenderMode();
            }
            this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
            if (renderMode != 1) {
                this.mGLThread.setRenderMode(renderMode);
            }
            this.mGLThread.start();
        }
        this.mDetached = false;
    }

    protected void onDetachedFromWindow() {
        if (this.mGLThread != null) {
            this.mGLThread.requestExitAndWait();
        }
        this.mDetached = true;
        super.onDetachedFromWindow();
    }

    private void checkRenderThreadState() {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
    }
}
