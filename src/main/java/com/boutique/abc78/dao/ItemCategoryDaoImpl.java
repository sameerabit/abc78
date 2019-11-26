package com.boutique.abc78.dao;

import com.boutique.abc78.model.ItemCategory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class ItemCategoryDaoImpl implements ItemCategoryDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<ItemCategory> getAllCategories(String search) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT i FROM ItemCategory i  order by i.id desc");
        if(search!=""){
            query = em.createQuery("SELECT i FROM ItemCategory i where i.name like :name order by i.id desc");
            query.setParameter("name", "%"+search+"%" );
        }
        List<ItemCategory> list =  query.getResultList();
        em.close();
        return list;
    }

    @Override
    public ItemCategory save(ItemCategory itemCategory) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        if(itemCategory.getId() == null){
            em.persist(itemCategory);
        }else{
            em.merge(itemCategory);
        }
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
        em.close();
        return itemCategory;
    }

    @Override
    @Transactional
    public int delete(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        ItemCategory itemCategory = em.find(ItemCategory.class, id);
        em.getTransaction().begin();
        em.remove(itemCategory);
        em.getTransaction().commit();
        return 1;
    }

}
