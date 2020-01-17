package com.boutique.abc78.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ItemBatch {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private Float buyingPrice;

    private Float quantity;

    @ManyToOne(targetEntity = Item.class)
    private Item item;


    @ManyToOne(targetEntity = GoodReceiveNote.class,cascade = { CascadeType.REMOVE })
    @JsonIgnore
    private GoodReceiveNote goodReceiveNote;

    @DateTimeFormat(pattern = "yy/mm/dd")
    private Date date;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getBuyingPrice() {
        return buyingPrice;
    }

    public void setBuyingPrice(Float buyingPrice) {
        this.buyingPrice = buyingPrice;
    }

    public Float getQuantity() {
        return quantity;
    }

    public void setQuantity(Float quantity) {
        this.quantity = quantity;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public GoodReceiveNote getGoodReceiveNote() {
        return goodReceiveNote;
    }

    public void setGoodReceiveNote(GoodReceiveNote goodReceiveNote) {
        this.goodReceiveNote = goodReceiveNote;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
