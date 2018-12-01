package com.android.camera.fragment.sticker;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.fragment.sticker.BaseSelectAdapter.BaseSelectHolder;
import com.android.camera.fragment.sticker.download.DownloadView;
import com.android.camera.network.imageloader.ImageLoaderManager;
import com.android.camera.sticker.StickerInfo;

public class StickerAdapter extends BaseSelectAdapter<StickerInfo> {

    public class StickerHolder extends BaseSelectHolder {
        public DownloadView mDownloadView;
        private ImageView mImageView;

        public StickerHolder(View itemView) {
            super(itemView);
            this.mImageView = (ImageView) itemView.findViewById(R.id.item_iv);
            this.mDownloadView = (DownloadView) itemView.findViewById(R.id.item_download);
        }

        public void bindView(int position) {
            StickerInfo data = (StickerInfo) StickerAdapter.this.getItemData(position);
            if (data.isLocal) {
                this.mImageView.setImageResource(data.imageId);
            } else {
                ImageLoaderManager.getInstance().loadImage(this.mImageView, data.icon);
            }
            int state = data.getDownloadState();
            this.mDownloadView.setStateImage(state);
            if (state == 3) {
                data.downloadState = 1;
            }
        }
    }

    public StickerAdapter(Context context) {
        super(context);
    }

    protected int getLayoutId() {
        return R.layout.fragment_sticker_item;
    }

    protected BaseSelectHolder getHolder(View view) {
        return new StickerHolder(view);
    }
}
