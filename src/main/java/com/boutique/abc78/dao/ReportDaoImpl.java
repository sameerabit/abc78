package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleBatch;
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


    public List<SaleBatch> dailySalesReport(String date,String startDate,String eDate){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Date rDate = null;
        Date endDate = null;

        try {


            if(!startDate.isEmpty() && !eDate.isEmpty()){
                rDate = format.parse(startDate);
                endDate = format.parse(eDate);
            } else {
                rDate = format.parse(date);
                cal.setTime(rDate);
                cal.add(Calendar.DAY_OF_MONTH, 1);
                String newDate = format.format(cal.getTime());
                endDate = format.parse(newDate);
            }


        } catch (ParseException ex){

        }
        EntityManager em = entityManagerFactory.createEntityManager();
//        Query query = em.createQuery("SELECT s FROM Sale s where s.orderDate between :startDate and :endDate");
        Query query = em.createQuery("SELECT sb FROM SaleBatch sb, SaleOrderDetail sod, Sale s where sb.saleOrderDetail = sod and sod.sale = s and s.orderDate between :startDate and :endDate");


        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<SaleBatch> saleBatches = query.getResultList();

        em.close();
        return saleBatches;

    }


}
