/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Emrys
 */
@Controller
@RequestMapping(value = "/asignacion")
public class asignarController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    

    public asignarController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        //this.asignar1Validator = new AsignacionValidator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
                sql = "select * from vw_numEstudiantes_maestros";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("asignar/indexA");  // Este es el nombre del archivo vista .jsp
                return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }
    
    @GetMapping(value = "/proyectos")
    public ModelAndView proyectos(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            sql = "SELECT idEncargado from tb_encargados where idUsuario = "+id;
            Object []parameters = new Object[]{};
            int idEncargado = this.jdbcTemplate.queryForObject(sql,parameters,int.class);
                sql = "select * from vw_asignacion_proyectos WHERE idencargado = "+idEncargado;
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("asignar/indexP");  // Este es el nombre del archivo vista .jsp
                return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @GetMapping(value = "/baja")
    public ModelAndView baja(@RequestParam("id") int idtabla
    ) {
        String sql = "UPDATE from tb_asignacion_proyecto SET Estado = 6 where idAsignacionProyecto=" + idtabla;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/asignacion/proyectos");
    }
    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/insertar")
    public ModelAndView insertar(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 1 || tipo == 2) {
                mav.addObject("datos", new Asignacion());
                mav.setViewName("asignar/insertarA");
                sql = "SELECT * FROM tb_usuarios where (tipo = 3 OR tipo = 5) and idUsuario NOT IN (SELECT idEstudiante from tb_asignacion)";
                lista = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("nombres", lista);
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @GetMapping(value = "/asignar")
    public ModelAndView asignacion(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sql;
        ModelAndView mav = new ModelAndView();
        id = (int) session.getAttribute("id");
        sql = "SELECT idEncargado from tb_encargados where idUsuario = "+id;
        Object []parameters = new Object[]{};
        int idEncargado = this.jdbcTemplate.queryForObject(sql,parameters,int.class);
        mav.addObject("datos", new Asignacion_Proyecto());
        mav.setViewName("asignar/insertarP");
        sql = "SELECT * FROM tb_proyectos where idEncargado = "+idEncargado;
        lista = this.jdbcTemplate.queryForList(sql);
        model.addAttribute("nombres", lista);
        sql = "SELECT * FROM vw_estudiantes_noAsignados";
        lista = this.jdbcTemplate.queryForList(sql);
        model.addAttribute("estudiantes", lista);
        return mav;
    }

    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/insertar")
    public ModelAndView insertar(
            @ModelAttribute("datos") @Valid Asignacion_Proyecto u, BindingResult result, Model model
    ) {
        //this.asignar1Validator.validate(u, result);
        String sql = "insert into tb_asignacion_proyecto (idProyecto, idestudiante, estado) values (?,?,?)";
        this.jdbcTemplate.update(sql, u.getIdProyecto(), u.getIdEstudiante(),1);
        sql = "SELECT idUsuario from tb_estudiantes WHERE idEstudiate = "+u.getIdEstudiante();
        Object []parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "UPDATE FROM tb_proyectos SET idEstudiante = ? WHERE idProyecto = "+u.getIdProyecto();
        this.jdbcTemplate.update(sql,idUsuario);
        return new ModelAndView("redirect:/asignacion/proyectos ");
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idtabla, Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 1 || tipo == 2) {
                sql = "select idmaestro from maestro_servicio where idtabla1=" + idtabla;
                Object[] parameters = new Object[]{};
                int idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                sql = "select idservicio from maestro_servicio where idtabla1=" + idtabla;
                int idservicio = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                mav.addObject("datos", new Asignacion());
                mav.setViewName("asignar/editarA");
                sql = "select * from usuario";
                lista = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("nombres", lista);
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos") @Valid Asignacion u, BindingResult result, Model model
    ) {
        //this.asignar1Validator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("asignar/editarA");
            String sql = "select * from usuario";
            lista = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("nombres", lista);
            return mav;
        } else {
            String sql = "update maestro_servicio set idmaestro=?, idservicio=? where idtabla1=" + u.getIdAsignacion();
            this.jdbcTemplate.update(sql, u.getIdmaestro(), u.getIdEstudiante());
            return new ModelAndView("redirect:/asignacion/lista");
        }
    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(@RequestParam("id") int idtabla
    ) {
        String sql = "delete from maestro_servicio where idtabla1=" + idtabla;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/asignacion/lista");
    }
}
