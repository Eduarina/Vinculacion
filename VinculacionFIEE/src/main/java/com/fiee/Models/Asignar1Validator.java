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
public class Asignar1Validator implements Validator{
    @Override
    public boolean supports(Class<?> type) {
        return Asignar1.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Asignar1 asignar = (Asignar1) target;
        if(asignar.getIdmaestro()==0){
            errors.rejectValue("idmaestro", "required.idmaestro", "Seleccione un maestro");
        }
        if(asignar.getIdservicio()==0){
            errors.rejectValue("idservicio", "required.idservicio", "Seleccione un servicio");
        }
    }
}
