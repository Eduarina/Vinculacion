package com.fiee.Models;

/**
 *
 * @author Anemc
 */
public class Usuarios {

    private int idusuario;
    private String user;
    private String pass;
    private String correo;
    private String nombre;
    private int tipo;
    private int telefono;
//

    @Override
    public String toString() {
        return "Usuarios{" + "idusuario=" + idusuario + ", user=" + user + ", pass=" + pass + ", correo=" + correo + ", nombre=" + nombre + ", tipo=" + tipo + ", telefono=" + telefono + '}';
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

}
