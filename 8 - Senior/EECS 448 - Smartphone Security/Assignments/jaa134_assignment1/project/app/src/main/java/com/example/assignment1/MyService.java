package com.example.assignment1;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.text.format.DateFormat;

public class MyService extends Service {

    public static final String ACTION = "com.example.updateUI";
    public static final String EXTRA = "time";

    private final IBinder mBinder = new LocalBinder();
    private HandlerThread mHandlerThread;
    private Handler mHandler;
    boolean shouldRun = false;

    public class LocalBinder extends Binder {
        MyService getService() {
            // Return this instance of LocalService so clients can call public methods
            return MyService.this;
        }
    }

    public MyService() {
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        shouldRun = true;

        mHandlerThread = new HandlerThread("LocalServiceThread");
        mHandlerThread.start();

        mHandler = new Handler(mHandlerThread.getLooper());

        mHandler.post(new Runnable() {
            @Override
            public void run() {
                while (shouldRun){

                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            Intent intent = new Intent(ACTION);
                            DateFormat df = new DateFormat();
                            String time = df.format("hh:mm", new java.util.Date()).toString();
                            intent.putExtra(EXTRA, time);
                            sendBroadcast(intent);
                        }
                    });

                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public void onDestroy() {
        shouldRun = false;
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        //do not allow binding ATM
        return null;
    }
}
