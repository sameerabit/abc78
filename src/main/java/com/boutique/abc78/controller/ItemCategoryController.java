package com.boutique.abc78.controller;

import com.boutique.abc78.model.Item;
import com.boutique.abc78.model.ItemCategory;
import com.boutique.abc78.service.ItemCategoryService;
import com.boutique.abc78.service.ItemService;
import com.boutique.abc78.validator.CategoryValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/category")
public class ItemCategoryController {


    @Autowired
    ItemCategoryService itemCategoryService;

    @Autowired
    CategoryValidator categoryValidator;


    @RequestMapping("/list")
    public String getAllItems(@RequestParam(defaultValue="") String search,Model model){
        List<ItemCategory> itemCategories = itemCategoryService.getAllCategories(search);
        model.addAttribute("itemCategories", itemCategories);
        return  "item_cat_list";
    }

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("itemCategory", new ItemCategory());
        return  "category";
    }

    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@Valid @ModelAttribute("itemCategory")ItemCategory itemCategory, BindingResult bindingResult){
        categoryValidator.validate(itemCategory, bindingResult);
        if (bindingResult.hasErrors()) {
            return "category";
        }
        itemCategory = itemCategoryService.save(itemCategory);
        return "redirect:/category/show/"+itemCategory.getId();
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        ItemCategory itemCategory = itemCategoryService.getItemCatById(id);
        model.addAttribute("itemCategory", itemCategory);
        return  "category";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id,Model model){
        int res = itemCategoryService.delete(id);
        return "redirect:/category/list/";

    }



}
