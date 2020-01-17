package com.boutique.abc78.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class GoodReceiveNote {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(targetEntity = Supplier.class)
    private Supplier supplier;

    @DateTimeFormat(pattern = "yy/mm/dd")
    private Date orderDate;


    @OneToMany(mappedBy = "goodReceiveNote", orphanRemoval = true, fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<GoodReceiveNoteDetail> goodReceiveNoteDetail;


    @OneToMany(mappedBy = "goodReceiveNote", orphanRemoval = true, fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
    private List<ItemBatch> itemBatches;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<GoodReceiveNoteDetail> getGoodReceiveNoteDetail() {
        return goodReceiveNoteDetail;
    }

    public void setGoodReceiveNoteDetails(List<GoodReceiveNoteDetail> goodReceiveNoteDetails) {
        this.goodReceiveNoteDetail = goodReceiveNoteDetails;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }


    public List<ItemBatch> getItemBatches() {
        return itemBatches;
    }

    public void setItemBatches(List<ItemBatch> itemBatches) {
        this.itemBatches = itemBatches;
    }
}
