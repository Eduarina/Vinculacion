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
public class Reporte {
    private int idreporte;
    private String nombre;
    private String carrera;
    private String correo;
    private String telefono;
    private String celular;
    private String matricula;
    
    private int noreporte;
    private String fecha;
    private String dependencia;
    private String telefonod;
    private String proyecto;
    private String horario;
    
    private String actividades;
    private String descripcion;

    public Reporte() {
    }

    public Reporte(String nombre, String carrera, String correo, String telefono, String celular, String matricula, int noreporte, String fecha, String dependencia, String telefonod, String proyecto, String horario, String actividades, String descripcion) {
        this.nombre = nombre;
        this.carrera = carrera;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.matricula = matricula;
        this.noreporte = noreporte;
        this.fecha = fecha;
        this.dependencia = dependencia;
        this.telefonod = telefonod;
        this.proyecto = proyecto;
        this.horario = horario;
        this.actividades = actividades;
        this.descripcion = descripcion;
    }

    public Reporte(int idreporte, String nombre, String carrera, String correo, String telefono, String celular, String matricula, int noreporte, String fecha, String dependencia, String telefonod, String proyecto, String horario, String actividades, String descripcion) {
        this.idreporte = idreporte;
        this.nombre = nombre;
        this.carrera = carrera;
        this.correo = correo;
        this.telefono = telefono;
        this.celular = celular;
        this.matricula = matricula;
        this.noreporte = noreporte;
        this.fecha = fecha;
        this.dependencia = dependencia;
        this.telefonod = telefonod;
        this.proyecto = proyecto;
        this.horario = horario;
        this.actividades = actividades;
        this.descripcion = descripcion;
    }

    public int getIdreporte() {
        return idreporte;
    }

    public void setIdreporte(int idreporte) {
        this.idreporte = idreporte;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
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

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getNoreporte() {
        return noreporte;
    }

    public void setNoreporte(int noreporte) {
        this.noreporte = noreporte;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getTelefonod() {
        return telefonod;
    }

    public void setTelefonod(String telefonod) {
        this.telefonod = telefonod;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
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
    
}
