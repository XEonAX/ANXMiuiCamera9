package com.miui.internal.app;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.text.Layout;
import android.text.TextUtils;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import com.miui.internal.R;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.variable.AlertControllerWrapper.AlertParams.ActionItem;
import com.miui.internal.view.menu.MenuBuilder;
import com.miui.internal.view.menu.MenuBuilder.Callback;
import com.miui.internal.view.menu.MenuPresenter;
import com.miui.internal.widget.ActionBarContainer;
import com.miui.internal.widget.ActionBarContextView;
import com.miui.internal.widget.ActionBarView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import miui.app.ActionBar;
import miui.widget.EditableListViewWrapper;
import miui.widget.ProgressBar;

public class AlertControllerImpl implements Callback {
    private boolean[] adA;
    private View adB;
    private boolean adC;
    private DialogInterface adD;
    private EditableListViewWrapper adE;
    private Handler adF;
    private Drawable adG;
    private int adH = 0;
    private final Runnable adI = new Runnable() {
        public void run() {
            MenuBuilder createMenu = AlertControllerImpl.this.createMenu();
            if (AlertControllerImpl.this.yY(createMenu) && AlertControllerImpl.this.yZ(createMenu)) {
                AlertControllerImpl.this.setMenu(createMenu);
            } else {
                AlertControllerImpl.this.setMenu(null);
            }
        }
    };
    private final int adJ;
    private final int adK;
    private ListView adL;
    private MenuPresenter.Callback adM = new MenuPresenter.Callback() {
        public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        }

        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            return false;
        }
    };
    private CharSequence adN;
    private TextView adO;
    private final int adP;
    private ScrollView adQ;
    private final int adR;
    private CharSequence adS;
    private TextView adT;
    private View adU;
    private final Window adV;
    private Window.Callback adW = new Window.Callback() {
        public boolean dispatchKeyEvent(KeyEvent keyEvent) {
            return false;
        }

        public boolean dispatchKeyShortcutEvent(KeyEvent keyEvent) {
            return false;
        }

        public boolean dispatchTouchEvent(MotionEvent motionEvent) {
            return false;
        }

        public boolean dispatchTrackballEvent(MotionEvent motionEvent) {
            return false;
        }

        public boolean dispatchGenericMotionEvent(MotionEvent motionEvent) {
            return false;
        }

        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
            return false;
        }

        public View onCreatePanelView(int i) {
            return null;
        }

        public boolean onCreatePanelMenu(int i, Menu menu) {
            return false;
        }

        public boolean onPreparePanel(int i, View view, Menu menu) {
            return false;
        }

        public boolean onMenuOpened(int i, Menu menu) {
            return false;
        }

        public boolean onMenuItemSelected(int i, MenuItem menuItem) {
            return false;
        }

        public void onWindowAttributesChanged(LayoutParams layoutParams) {
        }

        public void onContentChanged() {
        }

        public void onWindowFocusChanged(boolean z) {
        }

        public void onAttachedToWindow() {
        }

        public void onDetachedFromWindow() {
        }

        public void onPanelClosed(int i, Menu menu) {
        }

        public boolean onSearchRequested() {
            return false;
        }

        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return null;
        }

        public void onActionModeStarted(ActionMode actionMode) {
        }

        public void onActionModeFinished(ActionMode actionMode) {
        }
    };
    private ActionBar adk;
    private ListAdapter adl;
    private final int adm;
    private ViewGroup adn;
    private OnClickListener ado = new OnClickListener() {
        public void onClick(View view) {
            Message message = null;
            if (view == AlertControllerImpl.this.adv && AlertControllerImpl.this.adw != null) {
                message = Message.obtain(AlertControllerImpl.this.adw);
            } else if (view == AlertControllerImpl.this.adp && AlertControllerImpl.this.adq != null) {
                message = Message.obtain(AlertControllerImpl.this.adq);
            } else if (view == AlertControllerImpl.this.ads && AlertControllerImpl.this.adt != null) {
                message = Message.obtain(AlertControllerImpl.this.adt);
            }
            if (message != null) {
                message.sendToTarget();
            }
            AlertControllerImpl.this.adF.obtainMessage(1, AlertControllerImpl.this.adD).sendToTarget();
        }
    };
    private Button adp;
    private Message adq;
    private CharSequence adr;
    private Button ads;
    private Message adt;
    private CharSequence adu;
    private Button adv;
    private Message adw;
    private CharSequence adx;
    private Button ady;
    private int adz = -1;
    private ActionBarView mActionBarView;
    private ArrayList<ActionItem> mActionItems;
    private CharSequence mCheckBoxMessage;
    private Context mContext;
    private boolean mIsChecked;
    private MenuBuilder mMenu;
    private DialogInterface.OnClickListener mOnActionItemClickListener;

    private static final class ButtonHandler extends Handler {
        private static final int adX = 1;
        private WeakReference<DialogInterface> adY;

        public ButtonHandler(DialogInterface dialogInterface) {
            this.adY = new WeakReference(dialogInterface);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case -3:
                case -2:
                case -1:
                    ((DialogInterface.OnClickListener) message.obj).onClick((DialogInterface) this.adY.get(), message.what);
                    return;
                case 1:
                    ((DialogInterface) message.obj).dismiss();
                    return;
                default:
                    return;
            }
        }
    }

    public AlertControllerImpl(Context context, DialogInterface dialogInterface, Window window) {
        this.mContext = context;
        this.adD = dialogInterface;
        this.adV = window;
        this.adF = new ButtonHandler(dialogInterface);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(null, R.styleable.AlertDialog, 16842845, 0);
        this.adm = obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_layout, R.layout.alert_dialog);
        this.adK = obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_listLayout, R.layout.select_dialog);
        this.adP = obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_multiChoiceItemLayout, R.layout.select_dialog_multichoice);
        this.adR = obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_singleChoiceItemLayout, miui.R.layout.select_dialog_singlechoice);
        this.adJ = obtainStyledAttributes.getResourceId(R.styleable.AlertDialog_listItemLayout, R.layout.select_dialog_item);
        obtainStyledAttributes.recycle();
    }

    static boolean yV(View view) {
        if (view.onCheckIsTextEditor()) {
            return true;
        }
        if (!(view instanceof ViewGroup)) {
            return false;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        while (childCount > 0) {
            childCount--;
            if (yV(viewGroup.getChildAt(childCount))) {
                return true;
            }
        }
        return false;
    }

    public void installContent() {
        this.adV.requestFeature(1);
        if (this.adU == null || (yV(this.adU) ^ 1) != 0) {
            this.adV.setFlags(131072, 131072);
        }
        yW();
        this.adn = (ViewGroup) this.adV.findViewById(R.id.parentPanel);
        zh();
    }

    private void yW() {
        if (this.mActionItems != null) {
            View inflate = View.inflate(this.mContext, R.layout.screen_action_bar, null);
            this.mActionBarView = (ActionBarView) inflate.findViewById(R.id.action_bar);
            this.mActionBarView.setWindowCallback(this.adW);
            ActionBarContainer actionBarContainer = (ActionBarContainer) inflate.findViewById(R.id.split_action_bar);
            if (actionBarContainer != null) {
                this.mActionBarView.setSplitView(actionBarContainer);
                this.mActionBarView.setSplitActionBar(true);
                this.mActionBarView.setSplitWhenNarrow(true);
                ActionBarContextView actionBarContextView = (ActionBarContextView) inflate.findViewById(R.id.action_context_bar);
                actionBarContextView.setSplitView(actionBarContainer);
                actionBarContextView.setSplitActionBar(true);
                actionBarContextView.setSplitWhenNarrow(true);
            }
            View.inflate(this.mContext, this.adm, (ViewGroup) inflate.findViewById(16908290));
            this.adV.setContentView(inflate);
            this.adV.getDecorView().post(this.adI);
            this.adk = new ActionBarImpl((Dialog) this.adD);
            this.adk.setDisplayOptions(0);
            this.mActionBarView.setCollapsable(true);
            return;
        }
        this.adV.setContentView(this.adm);
        if (!DeviceHelper.IS_TABLET) {
            this.adV.setGravity(80);
            this.adV.setLayout(-1, -2);
        }
    }

    private void setMenu(MenuBuilder menuBuilder) {
        if (menuBuilder != this.mMenu) {
            this.mMenu = menuBuilder;
            if (this.mActionBarView != null) {
                this.mActionBarView.setMenu(menuBuilder, this.adM);
            }
        }
    }

    MenuBuilder createMenu() {
        MenuBuilder menuBuilder = new MenuBuilder(this.mContext);
        menuBuilder.setCallback(this);
        return menuBuilder;
    }

    private boolean yY(MenuBuilder menuBuilder) {
        for (ActionItem actionItem : this.mActionItems) {
            menuBuilder.add(0, actionItem.id, 0, actionItem.label).setIcon(actionItem.icon).setShowAsAction(2);
        }
        return true;
    }

    private boolean yZ(MenuBuilder menuBuilder) {
        return true;
    }

    public boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
        if (this.mOnActionItemClickListener != null) {
            this.mOnActionItemClickListener.onClick(this.adD, menuItem.getItemId());
        }
        return true;
    }

    public void onMenuModeChange(MenuBuilder menuBuilder) {
    }

    public void setIcon(Drawable drawable) {
        this.adG = drawable;
        this.adH = 0;
    }

    public void setIcon(int i) {
        this.adH = i;
        this.adG = null;
    }

    public void setTitle(CharSequence charSequence) {
        this.adS = charSequence;
        if (this.adT != null) {
            this.adT.setText(charSequence);
        }
    }

    public void setCustomTitle(View view) {
        this.adB = view;
    }

    public void setMessage(CharSequence charSequence) {
        this.adN = charSequence;
        if (this.adO != null) {
            this.adO.setText(charSequence);
        }
    }

    public void setView(View view) {
        this.adU = view;
    }

    public void setCheckBox(boolean z, CharSequence charSequence) {
        this.mIsChecked = z;
        this.mCheckBoxMessage = charSequence;
    }

    public void setButton(int i, CharSequence charSequence, DialogInterface.OnClickListener onClickListener, Message message) {
        if (message == null && onClickListener != null) {
            message = this.adF.obtainMessage(i, onClickListener);
        }
        switch (i) {
            case -3:
                this.adu = charSequence;
                this.adt = message;
                return;
            case -2:
                this.adr = charSequence;
                this.adq = message;
                return;
            case -1:
                this.adx = charSequence;
                this.adw = message;
                return;
            default:
                throw new IllegalStateException("Button does not exist");
        }
    }

    public void setActionItems(ArrayList<ActionItem> arrayList, DialogInterface.OnClickListener onClickListener) {
        this.mActionItems = arrayList;
        this.mOnActionItemClickListener = onClickListener;
    }

    public ListView getListView() {
        return this.adL;
    }

    public void setListView(ListView listView) {
        this.adL = listView;
    }

    public int getListLayout() {
        return this.adK;
    }

    public int getListItemLayout() {
        return this.adJ;
    }

    public int getSingleChoiceItemLayout() {
        return this.adR;
    }

    public int getMultiChoiceItemLayout() {
        return this.adP;
    }

    public TextView getMessageView() {
        return this.adO;
    }

    public void setCheckedItems(boolean[] zArr) {
        this.adA = zArr;
    }

    public boolean[] getCheckedItems() {
        return this.adA;
    }

    public boolean isChecked() {
        boolean isChecked = ((CheckBox) this.adn.findViewById(16908289)).isChecked();
        this.mIsChecked = isChecked;
        return isChecked;
    }

    public DialogInterface getDialogInterface() {
        return this.adD;
    }

    public Button getButton(int i) {
        switch (i) {
            case -3:
                return this.ads;
            case -2:
                return this.adp;
            case -1:
                return this.adv;
            default:
                return null;
        }
    }

    public ActionBar getActionBar() {
        return this.adk;
    }

    public void setAdapter(ListAdapter listAdapter) {
        this.adl = listAdapter;
    }

    public void setCheckedItem(int i) {
        this.adz = i;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return this.adQ != null ? this.adQ.executeKeyEvent(keyEvent) : false;
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        return this.adQ != null ? this.adQ.executeKeyEvent(keyEvent) : false;
    }

    private void zh() {
        ViewGroup viewGroup = (ViewGroup) this.adn.findViewById(R.id.topPanel);
        if (viewGroup != null) {
            zg(viewGroup);
        }
        viewGroup = (ViewGroup) this.adn.findViewById(R.id.contentPanel);
        if (viewGroup != null) {
            zd(viewGroup);
        }
        FrameLayout frameLayout = (FrameLayout) this.adn.findViewById(miui.R.id.customPanel);
        if (frameLayout != null) {
            ze(frameLayout);
        }
        frameLayout = (FrameLayout) this.adn.findViewById(R.id.checkboxPanel);
        if (frameLayout != null) {
            zc(frameLayout);
        }
        viewGroup = (ViewGroup) this.adn.findViewById(R.id.buttonPanel);
        if (viewGroup != null) {
            zb(viewGroup);
        }
    }

    private void zg(ViewGroup viewGroup) {
        if (this.adB != null) {
            int paddingLeft;
            viewGroup.addView(this.adB, 0, new LinearLayout.LayoutParams(-1, -2));
            int dimensionPixelSize = this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_title_vertical_padding);
            if (this.adB.getPaddingTop() != 0) {
                dimensionPixelSize = this.adB.getPaddingTop();
            }
            int dimensionPixelSize2 = this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_title_horizontal_padding);
            if (this.adB.getPaddingLeft() != 0) {
                paddingLeft = this.adB.getPaddingLeft();
            } else {
                paddingLeft = dimensionPixelSize2;
            }
            if (this.adB.getPaddingRight() != 0) {
                dimensionPixelSize2 = this.adB.getPaddingRight();
            }
            this.adB.setPadding(paddingLeft, dimensionPixelSize, dimensionPixelSize2, 0);
            viewGroup.removeView(this.adn.findViewById(R.id.alertTitle));
        } else if ((TextUtils.isEmpty(this.adS) ^ 1) != 0) {
            this.adT = (TextView) viewGroup.findViewById(R.id.alertTitle);
            this.adT.setText(this.adS);
            if (this.adG != null) {
                this.adT.setCompoundDrawablesRelativeWithIntrinsicBounds(this.adG, null, null, null);
            }
            if (this.adH != 0) {
                this.adT.setCompoundDrawablesRelativeWithIntrinsicBounds(this.adH, 0, 0, 0);
            }
        } else {
            viewGroup.setVisibility(8);
        }
    }

    private void zd(ViewGroup viewGroup) {
        this.adQ = (ScrollView) this.adn.findViewById(R.id.scrollView);
        this.adQ.setFocusable(false);
        this.adO = (TextView) this.adn.findViewById(miui.R.id.message);
        if (this.adO != null) {
            if (this.adN != null) {
                this.adO.setText(this.adN);
                View findViewById = this.adn.findViewById(R.id.topPanel);
                if (findViewById != null && findViewById.getVisibility() == 8) {
                    viewGroup.setPadding(viewGroup.getPaddingLeft(), this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_message_without_title_vertical_padding), viewGroup.getRight(), viewGroup.getPaddingBottom());
                }
            } else {
                this.adO.setVisibility(8);
                this.adQ.removeView(this.adO);
                if (this.adL != null) {
                    zf();
                    viewGroup.removeView(this.adQ);
                    viewGroup.addView(this.adL, new LinearLayout.LayoutParams(-1, -1));
                    viewGroup.setLayoutParams(new LinearLayout.LayoutParams(-1, 0, 1.0f));
                    viewGroup.setPadding(0, 0, 0, 0);
                    za();
                    if (DeviceHelper.IS_TABLET && this.adB == null && this.adT != null) {
                        this.adT.setPadding(0, 0, 0, 0);
                        try {
                            this.adn.findViewById(R.id.topPanel).setBackground(this.mContext.getResources().getDrawable(R.drawable.dialog_title_bg_light));
                        } catch (NotFoundException e) {
                        }
                        viewGroup.setPadding(viewGroup.getPaddingLeft(), 0, viewGroup.getPaddingRight(), viewGroup.getPaddingBottom());
                    }
                } else {
                    viewGroup.setVisibility(8);
                }
            }
        }
    }

    private void zf() {
        int choiceMode = this.adL.getChoiceMode();
        if (this.adl != null) {
            if (choiceMode == 2) {
                Button button = (Button) this.adn.findViewById(R.id.cancel);
                if (button != null) {
                    button.setOnClickListener(new OnClickListener() {
                        public void onClick(View view) {
                            AlertControllerImpl.this.adD.dismiss();
                        }
                    });
                }
                button = (Button) this.adn.findViewById(R.id.select);
                if (button != null) {
                    this.ady = button;
                    button.setOnClickListener(new OnClickListener() {
                        public void onClick(View view) {
                            int i;
                            boolean isAllItemsChecked = AlertControllerImpl.this.adE.isAllItemsChecked();
                            AlertControllerImpl.this.adE.setAllItemsChecked(isAllItemsChecked ^ 1);
                            Button button = button;
                            if (isAllItemsChecked) {
                                i = miui.R.string.select_all;
                            } else {
                                i = miui.R.string.deselect_all;
                            }
                            button.setText(i);
                        }
                    });
                }
                if (this.ady != null) {
                    this.adE = new EditableListViewWrapper(this.adL);
                    this.adL.setChoiceMode(choiceMode);
                    this.adE.setAdapter(this.adl);
                    final OnItemClickListener onItemClickListener = this.adL.getOnItemClickListener();
                    this.adL.setOnItemClickListener(new OnItemClickListener() {
                        public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                            onItemClickListener.onItemClick(adapterView, view, i, j);
                            AlertControllerImpl.this.ady.setText(AlertControllerImpl.this.adE.isAllItemsChecked() ? miui.R.string.deselect_all : miui.R.string.select_all);
                        }
                    });
                    if (this.adA != null) {
                        for (int i = 0; i < this.adA.length; i++) {
                            this.adE.setItemChecked(i, this.adA[i]);
                        }
                    }
                    this.ady.setText(this.adE.isAllItemsChecked() ? miui.R.string.deselect_all : miui.R.string.select_all);
                } else {
                    this.adL.setAdapter(this.adl);
                }
            } else {
                this.adL.setAdapter(this.adl);
            }
        }
        if (this.adz > -1) {
            this.adL.setItemChecked(this.adz, true);
            this.adL.setSelection(this.adz);
        }
    }

    private void ze(FrameLayout frameLayout) {
        if (this.adU != null) {
            ((FrameLayout) this.adn.findViewById(16908331)).addView(this.adU, new ViewGroup.LayoutParams(-1, -1));
            if (this.adL != null) {
                ((LinearLayout.LayoutParams) frameLayout.getLayoutParams()).weight = 0.0f;
            }
            if (this.adU instanceof ViewGroup) {
                int paddingLeft;
                ViewGroup viewGroup = (ViewGroup) this.adU;
                int dimensionPixelSize = this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_custom_vertical_padding);
                if (viewGroup.getPaddingTop() != 0) {
                    dimensionPixelSize = viewGroup.getPaddingTop();
                }
                this.adC = viewGroup.getPaddingBottom() != 0;
                int dimensionPixelSize2 = this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_custom_horizontal_padding);
                if (viewGroup.getPaddingLeft() != 0) {
                    paddingLeft = viewGroup.getPaddingLeft();
                } else {
                    paddingLeft = dimensionPixelSize2;
                }
                if (viewGroup.getPaddingRight() != 0) {
                    dimensionPixelSize2 = viewGroup.getPaddingRight();
                }
                View findViewById = viewGroup.findViewById(16908301);
                if (findViewById != null && ((findViewById instanceof ProgressBar) ^ 1) != 0) {
                    frameLayout.setPadding(0, 0, 0, 0);
                    this.adC = true;
                    return;
                } else if (viewGroup.findViewById(R.id.datePicker) == null && viewGroup.findViewById(R.id.timePicker) == null && viewGroup.findViewById(R.id.dateTimePicker) == null) {
                    frameLayout.setPadding(paddingLeft, dimensionPixelSize, dimensionPixelSize2, viewGroup.getPaddingBottom());
                    viewGroup.setPadding(0, 0, 0, 0);
                    return;
                } else {
                    frameLayout.setPadding(0, 0, 0, 0);
                    za();
                    this.adC = true;
                    return;
                }
            }
            return;
        }
        frameLayout.setVisibility(8);
    }

    private void za() {
        if (this.adT != null) {
            int dimensionPixelSize = this.mContext.getResources().getDimensionPixelSize(R.dimen.dialog_title_average_vertical_padding);
            this.adT.setPadding(this.adT.getPaddingLeft(), dimensionPixelSize, this.adT.getPaddingRight(), dimensionPixelSize);
        }
    }

    private void zc(FrameLayout frameLayout) {
        if (this.mCheckBoxMessage != null) {
            frameLayout.setVisibility(0);
            CheckBox checkBox = (CheckBox) frameLayout.findViewById(16908289);
            checkBox.setChecked(this.mIsChecked);
            checkBox.setText(this.mCheckBoxMessage);
            return;
        }
        frameLayout.setVisibility(8);
    }

    private void zb(ViewGroup viewGroup) {
        int i;
        boolean z;
        int i2;
        this.adv = (Button) viewGroup.findViewById(16908313);
        if (this.adv != null) {
            this.adv.setOnClickListener(this.ado);
            if (TextUtils.isEmpty(this.adx)) {
                this.adv.setVisibility(8);
                i = 0;
                z = false;
                i2 = 0;
            } else {
                this.adv.setText(this.adx);
                this.adv.setVisibility(0);
                i = 1;
                z = yX(this.adv);
                i2 = 1;
            }
        } else {
            i = 0;
            z = false;
            i2 = 0;
        }
        this.adp = (Button) viewGroup.findViewById(16908314);
        if (this.adp != null) {
            this.adp.setOnClickListener(this.ado);
            if (TextUtils.isEmpty(this.adr)) {
                this.adp.setVisibility(8);
            } else {
                this.adp.setText(this.adr);
                this.adp.setVisibility(0);
                z = yX(this.adp);
                i++;
                i2 = 1;
            }
        }
        this.ads = (Button) viewGroup.findViewById(16908315);
        if (this.ads != null) {
            this.ads.setOnClickListener(this.ado);
            if (TextUtils.isEmpty(this.adu)) {
                this.ads.setVisibility(8);
            } else {
                this.ads.setText(this.adu);
                this.ads.setVisibility(0);
                z = yX(this.ads);
                i++;
                i2 = 1;
            }
        }
        if (i2 != 0) {
            LinearLayout linearLayout = (LinearLayout) viewGroup.findViewById(R.id.buttonGroup);
            if (z || r1 > 2) {
                ViewGroup.LayoutParams layoutParams;
                linearLayout.setOrientation(1);
                linearLayout.removeAllViews();
                if (this.adv != null) {
                    layoutParams = this.adv.getLayoutParams();
                    layoutParams.width = -1;
                    linearLayout.addView(this.adv, layoutParams);
                }
                if (this.ads != null) {
                    layoutParams = this.ads.getLayoutParams();
                    layoutParams.width = -1;
                    linearLayout.addView(this.ads, layoutParams);
                }
                if (this.adp != null) {
                    layoutParams = this.adp.getLayoutParams();
                    layoutParams.width = -1;
                    linearLayout.addView(this.adp, layoutParams);
                }
            }
            if (this.adC || this.adL != null || this.mCheckBoxMessage != null) {
                linearLayout.setPadding(linearLayout.getPaddingLeft(), 0, linearLayout.getPaddingRight(), linearLayout.getPaddingBottom());
                return;
            }
            return;
        }
        viewGroup.setVisibility(8);
    }

    private boolean yX(TextView textView) {
        Layout layout = textView.getLayout();
        if (layout == null || layout.getLineCount() <= 0 || layout.getEllipsisCount(layout.getLineCount() - 1) <= 0) {
            return false;
        }
        return true;
    }
}
