package com.boutique.abc78.controller;

import com.boutique.abc78.model.Payment;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.SaleOrderDetail;
import com.boutique.abc78.service.SaleService;
import com.boutique.abc78.validator.SalesValidator;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/sale")
public class SalesRestController {

    @Autowired
    SaleService saleService;

    @Autowired
    SalesValidator salesValidator;

    @RequestMapping(value="/save", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public HashMap<String, Object> store(@Valid @RequestBody Sale sale, BindingResult bindingResult, HttpServletResponse response){
        HashMap<String, Object> map = new HashMap<>();
        float total = 0;
        float discount = 0;
        salesValidator.validate(sale, bindingResult);
        if (bindingResult.hasErrors()) {
            response.setStatus(422);
            map.put("errors",bindingResult.getAllErrors());
            return map;
        }

        if(sale.getId() != null){
            saleService.removeSaleOrderDetails(sale.getId());
        }
        for (SaleOrderDetail saleOrderDetail: sale.getSaleOrderDetail()) {
            saleOrderDetail.setSale(sale);
            total += saleOrderDetail.getTotal();
        }
        sale.setTotal(total);
        sale = saleService.save(sale);
        map.put("success",sale);
        return map;
    }

    @RequestMapping(value="/show", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Sale show(@RequestParam Integer sale){
        Sale saleObj = saleService.getSale(sale);
        return saleObj;
    }

    @RequestMapping(value="/pay", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Payment store(@RequestBody Payment payment){
        return saleService.pay(payment);
    }
}
