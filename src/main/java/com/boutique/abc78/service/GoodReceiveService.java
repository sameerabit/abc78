package com.boutique.abc78.service;

import com.boutique.abc78.dao.GoodReceiveDaoImpl;
import com.boutique.abc78.dao.SaleDaoImpl;
import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodReceiveService {

    @Autowired
    private GoodReceiveDaoImpl goodReceiveDao;


    public GoodReceiveNote save(GoodReceiveNote goodReceiveNote){
        goodReceiveNote = this.goodReceiveDao.save(goodReceiveNote);
        return goodReceiveNote;
    }

    public List<GoodReceiveNote> getAllGoodReceiveNotes(){
        return this.goodReceiveDao.getAllGoodReceiveNotes();
    }

    public GoodReceiveNote getGoodReceiveNote(Integer saleId){
        return this.goodReceiveDao.getGoodReceiveNote(saleId);
    }

    public void removeGoodReceiveNoteDetails(Integer grnId){
        this.goodReceiveDao.removeGoodReceiveNoteDetails(grnId);
    }


}
