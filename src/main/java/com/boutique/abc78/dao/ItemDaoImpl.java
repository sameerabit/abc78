package com.boutique.abc78.dao;

import com.boutique.abc78.model.Item;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class ItemDaoImpl implements ItemDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<Item> getAllItems() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Item> itemList = em.createQuery("SELECT c FROM Item c").getResultList();
        em.close();
        return itemList;
    }

    @Override
    public List<Item> getItemByNameLike(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Item c where c.name LIKE :name");
        query.setParameter("name", "%" + name + "%");
        List<Item> itemList = query.getResultList();
        em.close();
        return itemList;
    }

    @Override
    public Item save(Item item) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
        em.close();
        return item;
    }

    @Override
    public Item getItemById(int itemId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Item c where c.id = :id");
        query.setParameter("id", itemId );
        Item item = (Item) query.getSingleResult();
        em.close();
        return item;
    }

}
