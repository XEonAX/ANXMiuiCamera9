.class public Lcom/android/camera/fragment/top/ExtraAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ExtraAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/android/camera/fragment/CommonRecyclerViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataItemConfig:Lcom/android/camera/data/data/config/DataItemConfig;

.field private mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

.field private mDegree:I

.field private mImageNormalColor:I

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mSelectedColor:I

.field private mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

.field private mTAG:I

.field private mTextNormalColor:I


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/SupportedConfigs;Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1, "supportedConfigs"    # Lcom/android/camera/data/data/config/SupportedConfigs;
    .param p2, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mTAG:I

    .line 46
    iput-object p1, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 47
    iput-object p2, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 48
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    .line 49
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemConfig:Lcom/android/camera/data/data/config/DataItemConfig;

    .line 50
    const v0, -0x4c000001

    iput v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mTextNormalColor:I

    .line 51
    const v0, -0x141415

    iput v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mImageNormalColor:I

    .line 52
    const v0, -0xe66d19

    iput v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSelectedColor:I

    .line 53
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 69
    check-cast p1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/top/ExtraAdapter;->onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/CommonRecyclerViewHolder;I)V
    .locals 22
    .param p1, "holder"    # Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfig(I)I

    move-result v8

    .line 74
    .local v8, "config":I
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 75
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    const/16 v16, 0x0

    .line 78
    .local v16, "topResourceId":I
    const/4 v14, -0x1

    .line 80
    .local v14, "textResource":I
    const/4 v12, 0x0

    .line 82
    .local v12, "selected":Z
    packed-switch v8, :pswitch_data_0

    .line 205
    .end local v12    # "selected":Z
    :goto_0
    :pswitch_0
    const v17, 0x7f0a0042

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    .line 206
    .local v15, "textView":Landroid/widget/TextView;
    const v17, 0x7f0a0041

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->getView(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/android/camera/ui/ColorImageView;

    .line 207
    .local v10, "imageView":Lcom/android/camera/ui/ColorImageView;
    invoke-virtual {v15, v14}, Landroid/widget/TextView;->setText(I)V

    .line 209
    if-eqz v12, :cond_3

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSelectedColor:I

    .line 210
    .local v13, "textColor":I
    :goto_1
    if-eqz v12, :cond_4

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mSelectedColor:I

    .line 211
    .local v9, "imageColor":I
    :goto_2
    invoke-virtual {v15, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    invoke-virtual {v10, v9}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 213
    move/from16 v0, v16

    invoke-virtual {v10, v0}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 214
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 215
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mTAG:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v0, v8, :cond_0

    .line 216
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .local v5, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 218
    if-eqz v12, :cond_5

    .line 219
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f0f00dc

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    :goto_3
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 224
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    new-instance v18, Lcom/android/camera/fragment/top/ExtraAdapter$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/top/ExtraAdapter$1;-><init>(Lcom/android/camera/fragment/top/ExtraAdapter;Lcom/android/camera/fragment/CommonRecyclerViewHolder;)V

    .line 229
    const-wide/16 v20, 0x64

    .line 224
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 232
    .end local v5    # "builder":Ljava/lang/StringBuilder;
    :cond_0
    return-void

    .line 84
    .end local v9    # "imageColor":I
    .end local v10    # "imageView":Lcom/android/camera/ui/ColorImageView;
    .end local v13    # "textColor":I
    .end local v15    # "textView":Landroid/widget/TextView;
    .restart local v12    # "selected":Z
    :pswitch_1
    const v16, 0x7f0200ab

    .line 85
    const v14, 0x7f0f019d

    .line 86
    goto/16 :goto_0

    .line 90
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v7

    .line 91
    .local v7, "componentRunningTimer":Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    invoke-virtual {v7}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->isSwitchOn()Z

    move-result v12

    .line 93
    .local v12, "selected":Z
    const/16 v17, 0xa0

    .line 92
    move/from16 v0, v17

    invoke-virtual {v7, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getValueSelectedDrawable(I)I

    move-result v16

    .line 95
    const/16 v17, 0xa0

    .line 94
    move/from16 v0, v17

    invoke-virtual {v7, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getValueDisplayString(I)I

    move-result v14

    goto/16 :goto_0

    .line 100
    .end local v7    # "componentRunningTimer":Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    .local v12, "selected":Z
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v6

    .line 101
    .local v6, "componentRunningTiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_tilt_shift_mode"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .line 102
    .local v12, "selected":Z
    if-eqz v12, :cond_1

    .line 104
    const/16 v17, 0xa0

    .line 103
    move/from16 v0, v17

    invoke-virtual {v6, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getValueDisplayString(I)I

    move-result v14

    .line 106
    const/16 v17, 0xa0

    .line 105
    move/from16 v0, v17

    invoke-virtual {v6, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getValueSelectedDrawable(I)I

    move-result v16

    goto/16 :goto_0

    .line 108
    :cond_1
    const v14, 0x7f0f01a1

    .line 109
    const v16, 0x7f0200c4

    goto/16 :goto_0

    .line 114
    .end local v6    # "componentRunningTiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    .local v12, "selected":Z
    :pswitch_4
    const v16, 0x7f0200c2

    .line 115
    const v14, 0x7f0f019e

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_gradienter_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 120
    .local v12, "selected":Z
    :pswitch_5
    const v16, 0x7f0200c3

    .line 121
    const v14, 0x7f0f01a4

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_super_resolution_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 126
    .local v12, "selected":Z
    :pswitch_6
    const v16, 0x7f0200bb

    .line 127
    const v14, 0x7f0f019f

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_hand_night_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 132
    .local v12, "selected":Z
    :pswitch_7
    const v16, 0x7f0200bc

    .line 133
    const v14, 0x7f0f01a3

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_ubifocus_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 138
    .local v12, "selected":Z
    :pswitch_8
    const v16, 0x7f0200b6

    .line 139
    const v14, 0x7f0f01a0

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_groupshot_mode_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 144
    .local v12, "selected":Z
    :pswitch_9
    const v16, 0x7f0200bf

    .line 145
    const v14, 0x7f0f01a2

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_scenemode_setting_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 150
    .local v12, "selected":Z
    :pswitch_a
    const v16, 0x7f0200c1

    .line 151
    const v14, 0x7f0f012e

    .line 152
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 156
    .local v12, "selected":Z
    :pswitch_b
    const v16, 0x7f0200ac

    .line 157
    const v14, 0x7f0f012d

    .line 158
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 162
    .local v12, "selected":Z
    :pswitch_c
    const v16, 0x7f0200bd

    .line 163
    const v14, 0x7f0f0164

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_magic_mirror_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 168
    .local v12, "selected":Z
    :pswitch_d
    const v16, 0x7f0200be

    .line 169
    const v14, 0x7f0f0042

    .line 170
    goto/16 :goto_0

    .line 173
    :pswitch_e
    const v16, 0x7f0200b5

    .line 174
    const v14, 0x7f0f011f

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    move-object/from16 v17, v0

    const-string/jumbo v18, "pref_camera_show_gender_age_key"

    invoke-virtual/range {v17 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 179
    .local v12, "selected":Z
    :pswitch_f
    const v16, 0x7f0200aa

    .line 180
    const v14, 0x7f0f0104

    .line 181
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v12

    .local v12, "selected":Z
    goto/16 :goto_0

    .line 185
    .local v12, "selected":Z
    :pswitch_10
    const/4 v12, 0x0

    .line 186
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v17

    if-eqz v17, :cond_2

    .line 187
    const v16, 0x7f0200a6

    .line 188
    const v14, 0x7f0f014f

    goto/16 :goto_0

    .line 190
    :cond_2
    const v16, 0x7f0200a5

    .line 191
    const v14, 0x7f0f014e

    goto/16 :goto_0

    .line 196
    :pswitch_11
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v11

    .line 197
    .local v11, "mode":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDataItemConfig:Lcom/android/camera/data/data/config/DataItemConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v4

    .line 198
    .local v4, "beautyConfig":Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    invoke-virtual {v4, v11}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isSwitchOn(I)Z

    move-result v12

    .line 199
    .local v12, "selected":Z
    invoke-virtual {v4, v11}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getValueSelectedDrawable(I)I

    move-result v16

    .line 200
    invoke-virtual {v4, v11}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getValueDisplayString(I)I

    move-result v14

    goto/16 :goto_0

    .line 209
    .end local v4    # "beautyConfig":Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    .end local v11    # "mode":I
    .end local v12    # "selected":Z
    .restart local v10    # "imageView":Lcom/android/camera/ui/ColorImageView;
    .restart local v15    # "textView":Landroid/widget/TextView;
    :cond_3
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mTextNormalColor:I

    .restart local v13    # "textColor":I
    goto/16 :goto_1

    .line 210
    :cond_4
    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/fragment/top/ExtraAdapter;->mImageNormalColor:I

    .restart local v9    # "imageColor":I
    goto/16 :goto_2

    .line 221
    .restart local v5    # "builder":Ljava/lang/StringBuilder;
    :cond_5
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/fragment/CommonRecyclerViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f0f00dd

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 82
    nop

    :pswitch_data_0
    .packed-switch 0xe1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_7
        :pswitch_a
        :pswitch_b
        :pswitch_9
        :pswitch_8
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_11
        :pswitch_f
        :pswitch_5
        :pswitch_10
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/top/ExtraAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/CommonRecyclerViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v3, 0x0

    .line 61
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 62
    const v2, 0x7f04001e

    .line 61
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 63
    .local v0, "view":Landroid/view/View;
    iget v1, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDegree:I

    if-eqz v1, :cond_0

    .line 64
    iget v1, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDegree:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 66
    :cond_0
    new-instance v1, Lcom/android/camera/fragment/CommonRecyclerViewHolder;

    invoke-direct {v1, v0}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method

.method public setNewDegree(I)V
    .locals 0
    .param p1, "newDegree"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mDegree:I

    .line 57
    return-void
.end method

.method public setOnClictTag(I)V
    .locals 0
    .param p1, "tag"    # I

    .prologue
    .line 240
    iput p1, p0, Lcom/android/camera/fragment/top/ExtraAdapter;->mTAG:I

    .line 241
    return-void
.end method
