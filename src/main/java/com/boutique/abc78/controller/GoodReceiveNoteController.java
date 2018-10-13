package com.boutique.abc78.controller;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.Supplier;
import com.boutique.abc78.service.SupplierService;
import com.boutique.abc78.service.GoodReceiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/grn")
public class GoodReceiveNoteController {

    @Autowired
    GoodReceiveService goodReceiveService;

    @Autowired
    SupplierService supplierService;

    @RequestMapping("/")
    public String index(Model model){
        List<Supplier> allSuppliers = supplierService.getAllSuppliers();
        model.addAttribute("supplierList",allSuppliers);
        model.addAttribute("goodReceiveNote", new GoodReceiveNote());
        return  "good_receive";
    }

    @RequestMapping("/list")
    public String getAllSales(Model model){
        List<GoodReceiveNote> allGoodReceiveNotes = goodReceiveService.getAllGoodReceiveNotes();
        model.addAttribute("goodReceiveNoteList", allGoodReceiveNotes);
        return  "good_receive_list";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        GoodReceiveNote goodReceiveNote = goodReceiveService.getGoodReceiveNote(id);
        List<Supplier> allSuppliers = supplierService.getAllSuppliers();
        model.addAttribute("customerList",allSuppliers);
        model.addAttribute("goodReceiveNote", goodReceiveNote);
        model.addAttribute("goodReceiveNoteId", id);
        return  "good_receive";
    }




}
