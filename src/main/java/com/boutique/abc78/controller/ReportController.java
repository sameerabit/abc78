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
    public String index(Model model,@RequestParam(defaultValue="") String date){
        if(date.isEmpty()){
            return "reports/sale";
        }
        List<Sale> saleList = reportService.getDailySale(date);
        List<GoodReturnNote> goodReturnNoteList = goodReturnService.getAllGoodReturnNotesByDate(date);
        List<Expense> expenseList = expenseService.getExpensesByDate(date);

        float totalSales = 0;
        float profit = 0;
        float totalDiscount = 0;
        float grnTotal = 0;
        float expTotal = 0;



        for (Sale sale: saleList) {
            for (SaleOrderDetail saleOrderDetail:sale.getSaleOrderDetail()) {
                for (ItemBatch itemBatch:saleOrderDetail.getItemBatches()) {
                    totalSales+= saleOrderDetail.getTotal();
                    profit += saleOrderDetail.getTotal() - (itemBatch.getBuyingPrice()*saleOrderDetail.getQuantity());
                }
            }
        }

        for (GoodReturnNote goodReturnNote: goodReturnNoteList) {
            for(GoodReturnNoteDetail goodReturnNoteDetail :goodReturnNote.getGoodReturnNoteDetails()){
                grnTotal += goodReturnNoteDetail.getSellingPrice()*goodReturnNoteDetail.getQuantity();
            }
        }

        for(Expense expense : expenseList){
            expTotal += expense.getAmount();
        }

        model.addAttribute("saleList",saleList);
        model.addAttribute("goodReturnNoteList",goodReturnNoteList);
        model.addAttribute("expenseList",expenseList);
        model.addAttribute("profit",profit);
        model.addAttribute("totalSales",totalSales);
        model.addAttribute("totalDiscount",totalDiscount);
        model.addAttribute("grnTotal",grnTotal);
        model.addAttribute("expTotal",expTotal);

        return  "reports/sale";
    }

}
