package com.boutique.abc78.dao;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemBatch;
import com.boutique.abc78.model.SaleOrderDetail;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
        Query query = em.createQuery("SELECT c FROM ItemBatch c where c.item.id = :itemId");
        query.setParameter("itemId", itemId );
        List<ItemBatch> itemBatches = query.getResultList();
        em.close();
        return itemBatches;
    }

    @Override
    public void reduceQuantityForSales(SaleOrderDetail saleOrderDetail) {
        List<ItemBatch> itemBatches = this.getItemBatchByItemId(saleOrderDetail.getItem().getId());
        EntityManager em = entityManagerFactory.createEntityManager();
        Set<ItemBatch> itemBatchSet = new HashSet<>();
        em.getTransaction().begin();
        float zero = 0;
        float remainingQty = saleOrderDetail.getQuantity();
        for (ItemBatch itemBatch: itemBatches) {
            if (itemBatch.getQuantity() != 0){
                if(itemBatch.getQuantity() >= remainingQty){
                    itemBatch.setQuantity(itemBatch.getQuantity() - saleOrderDetail.getQuantity());
                    remainingQty = 0;
                } else {

                    float currentQty = itemBatch.getQuantity();
                    itemBatch.setQuantity(zero);
                    remainingQty = saleOrderDetail.getQuantity() - currentQty;
                }
            }
            itemBatchSet.add(itemBatch);
            em.merge(itemBatch);

        }
        saleOrderDetail.setItemBatches(itemBatchSet);
        em.merge(saleOrderDetail);
        em.getTransaction().commit();
        em.close();
    }

}
