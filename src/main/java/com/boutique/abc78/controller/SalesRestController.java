package com.boutique.abc78.controller;

import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleOrderDetail;
import com.boutique.abc78.service.SaleService;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping(value = "/api/sale")
public class SalesRestController {

    @Autowired
    SaleService saleService;

    @RequestMapping(value="/save", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String store(@RequestBody SalesWrapper salesWrapper){
        float total = 0;
        float discount = 0;
        if(salesWrapper.getSale().getId() != null){
            saleService.removeSaleOrderDetails(salesWrapper.sale.getId());
        }
        for (SaleOrderDetail saleOrderDetail: salesWrapper.getSale().getSaleOrderDetail()) {
            saleOrderDetail.setSale(salesWrapper.getSale());
            total += saleOrderDetail.getTotal();
        }
        salesWrapper.getSale().setTotal(total);
        saleService.save(salesWrapper.sale);
        return "sale";
    }

    @RequestMapping(value="/show", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Sale show(@RequestParam Integer sale){
        Sale saleObj = saleService.getSale(sale);
        return saleObj;
    }
}
