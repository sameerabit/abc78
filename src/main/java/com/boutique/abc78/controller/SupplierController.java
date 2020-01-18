package com.boutique.abc78.controller;

import com.boutique.abc78.model.Supplier;
import com.boutique.abc78.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/supplier")
public class SupplierController {


    @Autowired
    SupplierService supplierService;

    @RequestMapping(value = "/getSuppliersByNameLike", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList getSuppliersByNameLike(@RequestParam String name){
        ArrayList supplierList = supplierService.getSupplierByNameLike(name);
        return supplierList;
    }

    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@Valid @ModelAttribute("supplier")Supplier supplier){
        supplierService.save(supplier);
        return "redirect:/supplier/show/"+supplier.getId();
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        Supplier supplier = supplierService.getSupplierById(id);
        model.addAttribute("supplier", supplier);
        return  "supplier";
    }

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("supplier", new Supplier());
        return  "supplier";
    }

    @RequestMapping("/list")
    public String getAllItems(Model model){
        List<Supplier> suppliers = supplierService.getAllSuppliers();
        model.addAttribute("suppliers", suppliers);
        return  "supplier_list";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id,Model model){
        int res = supplierService.delete(id);
        return "redirect:/supplier/list/";

    }

}
