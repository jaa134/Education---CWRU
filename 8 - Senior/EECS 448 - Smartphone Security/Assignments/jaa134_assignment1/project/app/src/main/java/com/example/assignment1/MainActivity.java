package com.example.assignment1;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.content.Intent;
import android.widget.TextView;
import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setTime();
    }

    public void setTime() {
        TextView tv = (TextView)findViewById(R.id.time);
        String time = Calendar.getInstance().getTime().toString();
        tv.setText(time);
    }

    public void OnA1(android.view.View view) {
        Intent intent = new Intent(this, BroadcastActivity.class);
        startActivity(intent);
    }

    public void OnA2(android.view.View view) {
        Intent intent = new Intent(this, ServiceActivity.class);
        startActivity(intent);
    }

    public void OnA3(android.view.View view) {
        Intent intent = new Intent(this, ContentProviderActivity.class);
        startActivity(intent);
    }
}
