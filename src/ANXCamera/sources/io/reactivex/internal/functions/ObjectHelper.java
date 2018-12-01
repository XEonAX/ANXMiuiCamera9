package io.reactivex.internal.functions;

import io.reactivex.functions.BiPredicate;

public final class ObjectHelper {
    static final BiPredicate<Object, Object> EQUALS = new BiObjectPredicate();

    static final class BiObjectPredicate implements BiPredicate<Object, Object> {
        BiObjectPredicate() {
        }
    }

    private ObjectHelper() {
        throw new IllegalStateException("No instances!");
    }

    public static <T> T requireNonNull(T object, String message) {
        if (object != null) {
            return object;
        }
        throw new NullPointerException(message);
    }

    public static boolean equals(Object o1, Object o2) {
        return o1 == o2 || (o1 != null && o1.equals(o2));
    }

    public static int compare(int v1, int v2) {
        if (v1 >= v2) {
            return v1 <= v2 ? 0 : 1;
        } else {
            return -1;
        }
    }

    public static int compare(long v1, long v2) {
        if ((v1 >= v2 ? 1 : 0) == 0) {
            return -1;
        }
        return ((v1 > v2 ? 1 : (v1 == v2 ? 0 : -1)) <= 0 ? 1 : 0) != 0 ? 0 : 1;
    }

    public static int verifyPositive(int value, String paramName) {
        if (value > 0) {
            return value;
        }
        throw new IllegalArgumentException(paramName + " > 0 required but it was " + value);
    }
}
