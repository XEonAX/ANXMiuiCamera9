package com.sensetime.stmobile.model;

public class STMobile106 {
    int ID;
    float eye_dist;
    float pitch;
    STPoint[] points_array = new STPoint[106];
    STRect rect;
    float roll;
    float score;
    float[] visibility_array = new float[106];
    float yaw;

    public STMobile106(STRect rect, float score, STPoint[] points_array, float yaw, float pitch, float roll, float eye_dist, int ID) {
        this.rect = rect;
        this.score = score;
        this.points_array = points_array;
        this.yaw = yaw;
        this.pitch = pitch;
        this.roll = roll;
        this.eye_dist = eye_dist;
        this.ID = ID;
    }

    public STRect getRect() {
        return this.rect;
    }

    public void setRect(STRect rect) {
        this.rect = rect;
    }

    public float getScore() {
        return this.score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public STPoint[] getPoints_array() {
        return this.points_array;
    }

    public float[] getVisibilityArray() {
        return this.visibility_array;
    }

    public void setPoints_array(STPoint[] points_array) {
        this.points_array = points_array;
    }

    public float getYaw() {
        return this.yaw;
    }

    public void setYaw(float yaw) {
        this.yaw = yaw;
    }

    public float getPitch() {
        return this.pitch;
    }

    public void setPitch(float pitch) {
        this.pitch = pitch;
    }

    public float getRoll() {
        return this.roll;
    }

    public void setRoll(float roll) {
        this.roll = roll;
    }

    public float getEye_dist() {
        return this.eye_dist;
    }

    public void setEye_dist(float eye_dist) {
        this.eye_dist = eye_dist;
    }

    public int getID() {
        return this.ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
}
