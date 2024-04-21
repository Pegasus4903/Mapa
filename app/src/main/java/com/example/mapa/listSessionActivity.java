package com.example.mapa;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import io.objectbox.Box;

public class listSessionActivity extends AppCompatActivity {

    RecyclerView recyclerView;
    List<Session> dataList = new ArrayList<>();
    LinearLayoutManager linearLayoutManager;
    listeAdapter adapter;
    FloatingActionButton floatingButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list_session);

        recyclerView = findViewById(R.id.liste);
        floatingButton = findViewById(R.id.floatingButton);

        Box<Session> sessionBox = ObjectBox.get().boxFor(Session.class);

        dataList = sessionBox.getAll();

        linearLayoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(linearLayoutManager);

        adapter = new listeAdapter(this, dataList);

        recyclerView.setAdapter(adapter);

        floatingButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(getApplicationContext(), MainActivity.class));
                finish();
            }
        });
    }
}