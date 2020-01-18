package com.boutique.abc78.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Sale {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(targetEntity = Customer.class)
    private Customer customer;

    @DateTimeFormat(pattern = "yy/mm/dd")
    private Date orderDate;

    @OneToOne(mappedBy = "payment")
    private Payment payment;

    private float totalDiscount;

    private float total;

    @OneToMany(mappedBy = "sale",orphanRemoval=true,fetch=FetchType.LAZY, cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<SaleOrderDetail> saleOrderDetail;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public List<SaleOrderDetail> getSaleOrderDetail() {
        return saleOrderDetail;
    }

    public void setSaleOrderDetail(List<SaleOrderDetail> saleOrderDetail) {
        this.saleOrderDetail = saleOrderDetail;
    }

    public float getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(float totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", customer=" + customer +
                ", orderDate=" + orderDate +
                ", saleOrderDetail=" + saleOrderDetail +
                ", status='" + status + '\'' +
                '}';
    }
}
