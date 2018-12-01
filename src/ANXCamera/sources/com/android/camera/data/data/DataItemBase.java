package com.android.camera.data.data;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.cloud.DataCloud$CloudItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.data.provider.DataProvider.ProviderEvent;

public abstract class DataItemBase implements ProviderEvent, ProviderEditor {
    private DataCloud$CloudItem mDataCloudItem;
    private Editor mEditor;
    private final Object mLock = new Object();
    private SharedPreferences mPreferences;
    private SimpleArrayMap<String, Object> mValues = new SimpleArrayMap();

    public String getString(String key, String defaultValue) {
        if (this.mDataCloudItem != null) {
            defaultValue = this.mDataCloudItem.getCloudStringDefault(key, defaultValue);
        }
        synchronized (this.mLock) {
            String v = (String) this.mValues.get(key);
            if (v == null && (isTransient() ^ 1) != 0) {
                v = getSharedPreferences().getString(key, defaultValue);
            }
            if (v != null) {
                defaultValue = v;
            }
        }
        return defaultValue;
    }

    public boolean getBoolean(String key, boolean defaultValue) {
        if (this.mDataCloudItem != null) {
            defaultValue = this.mDataCloudItem.getCloudBooleanDefault(key, defaultValue);
        }
        synchronized (this.mLock) {
            Boolean v = (Boolean) this.mValues.get(key);
            if (v == null && (isTransient() ^ 1) != 0) {
                v = Boolean.valueOf(getSharedPreferences().getBoolean(key, defaultValue));
            }
            if (v != null) {
                defaultValue = v.booleanValue();
            }
        }
        return defaultValue;
    }

    public int getInt(String key, int defaultValue) {
        if (this.mDataCloudItem != null) {
            defaultValue = this.mDataCloudItem.getCloudIntDefault(key, defaultValue);
        }
        synchronized (this.mLock) {
            Integer v = (Integer) this.mValues.get(key);
            if (v == null && (isTransient() ^ 1) != 0) {
                v = Integer.valueOf(getSharedPreferences().getInt(key, defaultValue));
            }
            if (v != null) {
                defaultValue = v.intValue();
            }
        }
        return defaultValue;
    }

    public long getLong(String key, long defaultValue) {
        if (this.mDataCloudItem != null) {
            defaultValue = this.mDataCloudItem.getCloudLongDefault(key, defaultValue);
        }
        synchronized (this.mLock) {
            Long v = (Long) this.mValues.get(key);
            if (v == null && (isTransient() ^ 1) != 0) {
                v = Long.valueOf(getSharedPreferences().getLong(key, defaultValue));
            }
            if (v != null) {
                defaultValue = v.longValue();
            }
        }
        return defaultValue;
    }

    public float getFloat(String key, float defaultValue) {
        if (this.mDataCloudItem != null) {
            defaultValue = this.mDataCloudItem.getCloudFloatDefault(key, defaultValue);
        }
        synchronized (this.mLock) {
            Float v = (Float) this.mValues.get(key);
            if (v == null && (isTransient() ^ 1) != 0) {
                v = Float.valueOf(getSharedPreferences().getFloat(key, defaultValue));
            }
            if (v != null) {
                defaultValue = v.floatValue();
            }
        }
        return defaultValue;
    }

    public boolean contains(String key) {
        return getSharedPreferences().contains(key);
    }

    public ProviderEditor editor() {
        synchronized (this.mLock) {
            if (isMutable()) {
                if (!isTransient() && this.mEditor == null) {
                    this.mEditor = getSharedPreferences().edit();
                }
            } else {
                throw new RuntimeException("not allowed to modify");
            }
        }
        return this;
    }

    public ProviderEditor putString(String key, String value) {
        synchronized (this.mLock) {
            this.mValues.put(key, value);
            if (this.mEditor != null) {
                this.mEditor.putString(key, value);
            }
        }
        return this;
    }

    public ProviderEditor putBoolean(String key, boolean value) {
        synchronized (this.mLock) {
            this.mValues.put(key, Boolean.valueOf(value));
            if (this.mEditor != null) {
                this.mEditor.putBoolean(key, value);
            }
        }
        return this;
    }

    public ProviderEditor putInt(String key, int value) {
        synchronized (this.mLock) {
            this.mValues.put(key, Integer.valueOf(value));
            if (this.mEditor != null) {
                this.mEditor.putInt(key, value);
            }
        }
        return this;
    }

    public ProviderEditor putLong(String key, long value) {
        synchronized (this.mLock) {
            this.mValues.put(key, Long.valueOf(value));
            if (this.mEditor != null) {
                this.mEditor.putLong(key, value);
            }
        }
        return this;
    }

    public ProviderEditor putFloat(String key, float value) {
        synchronized (this.mLock) {
            this.mValues.put(key, Float.valueOf(value));
            if (this.mEditor != null) {
                this.mEditor.putFloat(key, value);
            }
        }
        return this;
    }

    public ProviderEditor remove(String key) {
        synchronized (this.mLock) {
            this.mValues.remove(key);
            if (this.mEditor != null) {
                this.mEditor.remove(key);
            }
        }
        return this;
    }

    public ProviderEditor clear() {
        synchronized (this.mLock) {
            this.mValues.clear();
            if (this.mEditor != null) {
                this.mEditor.clear();
            }
        }
        return this;
    }

    public boolean commit() {
        synchronized (this.mLock) {
            if (this.mEditor != null) {
                boolean commit = this.mEditor.commit();
                return commit;
            }
            return false;
        }
    }

    public void apply() {
        if (isTransient()) {
            throw new RuntimeException("Transient data！");
        }
        synchronized (this.mLock) {
            if (this.mEditor == null) {
                throw new RuntimeException("Editor null！");
            }
            this.mEditor.apply();
        }
    }

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        if (!isTransient()) {
            this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
        }
    }

    public SimpleArrayMap<String, Object> getValues() {
        SimpleArrayMap<String, Object> simpleArrayMap;
        synchronized (this.mLock) {
            simpleArrayMap = this.mValues;
        }
        return simpleArrayMap;
    }

    public SimpleArrayMap cloneValues() {
        SimpleArrayMap<String, Object> cloneValues;
        synchronized (this.mLock) {
            cloneValues = new SimpleArrayMap();
            cloneValues.putAll(this.mValues);
        }
        return cloneValues;
    }

    public void injectCloud(DataCloud$CloudItem dataCloudItem) {
        this.mDataCloudItem = dataCloudItem;
    }

    protected boolean isMutable() {
        return true;
    }
}
