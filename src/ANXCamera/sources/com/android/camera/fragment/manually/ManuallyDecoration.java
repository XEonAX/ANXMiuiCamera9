package com.android.camera.fragment.manually;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

public class ManuallyDecoration extends ItemDecoration {
    private Paint mDividerPaint;
    private int mDividerWidth = 1;
    private int mSpanCount;

    public ManuallyDecoration(int dividerWidth, @ColorInt int dividerColor) {
        this.mDividerWidth = dividerWidth;
        this.mDividerPaint = new Paint();
        this.mDividerPaint.setAntiAlias(true);
        this.mDividerPaint.setColor(dividerColor);
    }

    public void setStyle(int spanCount) {
        this.mSpanCount = spanCount;
    }

    public void getItemOffsets(Rect outRect, int itemPosition, RecyclerView parent) {
        int eachWidth = ((this.mSpanCount - 1) * this.mDividerWidth) / this.mSpanCount;
        int left = (itemPosition % this.mSpanCount) * (this.mDividerWidth - eachWidth);
        outRect.set(left, 0, eachWidth - left, this.mDividerWidth);
    }

    public void onDraw(Canvas canvas, RecyclerView parent, State state) {
        int childSize = parent.getChildCount();
        for (int i = 0; i < childSize; i++) {
            View child = parent.getChildAt(i);
            LayoutParams layoutParams = (LayoutParams) child.getLayoutParams();
            int left = child.getLeft();
            int right = child.getRight();
            int top = child.getBottom() + layoutParams.bottomMargin;
            int bottom = top + this.mDividerWidth;
            if (this.mDividerPaint != null) {
                canvas.drawRect((float) left, (float) top, (float) right, (float) bottom, this.mDividerPaint);
            }
            top = child.getTop();
            bottom = child.getBottom() + this.mDividerWidth;
            left = child.getRight() + layoutParams.rightMargin;
            right = left + this.mDividerWidth;
            if (this.mDividerPaint != null) {
                canvas.drawRect((float) left, (float) top, (float) right, (float) bottom, this.mDividerPaint);
            }
        }
    }
}
