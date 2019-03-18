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
public class Vinculacion {
    private int idvinculacion;
    private String nombre;
    private String usuario;
    private String password;

    public Vinculacion(String nombre, String usuario) {
        this.nombre = nombre;
        this.usuario = usuario;
    }

    public Vinculacion() {
    }

    public Vinculacion(String nombre, String usuario, String password) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
    }

    public int getIdvinculacion() {
        return idvinculacion;
    }

    public void setIdvinculacion(int idvinculacion) {
        this.idvinculacion = idvinculacion;
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

    public Vinculacion(int idvinculacion, String nombre, String usuario, String password) {
        this.idvinculacion = idvinculacion;
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
    }

}