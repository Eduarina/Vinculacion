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
 * @author Anemc
 */
public class VinculacionValidator implements Validator{

    @Override
    public boolean supports(Class<?> target) {
        return Vinculacion.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Vinculacion vinculacion = (Vinculacion) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre", 
                "required.nombre", "El campo nombre es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "usuario", 
                "required.usuario", "El campo usuario es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", 
                "required.password", "El campo contraseña es obligatorio");
    }
    
}
