package com.android.camera.data.data.config;

import java.util.ArrayList;
import java.util.List;

public class SupportedConfigs {
    private List<Integer> mSupportedConfigs;

    public SupportedConfigs() {
        this.mSupportedConfigs = new ArrayList();
    }

    public SupportedConfigs(int size) {
        this.mSupportedConfigs = new ArrayList(size);
    }

    public void add(int... configs) {
        for (int config : configs) {
            this.mSupportedConfigs.add(Integer.valueOf(config));
        }
    }

    public SupportedConfigs add(int config) {
        this.mSupportedConfigs.add(Integer.valueOf(config));
        return this;
    }

    public int getLength() {
        return this.mSupportedConfigs.size();
    }

    public int getConfig(int position) {
        return ((Integer) this.mSupportedConfigs.get(position)).intValue();
    }

    public boolean hasConfig(int config) {
        for (Integer intValue : this.mSupportedConfigs) {
            if (intValue.intValue() == config) {
                return true;
            }
        }
        return false;
    }
}
