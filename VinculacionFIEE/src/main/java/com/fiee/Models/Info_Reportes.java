/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Models;

/**
 *
 * @author Eduar
 */
public class Info_Reportes {

    private int idEstudiante;
    private int idReporte;
    private int Tipo;
    private String tipoReporte;
    public String nombreEstudiante;
    private int num;
    private String estadoMaestro;
    private String estadoEncargado;

    public Info_Reportes() {
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int Tipo) {
        this.Tipo = Tipo;
    }

    public String getTipoReporte() {
        return tipoReporte;
    }

    public void setTipoReporte(String tipoReporte) {
        this.tipoReporte = tipoReporte;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }    

    public String getEstadoMaestro() {
        return estadoMaestro;
    }

    public void setEstadoMaestro(String estadoMaestro) {
        this.estadoMaestro = estadoMaestro;
    }

    public String getEstadoEncargado() {
        return estadoEncargado;
    }

    public void setEstadoEncargado(String estadoEncargado) {
        this.estadoEncargado = estadoEncargado;
    }

    
    
}
