package com.boutique.abc78.service;

import com.boutique.abc78.dao.SaleDaoImpl;
import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleService {

    @Autowired
    private SaleDaoImpl saleDao;


    public Sale save(Sale sale){
        sale = this.saleDao.save(sale);
        return sale;
    }

    public List<Sale> getAllSales(){
        return this.saleDao.getAllSales();
    }

    public Sale getSale(Integer saleId){
        return this.saleDao.getSale(saleId);
    }

    public void removeSaleOrderDetails(Integer saledId){
        this.saleDao.removeSaleOrderDetails(saledId);
    }


}
