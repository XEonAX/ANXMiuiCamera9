package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.module.ModuleManager;
import com.android.camera.ui.ColorImageView;

public class ExtraAdapter extends Adapter<CommonRecyclerViewHolder> {
    private DataItemConfig mDataItemConfig;
    private DataItemRunning mDataItemRunning;
    private int mDegree;
    private int mImageNormalColor;
    private OnClickListener mOnClickListener;
    private int mSelectedColor;
    private SupportedConfigs mSupportedConfigs;
    private int mTAG = -1;
    private int mTextNormalColor;

    public ExtraAdapter(SupportedConfigs supportedConfigs, OnClickListener onClickListener) {
        this.mSupportedConfigs = supportedConfigs;
        this.mOnClickListener = onClickListener;
        this.mDataItemRunning = DataRepository.dataItemRunning();
        this.mDataItemConfig = DataRepository.dataItemConfig();
        this.mTextNormalColor = -1275068417;
        this.mImageNormalColor = -1315861;
        this.mSelectedColor = -15101209;
    }

    public void setNewDegree(int newDegree) {
        this.mDegree = newDegree;
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_top_config_extra_item, parent, false);
        if (this.mDegree != 0) {
            ViewCompat.setRotation(view, (float) this.mDegree);
        }
        return new CommonRecyclerViewHolder(view);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder holder, int position) {
        int config = this.mSupportedConfigs.getConfig(position);
        holder.itemView.setTag(Integer.valueOf(config));
        holder.itemView.setOnClickListener(this.mOnClickListener);
        int topResourceId = 0;
        int textResource = -1;
        boolean selected = false;
        switch (config) {
            case 225:
                topResourceId = R.drawable.ic_config_extra_setting;
                textResource = R.string.config_name_setting;
                break;
            case 226:
                ComponentRunningTimer componentRunningTimer = this.mDataItemRunning.getComponentRunningTimer();
                selected = componentRunningTimer.isSwitchOn();
                topResourceId = componentRunningTimer.getValueSelectedDrawable(160);
                textResource = componentRunningTimer.getValueDisplayString(160);
                break;
            case 228:
                ComponentRunningTiltValue componentRunningTiltValue = this.mDataItemRunning.getComponentRunningTiltValue();
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
                if (!selected) {
                    textResource = R.string.config_name_tilt;
                    topResourceId = R.drawable.ic_config_tilt;
                    break;
                }
                textResource = componentRunningTiltValue.getValueDisplayString(160);
                topResourceId = componentRunningTiltValue.getValueSelectedDrawable(160);
                break;
            case 229:
                topResourceId = R.drawable.ic_config_straighten;
                textResource = R.string.config_name_straighten;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                break;
            case 230:
                topResourceId = R.drawable.ic_config_hht;
                textResource = R.string.config_name_hht;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                break;
            case 231:
                topResourceId = R.drawable.ic_config_magic;
                textResource = R.string.config_name_magic;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                break;
            case 232:
                topResourceId = R.drawable.ic_config_slow_motion;
                textResource = R.string.pref_video_speed_slow_title;
                selected = ModuleManager.isSlowMotionModule();
                break;
            case 233:
                topResourceId = R.drawable.ic_config_fast_motion;
                textResource = R.string.pref_video_speed_fast_title;
                selected = ModuleManager.isFastMotionModule();
                break;
            case 234:
                topResourceId = R.drawable.ic_config_scene;
                textResource = R.string.config_name_scene;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                break;
            case 235:
                topResourceId = R.drawable.ic_config_group;
                textResource = R.string.config_name_group;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                break;
            case 236:
                topResourceId = R.drawable.ic_config_magic_mirror;
                textResource = R.string.pref_camera_magic_mirror_title;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                break;
            case 237:
                topResourceId = R.drawable.ic_config_raw;
                textResource = R.string.pref_camera_picture_format_entry_raw;
                break;
            case 238:
                topResourceId = R.drawable.ic_config_gender_age;
                textResource = R.string.pref_camera_show_gender_age_config_title;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
                break;
            case 239:
                int mode = DataRepository.dataItemGlobal().getCurrentMode();
                ComponentConfigBeauty beautyConfig = this.mDataItemConfig.getComponentConfigBeauty();
                selected = beautyConfig.isSwitchOn(mode);
                topResourceId = beautyConfig.getValueSelectedDrawable(mode);
                textResource = beautyConfig.getValueDisplayString(mode);
                break;
            case 240:
                topResourceId = R.drawable.ic_config_dual_watermark;
                textResource = R.string.pref_dualcamera_watermark_title;
                selected = CameraSettings.isDualCameraWaterMarkOpen();
                break;
            case 241:
                topResourceId = R.drawable.ic_config_super_resolution;
                textResource = R.string.config_name_super_resolution;
                selected = this.mDataItemRunning.isSwitchOn("pref_camera_super_resolution_key");
                break;
            case 242:
                selected = false;
                if (!Util.isGlobalVersion()) {
                    topResourceId = R.drawable.ic_config_ai_detect_unselected;
                    textResource = R.string.pref_ai_detect;
                    break;
                }
                topResourceId = R.drawable.ic_config_ai_glens;
                textResource = R.string.pref_google_lens;
                break;
        }
        TextView textView = (TextView) holder.getView(R.id.extra_item_text);
        ColorImageView imageView = (ColorImageView) holder.getView(R.id.extra_item_image);
        textView.setText(textResource);
        int textColor = selected ? this.mSelectedColor : this.mTextNormalColor;
        int imageColor = selected ? this.mSelectedColor : this.mImageNormalColor;
        textView.setTextColor(textColor);
        imageView.setColor(imageColor);
        imageView.setImageResource(topResourceId);
        if (Util.isAccessible() && this.mTAG == config) {
            StringBuilder builder = new StringBuilder();
            builder.append(textView.getText());
            if (selected) {
                builder.append(holder.itemView.getResources().getString(R.string.accessibility_open));
            } else {
                builder.append(holder.itemView.getResources().getString(R.string.accessibility_closed));
            }
            holder.itemView.setContentDescription(builder);
            final CommonRecyclerViewHolder commonRecyclerViewHolder = holder;
            holder.itemView.postDelayed(new Runnable() {
                public void run() {
                    commonRecyclerViewHolder.itemView.sendAccessibilityEvent(128);
                }
            }, 100);
        }
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    public void setOnClictTag(int tag) {
        this.mTAG = tag;
    }
}
