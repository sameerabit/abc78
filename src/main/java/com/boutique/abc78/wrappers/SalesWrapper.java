package com.boutique.abc78.wrappers;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleOrderDetail;

import java.util.List;

public class SalesWrapper {

    public Sale sale;

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }
}
