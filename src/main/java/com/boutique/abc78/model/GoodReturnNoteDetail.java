package com.boutique.abc78.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class GoodReturnNoteDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(targetEntity = GoodReturnNote.class)
    @JsonIgnore
    private GoodReturnNote goodReturnNote;

    @ManyToOne(targetEntity = Item.class)
    private Item item;

    private Float sellingPrice;

    private Float total;

    private Float quantity;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
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

    public GoodReturnNote getGoodReturnNote() {
        return goodReturnNote;
    }

    public void setGoodReturnNote(GoodReturnNote goodReturnNote) {
        this.goodReturnNote = goodReturnNote;
    }

    public Float getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Float sellingPrice) {
        this.sellingPrice = sellingPrice;
    }
}
