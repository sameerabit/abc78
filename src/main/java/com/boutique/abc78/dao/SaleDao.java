package com.boutique.abc78.dao;

import com.boutique.abc78.model.Payment;
import com.boutique.abc78.model.Sale;

import java.util.List;

public interface SaleDao {

    Sale save(Sale sale);

    List<Sale> getAllSales(String start,String end);


    Sale getSale(Integer saleId);

    void removeSaleOrderDetails(Integer saleId);

    Payment pay(Payment payment);
}
