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
        return itemList;
    }

    @Override
    public List<Item> getItemByNameLike(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Item c where c.name LIKE :name");
        query.setParameter("name", "%" + name + "%");
        List<Item> itemList = query.getResultList();
        return itemList;
    }
}
