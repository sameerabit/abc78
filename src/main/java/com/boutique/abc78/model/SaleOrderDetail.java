package com.boutique.abc78.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class SaleOrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(targetEntity = Sale.class)
    @JsonIgnore
    private Sale sale;

    @ManyToOne(targetEntity = Item.class)
    private Item item;


    @ManyToMany(fetch=FetchType.LAZY)
    @JsonIgnore
    @JoinTable(
            name = "sales_batches",
            joinColumns = { @JoinColumn(name = "item_batch_id") },
            inverseJoinColumns = { @JoinColumn(name = "sale_order_detail_id") }
    )
    private Set<ItemBatch> itemBatches = new HashSet<>();

    private Float price;

    private Float discount;

    private Float total;

    private Float quantity;

    private Float returned;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Float getQuantity() {
        return quantity;
    }

    public void setQuantity(Float quantity) {
        this.quantity = quantity;
    }


    public Float getReturned() {
        return returned;
    }

    public void setReturned(Float returned) {
        this.returned = returned;
    }

    public Set<ItemBatch> getItemBatches() {
        return itemBatches;
    }

    public void setItemBatches(Set<ItemBatch> itemBatches) {
        this.itemBatches = itemBatches;
    }
}
