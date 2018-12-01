package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.camera2.params.Face;
import com.android.camera.effect.FaceAnalyzeInfo;

@TargetApi(21)
public class CameraHardwareFace {
    private static final String TAG = CameraHardwareFace.class.getSimpleName();
    public float ageFemale;
    public float ageMale;
    public float beautyscore;
    public int blinkDetected = 0;
    public int faceRecognised = 0;
    public int faceType = 0;
    public float gender;
    public int id = -1;
    public Point leftEye = null;
    public Point mouth = null;
    public float prob;
    public Rect rect;
    public Point rightEye = null;
    public int score;
    public int smileDegree = 0;
    public int smileScore = 0;
    public int t2tStop = 0;

    public static CameraHardwareFace[] convertCameraHardwareFace(Face[] faces) {
        CameraHardwareFace[] hFaces = new CameraHardwareFace[faces.length];
        for (int i = 0; i < faces.length; i++) {
            hFaces[i] = new CameraHardwareFace();
            copyFace(hFaces[i], faces[i]);
        }
        return hFaces;
    }

    public static CameraHardwareFace[] convertExCameraHardwareFace(Face[] faces, FaceAnalyzeInfo faceInfo) {
        int face_num = Math.min(faces.length, faceInfo.mAge.length);
        CameraHardwareFace[] hFaces = new CameraHardwareFace[face_num];
        for (int i = 0; i < face_num; i++) {
            hFaces[i] = new CameraHardwareFace();
            copyExFace(hFaces[i], faces[i], faceInfo.mAge[i], faceInfo.mGender[i], faceInfo.mFaceScore[i], faceInfo.mProp[i]);
        }
        return hFaces;
    }

    private static void copyFace(CameraHardwareFace cameraface, Face face) {
        cameraface.rect = face.getBounds();
        cameraface.score = face.getScore();
        cameraface.id = face.getId();
    }

    /* JADX WARNING: Removed duplicated region for block: B:6:0x0036 A:{Splitter: B:3:0x0020, ExcHandler: java.lang.IllegalArgumentException (r0_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Removed duplicated region for block: B:6:0x0036 A:{Splitter: B:3:0x0020, ExcHandler: java.lang.IllegalArgumentException (r0_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:6:0x0036, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:7:0x0037, code:
            com.android.camera.log.Log.e(TAG, r0.getMessage());
     */
    private static void copyExFace(com.android.camera2.CameraHardwareFace r8, android.hardware.camera2.params.Face r9, float r10, float r11, float r12, float r13) {
        /*
        r4 = r9.getBounds();
        r8.rect = r4;
        r4 = r9.getScore();
        r8.score = r4;
        r4 = r9.getId();
        r8.id = r4;
        r4 = r9.getClass();
        r2 = r4.getFields();
        r4 = 0;
        r5 = r2.length;
    L_0x001c:
        if (r4 >= r5) goto L_0x0041;
    L_0x001e:
        r1 = r2[r4];
        r6 = r8.getClass();	 Catch:{ IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036 }
        r7 = r1.getName();	 Catch:{ IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036 }
        r3 = r6.getField(r7);	 Catch:{ IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036 }
        r6 = r1.get(r9);	 Catch:{ IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036 }
        r3.set(r8, r6);	 Catch:{ IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036, IllegalArgumentException -> 0x0036 }
    L_0x0033:
        r4 = r4 + 1;
        goto L_0x001c;
    L_0x0036:
        r0 = move-exception;
        r6 = TAG;
        r7 = r0.getMessage();
        com.android.camera.log.Log.e(r6, r7);
        goto L_0x0033;
    L_0x0041:
        r8.gender = r11;
        r8.beautyscore = r12;
        r8.ageMale = r10;
        r8.ageFemale = r10;
        r8.prob = r13;
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.CameraHardwareFace.copyExFace(com.android.camera2.CameraHardwareFace, android.hardware.camera2.params.Face, float, float, float, float):void");
    }
}
