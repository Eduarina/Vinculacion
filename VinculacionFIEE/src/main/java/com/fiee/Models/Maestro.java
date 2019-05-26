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
    private int idusuario;
    private String correo;
    private String nombre;
    private int estatus;
    

    public Maestro() {
    }
    
    public Maestro(int idmaestro, String correo, String nombre, int estatus, int idusuario) {
        this.idmaestro = idmaestro;
        this.correo = correo;
        this.nombre = nombre;
        this.estatus = estatus;
        this.idusuario = idusuario;
    }

    public Maestro(String correo, String nombre, int estatus) {
        this.correo = correo;
        this.nombre = nombre;
        this.estatus = estatus;
    }

    public Maestro(int idmaestro, String correo, String nombre) {
        this.idmaestro = idmaestro;
        this.correo = correo;
        this.nombre = nombre;
    }

    public int getIdmaestro() {
        return idmaestro;
    }

    public void setIdmaestro(int idmaestro) {
        this.idmaestro = idmaestro;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
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

}
