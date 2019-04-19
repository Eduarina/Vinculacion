/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Models;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Emrys
 */
public class VencimientoValidator implements Validator{
    @Override
    public boolean supports(Class<?> type) {
        return Vencimiento.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Vencimiento vencimiento = (Vencimiento) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "datepicker", 
                "required.datepicker", "El campo fecha es obligatorio");
        
    }
}
