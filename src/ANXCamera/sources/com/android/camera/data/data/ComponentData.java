package com.android.camera.data.data;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.util.List;
import java.util.Locale;

public abstract class ComponentData {
    public List<ComponentDataItem> mItems;
    protected DataItemBase mParentDataItem;

    public abstract String getDefaultValue(int i);

    @StringRes
    public abstract int getDisplayTitleString();

    public abstract List<ComponentDataItem> getItems();

    public abstract String getKey(int i);

    public <D extends DataItemBase> ComponentData(D dataItemBase) {
        this.mParentDataItem = dataItemBase;
    }

    protected boolean checkValueValid(String value) {
        return true;
    }

    protected void resetComponentValue(int mode) {
    }

    public String getComponentValue(int mode) {
        String defaultValue = getDefaultValue(mode);
        String value = this.mParentDataItem.getString(getKey(mode), defaultValue);
        if (value == null || (value.equals(defaultValue) ^ 1) == 0 || (checkValueValid(value) ^ 1) == 0) {
            return value;
        }
        Log.e(getClass().getSimpleName(), "reset invalid value " + value);
        resetComponentValue(mode);
        return this.mParentDataItem.getString(getKey(mode), defaultValue);
    }

    public void setComponentValue(int mode, String newValue) {
        if (this.mParentDataItem.isTransient()) {
            this.mParentDataItem.putString(getKey(mode), newValue);
        } else {
            this.mParentDataItem.editor().putString(getKey(mode), newValue).apply();
        }
    }

    @StringRes
    public int getValueDisplayString(int mode) {
        String value = getComponentValue(mode);
        for (ComponentDataItem dataItem : getItems()) {
            if (dataItem.mValue.equals(value)) {
                return dataItem.mDisplayNameRes;
            }
        }
        String msg = String.format(Locale.ENGLISH, "invalid value %1$s for %2$s", new Object[]{value, getKey(mode)});
        Log.e(getClass().getSimpleName(), msg);
        if (!Util.isDebugOsBuild()) {
            return -2;
        }
        throw new IllegalArgumentException(msg);
    }

    @DrawableRes
    public int getValueSelectedDrawable(int mode) {
        String value = getComponentValue(mode);
        for (ComponentDataItem dataItem : getItems()) {
            if (dataItem.mValue.equals(value)) {
                return dataItem.mIconSelectedRes;
            }
        }
        String msg = String.format(Locale.ENGLISH, "invalid value %1$s for %2$s", new Object[]{value, getKey(mode)});
        Log.e(getClass().getSimpleName(), msg);
        if (!Util.isDebugOsBuild()) {
            return -1;
        }
        throw new IllegalArgumentException(msg);
    }

    public int findIndexOfValue(String value) {
        List<ComponentDataItem> items = getItems();
        for (int i = 0; i < items.size(); i++) {
            if (value.equals(((ComponentDataItem) items.get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }

    public boolean isEmpty() {
        return this.mItems != null ? this.mItems.isEmpty() : true;
    }
}
