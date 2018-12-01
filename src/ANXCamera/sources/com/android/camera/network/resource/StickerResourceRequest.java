package com.android.camera.network.resource;

import com.android.camera.network.net.BaseGalleryRequest;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.sticker.StickerInfo;
import com.google.gson.JsonParseException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class StickerResourceRequest extends BaseGalleryRequest {
    public StickerResourceRequest() {
        super(0, "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/info");
        addParam("id", Long.toString(7326868816920608L));
        setUseCache(true);
        setCacheExpires(System.currentTimeMillis() + 147122892800L);
        setCacheSoftTtl(System.currentTimeMillis() + 86400000);
        HttpManager.getInstance().putDefaultCache(getCacheKey(), "sticker_list_default");
    }

    protected void onRequestSuccess(JSONObject data) throws Exception {
        try {
            List<StickerInfo> list = new ArrayList();
            JSONArray array = data.getJSONArray("galleryResourceInfoList");
            long expireAt = data.optLong("expireAt");
            if (expireAt != 0) {
                setCacheSoftTtl(expireAt);
            }
            if (array != null) {
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    StickerInfo stickerInfo = new StickerInfo();
                    stickerInfo.id = object.optLong("id");
                    stickerInfo.icon = object.optString("icon");
                    stickerInfo.extra = object.optString("extraInfo");
                    list.add(stickerInfo);
                }
            }
            deliverResponse(list);
        } catch (JsonParseException e) {
            e.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), data);
        } catch (Exception e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), data);
        }
    }
}
