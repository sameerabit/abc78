package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Service
public class ReportDaoImpl implements ReportDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    public Sale dailySalesReport(String date){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date rDate = null;
        try {
            rDate = format.parse(date);
        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.orderDate = :date");
        query.setParameter("date", rDate);
        Sale sale = (Sale)query.getSingleResult();
        em.close();
        return sale;

    }


}
