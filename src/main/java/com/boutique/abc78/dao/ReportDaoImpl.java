package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Service
public class ReportDaoImpl implements ReportDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    public List<Sale> dailySalesReport(String date){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Date rDate = null;
        Date endDate = null;

        try {
            rDate = format.parse(date);
            cal.setTime(rDate);
            cal.add(Calendar.DAY_OF_MONTH, 1);
            String newDate = format.format(cal.getTime());
            endDate = format.parse(newDate);
        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Sale s where s.orderDate between :startDate and :endDate");
        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<Sale> saleList = query.getResultList();
        em.close();
        return saleList;

    }


}
