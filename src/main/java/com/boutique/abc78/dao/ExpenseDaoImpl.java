package com.boutique.abc78.dao;

import com.boutique.abc78.model.Expense;
import com.boutique.abc78.model.Item;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class ExpenseDaoImpl implements ExpenseDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<Expense> getAllExpenses() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Expense> expenseList = em.createQuery("SELECT s FROM Expense s").getResultList();
        em.close();
        return expenseList;
    }

    @Override
    public List<Expense> getExpenseByNameLike(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Expense s where s.name LIKE :name");
        query.setParameter("name", "%" + name + "%");
        List<Expense> expenseList = query.getResultList();
        em.close();
        return expenseList;
    }

    @Override
    public Expense save(Expense expense) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        if(expense.getId() != null){
            em.merge(expense);
        }else{
            em.persist(expense);
        }
        em.getTransaction().commit();
        em.close();
        return expense;
    }

    @Override
    public Expense getExpenseById(int expenseId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Expense c where c.id = :id");
        query.setParameter("id", expenseId );
        Expense expense = (Expense) query.getSingleResult();
        em.close();
        return expense;
    }

    public List<Expense> getExpensesByDate(String date){
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
        Query query = em.createQuery("SELECT s FROM Expense s where s.date between :startDate and :endDate");
        query.setParameter("startDate", rDate);
        query.setParameter("endDate", endDate);
        List<Expense> expenseList = query.getResultList();
        em.close();
        return expenseList;
    }

    @Override
    @Transactional
    public int delete(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Expense expense = em.find(Expense.class, id);
        em.getTransaction().begin();
        em.remove(expense);
        em.getTransaction().commit();
        em.close();
        return 1;
    }

}
