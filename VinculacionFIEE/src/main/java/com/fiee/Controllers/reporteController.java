/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Reporte;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/reportes")
public class reporteController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;

    public reporteController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @GetMapping(value = "/lista") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista() {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from reporte";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("reportes", lista);
        mav.setViewName("reporte/indexR");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    @RequestMapping(value = "/insertarR", method = RequestMethod.GET) //Este es el nombre con el que se accede desde el navegador
    public ModelAndView insertar() {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Reporte());
        mav.setViewName("reporte/insertarR");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    @RequestMapping(value = "/insertarR", method = RequestMethod.POST)
    public ModelAndView insertar(Reporte v) {
        String sql = "insert into reporte(nombre, carrera, correo, telefono, celular, matricula, noreporte, fecha, dependencia, telefonod, proyecto, horario, actividades, descripcion) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getCarrera(), v.getCorreo(), v.getTelefono(), v.getCelular(), v.getMatricula(), v.getNoreporte(), v.getFecha(), v.getDependencia(), v.getTelefonod(), v.getProyecto(), v.getHorario(), v.getActividades(), v.getDescripcion());
        return new ModelAndView("redirect:/reportes");
    }

    @RequestMapping(value = "/editarR", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from reporte where idreporte=" + id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("reporte/editarR");
        return mav;
    }

    @RequestMapping(value = "/editarR", method = RequestMethod.POST)
    public ModelAndView editar(Reporte v) {
        String sql = "update reporte set nombre=?, carrera=?, correo=?, telefono=?, celular=?, matricula=?, noreporte=?, fecha=?, dependencia=?, telefonod=?, proyecto=?, horario=?, actividades=?, descripcion=? where idreporte=" + id;
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getCarrera(), v.getCorreo(), v.getTelefono(), v.getCelular(), v.getMatricula(), v.getNoreporte(), v.getFecha(), v.getDependencia(), v.getTelefonod(), v.getProyecto(), v.getHorario(), v.getActividades(), v.getDescripcion());
        return new ModelAndView("redirect:/reportes");
    }

    @RequestMapping(value = "/borrarR")
    public ModelAndView borrar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "delete from reporte where idreporte=" + id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/reportes");
    }
}
