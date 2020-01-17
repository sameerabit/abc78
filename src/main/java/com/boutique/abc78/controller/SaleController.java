package com.boutique.abc78.controller;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.GoodReturnNote;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.service.CustomerService;
import com.boutique.abc78.service.GoodReturnService;
import com.boutique.abc78.service.SaleService;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/sale")
public class SaleController {

    @Autowired
    SaleService saleService;

    @Autowired
    CustomerService customerService;

    @Autowired
    GoodReturnService goodReturnService;

    @RequestMapping("/")
    public String index(Model model){
        List<Customer> allCustomers = customerService.getAllCustomers();
        model.addAttribute("customerList",allCustomers);
        model.addAttribute("sale", new Sale());
        return  "sale";
    }

    @RequestMapping("/list")
    public String getAllSales(Model model,
                              @RequestParam(defaultValue="") String start,
                              @RequestParam(defaultValue="") String end){
        List<Sale> allSales = saleService.getAllSales(start,end);
        model.addAttribute("saleList", allSales);
        return  "sale_list";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        Sale sale = saleService.getSale(id);
        List<Customer> allCustomers = customerService.getAllCustomers();
        model.addAttribute("customerList",allCustomers);
        model.addAttribute("sale", sale);
        model.addAttribute("saleId", id);
        return  "sale";
    }

    @RequestMapping(value = "/return/{id}", method = RequestMethod.GET)
    public String returnSale(@PathVariable("id") Integer id,Model model){
        Sale sale = saleService.getSale(id);
        List<Customer> allCustomers = customerService.getAllCustomers();
        model.addAttribute("customerList",allCustomers);
        model.addAttribute("sale", sale);
        model.addAttribute("saleId", id);
        return  "return_sale";
    }

    @RequestMapping("/return_list")
    public String getAllGoodReturnNotes(Model model){
        List<GoodReturnNote> allReturns = goodReturnService.getAllGoodReturnNotes();
        model.addAttribute("returnList", allReturns);
        return  "return_list";
    }


    @RequestMapping(value = "/return/show/{id}", method = RequestMethod.GET)
    public String showReturns(@PathVariable("id") Integer id,Model model){
        GoodReturnNote grn = goodReturnService.getGoodReturnNote(id);
        model.addAttribute("grn", grn);
        return  "return";
    }





}
