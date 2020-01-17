package com.boutique.abc78.service;


import com.boutique.abc78.dao.ReportDaoImpl;
import com.boutique.abc78.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {

    @Autowired
    private ReportDaoImpl reportDao;


    public List<Sale> getDailySale(String date){
        return this.reportDao.dailySalesReport(date);
    }


}
