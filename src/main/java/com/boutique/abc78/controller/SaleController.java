package com.boutique.abc78.controller;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.service.CustomerService;
import com.boutique.abc78.service.SaleService;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/sale")
public class SaleController {

    @Autowired
    SaleService saleService;

    @Autowired
    CustomerService customerService;

    @RequestMapping("/")
    public String index(Model model){
        List<Customer> allCustomers = customerService.getAllCustomers();
        model.addAttribute("customerList",allCustomers);
        model.addAttribute("sale", new Sale());
        return  "sale";
    }




}
