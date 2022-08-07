package com.example.mapa;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;
import androidx.room.TypeConverter;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

@Entity
public class Session {
    @PrimaryKey(autoGenerate = true)
    public int Id;

    @ColumnInfo(name = "Title")
    private String Title;
    @ColumnInfo(name = "Distance")
    private int Distance;
    @ColumnInfo(name = "Time")
    private int Time;
    @ColumnInfo(name = "Date_Session")
    private Date DateSession;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public int getDistance() {
        return Distance;
    }

    public void setDistance(int distance) {
        Distance = distance;
    }

    public int getTime() {
        return Time;
    }

    public void setTime(int time) {
        Time = time;
    }

    public Date getDateSession() {
        return DateSession;
    }

    public void setDateSession(Date dateSession) {
        DateSession = dateSession;
    }
}
