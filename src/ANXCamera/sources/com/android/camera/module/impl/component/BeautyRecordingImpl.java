package com.android.camera.module.impl.component;

import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseProtocol;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import java.util.ArrayList;

public class BeautyRecordingImpl implements ModeProtocol$BaseProtocol {
    private ArrayList<HandleBeautyRecording> recordingArrayList = new ArrayList();

    public static BeautyRecordingImpl create() {
        return new BeautyRecordingImpl();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(173, this);
    }

    public void unRegisterProtocol() {
        this.recordingArrayList.clear();
        ModeCoordinatorImpl.getInstance().detachProtocol(173, this);
    }
}
