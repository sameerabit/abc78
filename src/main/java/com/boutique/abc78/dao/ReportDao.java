package com.boutique.abc78.dao;

import com.boutique.abc78.model.Sale;

import java.util.List;

public interface ReportDao {

    public Sale dailySalesReport(String date);

}
