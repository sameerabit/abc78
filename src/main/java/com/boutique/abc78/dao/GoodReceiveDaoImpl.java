package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.Sale;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class GoodReceiveDaoImpl implements GoodReceiveDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }

    @Override
    public GoodReceiveNote save(GoodReceiveNote goodReceiveNote) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        goodReceiveNote = em.merge(goodReceiveNote);
        em.getTransaction().commit();
        em.refresh(goodReceiveNote);
        em.close();
        return goodReceiveNote;
    }

    @Override
    public List<GoodReceiveNote> getAllGoodReceiveNotes(String start,String end) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Date rDate = null;
        Date endDate = null;

        try {
            if(!start.isEmpty() && !end.isEmpty()){
                rDate = format.parse(start);
                endDate = format.parse(end);
            }
        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReceiveNote g where g.orderDate between :startDate and :endDate order by g.id desc");
        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<GoodReceiveNote> goodReceiveNoteList = query.getResultList();
        em.close();
        return goodReceiveNoteList;
    }

    @Override
    public GoodReceiveNote getGoodReceiveNote(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReceiveNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReceiveNote goodReceiveNote = (GoodReceiveNote) query.getSingleResult();
        em.close();
        return goodReceiveNote;
    }

    @Override
    @Transactional
    public void removeGoodReceiveNoteDetails(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReceiveNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReceiveNote goodReceiveNote = (GoodReceiveNote) query.getSingleResult();
        goodReceiveNote.getGoodReceiveNoteDetail().remove(goodReceiveNote);
        em.close();

    }

    @Override
    @Transactional
    public void deleteGoodReceiveNote(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReceiveNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReceiveNote goodReceiveNote = (GoodReceiveNote) query.getSingleResult();
        goodReceiveNote.getGoodReceiveNoteDetail().remove(goodReceiveNote);
        goodReceiveNote.getItemBatches().remove(goodReceiveNote);
        em.getTransaction().begin();
        em.remove(goodReceiveNote);
        em.getTransaction().commit();
        em.close();

    }
}
