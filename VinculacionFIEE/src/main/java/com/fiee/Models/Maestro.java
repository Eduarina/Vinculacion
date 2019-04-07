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
    private String correo;
    private String carrera;
    private int estatus;
    private int idusuario;

    public Maestro() {
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

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
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

    public Maestro(int idmaestro, String correo, String carrera, int estatus, int idusuario) {
        this.idmaestro = idmaestro;
        this.correo = correo;
        this.carrera = carrera;
        this.estatus = estatus;
        this.idusuario = idusuario;
    }

    public Maestro(String correo, String carrera, int estatus) {
        this.correo = correo;
        this.carrera = carrera;
        this.estatus = estatus;
    }

    public Maestro(int idmaestro, String correo, String carrera) {
        this.idmaestro = idmaestro;
        this.correo = correo;
        this.carrera = carrera;
    }

}
