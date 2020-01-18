package com.boutique.abc78.service;

import com.boutique.abc78.dao.GoodReturnDaoImpl;
import com.boutique.abc78.dao.ItemBatchDaoImpl;
import com.boutique.abc78.model.GoodReturnNote;
import com.boutique.abc78.model.GoodReturnNoteDetail;
import com.boutique.abc78.model.ItemBatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodReturnService {

    @Autowired
    private GoodReturnDaoImpl goodReturnDao;

    @Autowired
    private ItemBatchDaoImpl itemBatchDao;


    public GoodReturnNote save(GoodReturnNote goodReturnNote){
        goodReturnNote = this.goodReturnDao.save(goodReturnNote);

//        for (GoodReturnNoteDetail goodReturnNoteDetail : goodReturnNote.getGoodReturnNoteDetail()) {
//            ItemBatch itemBatch = new ItemBatch();
//            itemBatch.setGoodReturnNote(goodReturnNote);
//            itemBatch.setBuyingPrice(goodReturnNoteDetail.getBuyingPrice());
//            itemBatch.setDate(goodReturnNote.getOrderDate());
//            itemBatch.setItem(goodReturnNoteDetail.getItem());
//            itemBatch.setQuantity(goodReturnNoteDetail.getQuantity());
//            itemBatchDao.save(itemBatch);
//
//        }
        return goodReturnNote;
    }

    public List<GoodReturnNote> getAllGoodReturnNotes(){
        return this.goodReturnDao.getAllGoodReturnNotes();
    }

    public GoodReturnNote getGoodReturnNote(Integer saleId){
        return this.goodReturnDao.getGoodReturnNote(saleId);
    }

    public void deleteGoodReturnNote(Integer grnId) {
        this.goodReturnDao.deleteGoodReturnNote(grnId);
    }

    public void removeGoodReturnNoteDetails(Integer grnId){
        this.goodReturnDao.removeGoodReturnNoteDetails(grnId);
    }

    public List<GoodReturnNote> getAllGoodReturnNotesByDate(String date, String startDate, String endDate){
        return this.goodReturnDao.getAllGoodReturnNotesByDate(date,startDate,endDate);
    }

}
