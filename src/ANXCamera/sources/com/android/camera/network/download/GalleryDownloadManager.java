package com.android.camera.network.download;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GalleryDownloadManager {
    public static final GalleryDownloadManager INSTANCE = new GalleryDownloadManager();
    private BlockingQueue<Runnable> mBlockingQueue = new LinkedBlockingQueue();
    private ThreadPoolExecutor mExecutor = new ThreadPoolExecutor(2, 4, 30, TimeUnit.SECONDS, this.mBlockingQueue, this.mThreadFactory);
    private Map<String, DownloadTask> mTasks = new HashMap();
    private ThreadFactory mThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger();

        public Thread newThread(Runnable r) {
            return new Thread(r, "DownloadTask #" + this.mCount.getAndIncrement());
        }
    };

    public interface OnCompleteListener extends OnCompleteListener {
    }

    private class TaskMonitor implements OnCompleteListener {
        private OnCompleteListener mWrapped;

        TaskMonitor(OnCompleteListener wrapped) {
            this.mWrapped = wrapped;
        }

        public void onRequestComplete(Request request, int code) {
            DownloadTask task = (DownloadTask) GalleryDownloadManager.this.mTasks.remove(request.getTag());
            if (task != null) {
                task.setOnProgressListener(null);
            }
            this.mWrapped.onRequestComplete(request, code);
        }
    }

    public void enqueue(Request request, OnCompleteListener listener) {
        DownloadTask task = new DownloadTask(request, new TaskMonitor(listener));
        this.mTasks.put(request.getTag(), task);
        task.execute(this.mExecutor);
    }
}
