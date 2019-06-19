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

    @GetMapping(value = "/infoAsignacion")
    public ModelAndView infoAsignacion(@RequestParam ("id") int idMaestro, HttpServletRequest request ){
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 1 || tipo == 2){
            ModelAndView mav = new ModelAndView();
            String sql = "SELECT Nombre from tb_usuarios WHERE idUsuario = "+idMaestro;
            String name = this.jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
            mav.addObject("nombre",name);
            sql = "SELECT * FROM vw_detalles_asignacion WHERE idMaestro = "+idMaestro;
            lista = this.jdbcTemplate.queryForList(sql);
            mav.addObject("lista",lista);
            mav.setViewName("asignar/detalles");
            return mav; 
        }
        return new ModelAndView("redirect:/home");
    }
    
    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            int tipo = (int) session.getAttribute("tipo");
            if(tipo == 1 || tipo == 2){
                id = (int) session.getAttribute("id");
                sql = "select * from vw_numEstudiantes_maestros";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("asignar/indexA");  // Este es el nombre del archivo vista .jsp
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }
    
    @GetMapping(value = "/proyectos")
    public ModelAndView proyectos(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if( tipo == 3 ){
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            sql = "SELECT ap.idAsignacionProyecto as ID, p.Titulo, u.nombre, ap.Estado, es.Descripcion FROM tb_proyectos p, tb_usuarios u, tb_asignacion_proyecto ap, ctg_estados es WHERE p.idEstudiante = u.idUsuario AND p.idProyecto = ap.idProyecto AND ap.Estado = es.idEstado";
            lista = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", lista);
            mav.setViewName("asignar/indexP");  // Este es el nombre del archivo vista .jsp
            return mav;
        }
        return new ModelAndView("redirect:/home");
    }

    @GetMapping(value = "/baja")
    public ModelAndView baja(@RequestParam("id") int idtabla, HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 3){
            String sql = "UPDATE tb_asignacion_proyecto SET Estado = 2 where idAsignacionProyecto=" + idtabla;
            this.jdbcTemplate.update(sql);
            return new ModelAndView("redirect:/asignacion/proyectos");
        }
        return new ModelAndView("redirect:/home");
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
        } catch (Exception ie) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @PostMapping(value = "/insercion")
    public ModelAndView insercion(
        @ModelAttribute("datos") @Valid Asignacion u, BindingResult result, Model model
    ){
        String sql = "insert into tb_asignacion (idMaestro, idestudiante, estado) values (?,?,?)";
        this.jdbcTemplate.update(sql, u.getIdMaestro(), u.getIdEstudiante(),1);
        return new ModelAndView("redirect:lista");
    }
    
    @GetMapping(value = "/asignar")
    public ModelAndView asignacion(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String sql;
        ModelAndView mav = new ModelAndView();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 3){
            id = (int) session.getAttribute("id");
            mav.addObject("datos", new Asignacion_Proyecto());
            mav.setViewName("asignar/insertarP");
            sql = "SELECT * FROM tb_proyectos where idProyecto NOT IN (SELECT idProyecto from tb_asignacion_proyecto WHERE Estado < 5)";
            lista = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("nombres", lista);
            sql = "SELECT * FROM vw_estudiantes_noAsignados";
            lista = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("estudiantes", lista);
            return mav;
        }
        return new ModelAndView("redirect:/home");
    }

    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/insertar")
    public ModelAndView insertar(
            @ModelAttribute("datos") @Valid Asignacion_Proyecto u, BindingResult result, Model model
    ) {
        //this.asignar1Validator.validate(u, result);
        String sql = "insert into tb_asignacion_proyecto (idProyecto, idestudiante, estado) values (?,?,?)";
        this.jdbcTemplate.update(sql, u.getIdProyecto(), u.getIdEstudiante(),5);
        sql = "SELECT idUsuario from tb_estudiantes WHERE idEstudiate = "+u.getIdEstudiante();
        Object []parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "UPDATE tb_proyectos SET idEstudiante = ? WHERE idProyecto = "+u.getIdProyecto();
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
            this.jdbcTemplate.update(sql, u.getIdMaestro(), u.getIdEstudiante());
            return new ModelAndView("redirect:/asignacion/lista");
        }
    }
    
}
