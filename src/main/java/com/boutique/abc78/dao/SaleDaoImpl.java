package com.boutique.abc78.dao;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Sale;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class SaleDaoImpl implements SaleDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }

    @Override
    public Sale save(Sale sale) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.merge(sale);
        em.getTransaction().commit();
        em.close();
        return sale;
    }

    @Override
    public List<Sale> getAllSales() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Sale> saleList = em.createQuery("SELECT s FROM Sale s order by s.id desc").getResultList();
        return saleList;
    }

    @Override
    public Sale getSale(Integer saleId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.id = :id");
        query.setParameter("id", saleId);
        Sale sale = (Sale) query.getSingleResult();
        return sale;
    }

    @Override
    @Transactional
    public void removeSaleOrderDetails(Integer saleId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.id = :id");
        query.setParameter("id", saleId);
        Sale sale = (Sale) query.getSingleResult();
        sale.getSaleOrderDetail().remove(sale);
        em.close();

    }
}
