package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.GoodReturnNote;

import java.util.List;

public interface GoodReturnDao {

    GoodReturnNote save(GoodReturnNote goodReceiveNote);

    List<GoodReturnNote> getAllGoodReturnNotes(String start,String end);

    GoodReturnNote getGoodReturnNote(Integer grnId);

    void removeGoodReturnNoteDetails(Integer grnId);

    void deleteGoodReturnNote(Integer grnId);

    List<GoodReturnNote> getAllGoodReturnNotesByDate(String date, String startDate, String endDate);
}
