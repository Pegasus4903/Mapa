package com.example.mapa;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimestampConverter {
    public static Date fromTimestamp(Long value) {
        return value == null ? null : new Date(value);
    }

    public static Long dateToTimestamp(Date date) {
        return date == null ? null : date.getTime();
    }

}
