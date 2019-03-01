package com.fiee.Models;

/**
 *
 * @author Anemc
 */
public class Usuarios {

    private int idusuario;
    private String user;
    private String pass;

    public Usuarios() {
    }

    public Usuarios(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Usuarios(int idusuario, String user, String pass) {
        this.idusuario = idusuario;
        this.user = user;
        this.pass = pass;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
