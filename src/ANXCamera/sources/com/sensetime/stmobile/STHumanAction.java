package com.sensetime.stmobile;

import com.sensetime.stmobile.model.STImage;
import com.sensetime.stmobile.model.STMobile106;
import com.sensetime.stmobile.model.STMobileFaceAction;
import com.sensetime.stmobile.model.STMobileHandAction;

public class STHumanAction {
    public int backGroundRet;
    public int faceCount;
    public STMobileFaceAction[] faces;
    public int handCount;
    public STMobileHandAction[] hands;
    public STImage image;

    public STMobile106[] getMobileFaces() {
        if (this.faceCount == 0) {
            return null;
        }
        STMobile106[] arrayFaces = new STMobile106[this.faceCount];
        for (int i = 0; i < this.faceCount; i++) {
            arrayFaces[i] = this.faces[i].face;
        }
        return arrayFaces;
    }

    public boolean replaceMobile106(STMobile106[] arrayFaces) {
        if (arrayFaces == null || arrayFaces.length == 0 || this.faces == null || this.faceCount != arrayFaces.length) {
            return false;
        }
        for (int i = 0; i < arrayFaces.length; i++) {
            this.faces[i].face = arrayFaces[i];
        }
        return true;
    }
}
