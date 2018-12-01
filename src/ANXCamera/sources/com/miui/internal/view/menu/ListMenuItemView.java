package com.miui.internal.view.menu;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import com.miui.internal.view.menu.MenuBuilder.ItemInvoker;
import com.miui.internal.view.menu.MenuView.ItemView;
import miui.R;
import miui.util.AttributeResolver;

public class ListMenuItemView extends LinearLayout implements ItemView {
    private Drawable PA;
    private CheckBox PB;
    private boolean PC;
    private ImageView PD;
    private MenuItemImpl PE;
    private boolean PF;
    private RadioButton PG;
    private View PH;
    private TextView PI;
    private int PJ;
    private Context PK;
    private TextView PL;
    private Context mContext;
    private LayoutInflater mInflater;

    public ListMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet);
        this.mContext = context;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.MenuView, i, 0);
        this.PA = obtainStyledAttributes.getDrawable(R.styleable.MenuView_android_itemBackground);
        this.PJ = obtainStyledAttributes.getResourceId(R.styleable.MenuView_android_itemTextAppearance, -1);
        this.PF = obtainStyledAttributes.getBoolean(com.miui.internal.R.styleable.MenuView_android_preserveIconSpacing, false);
        this.PK = context;
        obtainStyledAttributes.recycle();
    }

    public ListMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        setBackground(this.PA);
        this.PL = (TextView) findViewById(com.miui.internal.R.id.title);
        if (this.PJ != -1) {
            this.PL.setTextAppearance(this.PK, this.PJ);
        }
        this.PI = (TextView) findViewById(com.miui.internal.R.id.shortcut);
        this.PH = getChildAt(0);
    }

    public void initialize(MenuItemImpl menuItemImpl, int i) {
        this.PE = menuItemImpl;
        setVisibility(menuItemImpl.isVisible() ? 0 : 8);
        setTitle(menuItemImpl.tF(this));
        setCheckable(menuItemImpl.isCheckable());
        setShortcut(menuItemImpl.tG(), menuItemImpl.tH());
        setIcon(menuItemImpl.getIcon());
        setEnabled(menuItemImpl.isEnabled());
    }

    public void setForceShowIcon(boolean z) {
        this.PC = z;
        this.PF = z;
    }

    public void setTitle(CharSequence charSequence) {
        if (charSequence != null) {
            this.PL.setText(charSequence);
            if (this.PL.getVisibility() != 0) {
                this.PL.setVisibility(0);
            }
        } else if (this.PL.getVisibility() != 8) {
            this.PL.setVisibility(8);
        }
    }

    public MenuItemImpl getItemData() {
        return this.PE;
    }

    public void setCheckable(boolean z) {
        int i = 0;
        if (z || this.PG != null || this.PB != null) {
            CompoundButton compoundButton;
            CompoundButton compoundButton2;
            if (this.PE.isExclusiveCheckable()) {
                if (this.PG == null) {
                    tn();
                }
                compoundButton = this.PG;
                compoundButton2 = this.PB;
            } else {
                if (this.PB == null) {
                    tl();
                }
                compoundButton = this.PB;
                compoundButton2 = this.PG;
            }
            if (z) {
                compoundButton.setChecked(this.PE.isChecked());
                if (compoundButton.getVisibility() != 0) {
                    compoundButton.setVisibility(0);
                }
                if (!(compoundButton2 == null || compoundButton2.getVisibility() == 8)) {
                    compoundButton2.setVisibility(8);
                }
            } else {
                if (this.PB != null) {
                    this.PB.setVisibility(8);
                }
                if (this.PG != null) {
                    this.PG.setVisibility(8);
                }
            }
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.PH.getLayoutParams();
            if (!(z && (this.PE.isExclusiveCheckable() ^ 1) == 0)) {
                i = AttributeResolver.resolveDimensionPixelSize(getContext(), 16843683);
            }
            marginLayoutParams.setMarginStart(i);
            this.PH.setLayoutParams(marginLayoutParams);
            setActivated(this.PE.isChecked());
        }
    }

    public void setChecked(boolean z) {
        CompoundButton compoundButton;
        if (this.PE.isExclusiveCheckable()) {
            if (this.PG == null) {
                tn();
            }
            compoundButton = this.PG;
        } else {
            if (this.PB == null) {
                tl();
            }
            compoundButton = this.PB;
        }
        compoundButton.setChecked(z);
        setActivated(z);
    }

    public void setItemInvoker(ItemInvoker itemInvoker) {
        throw new UnsupportedOperationException();
    }

    public void setShortcut(boolean z, char c) {
        int i = 0;
        if (!(z && this.PE.tG())) {
            i = 8;
        }
        if (i == 0) {
            this.PI.setText(this.PE.tI());
        }
        if (this.PI.getVisibility() != i) {
            this.PI.setVisibility(i);
        }
    }

    public void setIcon(Drawable drawable) {
        boolean z = !this.PE.shouldShowIcon() ? this.PC : true;
        if (!z && (this.PF ^ 1) != 0) {
            return;
        }
        if (this.PD != null || drawable != null || (this.PF ^ 1) == 0) {
            if (this.PD == null) {
                tm();
            }
            if (drawable != null || this.PF) {
                ImageView imageView = this.PD;
                if (!z) {
                    drawable = null;
                }
                imageView.setImageDrawable(drawable);
                if (this.PD.getVisibility() != 0) {
                    this.PD.setVisibility(0);
                }
            } else {
                this.PD.setVisibility(8);
            }
        }
    }

    protected void onMeasure(int i, int i2) {
        if (this.PD != null && this.PF) {
            LayoutParams layoutParams = getLayoutParams();
            LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) this.PD.getLayoutParams();
            if (layoutParams.height > 0 && layoutParams2.width <= 0) {
                layoutParams2.width = layoutParams.height;
            }
        }
        super.onMeasure(i, i2);
    }

    private void tm() {
        this.PD = (ImageView) tk().inflate(com.miui.internal.R.layout.list_menu_item_icon, this, false);
        addView(this.PD, 0);
    }

    private void tn() {
        this.PG = (RadioButton) tk().inflate(com.miui.internal.R.layout.list_menu_item_radio, this, false);
        addView(this.PG, 0);
    }

    private void tl() {
        this.PB = (CheckBox) tk().inflate(com.miui.internal.R.layout.list_menu_item_checkbox, this, false);
        addView(this.PB);
    }

    public boolean prefersCondensedTitle() {
        return false;
    }

    public boolean showsIcon() {
        return this.PC;
    }

    private LayoutInflater tk() {
        if (this.mInflater == null) {
            this.mInflater = LayoutInflater.from(this.mContext);
        }
        return this.mInflater;
    }
}
