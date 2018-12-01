package io.reactivex.exceptions;

import com.sensetime.stmobile.STCommon;
import io.reactivex.annotations.NonNull;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public final class CompositeException extends RuntimeException {
    private static final long serialVersionUID = 3026362227162912146L;
    private Throwable cause;
    private final List<Throwable> exceptions;
    private final String message;

    static final class CompositeExceptionCausalChain extends RuntimeException {
        private static final long serialVersionUID = 3875212506787802066L;

        CompositeExceptionCausalChain() {
        }

        public String getMessage() {
            return "Chain of Causes for CompositeException In Order Received =>";
        }
    }

    static abstract class PrintStreamOrWriter {
        abstract void println(Object obj);

        PrintStreamOrWriter() {
        }
    }

    static final class WrappedPrintStream extends PrintStreamOrWriter {
        private final PrintStream printStream;

        WrappedPrintStream(PrintStream printStream) {
            this.printStream = printStream;
        }

        void println(Object o) {
            this.printStream.println(o);
        }
    }

    static final class WrappedPrintWriter extends PrintStreamOrWriter {
        private final PrintWriter printWriter;

        WrappedPrintWriter(PrintWriter printWriter) {
            this.printWriter = printWriter;
        }

        void println(Object o) {
            this.printWriter.println(o);
        }
    }

    public CompositeException(@NonNull Throwable... exceptions) {
        this(exceptions != null ? Arrays.asList(exceptions) : Collections.singletonList(new NullPointerException("exceptions was null")));
    }

    public CompositeException(@NonNull Iterable<? extends Throwable> errors) {
        Set<Throwable> deDupedExceptions = new LinkedHashSet();
        List<Throwable> localExceptions = new ArrayList();
        if (errors == null) {
            deDupedExceptions.add(new NullPointerException("errors was null"));
        } else {
            for (Throwable ex : errors) {
                if (ex instanceof CompositeException) {
                    deDupedExceptions.addAll(((CompositeException) ex).getExceptions());
                } else if (ex == null) {
                    deDupedExceptions.add(new NullPointerException("Throwable was null!"));
                } else {
                    deDupedExceptions.add(ex);
                }
            }
        }
        if (deDupedExceptions.isEmpty()) {
            throw new IllegalArgumentException("errors is empty");
        }
        localExceptions.addAll(deDupedExceptions);
        this.exceptions = Collections.unmodifiableList(localExceptions);
        this.message = this.exceptions.size() + " exceptions occurred. ";
    }

    @NonNull
    public List<Throwable> getExceptions() {
        return this.exceptions;
    }

    @NonNull
    public String getMessage() {
        return this.message;
    }

    @NonNull
    public synchronized Throwable getCause() {
        if (this.cause == null) {
            Throwable localCause = new CompositeExceptionCausalChain();
            Set<Throwable> seenCauses = new HashSet();
            Throwable chain = localCause;
            for (Throwable e : this.exceptions) {
                Throwable e2;
                if (!seenCauses.contains(e2)) {
                    seenCauses.add(e2);
                    for (Throwable child : getListOfCauses(e2)) {
                        if (seenCauses.contains(child)) {
                            e2 = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
                        } else {
                            seenCauses.add(child);
                        }
                    }
                    try {
                        chain.initCause(e2);
                    } catch (Throwable th) {
                    }
                    chain = getRootCause(chain);
                }
            }
            this.cause = localCause;
        }
        return this.cause;
    }

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream s) {
        printStackTrace(new WrappedPrintStream(s));
    }

    public void printStackTrace(PrintWriter s) {
        printStackTrace(new WrappedPrintWriter(s));
    }

    private void printStackTrace(PrintStreamOrWriter s) {
        StringBuilder b = new StringBuilder(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
        b.append(this).append(10);
        for (StackTraceElement myStackElement : getStackTrace()) {
            b.append("\tat ").append(myStackElement).append(10);
        }
        int i = 1;
        for (Throwable ex : this.exceptions) {
            b.append("  ComposedException ").append(i).append(" :\n");
            appendStackTrace(b, ex, "\t");
            i++;
        }
        s.println(b.toString());
    }

    private void appendStackTrace(StringBuilder b, Throwable ex, String prefix) {
        b.append(prefix).append(ex).append(10);
        for (StackTraceElement stackElement : ex.getStackTrace()) {
            b.append("\t\tat ").append(stackElement).append(10);
        }
        if (ex.getCause() != null) {
            b.append("\tCaused by: ");
            appendStackTrace(b, ex.getCause(), "");
        }
    }

    private List<Throwable> getListOfCauses(Throwable ex) {
        List<Throwable> list = new ArrayList();
        Throwable root = ex.getCause();
        if (root == null || root == ex) {
            return list;
        }
        while (true) {
            list.add(root);
            Throwable cause = root.getCause();
            if (!(cause == null || cause == root)) {
                root = cause;
            }
        }
        return list;
    }

    private Throwable getRootCause(Throwable e) {
        Throwable root = e.getCause();
        if (root == null || this.cause == root) {
            return e;
        }
        while (true) {
            Throwable cause = root.getCause();
            if (!(cause == null || cause == root)) {
                root = cause;
            }
        }
        return root;
    }
}
