package com.boutique.abc78.controller;

import com.boutique.abc78.model.Customer;
import com.boutique.abc78.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {


    @Autowired
    CustomerService customerService;

    @RequestMapping(value = "/getCustomersByNameLike", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList getCustomersByNameLike(@RequestParam String name){
        ArrayList customerList = customerService.getCustomerByNameLike(name);
        return customerList;
    }

}
