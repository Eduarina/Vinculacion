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
public class Usuario {
    private int idusuario;
    private String nombre;
    private String user;
    private String password;
    private String password2;
    private int tipo;

    public Usuario() {
    }

    public Usuario(String nombre, String user, String password, String password2, int tipo) {
        this.nombre = nombre;
        this.user = user;
        this.password = password;
        this.password2 = password2;
        this.tipo = tipo;
    }

    public Usuario(String nombre, String user, int tipo) {
        this.nombre = nombre;
        this.user = user;
        this.tipo = tipo;
    }


    public Usuario(int idusuario, String nombre, String user, String password, String password2, int tipo) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.user = user;
        this.password = password;
        this.password2 = password2;
        this.tipo = tipo;
    }

    public Usuario(String user, String password) {
        this.user = user;
        this.password = password;
    }


    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    
}