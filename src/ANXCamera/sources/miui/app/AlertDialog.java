package miui.app;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.DialogInterface.OnMultiChoiceClickListener;
import android.content.DialogInterface.OnShowListener;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.miui.internal.variable.AlertControllerWrapper;
import com.miui.internal.variable.AlertControllerWrapper.AlertParams;
import com.miui.internal.variable.AlertControllerWrapper.AlertParams.ActionItem;
import java.util.ArrayList;
import miui.R;
import miui.util.AttributeResolver;

public class AlertDialog extends Dialog implements DialogInterface {
    public static final int THEME_DARK = 2;
    public static final int THEME_DARK_EDIT = 4;
    public static final int THEME_DARK_EDIT_DEFAULT = 6;
    public static final int THEME_LIGHT = 3;
    public static final int THEME_LIGHT_EDIT = 5;
    public static final int THEME_LIGHT_EDIT_DEFAULT = 7;
    private AlertControllerWrapper El;

    public static class Builder {
        private AlertParams Em;
        private int En;

        public Builder(Context context) {
            this(context, AlertDialog.pv(context, 0));
        }

        public Builder(Context context, int i) {
            boolean z = false;
            this.Em = new AlertParams(new ContextThemeWrapper(context, AlertDialog.pv(context, i)));
            AlertParams alertParams = this.Em;
            if (i >= 4 && i <= 7) {
                z = true;
            }
            alertParams.mEditMode = z;
            this.En = i;
        }

        public Context getContext() {
            return this.Em.mContext;
        }

        public Builder setTitle(int i) {
            this.Em.mTitle = this.Em.mContext.getText(i);
            return this;
        }

        public Builder setTitle(CharSequence charSequence) {
            this.Em.mTitle = charSequence;
            return this;
        }

        public Builder setCustomTitle(View view) {
            this.Em.mCustomTitleView = view;
            return this;
        }

        public Builder setMessage(int i) {
            this.Em.mMessage = this.Em.mContext.getText(i);
            return this;
        }

        public Builder setMessage(CharSequence charSequence) {
            this.Em.mMessage = charSequence;
            return this;
        }

        public Builder setCheckBox(boolean z, CharSequence charSequence) {
            this.Em.mIsChecked = z;
            this.Em.mCheckBoxMessage = charSequence;
            return this;
        }

        public Builder setIcon(int i) {
            this.Em.mIconId = i;
            return this;
        }

        public Builder setIcon(Drawable drawable) {
            this.Em.mIcon = drawable;
            return this;
        }

        public Builder setIconAttribute(int i) {
            this.Em.mIconId = AttributeResolver.resolve(this.Em.mContext, i);
            return this;
        }

        public Builder setPositiveButton(int i, OnClickListener onClickListener) {
            this.Em.mPositiveButtonText = this.Em.mContext.getText(i);
            this.Em.mPositiveButtonListener = onClickListener;
            return this;
        }

        public Builder setPositiveButton(CharSequence charSequence, OnClickListener onClickListener) {
            this.Em.mPositiveButtonText = charSequence;
            this.Em.mPositiveButtonListener = onClickListener;
            return this;
        }

        public Builder setNegativeButton(int i, OnClickListener onClickListener) {
            this.Em.mNegativeButtonText = this.Em.mContext.getText(i);
            this.Em.mNegativeButtonListener = onClickListener;
            return this;
        }

        public Builder setNegativeButton(CharSequence charSequence, OnClickListener onClickListener) {
            this.Em.mNegativeButtonText = charSequence;
            this.Em.mNegativeButtonListener = onClickListener;
            return this;
        }

        public Builder setNeutralButton(int i, OnClickListener onClickListener) {
            this.Em.mNeutralButtonText = this.Em.mContext.getText(i);
            this.Em.mNeutralButtonListener = onClickListener;
            return this;
        }

        public Builder setNeutralButton(CharSequence charSequence, OnClickListener onClickListener) {
            this.Em.mNeutralButtonText = charSequence;
            this.Em.mNeutralButtonListener = onClickListener;
            return this;
        }

        public Builder setCancelable(boolean z) {
            this.Em.mCancelable = z;
            return this;
        }

        public Builder setOnCancelListener(OnCancelListener onCancelListener) {
            this.Em.mOnCancelListener = onCancelListener;
            return this;
        }

        public Builder setOnDismissListener(OnDismissListener onDismissListener) {
            this.Em.mOnDismissListener = onDismissListener;
            return this;
        }

        public Builder setOnShowListener(OnShowListener onShowListener) {
            this.Em.mOnShowListener = onShowListener;
            return this;
        }

        public Builder setOnKeyListener(OnKeyListener onKeyListener) {
            this.Em.mOnKeyListener = onKeyListener;
            return this;
        }

        public Builder addActionItem(CharSequence charSequence, int i, int i2) {
            if (this.Em.mActionItems == null) {
                this.Em.mActionItems = new ArrayList();
            }
            this.Em.mActionItems.add(new ActionItem(charSequence, i, i2));
            return this;
        }

        public Builder addActionItem(int i, int i2, int i3) {
            return addActionItem(this.Em.mContext.getText(i), i2, i3);
        }

        public Builder setOnActionItemClickListener(OnClickListener onClickListener) {
            this.Em.mOnActionItemClickListener = onClickListener;
            return this;
        }

        public Builder setItems(int i, OnClickListener onClickListener) {
            this.Em.mItems = this.Em.mContext.getResources().getTextArray(i);
            this.Em.mOnClickListener = onClickListener;
            return this;
        }

        public Builder setItems(CharSequence[] charSequenceArr, OnClickListener onClickListener) {
            this.Em.mItems = charSequenceArr;
            this.Em.mOnClickListener = onClickListener;
            return this;
        }

        public Builder setAdapter(ListAdapter listAdapter, OnClickListener onClickListener) {
            this.Em.mAdapter = listAdapter;
            this.Em.mOnClickListener = onClickListener;
            return this;
        }

        public Builder setCursor(Cursor cursor, OnClickListener onClickListener, String str) {
            this.Em.mCursor = cursor;
            this.Em.mLabelColumn = str;
            this.Em.mOnClickListener = onClickListener;
            return this;
        }

        public Builder setMultiChoiceItems(int i, boolean[] zArr, OnMultiChoiceClickListener onMultiChoiceClickListener) {
            this.Em.mItems = this.Em.mContext.getResources().getTextArray(i);
            this.Em.mOnCheckboxClickListener = onMultiChoiceClickListener;
            this.Em.mCheckedItems = zArr;
            this.Em.mIsMultiChoice = true;
            return this;
        }

        public Builder setMultiChoiceItems(CharSequence[] charSequenceArr, boolean[] zArr, OnMultiChoiceClickListener onMultiChoiceClickListener) {
            this.Em.mItems = charSequenceArr;
            this.Em.mOnCheckboxClickListener = onMultiChoiceClickListener;
            this.Em.mCheckedItems = zArr;
            this.Em.mIsMultiChoice = true;
            return this;
        }

        public Builder setMultiChoiceItems(Cursor cursor, String str, String str2, OnMultiChoiceClickListener onMultiChoiceClickListener) {
            this.Em.mCursor = cursor;
            this.Em.mOnCheckboxClickListener = onMultiChoiceClickListener;
            this.Em.mIsCheckedColumn = str;
            this.Em.mLabelColumn = str2;
            this.Em.mIsMultiChoice = true;
            return this;
        }

        public Builder setMultiChoiceAdapter(ListAdapter listAdapter, OnMultiChoiceClickListener onMultiChoiceClickListener) {
            this.Em.mAdapter = listAdapter;
            this.Em.mIsMultiChoice = true;
            this.Em.mOnCheckboxClickListener = onMultiChoiceClickListener;
            return this;
        }

        public Builder setSingleChoiceItems(int i, int i2, OnClickListener onClickListener) {
            this.Em.mItems = this.Em.mContext.getResources().getTextArray(i);
            this.Em.mOnClickListener = onClickListener;
            this.Em.mCheckedItem = i2;
            this.Em.mIsSingleChoice = true;
            return this;
        }

        public Builder setSingleChoiceItems(Cursor cursor, int i, String str, OnClickListener onClickListener) {
            this.Em.mCursor = cursor;
            this.Em.mOnClickListener = onClickListener;
            this.Em.mCheckedItem = i;
            this.Em.mLabelColumn = str;
            this.Em.mIsSingleChoice = true;
            return this;
        }

        public Builder setSingleChoiceItems(CharSequence[] charSequenceArr, int i, OnClickListener onClickListener) {
            this.Em.mItems = charSequenceArr;
            this.Em.mOnClickListener = onClickListener;
            this.Em.mCheckedItem = i;
            this.Em.mIsSingleChoice = true;
            return this;
        }

        public Builder setSingleChoiceItems(ListAdapter listAdapter, int i, OnClickListener onClickListener) {
            this.Em.mAdapter = listAdapter;
            this.Em.mOnClickListener = onClickListener;
            this.Em.mCheckedItem = i;
            this.Em.mIsSingleChoice = true;
            return this;
        }

        public Builder setOnItemSelectedListener(OnItemSelectedListener onItemSelectedListener) {
            this.Em.mOnItemSelectedListener = onItemSelectedListener;
            return this;
        }

        public Builder setView(int i) {
            this.Em.mView = this.Em.mInflater.inflate(i, null);
            return this;
        }

        public Builder setView(View view) {
            this.Em.mView = view;
            return this;
        }

        public AlertDialog create() {
            AlertDialog alertDialog = new AlertDialog(this.Em.mContext, this.En);
            this.Em.apply(alertDialog.El);
            alertDialog.setCancelable(this.Em.mCancelable);
            if (this.Em.mCancelable) {
                alertDialog.setCanceledOnTouchOutside(true);
            }
            alertDialog.setOnCancelListener(this.Em.mOnCancelListener);
            alertDialog.setOnDismissListener(this.Em.mOnDismissListener);
            alertDialog.setOnShowListener(this.Em.mOnShowListener);
            if (this.Em.mOnKeyListener != null) {
                alertDialog.setOnKeyListener(this.Em.mOnKeyListener);
            }
            return alertDialog;
        }

        public AlertDialog show() {
            AlertDialog create = create();
            create.show();
            return create;
        }
    }

    protected AlertDialog(Context context) {
        this(context, pv(context, 0));
    }

    protected AlertDialog(Context context, int i) {
        super(context, pv(context, i));
        this.El = new AlertControllerWrapper(context, this, getWindow());
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.El.installContent();
    }

    public ActionBar getMiuiActionBar() {
        return this.El.getImpl().getActionBar();
    }

    static int pv(Context context, int i) {
        switch (i) {
            case 2:
                return R.style.Theme_Dark_Dialog_Alert;
            case 3:
                return R.style.Theme_Light_Dialog_Alert;
            case 4:
                return com.miui.internal.R.style.Theme_Dark_Dialog_Edit;
            case 5:
                return com.miui.internal.R.style.Theme_Light_Dialog_Edit;
            case 6:
                return com.miui.internal.R.style.Theme_Dark_Dialog_Edit_Default;
            case 7:
                return com.miui.internal.R.style.Theme_Light_Dialog_Edit_Default;
            default:
                if (i >= ViewCompat.MEASURED_STATE_TOO_SMALL) {
                    return i;
                }
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16843529, typedValue, true);
                return typedValue.resourceId;
        }
    }

    public Button getButton(int i) {
        return this.El.getButton(i);
    }

    public ListView getListView() {
        return this.El.getListView();
    }

    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        this.El.setTitle(charSequence);
    }

    public void setCustomTitle(View view) {
        this.El.setCustomTitle(view);
    }

    public void setMessage(CharSequence charSequence) {
        this.El.setMessage(charSequence);
    }

    public TextView getMessageView() {
        return this.El.getMessageView();
    }

    public void setView(View view) {
        this.El.setView(view);
    }

    public void setButton(int i, CharSequence charSequence, Message message) {
        this.El.setButton(i, charSequence, null, message);
    }

    public void setButton(int i, CharSequence charSequence, OnClickListener onClickListener) {
        this.El.setButton(i, charSequence, onClickListener, null);
    }

    public void setIcon(int i) {
        this.El.setIcon(i);
    }

    public void setIcon(Drawable drawable) {
        this.El.setIcon(drawable);
    }

    public void setIconAttribute(int i) {
        this.El.setIcon(AttributeResolver.resolve(getContext(), i));
    }

    public boolean[] getCheckedItems() {
        return this.El.getCheckedItems();
    }

    public boolean isChecked() {
        return this.El.isChecked();
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        return !this.El.onKeyUp(i, keyEvent) ? super.onKeyUp(i, keyEvent) : true;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return !this.El.onKeyDown(i, keyEvent) ? super.onKeyDown(i, keyEvent) : true;
    }
}
