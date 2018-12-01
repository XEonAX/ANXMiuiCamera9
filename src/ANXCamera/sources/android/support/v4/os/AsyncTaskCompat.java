package android.support.v4.os;

import android.os.AsyncTask;
import android.os.Build.VERSION;

public class AsyncTaskCompat {
    public static <Params, Progress, Result> AsyncTask<Params, Progress, Result> executeParallel(AsyncTask<Params, Progress, Result> task, Params... params) {
        if (task != null) {
            if (VERSION.SDK_INT < 11) {
                task.execute(params);
            } else {
                AsyncTaskCompatHoneycomb.executeParallel(task, params);
            }
            return task;
        }
        throw new IllegalArgumentException("task can not be null");
    }
}
