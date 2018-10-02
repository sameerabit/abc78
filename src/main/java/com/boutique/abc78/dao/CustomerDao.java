package com.boutique.abc78.dao;

import com.boutique.abc78.model.Customer;

import java.util.List;

public interface CustomerDao {

    List<Customer> getAllCustomers();

    List<Customer> getCustomerByNameLike(String name);
}
