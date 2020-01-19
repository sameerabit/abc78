package com.boutique.abc78.dao;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Payment;
import com.boutique.abc78.model.Sale;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        sale = em.merge(sale);
        sale = em.find(Sale.class, sale.getId());
        em.getTransaction().commit();
        em.refresh(sale);
        em.close();
        return sale;
    }

    @Override
    public List<Sale> getAllSales(String start,String end) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date frmDate = null;
        Date enDate = null;
        try {
            frmDate = format.parse(start);
            enDate = format.parse(end);
        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.orderDate between :startDate and :endDate order by s.id desc");
        query.setParameter("startDate", frmDate);
        query.setParameter("endDate", enDate);
        List<Sale> saleList =query.getResultList();
        em.close();
        return saleList;
    }

    @Override
    public Sale getSale(Integer saleId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.id = :id");
        query.setParameter("id", saleId);
        Sale sale = (Sale) query.getSingleResult();
        em.close();
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

    @Override
    public Payment pay(Payment payment) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
       // Sale sale = em.find(Sale.class, payment.getSale().getId());
        payment.setSale(payment.getSale());
        payment = em.merge(payment);
        em.getTransaction().commit();
        em.refresh(payment);
        em.close();
        return payment;
    }

}
