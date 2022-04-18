package com.example.mapa;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class listSessionActivity extends AppCompatActivity {

    RecyclerView recyclerView;
    List<Session> dataList = new ArrayList<>();
    LinearLayoutManager linearLayoutManager;
    RoomDB database;
    listeAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list_session);

        recyclerView = findViewById(R.id.liste);

        database = RoomDB.getInstance(this);

        dataList = database.sessionDao().getAll();

        linearLayoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(linearLayoutManager);

        adapter = new listeAdapter(listSessionActivity.this, dataList);

        recyclerView.setAdapter(adapter);
    }
}