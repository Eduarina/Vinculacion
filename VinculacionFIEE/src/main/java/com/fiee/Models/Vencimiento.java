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
public class Vencimiento {
    private int idvencimiento;
    private String descripcion;
    private String datepicker;

    public Vencimiento() {
    }

    public Vencimiento(int idvencimiento, String descripcion, String datepicker) {
        this.idvencimiento = idvencimiento;
        this.descripcion = descripcion;
        this.datepicker = datepicker;
    }

    public int getIdvencimiento() {
        return idvencimiento;
    }

    public void setIdvencimiento(int idvencimiento) {
        this.idvencimiento = idvencimiento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDatepicker() {
        return datepicker;
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }
    
}
