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
public class ProyectoValidator implements Validator{
    @Override
    public boolean supports(Class<?> target) {
        return Proyecto.class.isAssignableFrom(target);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Encargado encargado = (Encargado) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre",
                "required.nombre", "El campo nombre es obligatorio");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "usuario",
                "required.usuario", "El campo usuario es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo",
                "required.correo", "El campo correo es obligatorio");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pass",
                "required.pass", "El campo contraseña es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pass2",
                "required.pass2", "El campo confirmar contraseña es obligatorio.");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefono",
                "required.telefono", "El campo teléfono es obligatorio");

        if(encargado.getSexo().equals("0")){
            errors.rejectValue("sexo", "required.sexo", "Seleccione un sexo");
        }
        if (encargado.getUsuario().length() < 6) {
            errors.rejectValue("usuario", "required.usuario", "El usuario debe contener al menos 6 caracteres.");
        }
        if (encargado.getPass().length() < 6) {
            errors.rejectValue("pass", "required.pass", "La contraseña debe contener al menos 6 caracteres.");
            errors.rejectValue("pass2", "required.pass2", "");
        }
        if (!encargado.getPass().equals(encargado.getPass2())) {
            errors.rejectValue("pass", "required.pass", "Las contraseñas no son iguales.");
            errors.rejectValue("pass2", "required.pass2", "");
        }
    }
}
