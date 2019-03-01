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
public class Bitacora {
    private int idbitacora;
    private String alumno;
    private String matricula;
    private String carrera;
    private String dependencia;
    private String ubicacion;
    private String fechaini;
    private String fechafin;
    private int nobitacora;
    private String actividades;
    private String descripcion;
    private String problemas;
    private String soluciones;

    public Bitacora() {
    }

    public Bitacora(String alumno, String matricula, String carrera, String dependencia, String ubicacion, String fechaini, String fechafin, int nobitacora, String actividades, String descripcion, String problemas, String soluciones) {
        this.alumno = alumno;
        this.matricula = matricula;
        this.carrera = carrera;
        this.dependencia = dependencia;
        this.ubicacion = ubicacion;
        this.fechaini = fechaini;
        this.fechafin = fechafin;
        this.nobitacora = nobitacora;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.problemas = problemas;
        this.soluciones = soluciones;
    }

    public Bitacora(int idbitacora, String alumno, String matricula, String carrera, String dependencia, String ubicacion, String fechaini, String fechafin, int nobitacora, String actividades, String descripcion, String problemas, String soluciones) {
        this.idbitacora = idbitacora;
        this.alumno = alumno;
        this.matricula = matricula;
        this.carrera = carrera;
        this.dependencia = dependencia;
        this.ubicacion = ubicacion;
        this.fechaini = fechaini;
        this.fechafin = fechafin;
        this.nobitacora = nobitacora;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.problemas = problemas;
        this.soluciones = soluciones;
    }

    public int getIdbitacora() {
        return idbitacora;
    }

    public void setIdbitacora(int idbitacora) {
        this.idbitacora = idbitacora;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getFechaini() {
        return fechaini;
    }

    public void setFechaini(String fechaini) {
        this.fechaini = fechaini;
    }

    public String getFechafin() {
        return fechafin;
    }

    public void setFechafin(String fechafin) {
        this.fechafin = fechafin;
    }

    public int getNobitacora() {
        return nobitacora;
    }

    public void setNobitacora(int nobitacora) {
        this.nobitacora = nobitacora;
    }

    public String getActividades() {
        return actividades;
    }

    public void setActividades(String actividades) {
        this.actividades = actividades;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getProblemas() {
        return problemas;
    }

    public void setProblemas(String problemas) {
        this.problemas = problemas;
    }

    public String getSoluciones() {
        return soluciones;
    }

    public void setSoluciones(String soluciones) {
        this.soluciones = soluciones;
    }
    
}
