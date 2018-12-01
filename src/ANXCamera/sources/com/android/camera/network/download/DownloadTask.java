package com.android.camera.network.download;

import android.os.AsyncTask;
import com.android.camera.log.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

class DownloadTask {
    private static final long RETRY_INTERVAL_MILLI = TimeUnit.SECONDS.toMillis(10);
    private CoreTask mCoreTask;
    private OnCompleteListener mOnCompleteListener;
    private OnProgressListener mOnProgressListener;
    private TaskInfo mTaskInfo;

    private class CoreTask extends AsyncTask<Void, Integer, Integer> {
        private Request mRequest;

        CoreTask(Request request) {
            this.mRequest = request;
        }

        protected Integer doInBackground(Void... params) {
            return Integer.valueOf(DownloadTask.this.performRequest(this.mRequest));
        }

        protected void onPostExecute(Integer downloadResult) {
            Log.d("DownloadTask", String.format("process download finish %d", new Object[]{downloadResult}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, downloadResult.intValue());
            }
        }

        protected void onProgressUpdate(Integer... values) {
            if (DownloadTask.this.mOnProgressListener != null) {
                DownloadTask.this.mOnProgressListener.onProgressUpdate(this.mRequest, values[0].intValue());
            }
        }

        protected void onCancelled(Integer downloadResult) {
            int status = downloadResult != null ? downloadResult.intValue() : -2;
            Log.d("DownloadTask", String.format("process download finish %d", new Object[]{Integer.valueOf(status)}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, 5);
            }
        }

        void publishProgress(int progress) {
            super.publishProgress(new Integer[]{Integer.valueOf(progress)});
        }
    }

    interface OnCompleteListener {
        void onRequestComplete(Request request, int i);
    }

    interface OnProgressListener {
        void onProgressUpdate(Request request, int i);
    }

    private static class TaskInfo {
        long mContentLength;
        MessageDigest mDigest;
        long mDownloadSize;

        /* synthetic */ TaskInfo(TaskInfo -this0) {
            this();
        }

        private TaskInfo() {
        }
    }

    DownloadTask(Request request, OnCompleteListener listener) {
        this.mCoreTask = new CoreTask(request);
        this.mOnCompleteListener = listener;
    }

    void execute(Executor exec) {
        this.mCoreTask.executeOnExecutor(exec, new Void[0]);
    }

    void setOnProgressListener(OnProgressListener onProgressListener) {
        this.mOnProgressListener = onProgressListener;
    }

    private int performRequest(Request request) {
        int code;
        Log.d("DownloadTask", String.format("start to download request[%s, %s, %s]", new Object[]{request.getTag(), request.getUri(), request.getDestination()}));
        preRequest();
        int maxRetry = request.getMaxRetryTimes();
        int i = 0;
        do {
            code = process(request);
            if (!isRetryState(code)) {
                break;
            }
            Log.d("DownloadTask", String.format("retry for %d", new Object[]{Integer.valueOf(code)}));
            try {
                Thread.sleep(RETRY_INTERVAL_MILLI, 0);
                i++;
            } catch (InterruptedException e) {
                code = 5;
            }
        } while (i <= maxRetry);
        return postRequest(code);
    }

    private int process(Request request) {
        Holder<HttpURLConnection> ret = ConnectionHelper.open(request.getUri(), request.getNetworkType());
        HttpURLConnection conn = ret.value;
        if (conn == null) {
            Log.d("DownloadTask", String.format("open connection failed", new Object[0]));
            return translateErrorCode(ret.reason);
        }
        InputStream in = null;
        OutputStream out = null;
        try {
            configure(conn);
            conn.connect();
            int result = translateResponseCode(conn.getResponseCode());
            if (result != 0) {
                Log.d("DownloadTask", String.format("response code not valid", new Object[0]));
                conn.disconnect();
                return result;
            }
            processHeader(conn);
            in = conn.getInputStream();
            out = openOutputStream(request.getDestination());
            if (out == null) {
                Log.d("DownloadTask", String.format("open output stream failed", new Object[0]));
                conn.disconnect();
                if (in != null) {
                    try {
                        in.close();
                    } catch (Throwable e) {
                        Log.w("DownloadTask", e);
                    }
                }
                if (out != null) {
                    try {
                        out.close();
                    } catch (Throwable e2) {
                        Log.w("DownloadTask", e2);
                    }
                }
                return 4;
            }
            preDownload(request);
            Log.d("DownloadTask", String.format("start to transfer data", new Object[0]));
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while (!this.mCoreTask.isCancelled()) {
                bytesRead = in.read(buffer);
                if (bytesRead == -1) {
                    break;
                }
                out.write(buffer, 0, bytesRead);
                performProgressUpdate(buffer, bytesRead);
            }
            if (bytesRead == -1) {
                Log.d("DownloadTask", String.format("download success", new Object[0]));
                int postDownload = postDownload();
                conn.disconnect();
                if (in != null) {
                    try {
                        in.close();
                    } catch (Throwable e22) {
                        Log.w("DownloadTask", e22);
                    }
                }
                if (out != null) {
                    try {
                        out.close();
                    } catch (Throwable e222) {
                        Log.w("DownloadTask", e222);
                    }
                }
                return postDownload;
            }
            Log.d("DownloadTask", String.format("cancelled, during download", new Object[0]));
            conn.disconnect();
            if (in != null) {
                try {
                    in.close();
                } catch (Throwable e2222) {
                    Log.w("DownloadTask", e2222);
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (Throwable e22222) {
                    Log.w("DownloadTask", e22222);
                }
            }
            return 5;
        } catch (Throwable e222222) {
            Log.w("DownloadTask", e222222);
            conn.disconnect();
            if (in != null) {
                try {
                    in.close();
                } catch (Throwable e2222222) {
                    Log.w("DownloadTask", e2222222);
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (Throwable e22222222) {
                    Log.w("DownloadTask", e22222222);
                }
            }
            return 11;
        } catch (Throwable th) {
            conn.disconnect();
            if (in != null) {
                try {
                    in.close();
                } catch (Throwable e222222222) {
                    Log.w("DownloadTask", e222222222);
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (Throwable e2222222222) {
                    Log.w("DownloadTask", e2222222222);
                }
            }
        }
    }

    private void preRequest() {
        this.mTaskInfo = new TaskInfo();
    }

    private void preDownload(Request request) {
        Verifier verifier = request.getVerifier();
        if (verifier != null) {
            Log.d("DownloadTask", String.format("need verify, try to get MessageDigest", new Object[0]));
            this.mTaskInfo.mDigest = verifier.getInstance();
        }
    }

    private void configure(HttpURLConnection conn) {
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);
        conn.setRequestProperty("Accept-Encoding", "identity");
    }

    private void processHeader(HttpURLConnection conn) {
        this.mTaskInfo.mContentLength = (long) conn.getContentLength();
        Log.d("DownloadTask", String.format("content length: %d", new Object[]{Long.valueOf(this.mTaskInfo.mContentLength)}));
    }

    private void performProgressUpdate(byte[] buff, int size) {
        long downloadSize = this.mTaskInfo.mDownloadSize;
        TaskInfo taskInfo = this.mTaskInfo;
        taskInfo.mDownloadSize += (long) size;
        if (this.mTaskInfo.mDigest != null) {
            this.mTaskInfo.mDigest.update(buff, 0, size);
        }
        if (this.mOnProgressListener != null && this.mTaskInfo.mContentLength > 0) {
            int percent = (int) ((((double) this.mTaskInfo.mDownloadSize) / ((double) this.mTaskInfo.mContentLength)) * 100.0d);
            if (((int) ((((double) downloadSize) / ((double) this.mTaskInfo.mContentLength)) * 100.0d)) != percent) {
                this.mCoreTask.publishProgress(percent);
            }
        }
    }

    private int postDownload() {
        if (this.mCoreTask.mRequest.getVerifier() == null || this.mCoreTask.mRequest.getVerifier().verify(this.mTaskInfo.mDigest.digest())) {
            Log.d("DownloadTask", String.format("verify success", new Object[0]));
            return 0;
        }
        Log.d("DownloadTask", String.format("verify fail", new Object[0]));
        return 6;
    }

    private int postRequest(int code) {
        File tmpFile;
        if (code != 0) {
            tmpFile = getTempFile(this.mCoreTask.mRequest.getDestination());
            if (tmpFile.exists() && (tmpFile.delete() ^ 1) != 0) {
                Log.d("DownloadTask", String.format("delete tmp file failed %s", new Object[]{tmpFile}));
            }
        } else {
            File dst = this.mCoreTask.mRequest.getDestination();
            tmpFile = getTempFile(dst);
            if (!tmpFile.exists()) {
                Log.w("DownloadTask", String.format("downloaded file missing", new Object[0]));
                return 9;
            } else if (tmpFile.renameTo(dst)) {
                Log.w("DownloadTask", String.format("rename tmp file success", new Object[0]));
            } else {
                Log.w("DownloadTask", String.format("downloaded file rename failed", new Object[0]));
                return 9;
            }
        }
        return code;
    }

    private static File getTempFile(File dst) {
        return new File(dst.getParent(), dst.getName() + ".download");
    }

    private static int translateResponseCode(int code) {
        if (code != 200) {
            Log.d("DownloadTask", String.format("processing http code %d", new Object[]{Integer.valueOf(code)}));
            int cat = code / 100;
            if (cat == 3) {
                return 7;
            }
            if (cat == 4) {
                return code == 408 ? 12 : 7;
            } else {
                if (cat != 5) {
                    return cat == 2 ? 7 : 7;
                } else {
                    if (code == 504) {
                        return 12;
                    }
                    return 8;
                }
            }
        }
        Log.d("DownloadTask", String.format("http status is ok", new Object[0]));
        return 0;
    }

    private static boolean isRetryState(int state) {
        return state == 12 || state == 11;
    }

    private static int translateErrorCode(int code) {
        switch (code) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            default:
                return 11;
        }
    }

    private static OutputStream openOutputStream(File file) {
        File folder = file.getParentFile();
        if (folder.exists() || (folder.mkdirs() ^ 1) == 0) {
            if (file.exists()) {
                if (file.isDirectory()) {
                    Log.d("DownloadTask", String.format("output file is a directory", new Object[0]));
                    return null;
                }
                Log.w("DownloadTask", String.format("output file will be overwritten", new Object[0]));
            }
            File tempFile = getTempFile(file);
            if (tempFile.exists()) {
                Log.w("DownloadTask", String.format("temp file exists, try delete", new Object[0]));
                if (!tempFile.delete()) {
                    Log.w("DownloadTask", String.format("temp file delete failed, will overwrite", new Object[0]));
                }
            }
            try {
                return new FileOutputStream(tempFile);
            } catch (Throwable e) {
                Log.w("DownloadTask", e);
                return null;
            }
        }
        Log.d("DownloadTask", String.format("create folder failed", new Object[0]));
        return null;
    }
}
