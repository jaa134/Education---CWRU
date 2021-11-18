package com.example.assignment1;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import java.util.Calendar;

public class MyReceiver extends BroadcastReceiver {

    public static final String ACTION = "com.example.homework";
    public static final String EXTRA = "msg";

    @Override
    public void onReceive(Context context, Intent intent) {
        String time = Calendar.getInstance().getTime().toString();
        String msg = intent.getStringExtra(EXTRA);
        Toast.makeText(context, "Intent Detected.\n" + time + "\n" + msg, Toast.LENGTH_LONG).show();
    }
}
