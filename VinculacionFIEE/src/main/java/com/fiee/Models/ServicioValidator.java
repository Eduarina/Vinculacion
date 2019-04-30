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
public class ServicioValidator implements Validator{
    @Override
    public boolean supports(Class<?> target) {
        return Servicio.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Servicio servicio = (Servicio) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "matricula",
                "required.matricula", "El campo matricula es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creditos",
                "required.creditos", "El créditos correo es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo",
                "required.correo", "El campo correo es obligatorio.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefono",
                "required.telefono", "El campo teléfono es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "celular",
                "required.celular", "El campo celular es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cv",
                "required.cv", "El campo habilidades y conocmientos es obligatorio.");
        
        if(servicio.getCarrera().equals("0")){
            errors.rejectValue("carrera", "required.carrera", "Seleccione un programa educativo");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "semestre",
                "required.semestre", "El campo semestre es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "horario",
                "required.horario", "El campo horario es obligatorio.");
    }
}
