package com.boutique.abc78.dao;

import com.boutique.abc78.model.ItemCategory;

import java.util.List;

public interface ItemCategoryDao {

    List<ItemCategory> getAllCategories();

    public ItemCategory  save(ItemCategory itemCategory);

    public ItemCategory getItemCatById(int itemCatId);

}
