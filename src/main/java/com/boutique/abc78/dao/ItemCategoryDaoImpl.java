package com.boutique.abc78.dao;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemCategory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class ItemCategoryDaoImpl implements ItemCategoryDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<ItemCategory> getAllCategories() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<ItemCategory> list = em.createQuery("SELECT i FROM ItemCategory i order by i.id desc").getResultList();
        return list;
    }

    @Override
    public ItemCategory save(ItemCategory itemCategory) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.merge(itemCategory);
        em.getTransaction().commit();
        em.close();
        return itemCategory;
    }

    @Override
    public ItemCategory getItemCatById(int itemCatId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM ItemCategory c where c.id = :id");
        query.setParameter("id", itemCatId );
        ItemCategory itemCategory = (ItemCategory) query.getSingleResult();
        return itemCategory;
    }
}
