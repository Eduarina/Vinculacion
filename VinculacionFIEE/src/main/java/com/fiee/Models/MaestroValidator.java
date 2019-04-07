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
public class MaestroValidator implements Validator {

    @Override
    public boolean supports(Class<?> target) {
        return Maestro.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Maestro maestro = (Maestro) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo",
                "required.correo", "El campo correo es obligatorio");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "carrera",
                "required.carrera", "El campo carrera es obligatorio");
    }
}
