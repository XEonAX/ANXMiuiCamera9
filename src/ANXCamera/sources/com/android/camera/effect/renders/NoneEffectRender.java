package com.android.camera.effect.renders;

import com.android.gallery3d.ui.GLCanvas;

public class NoneEffectRender extends PixelEffectRender {
    public NoneEffectRender(GLCanvas canvas) {
        super(canvas);
    }

    public NoneEffectRender(GLCanvas canvas, int id) {
        super(canvas, id);
    }

    public String getFragShaderString() {
        return "precision mediump float; \nuniform float uAlpha; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() { \n    gl_FragColor = texture2D(sTexture, vTexCoord)*uAlpha; \n}";
    }
}
