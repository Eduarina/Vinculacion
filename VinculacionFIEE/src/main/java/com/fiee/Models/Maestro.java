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
public class Maestro {
    private int idmaestro;
    private String nombre;
    private String usuario;
    private String password;
    private String correo;

    public Maestro() {
    }

    public Maestro(String nombre, String usuario, String correo) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.correo = correo;
    }

    public Maestro(String nombre, String usuario, String password, String correo) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
    }

    public Maestro(int idmaestro, String nombre, String usuario, String password, String correo) {
        this.idmaestro = idmaestro;
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
    }

    public int getIdmaestro() {
        return idmaestro;
    }

    public void setIdmaestro(int idmaestro) {
        this.idmaestro = idmaestro;
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
