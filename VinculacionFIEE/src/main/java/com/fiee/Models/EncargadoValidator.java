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
public class EncargadoValidator implements Validator{
    @Override
    public boolean supports(Class<?> target) {
        return Encargado.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Encargado encargado = (Encargado) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo",
                "required.correo", "El campo correo es obligatorio");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dependencia",
                "required.dependencia", "El campo dependencia es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "direccion",
                "required.direccion", "El campo dirección es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefono",
                "required.telefono", "El campo teléfono es obligatorio");
    }
}
