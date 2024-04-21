package com.example.mapa;


import java.util.Date;

import io.objectbox.annotation.Entity;

@Entity
public class Session {
    @io.objectbox.annotation.Id
    public long Id;
    private String Title;
    private int Distance;
    private int Time;
    private Date DateSession;

    public long getId() {
        return Id;
    }

    public void setId(long id) {
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
