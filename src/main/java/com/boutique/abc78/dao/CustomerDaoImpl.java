package com.boutique.abc78.dao;

import com.boutique.abc78.model.Customer;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class CustomerDaoImpl implements CustomerDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<Customer> getAllCustomers() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Customer> customerList = em.createQuery("SELECT c FROM Customer c").getResultList();
        return customerList;
    }

    @Override
    public List<Customer> getCustomerByNameLike(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Customer c where c.name LIKE :name");
        query.setParameter("name", "%" + name + "%");
        List<Customer> customerList = query.getResultList();
        return customerList;
    }
}
