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
public class UsuarioValidator2 implements Validator{
    @Override
    public boolean supports(Class<?> type) {
        return Usuario.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Usuario usuario = (Usuario) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre", 
                "required.nombre", "El campo nombre es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "matricula", 
                "required.matricula", "El campo matricula es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "semestre", 
                "required.semestre", "El campo semestre es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "correo", 
                "required.correo", "El campo correo es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telefono", 
                "required.telefono", "El campo telefono es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "celular", 
                "required.celular", "El campo celular es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", 
                "required.user", "El campo usuario es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", 
                "required.password", "El campo contraseña es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", 
                "required.password2", "El campo confirmar contraseña es obligatorio.");
        
        if(usuario.getSexo().equals("0")){
            errors.rejectValue("sexo", "required.sexo", "Seleccione un sexo");
        }
        if(usuario.getCarrera()==0){
            errors.rejectValue("carrera", "required.carrera", "Seleccione una carrera");
        }
        if(usuario.getUser().length()<6){
            errors.rejectValue("user", "required.user", "El usuario debe contener al menos 6 caracteres.");
        }
        if(usuario.getPassword().length()<6){
            errors.rejectValue("password", "required.password", "La contraseña debe contener al menos 6 caracteres.");
            errors.rejectValue("password2", "required.password2", "");
        }
        if(!usuario.getPassword().equals(usuario.getPassword2())){
            errors.rejectValue("password", "required.password", "Las contraseñas no son iguales.");
            errors.rejectValue("password2", "required.password2", "");
        }
    }
}
