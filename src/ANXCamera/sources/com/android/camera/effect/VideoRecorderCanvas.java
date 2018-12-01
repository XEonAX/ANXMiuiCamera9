package com.android.camera.effect;

import com.android.camera.Util;
import com.android.camera.effect.renders.RenderGroup;
import com.android.camera.effect.renders.VideoRecorderRender;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BaseGLCanvas;

public class VideoRecorderCanvas extends BaseGLCanvas {
    public VideoRecorderCanvas() {
        this.mRenderCaches = new RenderGroup(this);
        this.mRenderGroup = new VideoRecorderRender(this);
        initialize();
    }

    public void setSize(int width, int height) {
        super.setSize(width, height);
        Log.d("VideoRecorderCanvas", "setSize: size=" + width + "x" + height + " modelMatrix=" + Util.dumpMatrix(this.mState.getModelMatrix()));
    }
}
