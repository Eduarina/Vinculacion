/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.*;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/maestros")
public class maestroController {
    
    @Autowired
    ServletContext context; 

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private MaestroValidator maestroValidator;

    public maestroController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.maestroValidator = new MaestroValidator();
    }

    @RequestMapping(value = "/lista") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista() {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from vw_info_maestro";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);
        mav.setViewName("maestro/indexM");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    @GetMapping(value = "/insertar")
    public ModelAndView insertar() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("maestro", new MaestroTable());
        mav.setViewName("maestro/insertarM");
        return mav;
    }

    @PostMapping(value = "insertar")
    public ModelAndView insertar(
            @ModelAttribute("maestro") MaestroTable u, BindingResult result, SessionStatus status
    ) {
        this.maestroValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("maestro", u);
            mav.setViewName("maestro/insertarM");
            return mav;
        } else {
            u.setPass(loginController.getMD5(u.getPass()));
            String path;
            if (u.getSexo().equals("H")) {
                path = "/dist/img/user2-160x160.jpg";
            } else {
                path = "/dist/img/avatar2.png";
            }
            String sql = "insert into tb_usuarios(nombre, user, password, tipo, sexo, path, estado) values (?,?,?,?,?,?,?)";
            this.jdbcTemplate.update(sql, u.getNombre(), u.getUsuario(), u.getPass(), 3, u.getSexo(), path, 1);

            sql = "select idUsuario from last_ID";
            Object[] parameters = new Object[]{};
            int lastID = this.jdbcTemplate.queryForObject(sql, parameters, int.class);

            sql = "insert into tb_maestros (correo, Estado, idUsuario) values (?,?,?)";
            this.jdbcTemplate.update(sql, u.getCorreo(), 1, lastID);

            return new ModelAndView("redirect:/maestros/lista");

        }
    }

    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario, HttpServletRequest request) {
        MaestroTable user = new MaestroTable();
        user.setIdMaestro(idusuario);
        ModelAndView mav = new ModelAndView();
        String sql = "select nombre from vw_info_maestro where ID=" + idusuario;
        Object[] parameters = new Object[]{};
        String nombre = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setNombre(nombre);
        sql = "select usuario from vw_info_maestro where ID=" + idusuario;
        String usuario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setUsuario(usuario);
        sql = "select sexo from vw_info_maestro where ID=" + idusuario;
        String sexo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setSexo(sexo);
        sql = "select idUsuario from vw_info_maestro where ID=" + idusuario;
        String iduser = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        sql = "select password from tb_usuarios where idusuario=" + iduser;
        String password = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setPass(password);
        user.setPass2(password);
        sql = "select correo from vw_info_maestro where ID=" + idusuario;
        String correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setCorreo(correo);
        mav.addObject("datos", user);
        mav.setViewName("maestro/editarM");
        return mav;
    }

    @PostMapping(value = "editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid MaestroTable mt, BindingResult result
    ) {
        this.maestroValidator.validate(mt, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", mt);
            mav.setViewName("maestro/editarM");
            return mav;
        } else {
            String sql = "select idUsuario from vw_info_maestro where ID = " + mt.getIdMaestro();
            Object[] parameters = new Object[]{};
            int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            sql = "update tb_usuarios set nombre=?, user =?, sexo = ? where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql, mt.getNombre(), mt.getUsuario(), mt.getSexo());
            sql = "update tb_maestros set correo=? where idMaestro=" + mt.getIdMaestro();
            this.jdbcTemplate.update(sql, mt.getCorreo());
            return new ModelAndView("redirect:lista");
        }

    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select idUsuario from tb_maestros where idMaestro=" + id;
        Object[] parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "select Estado from tb_usuarios where idUsuario =" + idUsuario;
        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        if (estado == 1) {
            sql = "update tb_usuarios set Estado = 2 where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql);
            sql = "update tb_maestros set Estado = 2 where idMaestro=" + id;
        } else {
            sql = "update tb_usuarios set Estado = 1 where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql);
            sql = "update tb_maestros set Estado = 1 where idMaestro=" + id;
        }
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect: lista");
    }

    //poblar select para tipo en insertar
    @ModelAttribute("sexo")
    public Map<String, String> listadoTipo() {
        Map<String, String> sexo = new LinkedHashMap<>();
        sexo.put("H", "Hombre");
        sexo.put("M", "Mujer");
        return sexo;
    }
}
