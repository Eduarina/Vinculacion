/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Bitacora;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
public class bitacoraController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public bitacoraController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/bitacoras") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from bitacora";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("bitacoras", lista);    
        mav.setViewName("bitacora/indexB");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value="/insertarB", method = RequestMethod.GET) //Este es el nombre con el que se accede desde el navegador
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Bitacora());    
        mav.setViewName("bitacora/insertarB");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertarB", method = RequestMethod.POST)
    public ModelAndView insertar( Bitacora v)
    {
        String sql = "insert into bitacora(alumno, matricula, carrera, dependencia, ubicacion, fechaini, fechafin, nobitacora, actividades, descripcion, problemas, soluciones) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, v.getAlumno(), v.getMatricula(), v.getCarrera(), v.getDependencia(), v.getUbicacion(), v.getFechaini(), v.getFechafin(), v.getNobitacora(), v.getActividades(), v.getDescripcion(), v.getProblemas(), v.getSoluciones());
        return new ModelAndView("redirect:/bitacoras");
    }
    
    @RequestMapping(value = "/editarB", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from bitacora where idbitacora="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("bitacora/editarB");
        return mav;
    }
    @RequestMapping(value = "/editarB", method = RequestMethod.POST)
    public ModelAndView editar( Bitacora v)
    {
        String sql = "update bitacora set alumno=?, matricula=?, carrera=?, dependencia=?, ubicacion=?, fechaini=?, fechafin=?, nobitacora=?, actividades=?, descripcion=?, problemas=?, soluciones=? where idbitacora="+id;
        this.jdbcTemplate.update(sql, v.getAlumno(), v.getMatricula(), v.getCarrera(), v.getDependencia(), v.getUbicacion(), v.getFechaini(), v.getFechafin(), v.getNobitacora(), v.getActividades(), v.getDescripcion(), v.getProblemas(), v.getSoluciones());
        return new ModelAndView("redirect:/bitacoras");
    }
    @RequestMapping(value = "/borrarB")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from bitacora where idbitacora="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/bitacoras");
    }
}
