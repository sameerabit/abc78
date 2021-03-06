package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.Sale;

import java.util.List;

public interface GoodReceiveDao {

    GoodReceiveNote save(GoodReceiveNote goodReceiveNote);

    List<GoodReceiveNote> getAllGoodReceiveNotes(String start,String end);

    GoodReceiveNote getGoodReceiveNote(Integer grnId);

    void removeGoodReceiveNoteDetails(Integer grnId);

    void deleteGoodReceiveNote(Integer grnId);
}
