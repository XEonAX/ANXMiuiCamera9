package com.android.camera.protocol;

public interface ModeProtocol$CameraActionTrack extends ModeProtocol$BaseProtocol {
    void onTrackShutterButtonMissTaken(long j);

    void onTrackShutterButtonTaken(long j);
}
