package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReturnNote;
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
public class GoodReturnDaoImpl implements GoodReturnDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }

    @Override
    public GoodReturnNote save(GoodReturnNote goodReturnNote) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.merge(goodReturnNote);
        em.getTransaction().commit();
        em.close();
        return goodReturnNote;
    }

    @Override
    public List<GoodReturnNote> getAllGoodReturnNotes(String start,String end) {
        EntityManager em = entityManagerFactory.createEntityManager();
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
        Query query = em.createQuery("SELECT s FROM GoodReturnNote s where s.returnDate between :startDate and :endDate");
        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<GoodReturnNote> grnList = query.getResultList();
        em.close();
        return grnList;
    }

    @Override
    public GoodReturnNote getGoodReturnNote(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReturnNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReturnNote goodReturnNote = (GoodReturnNote) query.getSingleResult();
        em.close();
        return goodReturnNote;
    }

    @Override
    @Transactional
    public void removeGoodReturnNoteDetails(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReturnNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReturnNote goodReturnNote = (GoodReturnNote) query.getSingleResult();
        goodReturnNote.getGoodReturnNoteDetails().remove(goodReturnNote);
        em.close();

    }

    @Override
    @Transactional
    public void deleteGoodReturnNote(Integer grnId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT g FROM GoodReturnNote g where g.id = :id");
        query.setParameter("id", grnId);
        GoodReturnNote goodReturnNote = (GoodReturnNote) query.getSingleResult();
        goodReturnNote.getGoodReturnNoteDetails().remove(goodReturnNote);
        em.getTransaction().begin();
        em.remove(goodReturnNote);
        em.getTransaction().commit();
        em.close();

    }

    public List<GoodReturnNote>  getAllGoodReturnNotesByDate(String date,String startDate, String eDate){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Date rDate = null;
        Date endDate = null;

        try {

            if(!startDate.isEmpty() && !eDate.isEmpty()){
                rDate = format.parse(startDate);
                endDate = format.parse(eDate);
            }else{
                rDate = format.parse(date);
                cal.setTime(rDate);
                cal.add(Calendar.DAY_OF_MONTH, 1);
                String newDate = format.format(cal.getTime());
                endDate = format.parse(newDate);
            }


        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM GoodReturnNote s where s.returnDate between :startDate and :endDate");
        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<GoodReturnNote> grnList = query.getResultList();
        em.close();
        return grnList;
    }
}
