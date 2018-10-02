package com.boutique.abc78.controller;

import com.boutique.abc78.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping(value = "/item")
public class ItemController {

    @Autowired
    ItemService itemService;

    @RequestMapping(value = "/getItemsNameLike", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList getItemsByNameLike(@RequestParam String name){
        ArrayList itemList = itemService.getItemByNameLike(name);
        return itemList;
    }

}
