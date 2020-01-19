package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleBatch;

import java.util.List;

public interface ReportDao {

    public List<SaleBatch> dailySalesReport(String date, String startDate, String endDate);

}
