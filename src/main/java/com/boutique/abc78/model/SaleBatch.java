package com.boutique.abc78.model;


import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class SaleBatch {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JsonIgnore
    SaleOrderDetail saleOrderDetail;

    @ManyToOne(cascade = CascadeType.ALL)
    @JsonIgnore
    ItemBatch itemBatch;

    float quantity;

    public SaleOrderDetail getSaleOrderDetail() {
        return saleOrderDetail;
    }

    public void setSaleOrderDetail(SaleOrderDetail saleOrderDetail) {
        this.saleOrderDetail = saleOrderDetail;
    }

    public ItemBatch getItemBatch() {
        return itemBatch;
    }

    public void setItemBatch(ItemBatch itemBatch) {
        this.itemBatch = itemBatch;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }
}
