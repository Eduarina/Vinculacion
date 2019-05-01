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
public class ReporteValidator implements Validator{
    @Override
    public boolean supports(Class<?> target) {
        return Servicio.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Bitacora bitacora = (Bitacora) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "datepicker",
                "required.datepicker", "El campo fecha es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dependencia",
                "required.dependencia", "El dependencia es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefono",
                "required.telefono", "El campo telefóno es obligatorio.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "proyecto",
                "required.proyecto", "El campo nombre del proyecto es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "horario",
                "required.horario", "El campo horario es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "actividades",
                "required.actividades", "El campo actividades generales es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcion",
                "required.descripcion", "El campo descripcion de actividades es obligatorio.");
    }
}
