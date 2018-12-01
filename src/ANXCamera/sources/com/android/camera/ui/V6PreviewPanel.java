package com.android.camera.ui;

import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$PlayVideoProtocol;

public class V6PreviewPanel extends V6RelativeLayout implements OnClickListener {
    public TextView mCaptureDelayNumber;
    public RelativeLayout mCaptureDelayNumberParent;
    public V6EffectCropView mCropView;
    public FaceView mFaceView;
    public FocusView mFocusView;
    private Runnable mHidePreviewCover = new Runnable() {
        public void run() {
            V6PreviewPanel.this.mPreviewCover.setVisibility(8);
        }
    };
    private boolean mIsDelayNumInCenter = true;
    public ObjectView mObjectView;
    private View mPreviewCover;
    public V6PreviewFrame mPreviewFrame;
    public ImageView mVideoReviewImage;
    public ImageView mVideoReviewPlay;

    public V6PreviewPanel(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mFaceView = (FaceView) findChildrenById(R.id.v6_face_view);
        this.mObjectView = (ObjectView) findChildrenById(R.id.object_view);
        this.mCaptureDelayNumber = (TextView) findChildrenById(R.id.v6_capture_delay_number);
        this.mCaptureDelayNumberParent = (RelativeLayout) findChildrenById(R.id.v6_capture_delay_number_parent);
        this.mVideoReviewPlay = (ImageView) findChildrenById(R.id.v6_video_btn_play);
        this.mFocusView = (FocusView) findChildrenById(R.id.v6_focus_view);
        this.mPreviewFrame = (V6PreviewFrame) findChildrenById(R.id.v6_frame_layout);
        this.mCropView = (V6EffectCropView) findChildrenById(R.id.v6_effect_crop_view);
        this.mVideoReviewImage = (ImageView) findViewById(R.id.v6_video_review_image);
        this.mPreviewCover = findViewById(R.id.preview_cover);
        this.mVideoReviewImage.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.mVideoReviewPlay.setOnClickListener(this);
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.v6_video_btn_play /*2131361937*/:
                ((ModeProtocol$PlayVideoProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(167)).playVideo();
                return;
            default:
                return;
        }
    }

    public void showDelayNumber(String number) {
        if (this.mCaptureDelayNumberParent.getVisibility() != 0) {
            this.mCaptureDelayNumberParent.setVisibility(0);
        }
        if (this.mCaptureDelayNumber.getVisibility() != 0) {
            this.mCaptureDelayNumber.setVisibility(0);
        }
        this.mCaptureDelayNumber.setText(number);
    }

    public void hideDelayNumber() {
        if (this.mCaptureDelayNumber.getVisibility() != 8) {
            this.mCaptureDelayNumber.setVisibility(8);
        }
    }
}
