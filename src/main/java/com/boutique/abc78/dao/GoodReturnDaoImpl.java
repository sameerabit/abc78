package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReturnNote;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
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
    public List<GoodReturnNote> getAllGoodReturnNotes() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<GoodReturnNote> goodReturnNoteList = em.createQuery("SELECT g FROM GoodReturnNote g order by g.id desc").getResultList();
        em.close();
        return goodReturnNoteList;
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
}
