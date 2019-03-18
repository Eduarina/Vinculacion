/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Models;

/**
 *
 * @author Anemc
 */
public class Encargado {
    private int idencargado;
    private String nombre;
    private String usuario;
    private String password;
    private String correo;

    public Encargado() {
    }

    public Encargado(String nombre, String usuario, String correo) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.correo = correo;
    }

    public Encargado(String nombre, String usuario, String password, String correo) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
    }

    public Encargado(int idencargado, String nombre, String usuario, String password, String correo) {
        this.idencargado = idencargado;
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
    }

    public int getIdencargado() {
        return idencargado;
    }

    public void setIdencargado(int idencargado) {
        this.idencargado = idencargado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
}
