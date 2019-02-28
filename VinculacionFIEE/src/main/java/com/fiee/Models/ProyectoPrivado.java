package com.fiee.Models;

/**
 *
 * @author Anemc
 */
public class ProyectoPrivado {

    private int idpri;
    private String proyecto;
    private String dependencia;
    private int alumnos;
    private String inicio;
    private String fin;
    private String beca;
    private String tipo;
    private int convenio;
    private String impacto;
    private String responsable;
    private String carrera;
    private int horas;
    private int ingles;
    private String descripcion;
    private int telefono;
    private String direccion;
    private String correo;
    private int aprobacion;

    @Override
    public String toString() {
        return "ProyectoPrivado{" + "idpri=" + idpri + ", proyecto=" + proyecto + ", dependencia=" + dependencia + ", alumnos=" + alumnos + ", inicio=" + inicio + ", fin=" + fin + ", beca=" + beca + ", tipo=" + tipo + ", convenio=" + convenio + ", impacto=" + impacto + ", responsable=" + responsable + ", carrera=" + carrera + ", horas=" + horas + ", ingles=" + ingles + ", descripcion=" + descripcion + ", telefono=" + telefono + ", direccion=" + direccion + ", correo=" + correo + ", aprobacion=" + aprobacion + '}';
    }

    public int getIdpri() {
        return idpri;
    }

    public void setIdpri(int idpri) {
        this.idpri = idpri;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public int getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(int alumnos) {
        this.alumnos = alumnos;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    public String getBeca() {
        return beca;
    }

    public void setBeca(String beca) {
        this.beca = beca;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getConvenio() {
        return convenio;
    }

    public void setConvenio(int convenio) {
        this.convenio = convenio;
    }

    public String getImpacto() {
        return impacto;
    }

    public void setImpacto(String impacto) {
        this.impacto = impacto;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public int getIngles() {
        return ingles;
    }

    public void setIngles(int ingles) {
        this.ingles = ingles;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getAprobacion() {
        return aprobacion;
    }

    public void setAprobacion(int aprobacion) {
        this.aprobacion = aprobacion;
    }

}
