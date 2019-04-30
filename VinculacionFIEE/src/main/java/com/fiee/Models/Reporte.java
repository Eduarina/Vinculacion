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
    private int numero;
    private String datepicker;
    private String dependencia;
    private String telefono;
    private String proyecto;
    private String horario;
    private String actividades;
    private String descripcion;
    private String datepicker2;
    private int estado;
    private int idencargado;
    private int idmaestro;
    private int idservicio;
    

    public Reporte() {
    }

    public Reporte(int idreporte, int numero, String datepicker, String dependencia, String telefono, String proyecto, String horario, String actividades, String descripcion, String datepicker2, int estado, int idmaestro, int idservicio) {
        this.idreporte = idreporte;
        this.numero = numero;
        this.datepicker = datepicker;
        this.dependencia = dependencia;
        this.telefono = telefono;
        this.proyecto = proyecto;
        this.horario = horario;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.datepicker2 = datepicker2;
        this.estado = estado;
        this.idmaestro = idmaestro;
        this.idservicio = idservicio;
    }

    public Reporte(int idreporte, int numero, String datepicker, String dependencia, String telefono, String proyecto, String horario, String actividades, String descripcion, String datepicker2, int estado, int idencargado, int idmaestro, int idservicio) {
        this.idreporte = idreporte;
        this.numero = numero;
        this.datepicker = datepicker;
        this.dependencia = dependencia;
        this.telefono = telefono;
        this.proyecto = proyecto;
        this.horario = horario;
        this.actividades = actividades;
        this.descripcion = descripcion;
        this.datepicker2 = datepicker2;
        this.estado = estado;
        this.idencargado = idencargado;
        this.idmaestro = idmaestro;
        this.idservicio = idservicio;
    }

    public int getIdreporte() {
        return idreporte;
    }

    public void setIdreporte(int idreporte) {
        this.idreporte = idreporte;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

    public String getDatepicker2() {
        return datepicker2;
    }

    public void setDatepicker2(String datepicker2) {
        this.datepicker2 = datepicker2;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdencargado() {
        return idencargado;
    }

    public void setIdencargado(int idencargado) {
        this.idencargado = idencargado;
    }

    public int getIdmaestro() {
        return idmaestro;
    }

    public void setIdmaestro(int idmaestro) {
        this.idmaestro = idmaestro;
    }

    public int getIdservicio() {
        return idservicio;
    }

    public void setIdservicio(int idservicio) {
        this.idservicio = idservicio;
    }

}
