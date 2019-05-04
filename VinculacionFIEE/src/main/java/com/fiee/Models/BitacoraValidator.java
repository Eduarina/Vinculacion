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
public class BitacoraValidator implements Validator{
    @Override
    public boolean supports(Class<?> target) {
        return Servicio.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Bitacora bitacora = (Bitacora) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dependencia",
                "required.dependencia", "El campo dependencia es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "direccion",
                "required.direccion", "El ubicacion ubiación es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "datepicker",
                "required.datepicker", "El campo fecha de bitácora es obligatorio.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "actividades",
                "required.actividades", "El campo actividades generales es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcion",
                "required.descripcion", "El campo descripcion de actividades es obligatorio.");
    }
}
