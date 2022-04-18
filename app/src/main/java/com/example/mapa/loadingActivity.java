package com.example.mapa;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

public class loadingActivity extends AppCompatActivity {

    private final long SPLASH_TIME_OUT = 3000; //1 sec
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_loading);

        new Handler(Looper.getMainLooper()).postDelayed(new Runnable(){

            @Override
            public void run() {
                startActivity(new Intent(getApplicationContext(), listSessionActivity.class));
                finish();
            }
        }, SPLASH_TIME_OUT);
    }
}