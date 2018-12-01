package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.util.SparseArray;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.ArrayList;

public class RenderGroup extends Render {
    private static final String TAG = Render.class.getSimpleName();
    protected int mParentFrameBufferIdOld;
    private ArrayList<Render> mPartRenders = new ArrayList();
    private ArrayList<Render> mRenders = new ArrayList();
    private SparseArray<Render> mRendersMap = new SparseArray();

    public RenderGroup(GLCanvas canvas) {
        super(canvas);
    }

    public RenderGroup(GLCanvas canvas, int id) {
        super(canvas, id);
    }

    private void initOrientation(Render render) {
        if (render != null) {
            render.setOrientation(this.mOrientation);
            render.setJpegOrientation(this.mJpegOrientation);
            render.setShootRotation(this.mShootRotation);
        }
    }

    public void addRender(Render render) {
        if (recordRender(render)) {
            this.mRenders.add(render);
            setSize(render);
            initOrientation(render);
        }
    }

    public void removeRender(int renderId) {
        if (this.mRendersMap.indexOfKey(renderId) >= 0) {
            Render render = getRender(renderId);
            this.mRenders.remove(render);
            this.mRendersMap.delete(renderId);
            if (render != null) {
                render.destroy();
            }
        }
    }

    public ArrayList<Render> getRenders() {
        return this.mRenders;
    }

    private void setSize(Render render) {
        if (render != null) {
            if (!(this.mPreviewWidth == 0 && this.mPreviewHeight == 0)) {
                render.setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
            }
            if (this.mViewportWidth != 0 || this.mViewportHeight != 0) {
                render.setViewportSize(this.mViewportWidth, this.mViewportHeight);
            }
        }
    }

    private boolean recordRender(Render render) {
        int renderId = render == null ? FilterInfo.FILTER_ID_NONE : render.getId();
        if (this.mRendersMap.indexOfKey(renderId) < 0) {
            this.mRendersMap.put(renderId, render);
            return true;
        }
        Log.e(TAG, "already added render with id " + Integer.toHexString(renderId), new RuntimeException());
        return false;
    }

    public Render getRender(int renderId) {
        if (renderId < 0) {
            Log.e(TAG, "invalid render id " + Integer.toHexString(renderId), new RuntimeException());
        }
        return (Render) this.mRendersMap.get(renderId);
    }

    public Render getRenderByIndex(int index) {
        if (index >= 0 && index <= this.mRenders.size() - 1) {
            return (Render) this.mRenders.get(index);
        }
        Log.e(TAG, "invalid render index: " + index + " size: " + this.mRenders.size());
        return null;
    }

    protected int getRenderSize() {
        return this.mRenders.size();
    }

    protected void clearRenders() {
        this.mRenders.clear();
        this.mRendersMap.clear();
    }

    public boolean draw(DrawAttribute attr) {
        for (Render render : this.mRenders) {
            if (render != null && render.draw(attr)) {
                return true;
            }
        }
        return false;
    }

    public void destroy() {
        for (Render render : this.mRenders) {
            if (render != null) {
                render.destroy();
            }
        }
        clearRenders();
    }

    public void beginBindFrameBuffer(int bufId, int bufWidth, int bufHeight) {
        GLES20.glBindFramebuffer(36160, bufId);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().identityAllM();
        this.mOldViewportWidth = this.mViewportWidth;
        this.mOldViewportHeight = this.mViewportHeight;
        this.mParentFrameBufferIdOld = this.mParentFrameBufferId;
        setParentFrameBufferId(bufId);
        setViewportSize(bufWidth, bufHeight);
    }

    public void beginBindFrameBuffer(FrameBuffer frameBuffer) {
        GLES20.glBindFramebuffer(36160, frameBuffer.getId());
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, frameBuffer.getTexture().getId(), 0);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().identityAllM();
        this.mOldViewportWidth = this.mViewportWidth;
        this.mOldViewportHeight = this.mViewportHeight;
        this.mParentFrameBufferIdOld = this.mParentFrameBufferId;
        setParentFrameBufferId(frameBuffer.getId());
        setViewportSize(frameBuffer.getWidth(), frameBuffer.getHeight());
    }

    public void endBindFrameBuffer() {
        this.mGLCanvas.getState().popState();
        GLES20.glBindFramebuffer(36160, this.mParentFrameBufferIdOld);
        setViewportSize(this.mOldViewportWidth, this.mOldViewportHeight);
        setParentFrameBufferId(this.mParentFrameBufferIdOld);
    }

    public void setViewportSize(int w, int h) {
        super.setViewportSize(w, h);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setViewportSize(w, h);
                }
            }
        }
    }

    public void setEffectRangeAttribute(EffectRectAttribute attribute) {
        super.setEffectRangeAttribute(attribute);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setEffectRangeAttribute(attribute);
                }
            }
        }
    }

    public void setPreviewSize(int w, int h) {
        super.setPreviewSize(w, h);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setPreviewSize(w, h);
                }
            }
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.deleteBuffer();
                }
            }
        }
    }

    public void setOrientation(int orientation) {
        if (this.mOrientation != orientation) {
            super.setOrientation(orientation);
            if (!this.mRenders.isEmpty()) {
                for (Render render : this.mRenders) {
                    if (render != null) {
                        render.setOrientation(orientation);
                    }
                }
            }
        }
    }

    public void setJpegOrientation(int orientation) {
        if (this.mJpegOrientation != orientation) {
            super.setJpegOrientation(orientation);
            if (!this.mRenders.isEmpty()) {
                for (Render render : this.mRenders) {
                    if (render != null) {
                        render.setJpegOrientation(orientation);
                    }
                }
            }
        }
    }

    public void setMirror(boolean mirror) {
        super.setMirror(mirror);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setMirror(mirror);
                }
            }
        }
    }

    public void setShootRotation(float shootRotation) {
        super.setShootRotation(shootRotation);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setShootRotation(shootRotation);
                }
            }
        }
    }

    public void setSnapshotSize(int snapshotWidth, int snapshotHeight) {
        super.setSnapshotSize(snapshotWidth, snapshotHeight);
        if (!this.mRenders.isEmpty()) {
            for (Render render : this.mRenders) {
                if (render != null) {
                    render.setSnapshotSize(snapshotWidth, snapshotHeight);
                }
            }
        }
    }

    protected void setParentFrameBufferId(int id) {
        super.setParentFrameBufferId(id);
        if (!this.mRenders.isEmpty()) {
            for (Render child : this.mRenders) {
                if (child != null) {
                    child.setParentFrameBufferId(id);
                }
            }
        }
    }

    public void setSticker(String newSticker) {
        for (Render render : this.mRenders) {
            if (render != null) {
                render.setSticker(newSticker);
            }
        }
    }

    public void setPreviousFrameBufferInfo(int bufId, int w, int h) {
        for (Render render : this.mRenders) {
            if (render != null) {
                render.setPreviousFrameBufferInfo(bufId, w, h);
            }
        }
    }

    public boolean isNeedInit(int renderId) {
        boolean z = true;
        if (renderId <= -1) {
            return true;
        }
        if (this.mRendersMap.indexOfKey(renderId) >= 0) {
            z = false;
        }
        return z;
    }

    public void addPartRender(Render render) {
        this.mPartRenders.add(render);
    }

    public void clearPartRenders() {
        this.mPartRenders.clear();
    }

    public Render getPartRender(int index) {
        if (index < 0 || index >= this.mPartRenders.size()) {
            return null;
        }
        return (Render) this.mPartRenders.get(index);
    }

    public boolean isPartComplete(int wholeSize) {
        return this.mPartRenders.size() == wholeSize;
    }
}
