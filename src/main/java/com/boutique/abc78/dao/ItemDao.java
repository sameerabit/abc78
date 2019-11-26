package com.boutique.abc78.dao;


import com.boutique.abc78.model.Item;

import java.util.List;

public interface ItemDao {

    List<Item> getAllItems();

    List<Item> getItemByNameLike(String name);

    public Item save(Item item);

    public Item getItemById(int itemId);

    public int delete(int id);

}
