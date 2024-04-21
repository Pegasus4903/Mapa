package com.example.mapa;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

public class listeAdapter extends RecyclerView.Adapter<listeAdapter.ViewHolder> {
    private Context context;
    private List<Session> dataList;
    //private RoomDB database;

    public listeAdapter(@NonNull Context context, List<Session> dataList){
        this.context = context;
        this.dataList = dataList;
        notifyDataSetChanged();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        TextView titleSessionText;
        TextView distanceSessionText;
        TextView dateSessionText;

        public ViewHolder(View view) {
            super(view);
            titleSessionText = view.findViewById(R.id.title_session);
            distanceSessionText = view.findViewById(R.id.distance_session);
            dateSessionText = view.findViewById(R.id.date_session);
        }
    }

    @NonNull
    @Override
    public listeAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_item, parent, false);

        return new ViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull final listeAdapter.ViewHolder holder, int position) {
        Session s = dataList.get(position);
       // database = RoomDB.getInstance(context);
        holder.titleSessionText.setText(s.getTitle());
        holder.distanceSessionText.setText("Distance : " + String.valueOf(s.getDistance()));
        holder.dateSessionText.setText(s.getDateSession().toString());
    }

    @Override
    public int getItemCount() {
        return dataList.size();
    }

}
