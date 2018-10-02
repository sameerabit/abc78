package com.boutique.abc78.controller;

import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleOrderDetail;
import com.boutique.abc78.service.SaleService;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping(value = "/api/sale")
public class SalesRestController {

    @Autowired
    SaleService saleService;

    @RequestMapping(value="/save", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String store(@RequestBody SalesWrapper salesWrapper){
        for (SaleOrderDetail saleOrderDetail: salesWrapper.getSale().getSaleOrderDetail()) {
            saleOrderDetail.setSale(salesWrapper.getSale());
        }
        saleService.save(salesWrapper.sale);
        return "sale";
    }
}
