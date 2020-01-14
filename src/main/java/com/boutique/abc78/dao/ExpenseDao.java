package com.boutique.abc78.dao;

import com.boutique.abc78.model.Expense;

import java.util.List;

public interface ExpenseDao {

    List<Expense> getAllExpenses();

    List<Expense> getExpenseByNameLike(String name);

    public Expense save(Expense expense);

    public Expense getExpenseById(int supplierId);
}
