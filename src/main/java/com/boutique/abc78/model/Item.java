package com.boutique.abc78.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    private String description;

    private BigDecimal price;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = ItemCategory.class)
    private ItemCategory itemCategory;

    @OneToMany(mappedBy = "item", orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<ItemBatch> itemBatches;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public ItemCategory getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(ItemCategory itemCategory) {
        this.itemCategory = itemCategory;
    }


    public List<ItemBatch> getItemBatches() {
        return itemBatches;
    }

    public void setItemBatches(List<ItemBatch> itemBatches) {
        this.itemBatches = itemBatches;
    }
}
