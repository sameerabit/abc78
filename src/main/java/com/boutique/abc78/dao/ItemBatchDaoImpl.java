package com.boutique.abc78.dao;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemBatch;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class ItemBatchDaoImpl implements ItemBatchDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public ItemBatch save(ItemBatch itemBatch) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.merge(itemBatch);
        em.getTransaction().commit();
        em.close();
        return itemBatch;
    }

    @Override
    public List<ItemBatch> getItemBatchByItemId(int itemId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM ItemBatch c where c.item_id = :itemId");
        query.setParameter("itemId", itemId );
        List<ItemBatch> itemBatches = query.getResultList();
        em.close();
        return itemBatches;
    }

}
