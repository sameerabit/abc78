package com.boutique.abc78.service;

import com.boutique.abc78.dao.ExpenseDaoImpl;
import com.boutique.abc78.model.Expense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ExpenseService {

    @Autowired
    private ExpenseDaoImpl expenseDao;


    public List<Expense> getAllExpenses(){
        return this.expenseDao.getAllExpenses();
    }


    public ArrayList getExpenseByNameLike(String name) {
        ArrayList list = new ArrayList();
        List<Expense> expenseList = expenseDao.getExpenseByNameLike(name);
        System.out.println(expenseList.toString());
        for (Expense expense:expenseList) {
            HashMap expenseMap = new HashMap();
            expenseMap.put("label",expense.getName());
            expenseMap.put("value",expense.getId());
            list.add(expenseMap);
        }
        return list;
    }

    public Expense save(Expense item) {
        return expenseDao.save(item);
    }

    public Expense getExpenseById(Integer id) {
        Expense expense = expenseDao.getExpenseById(id);
        return expense;
    }

    public int delete(int id){
        return expenseDao.delete(id);
    }

    public List<Expense> getExpensesByDate(String date) {
        List<Expense> expenses = expenseDao.getExpensesByDate(date);
        return expenses;
    }
}
