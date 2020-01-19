package com.boutique.abc78.validator;

import com.boutique.abc78.model.Supplier;
import com.boutique.abc78.model.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SupplierValidator implements Validator {



    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Supplier supplier = (Supplier) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");


    }
}
