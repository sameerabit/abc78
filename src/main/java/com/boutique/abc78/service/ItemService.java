package com.boutique.abc78.service;

import com.boutique.abc78.dao.ItemDaoImpl;
import com.boutique.abc78.model.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemDaoImpl itemDao;


    public List<Item> getAllItems() {
        return this.itemDao.getAllItems();
    }


    public ArrayList getItemByNameLike(String name) {
        ArrayList list = new ArrayList();
        List<Item> itemList = itemDao.getItemByNameLike(name);
        for (Item item : itemList) {
            HashMap itemMap = new HashMap();
            itemMap.put("label", item.getName());
            itemMap.put("value", item.getId());
            list.add(itemMap);
        }
        return list;
    }

    public Item save(Item item) {
        return itemDao.save(item);
    }

    public Item getItemById(Integer id) {
        Item item = itemDao.getItemById(id);
        return item;
    }
}
