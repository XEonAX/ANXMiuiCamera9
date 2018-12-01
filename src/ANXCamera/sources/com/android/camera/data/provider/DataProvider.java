package com.android.camera.data.provider;

public interface DataProvider {

    public interface ProviderEvent {
        ProviderEditor editor();

        boolean isTransient();

        String provideKey();
    }

    public interface ProviderEditor {
        void apply();

        ProviderEditor clear();

        boolean commit();

        ProviderEditor putBoolean(String str, boolean z);

        ProviderEditor putFloat(String str, float f);

        ProviderEditor putInt(String str, int i);

        ProviderEditor putLong(String str, long j);

        ProviderEditor putString(String str, String str2);

        ProviderEditor remove(String str);
    }

    <P extends ProviderEvent> P dataConfig();

    <P extends ProviderEvent> P dataConfig(int i);

    <P extends ProviderEvent> P dataConfig(int i, int i2);

    <P extends ProviderEvent> P dataFeature();

    <P extends ProviderEvent> P dataGlobal();

    <P extends ProviderEvent> P dataNormalConfig();

    <P extends ProviderEvent> P dataRunning();
}
