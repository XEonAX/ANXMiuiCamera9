package com.sensetime.stmobile.model;

public class STRect {
    private int bottom;
    private int left;
    private int right;
    private int top;

    public STRect(int left, int top, int right, int bottom) {
        this.left = left;
        this.top = top;
        this.right = right;
        this.bottom = bottom;
    }
}
