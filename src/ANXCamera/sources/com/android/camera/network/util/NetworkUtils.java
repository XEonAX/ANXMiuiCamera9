package com.android.camera.network.util;

import android.app.Application;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public class NetworkUtils {
    private static boolean DBG = false;
    private static Application sApp;

    private NetworkUtils() {
    }

    public static boolean isNetworkConnected() {
        ConnectivityManager connManager = (ConnectivityManager) sApp.getSystemService("connectivity");
        if (connManager == null) {
            return false;
        }
        NetworkInfo networkInfo = connManager.getActiveNetworkInfo();
        if (networkInfo == null || (networkInfo.isConnected() ^ 1) != 0) {
            return false;
        }
        return true;
    }

    public static boolean isActiveNetworkMetered() {
        ConnectivityManager connManager = (ConnectivityManager) sApp.getSystemService("connectivity");
        if (connManager == null) {
            return false;
        }
        return connManager.isActiveNetworkMetered();
    }
}
