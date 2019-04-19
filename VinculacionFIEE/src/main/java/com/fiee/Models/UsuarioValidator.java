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
public class UsuarioValidator implements Validator{
    @Override
    public boolean supports(Class<?> type) {
        return Usuario.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Usuario usuario = (Usuario) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre", 
                "required.nombre", "El campo nombre es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", 
                "required.user", "El campo usuario es obligatorio");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", 
                "required.password", "El campo contraseña es obligatorio");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", 
                "required.password2", "El campo confirmar contraseña es obligatorio.");
        
        if(usuario.getTipo()==0){
            errors.rejectValue("tipo", "required.tipo", "Seleccione un tipo");
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
