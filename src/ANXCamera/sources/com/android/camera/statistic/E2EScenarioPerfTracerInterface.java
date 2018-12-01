package com.android.camera.statistic;

import android.os.Bundle;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Map;

class E2EScenarioPerfTracerInterface {
    private static volatile Method sAbortMatchingScenario;
    private static volatile Method sAbortMatchingScenarioWithTag;
    private static volatile Method sAbortSpecificScenario;
    private static volatile Method sBeginScenario;
    private static volatile Method sBeginScenarioWithPayload;
    private static volatile Method sBeginScenarioWithTag;
    private static volatile Method sBeginScenarioWithTagAndPayload;
    private static volatile Class<?> sE2EScenarioClass;
    private static volatile Constructor<?> sE2EScenarioConstructor;
    private static volatile Class<?> sE2EScenarioPayloadClass;
    private static volatile Constructor<?> sE2EScenarioPayloadConstuctor;
    private static volatile Method sE2EScenarioPayloadMethodPutAll;
    private static volatile Method sE2EScenarioPayloadMethodPutValues;
    private static volatile Class<?> sE2EScenarioPerfTracerClass;
    private static volatile Class<?> sE2EScenarioSettingsClass;
    private static volatile Constructor<?> sE2EScenarioSettingsConstructor;
    private static volatile Method sE2EScenarioSettingsMethodEnableAutoAnalysis;
    private static volatile Method sE2EScenarioSettingsMethodSetHistoryLimitPerDay;
    private static volatile Method sE2EScenarioSettingsMethodSetStatisticsMode;
    private static volatile Method sFinishMatchingScenario;
    private static volatile Method sFinishMatchingScenarioWithPayload;
    private static volatile Method sFinishMatchingScenarioWithTag;
    private static volatile Method sFinishMatchingScenarioWithTagAndPayload;
    private static volatile Method sFinishSpecificScenario;
    private static volatile Method sFinishSpecificScenarioWithPayload;
    private static final Object sInitLockObject = new Object();
    private static volatile boolean sInitialized;

    public static class E2EScenario {
        private final Object scenario;

        /* synthetic */ E2EScenario(Object scenario, E2EScenario -this1) {
            this(scenario);
        }

        private E2EScenario(Object scenario) {
            this.scenario = scenario;
        }
    }

    public static class E2EScenarioPayload {
        private final Object payload;

        /* synthetic */ E2EScenarioPayload(Object payload, E2EScenarioPayload -this1) {
            this(payload);
        }

        private E2EScenarioPayload(Object payload) {
            this.payload = payload;
        }

        public void putAll(Map map) {
            if (E2EScenarioPerfTracerInterface.sE2EScenarioPayloadMethodPutAll != null) {
                try {
                    E2EScenarioPerfTracerInterface.sE2EScenarioPayloadMethodPutAll.invoke(this.payload, new Object[]{map});
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    public static class E2EScenarioSettings {
        private final Object scenarioSettings;

        /* synthetic */ E2EScenarioSettings(Object scenarioSettings, E2EScenarioSettings -this1) {
            this(scenarioSettings);
        }

        private E2EScenarioSettings(Object scenarioSettings) {
            this.scenarioSettings = scenarioSettings;
        }

        public void setStatisticsMode(int mode) {
            if (E2EScenarioPerfTracerInterface.sE2EScenarioSettingsMethodSetStatisticsMode != null) {
                try {
                    E2EScenarioPerfTracerInterface.sE2EScenarioSettingsMethodSetStatisticsMode.invoke(this.scenarioSettings, new Object[]{Integer.valueOf(mode)});
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }

        public void setHistoryLimitPerDay(int historyLimitPerDay) {
            if (E2EScenarioPerfTracerInterface.sE2EScenarioSettingsMethodSetHistoryLimitPerDay != null) {
                try {
                    E2EScenarioPerfTracerInterface.sE2EScenarioSettingsMethodSetHistoryLimitPerDay.invoke(this.scenarioSettings, new Object[]{Integer.valueOf(historyLimitPerDay)});
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    private E2EScenarioPerfTracerInterface() {
    }

    public static void init() {
        if (!sInitialized) {
            synchronized (sInitLockObject) {
                if (!sInitialized) {
                    try {
                        sE2EScenarioClass = Class.forName("android.os.statistics.E2EScenario");
                        sE2EScenarioConstructor = sE2EScenarioClass.getConstructor(new Class[]{String.class, String.class, String.class});
                    } catch (Exception e) {
                    }
                    try {
                        sE2EScenarioSettingsClass = Class.forName("android.os.statistics.E2EScenarioSettings");
                        sE2EScenarioSettingsConstructor = sE2EScenarioSettingsClass.getConstructor(new Class[0]);
                        sE2EScenarioSettingsMethodSetStatisticsMode = sE2EScenarioSettingsClass.getMethod("setStatisticsMode", new Class[]{Integer.TYPE});
                        sE2EScenarioSettingsMethodSetHistoryLimitPerDay = sE2EScenarioSettingsClass.getMethod("setHistoryLimitPerDay", new Class[]{Integer.TYPE});
                        sE2EScenarioSettingsMethodEnableAutoAnalysis = sE2EScenarioSettingsClass.getMethod("enableAutoAnalysis", new Class[]{Integer.TYPE, Integer.TYPE});
                    } catch (Exception e2) {
                    }
                    try {
                        sE2EScenarioPayloadClass = Class.forName("android.os.statistics.E2EScenarioPayload");
                        sE2EScenarioPayloadConstuctor = sE2EScenarioPayloadClass.getConstructor(new Class[0]);
                        sE2EScenarioPayloadMethodPutValues = sE2EScenarioPayloadClass.getMethod("putValues", new Class[]{Object[].class});
                        sE2EScenarioPayloadMethodPutAll = sE2EScenarioPayloadClass.getMethod("putAll", new Class[]{Map.class});
                    } catch (Exception e3) {
                    }
                    try {
                        sE2EScenarioPerfTracerClass = Class.forName("android.os.statistics.E2EScenarioPerfTracer");
                        sBeginScenario = sE2EScenarioPerfTracerClass.getMethod("beginScenario", new Class[]{sE2EScenarioClass, sE2EScenarioSettingsClass});
                        sBeginScenarioWithTag = sE2EScenarioPerfTracerClass.getMethod("beginScenario", new Class[]{sE2EScenarioClass, sE2EScenarioSettingsClass, String.class});
                        sBeginScenarioWithPayload = sE2EScenarioPerfTracerClass.getMethod("beginScenario", new Class[]{sE2EScenarioClass, sE2EScenarioSettingsClass, sE2EScenarioPayloadClass});
                        sBeginScenarioWithTagAndPayload = sE2EScenarioPerfTracerClass.getMethod("beginScenario", new Class[]{sE2EScenarioClass, sE2EScenarioSettingsClass, String.class, sE2EScenarioPayloadClass});
                        sAbortMatchingScenario = sE2EScenarioPerfTracerClass.getMethod("abortScenario", new Class[]{sE2EScenarioClass});
                        sAbortMatchingScenarioWithTag = sE2EScenarioPerfTracerClass.getMethod("abortScenario", new Class[]{sE2EScenarioClass, String.class});
                        sAbortSpecificScenario = sE2EScenarioPerfTracerClass.getMethod("abortScenario", new Class[]{Bundle.class});
                        sFinishMatchingScenario = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{sE2EScenarioClass});
                        sFinishMatchingScenarioWithPayload = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{sE2EScenarioClass, sE2EScenarioPayloadClass});
                        sFinishMatchingScenarioWithTag = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{sE2EScenarioClass, String.class});
                        sFinishMatchingScenarioWithTagAndPayload = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{sE2EScenarioClass, String.class, sE2EScenarioPayloadClass});
                        sFinishSpecificScenario = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{Bundle.class});
                        sFinishSpecificScenarioWithPayload = sE2EScenarioPerfTracerClass.getMethod("finishScenario", new Class[]{Bundle.class, sE2EScenarioPayloadClass});
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    sInitialized = true;
                }
            }
            return;
        }
        return;
    }

    public static E2EScenario createE2EScenario(String namespace, String category, String name) {
        if (!sInitialized) {
            init();
        }
        Object result = null;
        if (sE2EScenarioConstructor != null) {
            try {
                result = sE2EScenarioConstructor.newInstance(new Object[]{namespace, category, name});
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        if (result == null) {
            return null;
        }
        return new E2EScenario(result, null);
    }

    public static E2EScenarioSettings createE2EScenarioSettings() {
        if (!sInitialized) {
            init();
        }
        Object result = null;
        if (sE2EScenarioSettingsConstructor != null) {
            try {
                result = sE2EScenarioSettingsConstructor.newInstance(new Object[0]);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        if (result == null) {
            return null;
        }
        return new E2EScenarioSettings(result, null);
    }

    public static E2EScenarioPayload createE2EScenarioPayload() {
        if (!sInitialized) {
            init();
        }
        Object result = null;
        if (sE2EScenarioPayloadConstuctor != null) {
            try {
                result = sE2EScenarioPayloadConstuctor.newInstance(new Object[0]);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        if (result == null) {
            return null;
        }
        return new E2EScenarioPayload(result, null);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings scenarioSettings) {
        if (scenario == null || scenarioSettings == null) {
            return null;
        }
        if (!sInitialized) {
            init();
        }
        if (sBeginScenario != null) {
            try {
                return (Bundle) sBeginScenario.invoke(null, new Object[]{scenario.scenario, scenarioSettings.scenarioSettings});
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings scenarioSettings, E2EScenarioPayload payload) {
        if (scenario == null) {
            return null;
        }
        if (!sInitialized) {
            init();
        }
        if (sBeginScenarioWithPayload != null) {
            try {
                Method method = sBeginScenarioWithPayload;
                Object[] objArr = new Object[3];
                objArr[0] = scenario.scenario;
                objArr[1] = scenarioSettings.scenarioSettings;
                objArr[2] = payload == null ? null : payload.payload;
                return (Bundle) method.invoke(null, objArr);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public static void abortScenario(E2EScenario scenario) {
        if (scenario != null) {
            if (!sInitialized) {
                init();
            }
            if (sAbortMatchingScenario != null) {
                try {
                    sAbortMatchingScenario.invoke(null, new Object[]{scenario.scenario});
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    public static void finishScenario(E2EScenario scenario) {
        if (scenario != null) {
            if (!sInitialized) {
                init();
            }
            if (sFinishMatchingScenario != null) {
                try {
                    sFinishMatchingScenario.invoke(null, new Object[]{scenario.scenario});
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
