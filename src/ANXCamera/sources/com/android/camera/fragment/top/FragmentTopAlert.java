package com.android.camera.fragment.top;

import android.animation.LayoutTransition;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.ui.ToggleSwitch;
import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class FragmentTopAlert extends BaseFragment {
    private static final String TAG = FragmentTopAlert.class.getSimpleName();
    private final int HINT_DELAY_TIME = 2000;
    private ToggleSwitch mAiSceneSelectView;
    private TextView mAiSceneSwitchHintText;
    private long mAlertAiSceneSwitchHintTime;
    private int mAlertAiSceneSwitchHintTopMargin;
    private int mAlertImageType = -1;
    private ImageView mAlertImageView;
    private LinearLayout mAlertLiearLayout;
    private TextView mAlertRecordingText;
    private TextView mAlertStatusValue;
    private AlphaAnimation mBlingAnimation;
    private LayoutTransition mLayoutTransition;
    private int mSelectorTopMargin;
    private boolean mShow;
    private String mStateValueText = "";
    public final Runnable mViewHideRunnable = new Runnable() {
        public void run() {
            FragmentTopAlert.this.mAiSceneSwitchHintText.setVisibility(8);
            if (FragmentTopAlert.this.mAlertImageView.getVisibility() != 0) {
                FragmentTopAlert.this.transViewAnim(FragmentTopAlert.this.mAiSceneSelectView, FragmentTopAlert.this.mAlertAiSceneSwitchHintTopMargin);
            }
        }
    };
    private Runnable showAction = new Runnable() {
        public void run() {
            if (FragmentTopAlert.this.mAlertImageView.getVisibility() == 0) {
                FragmentTopAlert.this.setViewMargin(FragmentTopAlert.this.mAiSceneSelectView, FragmentTopAlert.this.getAlertImageBottom());
            } else if (FragmentTopAlert.this.mAiSceneSwitchHintText.getVisibility() == 0) {
                FragmentTopAlert.this.setViewMargin(FragmentTopAlert.this.mAiSceneSelectView, FragmentTopAlert.this.getViewBottom(FragmentTopAlert.this.mAiSceneSwitchHintText));
            } else {
                FragmentTopAlert.this.setViewMargin(FragmentTopAlert.this.mAiSceneSelectView, FragmentTopAlert.this.mSelectorTopMargin);
            }
            if (FragmentTopAlert.this.mAiSceneSelectView.getVisibility() == 8) {
                ViewCompat.setAlpha(FragmentTopAlert.this.mAiSceneSelectView, 0.0f);
                FragmentTopAlert.this.mAiSceneSelectView.setVisibility(0);
                ViewCompat.animate(FragmentTopAlert.this.mAiSceneSelectView).setInterpolator(new CubicEaseOutInterpolator()).alpha(1.0f).setDuration(400).start();
            }
        }
    };

    @Retention(RetentionPolicy.SOURCE)
    @interface AlertImageType {
    }

    protected void initView(View v) {
        this.mAlertImageView = (ImageView) v.findViewById(R.id.alert_image);
        this.mAlertRecordingText = (TextView) v.findViewById(R.id.alert_recording_time_view);
        this.mAlertStatusValue = (TextView) v.findViewById(R.id.alert_status_value);
        this.mAiSceneSelectView = (ToggleSwitch) v.findViewById(R.id.alert_ai_scene_select);
        this.mAiSceneSwitchHintText = (TextView) v.findViewById(R.id.alert_ai_scene_hint);
        this.mAlertLiearLayout = (LinearLayout) v.findViewById(R.id.top_alert_container);
        if (Util.isNotchDevice) {
            setViewMargin(this.mAlertRecordingText, Util.sStatusBarHeight);
        }
        this.mLayoutTransition = customTransition();
        this.mAlertLiearLayout.setLayoutTransition(this.mLayoutTransition);
        ViewCompat.setAlpha(this.mAlertRecordingText, 0.0f);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_alert;
    }

    public int getFragmentInto() {
        return 253;
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        if (this.mBlingAnimation != null) {
            this.mBlingAnimation.cancel();
            this.mBlingAnimation = null;
        }
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        clear();
        setShow(true);
    }

    public void setRecordingTimeState(int state) {
        switch (state) {
            case 1:
                switch (DataRepository.dataItemGlobal().getCurrentMode()) {
                    case 161:
                        this.mAlertRecordingText.setText("00:10");
                        break;
                    case 162:
                    case 168:
                    case 169:
                    case 170:
                        this.mAlertRecordingText.setText("00:00");
                        break;
                }
                ViewCompat.animate(this.mAlertRecordingText).alpha(1.0f).start();
                return;
            case 2:
                if (this.mBlingAnimation != null) {
                    this.mBlingAnimation.cancel();
                }
                ViewCompat.animate(this.mAlertRecordingText).alpha(0.0f).start();
                return;
            case 3:
                if (this.mBlingAnimation == null) {
                    this.mBlingAnimation = new AlphaAnimation(1.0f, 0.0f);
                    this.mBlingAnimation.setDuration(400);
                    this.mBlingAnimation.setStartOffset(100);
                    this.mBlingAnimation.setInterpolator(new DecelerateInterpolator());
                    this.mBlingAnimation.setRepeatMode(2);
                    this.mBlingAnimation.setRepeatCount(-1);
                }
                this.mAlertRecordingText.startAnimation(this.mBlingAnimation);
                return;
            case 4:
                this.mBlingAnimation.cancel();
                return;
            default:
                return;
        }
    }

    private LayoutTransition customTransition() {
        LayoutTransition transition = new LayoutTransition();
        transition.setInterpolator(2, new SineEaseInOutInterpolator());
        transition.setStartDelay(2, 0);
        transition.setDuration(2, 200);
        transition.setInterpolator(3, new SineEaseInOutInterpolator());
        transition.setStartDelay(3, 0);
        transition.setDuration(3, 200);
        transition.setInterpolator(4, new DecelerateInterpolator());
        transition.setStartDelay(4, 0);
        transition.setDuration(4, 200);
        transition.setInterpolator(0, new CubicEaseOutInterpolator());
        transition.setStartDelay(0, 0);
        transition.setDuration(0, 200);
        transition.setInterpolator(1, new CubicEaseOutInterpolator());
        transition.setStartDelay(1, 0);
        transition.setDuration(1, 200);
        transition.setAnimateParentHierarchy(true);
        return transition;
    }

    public void updateRecordingTime(String value) {
        this.mAlertRecordingText.setText(value);
    }

    public void alertHDR(int visible, int topMargin, boolean live) {
        if (visible == 0) {
            int newType = live ? 4 : 3;
            if (this.mAlertImageType != newType) {
                this.mAlertImageType = newType;
                this.mAlertImageView.setImageResource(live ? R.drawable.ic_alert_hdr_live : R.drawable.ic_alert_hdr);
            } else {
                return;
            }
        } else if (this.mAlertImageType == 4 || this.mAlertImageType == 3) {
            this.mAlertImageType = -1;
        } else {
            return;
        }
        setAlertImageVisible(visible, topMargin);
    }

    public void alertFlash(int visible, int topMargin, boolean torch) {
        if (visible == 0) {
            int newType = torch ? 2 : 1;
            if (this.mAlertImageType != newType) {
                this.mAlertImageType = newType;
                if (CameraSettings.isFrontCamera() && Device.isSupportFrontFlash()) {
                    torch = false;
                }
                this.mAlertImageView.setImageResource(torch ? R.drawable.ic_alert_flash_torch : R.drawable.ic_alert_flash);
            } else {
                return;
            }
        } else if (this.mAlertImageType == 2 || this.mAlertImageType == 1) {
            this.mAlertImageType = -1;
        } else {
            return;
        }
        setAlertImageVisible(visible, topMargin);
    }

    public void alertAiSceneSelector(int visible, int topMargin, OnCheckedChangeListener listener) {
        if (visible == 0) {
            this.mSelectorTopMargin = topMargin;
            long delayTime = 2000 - (System.currentTimeMillis() - this.mAlertAiSceneSwitchHintTime);
            ToggleSwitch toggleSwitch = this.mAiSceneSelectView;
            Runnable runnable = this.showAction;
            if (delayTime < 0) {
                delayTime = 0;
            }
            toggleSwitch.postDelayed(runnable, delayTime);
        } else {
            this.mAiSceneSelectView.removeCallbacks(this.showAction);
            if (this.mAiSceneSelectView.getVisibility() == 0) {
                ViewCompat.setAlpha(this.mAiSceneSelectView, 1.0f);
                ViewCompat.animate(this.mAiSceneSelectView).setInterpolator(new CubicEaseOutInterpolator()).alpha(0.0f).setDuration(400).start();
                this.mAiSceneSelectView.setVisibility(8);
            }
        }
        this.mAiSceneSelectView.setChecked(false);
        this.mAiSceneSelectView.setOnCheckedChangeListener(listener);
    }

    public void alertAiSceneSwitchHint(int visible, int topMargin) {
        setViewMargin(this.mAiSceneSwitchHintText, topMargin);
        this.mAlertAiSceneSwitchHintTopMargin = topMargin;
        if (visible == 0) {
            this.mAiSceneSwitchHintText.setText(R.string.pref_camera_front_ai_scene_entry_on);
        } else {
            this.mAiSceneSwitchHintText.setText(R.string.pref_camera_front_ai_scene_entry_off);
        }
        this.mAiSceneSwitchHintText.setVisibility(0);
        this.mAlertAiSceneSwitchHintTime = System.currentTimeMillis();
        this.mAiSceneSwitchHintText.removeCallbacks(this.mViewHideRunnable);
        this.mAiSceneSwitchHintText.postDelayed(this.mViewHideRunnable, 2000);
    }

    public void alertUpdateValue(int type, int topMargin) {
        this.mStateValueText = "";
        ModeProtocol$DualController dualController = (ModeProtocol$DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null || !dualController.isZoomVisible()) {
            String zoomValue = getUpdateZoom();
            if (zoomValue != null) {
                this.mStateValueText += zoomValue;
            }
            if (TextUtils.isEmpty(this.mStateValueText)) {
                this.mAlertStatusValue.setVisibility(8);
            } else {
                if (this.mAlertStatusValue.getVisibility() != 0) {
                    if (this.mAlertImageView.getVisibility() == 0) {
                        setViewMargin(this.mAlertStatusValue, getAlertImageBottom());
                    } else {
                        setViewMargin(this.mAlertStatusValue, topMargin);
                    }
                    this.mAlertStatusValue.setVisibility(0);
                }
                this.mAlertStatusValue.setText(this.mStateValueText);
            }
        }
    }

    public void setShow(boolean show) {
        this.mShow = show;
    }

    public boolean isShow() {
        return this.mShow;
    }

    public void clear() {
        this.mStateValueText = "";
        this.mAlertImageType = -1;
        if (this.mAlertStatusValue.getVisibility() != 8) {
            this.mAlertStatusValue.setVisibility(8);
        }
        if (this.mAlertImageView.getVisibility() != 8) {
            this.mAlertImageView.setVisibility(8);
        }
        if (this.mAiSceneSelectView.getVisibility() != 8) {
            this.mAiSceneSelectView.setVisibility(8);
        }
        if (this.mAiSceneSwitchHintText.getVisibility() != 8) {
            this.mAiSceneSwitchHintText.setVisibility(8);
        }
    }

    private void setAlertImageVisible(int visible, int topMargin) {
        if (visible == 0) {
            setViewMargin(this.mAlertImageView, topMargin);
            this.mAlertImageView.setVisibility(0);
            transViewAnim(this.mAlertStatusValue, getAlertImageBottom());
            if (this.mAiSceneSwitchHintText.getVisibility() != 0) {
                transViewAnim(this.mAiSceneSelectView, getAlertImageBottom());
                return;
            }
            return;
        }
        if (this.mAlertImageView.getVisibility() == 0) {
            this.mAlertImageView.setVisibility(8);
        }
        transViewAnim(this.mAlertStatusValue, topMargin);
        if (this.mAiSceneSwitchHintText.getVisibility() != 0) {
            transViewAnim(this.mAiSceneSelectView, topMargin);
        }
    }

    private void transViewAnim(View view, int margin) {
        if (view.getVisibility() == 0) {
            Completable.create(new TranslateYOnSubscribe(view, margin - ((MarginLayoutParams) view.getLayoutParams()).topMargin).setDurationTime(100)).subscribe();
        }
    }

    private void setViewMargin(View view, int topMargin) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.topMargin = topMargin;
        view.setLayoutParams(marginLayoutParams);
        ViewCompat.setTranslationY(view, 0.0f);
    }

    private int getAlertImageBottom() {
        if (this.mAlertImageView.getVisibility() != 0) {
            return 0;
        }
        return ((((MarginLayoutParams) this.mAlertImageView.getLayoutParams()).topMargin + this.mAlertImageView.getDrawable().getIntrinsicHeight()) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width)) - getResources().getDimensionPixelSize(R.dimen.top_alert_correct_height);
    }

    private int getViewBottom(View view) {
        if (view.getVisibility() != 0) {
            return 0;
        }
        return ((((MarginLayoutParams) view.getLayoutParams()).topMargin + view.getHeight()) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width)) - getResources().getDimensionPixelSize(R.dimen.top_alert_correct_height);
    }

    private String getUpdateZoom() {
        float zoomRatio = CameraSettings.readZoom();
        if (zoomRatio == 1.0f) {
            return null;
        }
        int zoomSig = (int) zoomRatio;
        return "x " + zoomSig + "." + ((int) ((zoomRatio - ((float) zoomSig)) * 10.0f));
    }
}
