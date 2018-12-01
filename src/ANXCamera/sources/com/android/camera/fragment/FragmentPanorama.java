package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Handler;
import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraScreenNail.RequestRenderListener;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$PanoramaProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.GLTextureView;
import com.android.camera.ui.GLTextureView.EGLShareContextGetter;
import com.android.camera.ui.PanoMovingIndicatorView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.GLCanvas;
import io.reactivex.Completable;
import java.util.List;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.opengles.GL10;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FragmentPanorama extends BaseFragment implements ModeProtocol$PanoramaProtocol, RequestRenderListener, OnClickListener {
    private int mArrowMargin;
    private Interpolator mCubicEaseInOutInterpolator = new CubicEaseInOutInterpolator();
    private Handler mHandler = new Handler();
    private ImageView mIndicator;
    private int mMoveDirection = -1;
    private View mMoveReferenceLine;
    private PanoMovingIndicatorView mMovingDirectionView;
    private PanoramaArrowAnimateDrawable mPanoramaArrowAnimateDrawable = new PanoramaArrowAnimateDrawable();
    private ImageView mPanoramaPreview;
    private View mPanoramaViewRoot;
    private GLTextureView mStillPreview;
    private View mStillPreviewHintArea;
    private int mStillPreviewTextureHeight;
    private int mStillPreviewTextureOffsetX;
    private int mStillPreviewTextureOffsetY;
    private int mStillPreviewTextureWidth;
    private TextView mUseHint;
    private boolean mWaitingFirstFrame = false;

    private class StillPreviewRender implements Renderer {
        private DrawExtTexAttribute mExtTexture;
        float[] mTransform;

        /* synthetic */ StillPreviewRender(FragmentPanorama this$0, StillPreviewRender -this1) {
            this();
        }

        private StillPreviewRender() {
            this.mExtTexture = new DrawExtTexAttribute(true);
            this.mTransform = new float[16];
        }

        public void onSurfaceCreated(GL10 gl10, EGLConfig eglConfig) {
        }

        public void onSurfaceChanged(GL10 gl10, int width, int height) {
        }

        public void onDrawFrame(GL10 gl10) {
            CameraScreenNail screen = ((ActivityBase) FragmentPanorama.this.getContext()).getCameraScreenNail();
            GLCanvas canvas = ((ActivityBase) FragmentPanorama.this.getContext()).getGLView().getGLCanvas();
            if (screen != null && canvas != null) {
                synchronized (canvas) {
                    canvas.clearBuffer();
                    int oldWidth = canvas.getWidth();
                    int oldHeight = canvas.getHeight();
                    canvas.getState().pushState();
                    canvas.setSize(FragmentPanorama.this.mStillPreview.getWidth(), FragmentPanorama.this.mStillPreview.getHeight());
                    screen.getSurfaceTexture().getTransformMatrix(this.mTransform);
                    canvas.draw(this.mExtTexture.init(screen.getExtTexture(), this.mTransform, FragmentPanorama.this.mStillPreviewTextureOffsetX, FragmentPanorama.this.mStillPreviewTextureOffsetY, FragmentPanorama.this.mStillPreviewTextureWidth, FragmentPanorama.this.mStillPreviewTextureHeight));
                    canvas.setSize(oldWidth, oldHeight);
                    canvas.getState().popState();
                    canvas.recycledResources();
                }
                if (FragmentPanorama.this.mWaitingFirstFrame) {
                    FragmentPanorama.this.mWaitingFirstFrame = false;
                    FragmentPanorama.this.mHandler.post(new Runnable() {
                        public void run() {
                            FragmentPanorama.this.mMoveReferenceLine.setVisibility(0);
                            FragmentPanorama.this.mIndicator.setVisibility(0);
                        }
                    });
                }
            }
        }
    }

    protected void initView(View v) {
        this.mPanoramaViewRoot = v;
        this.mIndicator = (ImageView) this.mPanoramaViewRoot.findViewById(R.id.pano_arrow);
        this.mUseHint = (TextView) this.mPanoramaViewRoot.findViewById(R.id.pano_use_hint);
        this.mIndicator.setImageDrawable(this.mPanoramaArrowAnimateDrawable);
        this.mArrowMargin = getResources().getDimensionPixelSize(R.dimen.pano_arrow_margin);
        if (Util.isNotchDevice) {
            setViewMargin(this.mPanoramaViewRoot, Util.sStatusBarHeight);
        }
        this.mPanoramaPreview = (ImageView) this.mPanoramaViewRoot.findViewById(R.id.panorama_image_preview);
        this.mStillPreview = (GLTextureView) this.mPanoramaViewRoot.findViewById(R.id.panorama_still_preview);
        this.mMovingDirectionView = (PanoMovingIndicatorView) this.mPanoramaViewRoot.findViewById(R.id.pano_move_direction_view);
        this.mMoveReferenceLine = this.mPanoramaViewRoot.findViewById(R.id.pano_move_reference_line);
        this.mStillPreviewHintArea = this.mPanoramaViewRoot.findViewById(R.id.pano_still_preview_hint_area);
        this.mPanoramaViewRoot.findViewById(R.id.pano_preview_hint_frame).setOnClickListener(this);
        if (this.mStillPreview.getRenderer() == null) {
            StillPreviewRender stillPreviewRender = new StillPreviewRender(this, null);
            this.mStillPreview.setEGLContextClientVersion(2);
            this.mStillPreview.setEGLShareContextGetter(new EGLShareContextGetter() {
                public EGLContext getShareContext() {
                    return ((ActivityBase) FragmentPanorama.this.getContext()).getGLView().getEGLContext();
                }
            });
            this.mStillPreview.setRenderer(stillPreviewRender);
            this.mStillPreview.setRenderMode(0);
            this.mStillPreview.onPause();
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.pano_view;
    }

    public int getFragmentInto() {
        return 4080;
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(176, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(176, this);
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            if (this.mMoveDirection == 5) {
                CameraStatUtil.trackDirectionChanged(4);
                moveToDirection(4);
            } else if (this.mMoveDirection == 4) {
                CameraStatUtil.trackDirectionChanged(5);
                moveToDirection(5);
            }
            CameraSettings.setPanoramaMoveDirection(this.mMoveDirection);
        }
    }

    private void setViewMargin(View view, int topMargin) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.topMargin = topMargin;
        view.setLayoutParams(marginLayoutParams);
    }

    public void initPreviewLayout(int width, int height, int previewWidth, int previewHeight) {
        this.mMoveDirection = CameraSettings.getPanoramaMoveDirection();
        LayoutParams params = this.mStillPreview.getLayoutParams();
        params.width = width;
        params.height = height;
        this.mStillPreviewTextureWidth = params.width;
        this.mStillPreviewTextureHeight = (params.width * previewWidth) / previewHeight;
        this.mStillPreviewTextureOffsetX = 0;
        this.mStillPreviewTextureOffsetY = (-(this.mStillPreviewTextureHeight - params.height)) / 2;
        this.mStillPreview.requestLayout();
    }

    public void moveToDirection(int direction) {
        this.mMoveDirection = direction;
        float translationX = this.mIndicator.getTranslationX();
        float transformationRatio = this.mPanoramaArrowAnimateDrawable.getTransformationRatio();
        if (this.mMoveDirection == 4) {
            translationX = (float) (this.mStillPreviewTextureWidth + this.mArrowMargin);
            transformationRatio = 2.0f;
        } else if (this.mMoveDirection == 5) {
            translationX = (float) (((Util.sWindowWidth - this.mStillPreviewTextureWidth) - this.mArrowMargin) - this.mIndicator.getWidth());
            transformationRatio = 0.0f;
        }
        ObjectAnimator.ofFloat(this.mIndicator, "translationX", new float[]{this.mIndicator.getTranslationX(), translationX}).setDuration(500);
        ObjectAnimator.ofFloat(this.mPanoramaArrowAnimateDrawable, "transformationRatio", new float[]{this.mPanoramaArrowAnimateDrawable.getTransformationRatio(), transformationRatio}).setDuration(500);
        ObjectAnimator.ofFloat(this.mStillPreview, "alpha", new float[]{this.mStillPreview.getAlpha(), 0.0f}).setDuration(250);
        ObjectAnimator previewFadeInAnimator = ObjectAnimator.ofFloat(this.mStillPreview, "alpha", new float[]{0.0f, 1.0f});
        previewFadeInAnimator.setDuration(250);
        previewFadeInAnimator.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animation) {
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) FragmentPanorama.this.mStillPreview.getLayoutParams();
                if (FragmentPanorama.this.mMoveDirection == 5) {
                    layoutParams.removeRule(9);
                    layoutParams.addRule(11);
                } else if (FragmentPanorama.this.mMoveDirection == 4) {
                    layoutParams.removeRule(11);
                    layoutParams.addRule(9);
                }
                FragmentPanorama.this.mStillPreview.requestLayout();
            }
        });
        new AnimatorSet().playSequentially(new Animator[]{previewFadeOutAnimator, previewFadeInAnimator});
        AnimatorSet animator = new AnimatorSet();
        animator.playTogether(new Animator[]{arrowMoveAnimator, arrowTransformAnimator, previewFadeOutInAnimator});
        animator.setInterpolator(this.mCubicEaseInOutInterpolator);
        animator.start();
    }

    public void requestRender() {
        if (this.mStillPreviewHintArea != null && this.mStillPreviewHintArea.isShown()) {
            this.mStillPreview.requestRender();
        }
    }

    public void setShootUI() {
        setClickEnable(false);
        this.mMovingDirectionView.setVisibility(8);
        this.mStillPreviewHintArea.setVisibility(0);
    }

    public void resetShootUI() {
        setClickEnable(true);
        this.mStillPreviewHintArea.setVisibility(8);
        this.mStillPreview.onPause();
        this.mMovingDirectionView.setVisibility(8);
        this.mUseHint.setText(R.string.pano_how_to_use_prompt_start);
    }

    public void showSmallPreview(boolean animation) {
        this.mMovingDirectionView.setVisibility(8);
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.mStillPreview.getLayoutParams();
        if (this.mMoveDirection == 5) {
            layoutParams.removeRule(9);
            layoutParams.addRule(11);
            this.mIndicator.setTranslationX((float) (((Util.sWindowWidth - this.mStillPreviewTextureWidth) - this.mArrowMargin) - this.mIndicator.getWidth()));
            this.mPanoramaArrowAnimateDrawable.setTransformationRatio(0.0f);
        } else if (this.mMoveDirection == 4) {
            layoutParams.removeRule(11);
            layoutParams.addRule(9);
            this.mIndicator.setTranslationX((float) (this.mStillPreviewTextureWidth + this.mArrowMargin));
            this.mPanoramaArrowAnimateDrawable.setTransformationRatio(2.0f);
        }
        this.mStillPreview.requestLayout();
        this.mStillPreview.onResume();
        this.mStillPreview.requestRender();
        this.mStillPreviewHintArea.setVisibility(0);
        this.mWaitingFirstFrame = true;
        if (animation) {
            Completable.create(new AlphaInOnSubscribe(this.mPanoramaViewRoot).setDurationTime(600)).subscribe();
        } else {
            AlphaInOnSubscribe.directSetResult(this.mPanoramaViewRoot);
        }
    }

    public void setDisplayPreviewBitmap(Bitmap bitmap) {
        this.mPanoramaPreview.setImageBitmap(bitmap);
    }

    public void setDirectionTooFast(boolean tooFast, int moveSpeed) {
        this.mMovingDirectionView.setTooFast(tooFast, moveSpeed);
    }

    public void setDirectionPosition(Point attachedPos, int previewRefY) {
        this.mMovingDirectionView.setPosition(attachedPos, previewRefY);
    }

    public void onPreviewMoving() {
        if (this.mStillPreviewHintArea.getVisibility() == 0) {
            return;
        }
        if (this.mMovingDirectionView.isTooFast()) {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_slow_down);
        } else if (this.mMovingDirectionView.isFar()) {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_align_reference_line);
        } else {
            this.mUseHint.setText(R.string.pano_how_to_use_prompt_go_on_moving);
        }
    }

    public void onCaptureOrientationDecided(int direction, int offsetX, int offsetY) {
        this.mStillPreviewHintArea.setVisibility(8);
        this.mStillPreview.onPause();
        this.mUseHint.setText(R.string.pano_how_to_use_prompt_go_on_moving);
        this.mMovingDirectionView.setVisibility(0);
        this.mMovingDirectionView.setDisplayCenterY((this.mMoveReferenceLine.getHeight() / 2) + Util.getRelativeLocation(this.mMovingDirectionView, this.mMoveReferenceLine)[1]);
        this.mMovingDirectionView.setMovingAttribute(direction, offsetX, offsetY);
    }

    public boolean isShown() {
        return this.mPanoramaViewRoot.isShown();
    }

    public void onPause() {
        super.onPause();
        this.mStillPreview.onPause();
        this.mPanoramaPreview.setImageDrawable(null);
    }

    public void onResume() {
        super.onResume();
        this.mPanoramaViewRoot.setVisibility(4);
        this.mMoveReferenceLine.setVisibility(4);
        this.mIndicator.setVisibility(4);
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        switch (newMode) {
            case 166:
                return;
            default:
                if (this.mPanoramaViewRoot.getVisibility() != 0) {
                    return;
                }
                if (animateInElements == null) {
                    AlphaOutOnSubscribe.directSetResult(this.mPanoramaViewRoot);
                    return;
                } else {
                    animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mPanoramaViewRoot).setDurationTime(150)));
                    return;
                }
        }
    }

    public void notifyAfterFrameAvailable(int arrivedType) {
        super.notifyAfterFrameAvailable(arrivedType);
        if (this.mCurrentMode == 166 && this.mPanoramaViewRoot.getVisibility() != 0) {
            showSmallPreview(true);
        }
    }
}
