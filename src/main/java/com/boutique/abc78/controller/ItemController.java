package com.boutique.abc78.controller;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemCategory;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.service.ItemCategoryService;
import com.boutique.abc78.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/item")
public class ItemController {

    @Autowired
    ItemService itemService;

    @Autowired
    ItemCategoryService itemCategoryService;

    @RequestMapping(value = "/getItemsNameLike", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList getItemsByNameLike(@RequestParam String name){
        ArrayList itemList = itemService.getItemByNameLike(name);
        return itemList;
    }

    @RequestMapping("/list")
    public String getAllItems(Model model){
        List<Item> items = itemService.getAllItems();
        model.addAttribute("items", items);
        return  "item_list";
    }

    @RequestMapping("/")
    public String index(Model model){
        List<ItemCategory> allCategories = itemCategoryService.getAllCategories();
        model.addAttribute("itemCategories",allCategories);
        model.addAttribute("item", new Item());
        return  "item";
    }

    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@Valid @ModelAttribute("item")Item item){
        itemService.save(item);
        return "redirect:/item/show/"+item.getId();
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        List<ItemCategory> allCategories = itemCategoryService.getAllCategories();
        model.addAttribute("itemCategories",allCategories);
        Item item = itemService.getItemById(id);
        model.addAttribute("item", item);
        return  "item";
    }



}
