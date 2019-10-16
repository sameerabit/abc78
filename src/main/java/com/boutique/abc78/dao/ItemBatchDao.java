package com.boutique.abc78.dao;


import com.boutique.abc78.model.ItemBatch;
import com.boutique.abc78.model.SaleOrderDetail;

import java.util.List;


public interface ItemBatchDao {


    public ItemBatch save(ItemBatch itemBatch);

    public List<ItemBatch> getItemBatchByItemId(int itemId);

    public void reduceQuantityForSales(SaleOrderDetail saleOrderDetail);
}
