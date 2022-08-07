package com.example.mapa;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverter;
import androidx.room.TypeConverters;

@Database(entities = {Session.class}, version = 3, exportSchema = false)
@TypeConverters({TimestampConverter.class})
public abstract class RoomDB extends RoomDatabase {
    private static RoomDB database;

    private static String DATABASE_NAME="session";

    public synchronized static RoomDB getInstance(Context context)
    {
        // check condition
        if(database==null)
        {
            // when database is null
            // Initialize database
            database=
                    Room.databaseBuilder(context.getApplicationContext(),RoomDB.class,DATABASE_NAME)
                            .allowMainThreadQueries().fallbackToDestructiveMigration().build();
        }
        // Return database
        return database;
    }

    public abstract SessionDao sessionDao();
}
