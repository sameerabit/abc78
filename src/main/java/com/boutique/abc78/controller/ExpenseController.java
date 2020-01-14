package com.boutique.abc78.controller;

import com.boutique.abc78.model.Expense;
import com.boutique.abc78.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/expenses")
public class ExpenseController {


    @Autowired
    ExpenseService expenseService;

    @RequestMapping(value = "/getExpensesByNameLike", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList getExpensesByNameLike(@RequestParam String name){
        ArrayList expenseList = expenseService.getExpenseByNameLike(name);
        return expenseList;
    }

    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@ModelAttribute("expense")Expense expense){
        expenseService.save(expense);
        return "redirect:/expenses/show/"+expense.getId();
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id,Model model){
        Expense expense = expenseService.getExpenseById(id);
        model.addAttribute("expense", expense);
        return  "expense";
    }

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("expense", new Expense());
        return  "expense";
    }

    @RequestMapping("/list")
    public String getAllItems(Model model){
        List<Expense> expenses = expenseService.getAllExpenses();
        model.addAttribute("expenses", expenses);
        return  "expense_list";
    }

}
