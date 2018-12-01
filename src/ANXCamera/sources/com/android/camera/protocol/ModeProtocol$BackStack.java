package com.android.camera.protocol;

public interface ModeProtocol$BackStack extends ModeProtocol$BaseProtocol {
    <P extends ModeProtocol$HandleBackTrace> void addInBackStack(P p);

    boolean handleBackStackFromKeyBack();

    boolean handleBackStackFromShutter();

    boolean handleBackStackFromTapDown(int i, int i2);

    <P extends ModeProtocol$HandleBackTrace> void removeBackStack(P p);
}
