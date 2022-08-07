package com.example.mapa;

import static androidx.room.OnConflictStrategy.IGNORE;
import static androidx.room.OnConflictStrategy.REPLACE;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

@Dao
public interface SessionDao {
    @Query("Select * from session order by date(Date_Session) asc")
    List<Session> getAll();

    @Insert(onConflict = IGNORE)
    void insert(Session session);

    @Query("UPDATE session SET Title = :newTitle WHERE Id = :sID")
    void update(int sID, String newTitle);

    @Delete
    void delete(Session session);
}
