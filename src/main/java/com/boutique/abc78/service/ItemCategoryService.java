package com.boutique.abc78.service;

import com.boutique.abc78.dao.ItemCategoryDao;
import com.boutique.abc78.dao.ItemCategoryDaoImpl;
import com.boutique.abc78.dao.ItemDaoImpl;
import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ItemCategoryService {

    @Autowired
    private ItemCategoryDaoImpl itemCategoryDao;


    public List<ItemCategory> getAllCategories(String search) {
        return this.itemCategoryDao.getAllCategories(search);
    }

    public ItemCategory save(ItemCategory itemCategory) {

        return itemCategoryDao.save(itemCategory);
    }

    public ItemCategory getItemCatById(Integer id) {
        ItemCategory itemCategory = itemCategoryDao.getItemCatById(id);
        return itemCategory;
    }

    public int delete(int id){
        return itemCategoryDao.delete(id);
    }


}
