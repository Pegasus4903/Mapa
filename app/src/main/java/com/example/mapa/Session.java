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
    public String Title;
    @ColumnInfo(name = "Distance")
    public int Distance;
    @ColumnInfo(name = "Time")
    public int Time;
    @ColumnInfo(name = "Date_Session")
    public Date DateSession;

}
