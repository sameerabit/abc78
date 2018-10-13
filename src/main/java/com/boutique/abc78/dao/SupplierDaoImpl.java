package com.boutique.abc78.dao;

import com.boutique.abc78.model.Supplier;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

@Service
public class SupplierDaoImpl implements SupplierDao {

    private EntityManagerFactory entityManagerFactory;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf){
        this.entityManagerFactory = emf;
    }


    @Override
    public List<Supplier> getAllSuppliers() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Supplier> supplierList = em.createQuery("SELECT s FROM Supplier s").getResultList();
        return supplierList;
    }

    @Override
    public List<Supplier> getSupplierByNameLike(String name) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT s FROM Supplier s where s.name LIKE :name");
        query.setParameter("name", "%" + name + "%");
        List<Supplier> supplierList = query.getResultList();
        return supplierList;
    }

    @Override
    public Supplier save(Supplier supplier) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.persist(supplier);
        em.getTransaction().commit();
        return supplier;
    }

    @Override
    public Supplier getSupplierById(int supplierId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createQuery("SELECT c FROM Supplier c where c.id = :id");
        query.setParameter("id", supplierId );
        Supplier supplier = (Supplier) query.getSingleResult();
        return supplier;
    }
}
