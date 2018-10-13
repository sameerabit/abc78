package com.boutique.abc78.service;

import com.boutique.abc78.dao.SupplierDaoImpl;
import com.boutique.abc78.model.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class SupplierService {

    @Autowired
    private SupplierDaoImpl supplierDao;


    public List<Supplier> getAllSuppliers(){
        return this.supplierDao.getAllSuppliers();
    }


    public ArrayList getSupplierByNameLike(String name) {
        ArrayList list = new ArrayList();
        List<Supplier> supplierList = supplierDao.getSupplierByNameLike(name);
        System.out.println(supplierList.toString());
        for (Supplier supplier:supplierList) {
            HashMap supplierMap = new HashMap();
            supplierMap.put("label",supplier.getName());
            supplierMap.put("value",supplier.getId());
            list.add(supplierMap);
        }
        return list;
    }

    public Supplier save(Supplier item) {
        return supplierDao.save(item);
    }

    public Supplier getSupplierById(Integer id) {
        Supplier supplier = supplierDao.getSupplierById(id);
        return supplier;
    }
}
