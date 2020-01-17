package com.boutique.abc78.model;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class GoodReturnNote {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(targetEntity = Sale.class)
    private Sale sale;

    @DateTimeFormat(pattern = "yy/mm/dd")
    private Date returnDate;


    @OneToMany(mappedBy = "goodReturnNote", orphanRemoval = true, fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<GoodReturnNoteDetail> goodReturnNoteDetail;


    private Float total;


    public void setTotal(Float total) {
        this.total = total;
    }

    public Float getTotal() {
        total = 0.0f;
        for (GoodReturnNoteDetail grn: this.getGoodReturnNoteDetails()) {
            total += grn.getQuantity()*grn.getSellingPrice();
        }
        return total;
    }


    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<GoodReturnNoteDetail> getGoodReturnNoteDetail() {
        return goodReturnNoteDetail;
    }

    public void setGoodReturnNoteDetail(List<GoodReturnNoteDetail> goodReturnNoteDetails) {
        this.goodReturnNoteDetail = goodReturnNoteDetails;
    }

    public List<GoodReturnNoteDetail> getGoodReturnNoteDetails() {
        return goodReturnNoteDetail;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }




}
