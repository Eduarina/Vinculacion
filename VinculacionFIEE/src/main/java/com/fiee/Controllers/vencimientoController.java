/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Usuario;
import com.fiee.Models.Vencimiento;
import com.fiee.Models.VencimientoValidator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = "/vencimiento")
public class vencimientoController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private VencimientoValidator vencimientoValidator;

    public vencimientoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.vencimientoValidator = new VencimientoValidator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            sql = "select * from vencimiento";
            lista = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", lista);
            mav.setViewName("vencimiento/indexV");  // Este es el nombre del archivo vista .jsp
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idvencimiento, HttpServletRequest request
    ) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            //id=Integer.parseInt(request.getParameter("id"));
            sql = "select descripcion from vencimiento where idvencimiento=" + idvencimiento;
            Object[] parameters = new Object[]{};
            String descripcion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            sql = "select fecha from vencimiento where idvencimiento=" + idvencimiento;
            String datepicker = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            mav.addObject("datos", new Vencimiento(idvencimiento, descripcion, datepicker));
            mav.setViewName("vencimiento/editarV");
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Vencimiento u, BindingResult result
    ) {
        this.vencimientoValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("vencimiento/editarV");
            return mav;
        } else {
            String sql = "update vencimiento set fecha=? where idvencimiento=" + u.getIdvencimiento();
            this.jdbcTemplate.update(sql, u.getDatepicker());
            return new ModelAndView("redirect:/vencimiento/lista");
        }

    }
}
