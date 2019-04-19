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
    private String datepicker;
    private String dependencia;
    private String direccion;
    private String numero;
    private String actividades;
    private String descripcion;
    private String problemas;
    private String soluciones;
    private String datepicker2;
    private String observaciones;
    private int estado;
    private int idservicio;
    private int idmaestro;
    private int idencargado;
    private int idproyecto;

    public Bitacora() {
    }

    public Bitacora(int idbitacora, String datepicker, String dependencia, String direccion, String numero, String actividades, String descripcion, String problemas, String soluciones, String datepicker2, String observaciones, int estado, int idservicio, int idmaestro) {
        this.idbitacora = idbitacora;
        this.datepicker = datepicker;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.numero = numero;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.problemas = problemas;
        this.soluciones = soluciones;
        this.datepicker2 = datepicker2;
        this.observaciones = observaciones;
        this.estado = estado;
        this.idservicio = idservicio;
        this.idmaestro = idmaestro;
    }

    public Bitacora(int idbitacora, String datepicker, String dependencia, String direccion, String numero, String actividades, String descripcion, String problemas, String soluciones, String datepicker2, String observaciones, int estado, int idservicio, int idmaestro, int idencargado) {
        this.idbitacora = idbitacora;
        this.datepicker = datepicker;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.numero = numero;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.problemas = problemas;
        this.soluciones = soluciones;
        this.datepicker2 = datepicker2;
        this.observaciones = observaciones;
        this.estado = estado;
        this.idservicio = idservicio;
        this.idmaestro = idmaestro;
        this.idencargado = idencargado;
    }

    public Bitacora(int idbitacora, String datepicker, String dependencia, String direccion, String numero, String actividades, String descripcion, String problemas, String soluciones, String datepicker2, String observaciones, int estado, int idservicio, int idmaestro, int idencargado, int idproyecto) {
        this.idbitacora = idbitacora;
        this.datepicker = datepicker;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.numero = numero;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.problemas = problemas;
        this.soluciones = soluciones;
        this.datepicker2 = datepicker2;
        this.observaciones = observaciones;
        this.estado = estado;
        this.idservicio = idservicio;
        this.idmaestro = idmaestro;
        this.idencargado = idencargado;
        this.idproyecto = idproyecto;
    }

    public int getIdbitacora() {
        return idbitacora;
    }

    public void setIdbitacora(int idbitacora) {
        this.idbitacora = idbitacora;
    }

    public String getDatepicker() {
        return datepicker;
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
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

    public String getDatepicker2() {
        return datepicker2;
    }

    public void setDatepicker2(String datepicker2) {
        this.datepicker2 = datepicker2;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

    public int getIdmaestro() {
        return idmaestro;
    }

    public void setIdmaestro(int idmaestro) {
        this.idmaestro = idmaestro;
    }

    public int getIdencargado() {
        return idencargado;
    }

    public void setIdencargado(int idencargado) {
        this.idencargado = idencargado;
    }

    public int getIdproyecto() {
        return idproyecto;
    }

    public void setIdproyecto(int idproyecto) {
        this.idproyecto = idproyecto;
    }

}
