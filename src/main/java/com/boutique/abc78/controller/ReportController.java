package com.boutique.abc78.controller;


import com.boutique.abc78.model.*;
import com.boutique.abc78.service.ExpenseService;
import com.boutique.abc78.service.GoodReturnService;
import com.boutique.abc78.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(value = "/reports")
public class ReportController {

    @Autowired
    ReportService reportService;

    @Autowired
    GoodReturnService goodReturnService;

    @Autowired
    ExpenseService expenseService;


    @RequestMapping("/daily_sale")
    public String index(Model model,@RequestParam(defaultValue="") String date,
                        @RequestParam(defaultValue="") String startDate,
                        @RequestParam(defaultValue="") String endDate
                        ){
        if(date.isEmpty()){
            return "reports/sale";
        }
        List<SaleBatch> saleBatches = reportService.getDailySale(date,startDate,endDate);
        List<GoodReturnNote> goodReturnNoteList = goodReturnService.getAllGoodReturnNotesByDate(date,startDate,endDate);
        List<Expense> expenseList = expenseService.getExpensesByDate(date,startDate,endDate);

        float totalSales = 0;
        float profit = 0;
        float totalDiscount = 0;
        float grnTotal = 0;
        float expTotal = 0;



        for (SaleBatch saleBatch: saleBatches) {
            totalSales+= saleBatch.getSaleOrderDetail().getPrice() * saleBatch.getQuantity();
            profit += (saleBatch.getSaleOrderDetail().getPrice() - saleBatch.getItemBatch().getBuyingPrice())*saleBatch.getQuantity();
        }

        for (GoodReturnNote goodReturnNote: goodReturnNoteList) {
            for(GoodReturnNoteDetail goodReturnNoteDetail :goodReturnNote.getGoodReturnNoteDetails()){
                grnTotal += goodReturnNoteDetail.getSellingPrice()*goodReturnNoteDetail.getQuantity();
            }
        }

        for(Expense expense : expenseList){
            expTotal += expense.getAmount();
        }

        model.addAttribute("saleBatches",saleBatches);
        model.addAttribute("goodReturnNoteList",goodReturnNoteList);
        model.addAttribute("expenseList",expenseList);
        model.addAttribute("profit",profit);
        model.addAttribute("totalSales",totalSales);
        model.addAttribute("totalDiscount",totalDiscount);
        model.addAttribute("grnTotal",grnTotal);
        model.addAttribute("expTotal",expTotal);

        return  "reports/sale";
    }

    @RequestMapping("/range_sale")
    public String rangeSales(Model model,@RequestParam(defaultValue="") String date,
                        @RequestParam(defaultValue="") String startDate,
                        @RequestParam(defaultValue="") String endDate
    ){
        List<SaleBatch> saleBatches = reportService.getDailySale(date,startDate,endDate);
        List<GoodReturnNote> goodReturnNoteList = goodReturnService.getAllGoodReturnNotesByDate(date,startDate,endDate);
        List<Expense> expenseList = expenseService.getExpensesByDate(date,startDate,endDate);

        float totalSales = 0;
        float profit = 0;
        float totalDiscount = 0;
        float grnTotal = 0;
        float expTotal = 0;



        for (SaleBatch saleBatch: saleBatches) {
            totalSales+= saleBatch.getSaleOrderDetail().getPrice() * saleBatch.getQuantity();
            profit += (saleBatch.getSaleOrderDetail().getPrice() - saleBatch.getItemBatch().getBuyingPrice())*saleBatch.getQuantity();
        }

        for (GoodReturnNote goodReturnNote: goodReturnNoteList) {
            for(GoodReturnNoteDetail goodReturnNoteDetail :goodReturnNote.getGoodReturnNoteDetails()){
                grnTotal += goodReturnNoteDetail.getSellingPrice()*goodReturnNoteDetail.getQuantity();
            }
        }

        for(Expense expense : expenseList){
            expTotal += expense.getAmount();
        }

        model.addAttribute("saleBatches",saleBatches);
        model.addAttribute("goodReturnNoteList",goodReturnNoteList);
        model.addAttribute("expenseList",expenseList);
        model.addAttribute("profit",profit);
        model.addAttribute("totalSales",totalSales);
        model.addAttribute("totalDiscount",totalDiscount);
        model.addAttribute("grnTotal",grnTotal);
        model.addAttribute("expTotal",expTotal);

        return  "reports/dateWiseSales";
    }

}
