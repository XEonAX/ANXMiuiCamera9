package com.android.camera.data.cloud;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;

public abstract class DataCloudItemBase implements DataCloud$CloudItem {
    private Editor mEditor;
    private SharedPreferences mPreferences;
    private boolean mReady;
    private SimpleArrayMap<String, Object> mValues = new SimpleArrayMap();

    public String getCloudStringDefault(String key, String localDefault) {
        if (!this.mReady) {
            return localDefault;
        }
        String v = (String) this.mValues.get(key);
        if (v == null) {
            v = getSharedPreferences().getString(key, localDefault);
        }
        if (v != null) {
            localDefault = v;
        }
        return localDefault;
    }

    public boolean getCloudBooleanDefault(String key, boolean localDefault) {
        if (!this.mReady) {
            return localDefault;
        }
        Boolean v = (Boolean) this.mValues.get(key);
        if (v == null) {
            v = Boolean.valueOf(getSharedPreferences().getBoolean(key, localDefault));
        }
        if (v != null) {
            localDefault = v.booleanValue();
        }
        return localDefault;
    }

    public int getCloudIntDefault(String key, int localDefault) {
        if (!this.mReady) {
            return localDefault;
        }
        Integer v = (Integer) this.mValues.get(key);
        if (v == null) {
            v = Integer.valueOf(getSharedPreferences().getInt(key, localDefault));
        }
        if (v != null) {
            localDefault = v.intValue();
        }
        return localDefault;
    }

    public long getCloudLongDefault(String key, long localDefault) {
        if (!this.mReady) {
            return localDefault;
        }
        Long v = (Long) this.mValues.get(key);
        if (v == null) {
            v = Long.valueOf(getSharedPreferences().getLong(key, localDefault));
        }
        if (v != null) {
            localDefault = v.longValue();
        }
        return localDefault;
    }

    public float getCloudFloatDefault(String key, float localDefault) {
        if (!this.mReady) {
            return localDefault;
        }
        Float v = (Float) this.mValues.get(key);
        if (v == null) {
            v = Float.valueOf(getSharedPreferences().getFloat(key, localDefault));
        }
        if (v != null) {
            localDefault = v.floatValue();
        }
        return localDefault;
    }

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
    }

    public Editor editor() {
        this.mEditor = getSharedPreferences().edit();
        return this.mEditor;
    }

    public void setReady(boolean ready) {
        this.mReady = ready;
    }
}
