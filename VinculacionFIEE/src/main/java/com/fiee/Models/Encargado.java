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
public class Encargado {

    private int idencargado;
    private String correo;
    private String dependencia;
    private String direccion;
    private String telefono;
    private int estatus;
    private int idusuario;

    public Encargado() {
    }

    public Encargado(int idencargado, String correo, String dependencia, String direccion, String telefono) {
        this.idencargado = idencargado;
        this.correo = correo;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public Encargado(String correo, String dependencia, String direccion, String telefono, int estatus, int idusuario) {
        this.correo = correo;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.telefono = telefono;
        this.estatus = estatus;
        this.idusuario = idusuario;
    }

    public Encargado(int idencargado, String correo, String dependencia, String direccion, String telefono, int estatus, int idusuario) {
        this.idencargado = idencargado;
        this.correo = correo;
        this.dependencia = dependencia;
        this.direccion = direccion;
        this.telefono = telefono;
        this.estatus = estatus;
        this.idusuario = idusuario;
    }

    public int getIdencargado() {
        return idencargado;
    }

    public void setIdencargado(int idencargado) {
        this.idencargado = idencargado;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

}
