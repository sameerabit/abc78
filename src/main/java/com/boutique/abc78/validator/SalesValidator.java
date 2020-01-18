package com.boutique.abc78.validator;

import com.boutique.abc78.model.ItemCategory;
import com.boutique.abc78.model.Sale;
import com.boutique.abc78.model.User;
import com.boutique.abc78.service.ItemCategoryService;
import com.boutique.abc78.wrappers.SalesWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SalesValidator implements Validator {

    @Autowired
    private ItemCategoryService itemCategoryService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Sale sale = (Sale) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "orderDate", "Order Date is Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "customer.id", "Customer is Required");

//        if (itemCategory.getId() != null && itemCategoryService.getItemCatById(itemCategory.getId()) != null) {
//            errors.rejectValue("name", "Duplicate.category.name");
//        }

    }
}
