package com.boutique.abc78.controller;


import com.boutique.abc78.model.Sale;
import com.boutique.abc78.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/reports")
public class ReportController {

    @Autowired
    ReportService reportService;


    @RequestMapping("/daily_sale")
    public String index(Model model,@RequestParam(defaultValue="") String date){
        if(date.isEmpty()){
            return "reports/sale";
        }
        List<Sale> saleList = reportService.getDailySale(date);
        model.addAttribute("saleList",saleList);
        return  "reports/sale";
    }

}
