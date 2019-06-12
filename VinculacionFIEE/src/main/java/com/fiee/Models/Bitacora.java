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

    private int idReporte;
    private int Num_Reporte;
    private int idProyecto;
    private int Tipo;
    private String Actividades;
    private String Descripcion;
    private String Problemas;
    private String Soluciones;
    private int Estado;
    private String Fecha;
    private int idEstudiante;
    private String vbo_Maestro;
    private String vbo_Encargado;

    public Bitacora() {
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public int getNum_Reporte() {
        return Num_Reporte;
    }

    public void setNum_Reporte(int Num_Reporte) {
        this.Num_Reporte = Num_Reporte;
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int Tipo) {
        this.Tipo = Tipo;
    }

    public String getActividades() {
        return Actividades;
    }

    public void setActividades(String Actividades) {
        this.Actividades = Actividades;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getProblemas() {
        return Problemas;
    }

    public void setProblemas(String Problemas) {
        this.Problemas = Problemas;
    }

    public String getSoluciones() {
        return Soluciones;
    }

    public void setSoluciones(String Soluciones) {
        this.Soluciones = Soluciones;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getVbo_Maestro() {
        return vbo_Maestro;
    }

    public void setVbo_Maestro(String vbo_Maestro) {
        this.vbo_Maestro = vbo_Maestro;
    }

    public String getVbo_Encargado() {
        return vbo_Encargado;
    }

    public void setVbo_Encargado(String vbo_Encargado) {
        this.vbo_Encargado = vbo_Encargado;
    }

    
    
}
