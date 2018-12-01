package com.android.camera;

public class ChangeManager {
    private int mStatus = 0;

    public void request(int type) {
        this.mStatus |= type;
    }

    public boolean check(int type) {
        return (this.mStatus & type) == type;
    }

    public void clear(int type) {
        this.mStatus &= ~type;
    }
}
