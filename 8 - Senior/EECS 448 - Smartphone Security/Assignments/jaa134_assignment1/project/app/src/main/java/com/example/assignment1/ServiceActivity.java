package com.example.assignment1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.widget.TextView;
import android.support.v4.content.LocalBroadcastManager;
import android.content.IntentFilter;
import android.widget.Toast;

public class ServiceActivity extends AppCompatActivity {

    private BroadcastReceiver receiver;
    private Intent manageService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_service);

        receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                TextView tv = (TextView)findViewById(R.id.time);
                String time = intent.getStringExtra(MyService.EXTRA);
                tv.setText(time);
            }
        };

        manageService = new Intent(this, MyService.class);
    }

    @Override
    protected void onStart() {
        super.onStart();
        registerReceiver(receiver, new IntentFilter(MyService.ACTION));
    }

    @Override
    protected void onStop() {
        unregisterReceiver(receiver);
        super.onStop();
    }

    public void OnStartService(View view) {
        startService(manageService);
        Toast.makeText(this, "Service started!", Toast.LENGTH_LONG).show();
    }

    public void OnStopService(View view) {
        stopService(manageService);
        Toast.makeText(this, "Service stopped!", Toast.LENGTH_LONG).show();
    }
}
