package com.boutique.abc78.dao;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.Sale;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
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
        em.persist(goodReceiveNote);
        em.getTransaction().commit();
        em.close();
        return goodReceiveNote;
    }

    @Override
    public List<GoodReceiveNote> getAllGoodReceiveNotes() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<GoodReceiveNote> goodReceiveNoteList = em.createQuery("SELECT g FROM GoodReceiveNote g order by g.id desc").getResultList();
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
