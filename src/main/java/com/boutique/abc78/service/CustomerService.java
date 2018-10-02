package com.boutique.abc78.service;

import com.boutique.abc78.dao.CustomerDaoImpl;
import com.boutique.abc78.dao.SaleDaoImpl;
import com.boutique.abc78.model.Customer;
import com.boutique.abc78.model.Sale;
import com.sun.org.apache.xerces.internal.xs.StringList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerDaoImpl customerDao;


    public List<Customer> getAllCustomers(){
        return this.customerDao.getAllCustomers();
    }


    public ArrayList getCustomerByNameLike(String name) {
        ArrayList list = new ArrayList();
        List<Customer> customerList = customerDao.getCustomerByNameLike(name);
        System.out.println(customerList.toString());
        for (Customer customer:customerList) {
            HashMap customerMap = new HashMap();
            customerMap.put("label",customer.getName());
            customerMap.put("value",customer.getId());
            list.add(customerMap);
        }
        return list;
    }
}
