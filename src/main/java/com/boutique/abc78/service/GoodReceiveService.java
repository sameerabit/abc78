package com.boutique.abc78.service;

import com.boutique.abc78.dao.GoodReceiveDaoImpl;
import com.boutique.abc78.dao.ItemBatchDaoImpl;
import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.GoodReceiveNoteDetail;
import com.boutique.abc78.model.ItemBatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodReceiveService {

    @Autowired
    private GoodReceiveDaoImpl goodReceiveDao;

    @Autowired
    private ItemBatchDaoImpl itemBatchDao;


    public GoodReceiveNote save(GoodReceiveNote goodReceiveNote){
        goodReceiveNote = this.goodReceiveDao.save(goodReceiveNote);

        for (GoodReceiveNoteDetail goodReceiveNoteDetail : goodReceiveNote.getGoodReceiveNoteDetail()) {
            ItemBatch itemBatch = new ItemBatch();
            itemBatch.setGoodReceiveNote(goodReceiveNote);
            itemBatch.setBuyingPrice(goodReceiveNoteDetail.getBuyingPrice());
            itemBatch.setDate(goodReceiveNote.getOrderDate());
            itemBatch.setItem(goodReceiveNoteDetail.getItem());
            itemBatch.setQuantity(goodReceiveNoteDetail.getQuantity());
            itemBatchDao.save(itemBatch);
        }
        return goodReceiveNote;
    }

    public List<GoodReceiveNote> getAllGoodReceiveNotes(){
        return this.goodReceiveDao.getAllGoodReceiveNotes();
    }

    public GoodReceiveNote getGoodReceiveNote(Integer saleId){
        return this.goodReceiveDao.getGoodReceiveNote(saleId);
    }

    public void deleteGoodReceiveNote(Integer grnId) {
        this.goodReceiveDao.deleteGoodReceiveNote(grnId);
    }

    public void removeGoodReceiveNoteDetails(Integer grnId){
        this.goodReceiveDao.removeGoodReceiveNoteDetails(grnId);
    }


}
