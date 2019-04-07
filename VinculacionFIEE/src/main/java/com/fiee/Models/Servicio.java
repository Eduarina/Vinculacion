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
public class Servicio {
    private int idservicio;
    private String matricula;
    private int creditos;
    private String correo;
    private String telefono;
    private String celular;
    private String cv;
    private String carrera;
    private int semestre;
    private int estatus;
    private String horario;
    private int idusuario;

    public Servicio() {
    }

    public Servicio(int idservicio, String matricula, int creditos, String correo, String telefono, String celular, String cv, String carrera, int semestre, int estatus, String horario, int idusuario) {
        this.idservicio = idservicio;
        this.matricula = matricula;
        this.creditos = creditos;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.cv = cv;
        this.carrera = carrera;
        this.semestre = semestre;
        this.estatus = estatus;
        this.horario = horario;
        this.idusuario = idusuario;
    }

    public Servicio(String matricula, int creditos, String correo, String telefono, String celular, String cv, String carrera, int semestre, int estatus, String horario, int idusuario) {
        this.matricula = matricula;
        this.creditos = creditos;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.cv = cv;
        this.carrera = carrera;
        this.semestre = semestre;
        this.estatus = estatus;
        this.horario = horario;
        this.idusuario = idusuario;
    }

    public Servicio(int idservicio, String matricula, int creditos, String correo, String telefono, String celular, String cv, String carrera, int semestre, String horario) {
        this.idservicio = idservicio;
        this.matricula = matricula;
        this.creditos = creditos;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.cv = cv;
        this.carrera = carrera;
        this.semestre = semestre;
        this.horario = horario;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
    
    
}
