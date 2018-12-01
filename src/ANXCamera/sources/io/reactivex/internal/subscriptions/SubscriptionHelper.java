package io.reactivex.internal.subscriptions;

import io.reactivex.exceptions.ProtocolViolationException;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscription;

public enum SubscriptionHelper implements Subscription {
    CANCELLED;

    public void request(long n) {
    }

    public void cancel() {
    }

    public static boolean validate(Subscription current, Subscription next) {
        if (next == null) {
            RxJavaPlugins.onError(new NullPointerException("next is null"));
            return false;
        } else if (current == null) {
            return true;
        } else {
            next.cancel();
            reportSubscriptionSet();
            return false;
        }
    }

    public static void reportSubscriptionSet() {
        RxJavaPlugins.onError(new ProtocolViolationException("Subscription already set!"));
    }

    public static boolean validate(long n) {
        boolean z;
        if (n > 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            return true;
        }
        RxJavaPlugins.onError(new IllegalArgumentException("n > 0 required but it was " + n));
        return false;
    }

    public static boolean setOnce(AtomicReference<Subscription> field, Subscription s) {
        ObjectHelper.requireNonNull(s, "s is null");
        if (field.compareAndSet(null, s)) {
            return true;
        }
        s.cancel();
        if (field.get() != CANCELLED) {
            reportSubscriptionSet();
        }
        return false;
    }

    public static boolean cancel(AtomicReference<Subscription> field) {
        if (((Subscription) field.get()) != CANCELLED) {
            Subscription current = (Subscription) field.getAndSet(CANCELLED);
            if (current != CANCELLED) {
                if (current != null) {
                    current.cancel();
                }
                return true;
            }
        }
        return false;
    }
}
