package com.example.assignment1;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class BroadcastActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_broadcast);
    }

    public void onBroadcast(android.view.View view) {
        Intent intent = new Intent(MyReceiver.ACTION);
        intent.putExtra(MyReceiver.EXTRA, "Broadcast event!");
        sendBroadcast(intent);
    }
}
