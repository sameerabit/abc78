package com.boutique.abc78.dao;


import com.boutique.abc78.model.ItemBatch;

import java.util.List;


public interface ItemBatchDao {


    public ItemBatch save(ItemBatch itemBatch);

    public List<ItemBatch> getItemBatchByItemId(int itemId);
}
