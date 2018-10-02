package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;

import java.util.List;

public interface SaleDao {

    Sale save(Sale sale);

    List<Sale> getAllSales();

    Sale getSale(Integer saleId);

    void removeSaleOrderDetails(Integer saleId);
}
