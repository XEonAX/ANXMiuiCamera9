package com.android.camera.effect.draw_mode;

public class DrawIntTexAttribute extends DrawAttribute {
    public int mHeight;
    public boolean mIsSnapshot;
    public int mTexId;
    public int mWidth;
    public int mX;
    public int mY;

    public DrawIntTexAttribute(int texId, int x, int y, int w, int h, boolean isSnapshot) {
        this.mX = x;
        this.mY = y;
        this.mWidth = w;
        this.mHeight = h;
        this.mTexId = texId;
        this.mTarget = 6;
        this.mIsSnapshot = isSnapshot;
    }
}
