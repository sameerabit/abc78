package com.boutique.abc78.controller;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemCategory;
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
@RequestMapping(value = "/itemCategory")
public class ItemCategoryController {


    @Autowired
    ItemCategoryService itemCategoryService;


    @RequestMapping("/list")
    public String getAllItems(Model model){
        List<ItemCategory> itemCategories = itemCategoryService.getAllCategories();
        model.addAttribute("itemCategories", itemCategories);
        return  "item_cat_list";
    }

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("itemCategory", new ItemCategory());
        return  "category";
    }

    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@Valid @ModelAttribute("item")ItemCategory itemCategory){
        itemCategoryService.save(itemCategory);
        return "redirect:/itemCategory/show/"+itemCategory.getId();
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        ItemCategory itemCategory = itemCategoryService.getItemCatById(id);
        model.addAttribute("itemCategory", itemCategory);
        return  "category";
    }



}
