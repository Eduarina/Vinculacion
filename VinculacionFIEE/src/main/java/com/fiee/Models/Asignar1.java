/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Models;

/**
 *
 * @author Emrys
 */
public class Asignar1 {
    private int idtabla1;
    private int idmaestro;
    private int idservicio;  
    
    public Asignar1() {
    }

    public Asignar1(int idmaestro, int idservicio) {
        this.idmaestro = idmaestro;
        this.idservicio = idservicio;
    }

    public Asignar1(int idtabla1, int idmaestro, int idservicio) {
        this.idtabla1 = idtabla1;
        this.idmaestro = idmaestro;
        this.idservicio = idservicio;
    }

    public int getIdtabla1() {
        return idtabla1;
    }

    public void setIdtabla1(int idtabla1) {
        this.idtabla1 = idtabla1;
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
