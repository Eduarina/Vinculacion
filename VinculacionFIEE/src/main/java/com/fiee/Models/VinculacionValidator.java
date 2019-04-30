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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo", 
                "required.correo", "El campo correo es obligatorio");
        
        if(vinculacion.getCarrera().equals("0")){
            errors.rejectValue("carrera", "required.carrera", "Seleccione un programa educativo");
        }
    }
    
}
