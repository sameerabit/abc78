package com.boutique.abc78.dao;

import com.boutique.abc78.model.Supplier;

import java.util.List;

public interface SupplierDao {

    List<Supplier> getAllSuppliers();

    List<Supplier> getSupplierByNameLike(String name);

    public Supplier save(Supplier supplier);

    public Supplier getSupplierById(int supplierId);

    public int delete(int id);

}
