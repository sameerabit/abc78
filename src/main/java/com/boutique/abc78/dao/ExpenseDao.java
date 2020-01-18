package com.boutique.abc78.dao;

import com.boutique.abc78.model.Expense;

import java.util.List;

public interface ExpenseDao {

    List<Expense> getAllExpenses();

    List<Expense> getExpenseByNameLike(String name);

    public Expense save(Expense expense);

    public Expense getExpenseById(int supplierId);

    public List<Expense> getExpensesByDate(String date,String startDate, String endDate);

    public int delete(int id);
}
