/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.UsuarioValidator;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author hp
 */
@Controller
@RequestMapping(value = "/documentos")
public class documentosController {
    
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    ArrayList<String> documentos;
    
    public documentosController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @GetMapping(value = "/lista")
    public ModelAndView lista(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "SELECT idEstudiate from tb_estudiantes where idUsuario = "+id;
        Object[] parameters = new Object[]{};
        int idEstudiante = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "Select * from vw_documentacion_alumno WHERE Estudiante = "+idEstudiante;
        lista = jdbcTemplate.queryForList(sql);
        ModelAndView response = new ModelAndView();
        response.addObject("datos", lista);
        response.setViewName("documentos/index");
        return response;
    }
    
}
