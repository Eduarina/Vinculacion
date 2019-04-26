/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Asignar1;
import com.fiee.Models.Asignar1Validator;
import com.fiee.Models.Maestro;
import com.fiee.Models.Usuario;
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
    private Asignar1Validator asignar1Validator;

    public asignarController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.asignar1Validator = new Asignar1Validator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 1 || tipo == 2) {
                sql = "select * from maestro_servicio";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("asignar/indexA");  // Este es el nombre del archivo vista .jsp
                sql = "select * from usuario";
                List lista1 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("nombres", lista1);
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
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
                mav.addObject("datos", new Asignar1());
                mav.setViewName("asignar/insertarA");
                sql = "SELECT * FROM usuario WHERE idusuario NOT IN (SELECT idservicio FROM maestro_servicio) ORDER BY nombre";
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
    @PostMapping(value = "/insertar")
    public ModelAndView insertar(
            @ModelAttribute("datos") @Valid Asignar1 u, BindingResult result, Model model
    ) {
        this.asignar1Validator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("asignar/insertarA");
            String sql = "select * from usuario";
            lista = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("nombres", lista);
            return mav;
        } else {
            String sql = "insert into maestro_servicio (idmaestro, idservicio) values (?,?)";
            this.jdbcTemplate.update(sql, u.getIdmaestro(), u.getIdservicio());
            return new ModelAndView("redirect:/asignacion/lista");
        }
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
                mav.addObject("datos", new Asignar1(idtabla, idmaestro, idservicio));
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
            @ModelAttribute("datos") @Valid Asignar1 u, BindingResult result, Model model
    ) {
        this.asignar1Validator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("asignar/editarA");
            String sql = "select * from usuario";
            lista = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("nombres", lista);
            return mav;
        } else {
            String sql = "update maestro_servicio set idmaestro=?, idservicio=? where idtabla1=" + u.getIdtabla1();
            this.jdbcTemplate.update(sql, u.getIdmaestro(), u.getIdservicio());
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
