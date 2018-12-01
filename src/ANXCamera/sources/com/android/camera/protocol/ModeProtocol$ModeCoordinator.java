package com.android.camera.protocol;

public interface ModeProtocol$ModeCoordinator {
    <P extends ModeProtocol$BaseProtocol> void attachProtocol(int i, P p);

    <P extends ModeProtocol$BaseProtocol> void detachProtocol(int i, P p);

    <P extends ModeProtocol$BaseProtocol> P getAttachProtocol(int i);
}
