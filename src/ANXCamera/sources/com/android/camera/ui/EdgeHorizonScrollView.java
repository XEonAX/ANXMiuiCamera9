package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader.TileMode;
import android.support.annotation.Nullable;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ModeChangeController;

public class EdgeHorizonScrollView extends HorizontalScrollView {
    private float mDownX = -1.0f;
    private Paint mEdgePaint;
    private int mEdgeWidth;
    private boolean mIsRTL;
    private boolean mScrolled = false;

    public EdgeHorizonScrollView(Context context) {
        super(context);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    public void initView() {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mEdgeWidth = getResources().getDimensionPixelSize(R.dimen.mode_select_layout_edge);
        this.mEdgePaint = new Paint();
        this.mEdgePaint.setAntiAlias(true);
        this.mEdgePaint.setStyle(Style.FILL);
        this.mEdgePaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
        this.mEdgePaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) this.mEdgeWidth, new int[]{-16777216, -16777216, 0}, new float[]{0.0f, 0.2f, 1.0f}, TileMode.CLAMP));
        setFocusable(false);
    }

    protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
        int width = getWidth();
        int height = getHeight();
        int saveLayerCount = canvas.saveLayer(0.0f, 0.0f, (float) Math.max(width, child.getWidth()), (float) height, null, 31);
        boolean drawChild = super.drawChild(canvas, child, drawingTime);
        canvas.translate((float) (this.mIsRTL ? Math.max(0, child.getWidth() - width) : 0), 0.0f);
        float middleWidth = ((float) width) / 2.0f;
        float middleHeight = ((float) height) / 2.0f;
        float offset = ((float) (height - width)) / 2.0f;
        int saveCount = canvas.save();
        canvas.rotate(90.0f, middleWidth, middleHeight);
        canvas.translate(0.0f, offset);
        canvas.drawRect(0.0f - offset, 0.0f, ((float) width) + offset, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas.restoreToCount(saveCount);
        saveCount = canvas.save();
        canvas.rotate(-90.0f, middleWidth, middleHeight);
        canvas.translate(0.0f, offset);
        canvas.drawRect(0.0f - offset, 0.0f, ((float) width) + offset, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas.restoreToCount(saveCount);
        canvas.restoreToCount(saveLayerCount);
        return drawChild;
    }

    public boolean onTouchEvent(MotionEvent ev) {
        switch (ev.getAction()) {
            case 0:
                this.mDownX = ev.getX();
                this.mScrolled = false;
                return true;
            case 1:
            case 3:
                this.mDownX = -1.0f;
                this.mScrolled = false;
                break;
            case 2:
                if (this.mDownX == -1.0f) {
                    this.mDownX = ev.getX();
                }
                float distanceX = ev.getX() - this.mDownX;
                ModeProtocol$ModeChangeController controller = (ModeProtocol$ModeChangeController) ModeCoordinatorImpl.getInstance().getAttachProtocol(179);
                if (!this.mScrolled) {
                    if (distanceX > ((float) Util.dpToPixel(17.0f))) {
                        controller.selectMode(3, 0);
                        this.mScrolled = true;
                    } else if (distanceX < ((float) (-Util.dpToPixel(17.0f)))) {
                        controller.selectMode(5, 0);
                        this.mScrolled = true;
                    }
                }
                return true;
        }
        return false;
    }
}
