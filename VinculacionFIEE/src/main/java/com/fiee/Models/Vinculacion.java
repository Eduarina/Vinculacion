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
    private String correo;
    private String carrera;
    private int idusuario;

    public Vinculacion() {
    }

    public Vinculacion(String correo, String carrera) {
        this.correo = correo;
        this.carrera = carrera;
    }

    public Vinculacion(int idvinculacion, String correo, String carrera) {
        this.idvinculacion = idvinculacion;
        this.correo = correo;
        this.carrera = carrera;
    }

    public Vinculacion(String correo, String carrera, int idusuario) {
        this.correo = correo;
        this.carrera = carrera;
        this.idusuario = idusuario;
    }

    public Vinculacion(int idusuario) {
        this.idusuario = idusuario;
    }

    public Vinculacion(int idvinculacion, String correo, String carrera, int idusuario) {
        this.idvinculacion = idvinculacion;
        this.correo = correo;
        this.carrera = carrera;
        this.idusuario = idusuario;
    }

    public int getIdvinculacion() {
        return idvinculacion;
    }

    public void setIdvinculacion(int idvinculacion) {
        this.idvinculacion = idvinculacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
    
}