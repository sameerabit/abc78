package com.boutique.abc78.service;

import com.boutique.abc78.dao.SaleDaoImpl;
import com.boutique.abc78.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaleService {

    @Autowired
    private SaleDaoImpl saleDao;


    public Sale save(Sale sale){
        sale = this.saleDao.save(sale);
        return sale;
    }


}
