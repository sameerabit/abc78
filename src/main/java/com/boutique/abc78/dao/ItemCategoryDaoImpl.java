package com.boutique.abc78.dao;

import com.boutique.abc78.model.ItemCategory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
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
        List<ItemCategory> saleList = em.createQuery("SELECT i FROM ItemCategory i order by i.id desc").getResultList();
        return saleList;
    }
}
