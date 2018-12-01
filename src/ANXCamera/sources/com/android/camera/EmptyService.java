package com.android.camera;

import android.app.Notification.Builder;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;

public class EmptyService extends Service {
    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            EmptyService.this.stopForeground(true);
            EmptyService.this.stopSelf();
        }
    };

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onCreate() {
        getApplicationContext().registerReceiver(this.mReceiver, new IntentFilter("android.intent.action.SCREEN_ON"));
        super.onCreate();
    }

    public int onStartCommand(Intent intent, int flags, int startId) {
        startForeground(0, new Builder(this).setTicker("camera service").setContentIntent(PendingIntent.getActivity(this, 0, intent, 0)).setWhen(System.currentTimeMillis()).build());
        CompatibilityUtils.allocGraphicBuffers();
        return 2;
    }

    public void onDestroy() {
        stopForeground(true);
        getApplicationContext().unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }
}
