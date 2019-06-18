/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Encargado;
import com.fiee.Models.EncargadoValidator;
import java.io.File;
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
@RequestMapping(value = "/encargados")
public class encargadoController {
    
    @Autowired
    ServletContext context; 

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private EncargadoValidator encargadoValidator;

    public encargadoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.encargadoValidator = new EncargadoValidator();
    }

    //Solo pueden entrar admin y vinculacion
    @RequestMapping(value = "/lista") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 1 || tipo == 2){
            ModelAndView mav = new ModelAndView();
            String sql = "select * from vw_info_encargado";
            lista = this.jdbcTemplate.queryForList(sql);
            mav.addObject("encargados", lista);
            mav.setViewName("encargado/indexE");  // Este es el nombre del archivo vista .jsp
            return mav;
        }else{
            return new ModelAndView("redirect:/home");
        }
    }

    
    //Solo pueden entrar admin y vinculacion
    @RequestMapping(value = "/insertar", method = RequestMethod.GET)
    public ModelAndView insertar( HttpServletRequest request ) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 1 || tipo == 2){
            ModelAndView mav = new ModelAndView();
            mav.addObject("nuevo", new Encargado());
            mav.setViewName("encargado/insertarE");
            return mav;
        }else{
            return new ModelAndView("redirect:/home");
        }
    }

    @PostMapping(value = "insertar")
    public ModelAndView insertar(
            @ModelAttribute("nuevo") Encargado e, BindingResult result, SessionStatus status
    ) {
        this.encargadoValidator.validate(e, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("nuevo", e);
            mav.setViewName("encargado/insertarE");
            return mav;
        } else {
            e.setPass(loginController.getMD5(e.getPass()));
            String path;
            if (e.getSexo().equals("H")) {
                path = "/dist/img/user2-160x160.jpg";
            } else {
                path = "/dist/img/avatar2.png";
            }
            String sql = "insert into tb_usuarios(nombre, user, password, tipo, sexo, path, estado) values (?,?,?,?,?,?,?)";
            this.jdbcTemplate.update(sql, e.getNombre(), e.getUsuario(), e.getPass(), 4, e.getSexo(), path, 1);

            String uploadPath = context.getRealPath("/resources/encargados") + File.separator + e.getNombre();
            File file = new File(uploadPath);
            file.mkdir();

            sql = "select idUsuario from last_ID";
            Object[] parameters = new Object[]{};
            int lastID = this.jdbcTemplate.queryForObject(sql, parameters, int.class);

            sql = "insert into tb_encargados (correo, telefono, Estado, idUsuario) values (?,?,?,?)";
            this.jdbcTemplate.update(sql, e.getCorreo(), e.getTelefono(), 1, lastID);

            return new ModelAndView("redirect:/encargados/lista");

        }

    }

    
    //Solo pueden entrar admin y vinculacion
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 1 || tipo == 2){
            Encargado user = new Encargado();
            user.setIdencargado(idusuario);
            ModelAndView mav = new ModelAndView();
            String sql = "select nombre from vw_info_encargado where ID=" + idusuario;
            Object[] parameters = new Object[]{};
            String nombre = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setNombre(nombre);
            sql = "select usuario from vw_info_encargado where ID=" + idusuario;
            String usuario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setUsuario(usuario);
            sql = "select telefono from tb_encargados where idencargado=" + idusuario;
            String telefono = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setTelefono(telefono);
            sql = "select sexo from vw_info_encargado where ID=" + idusuario;
            String sexo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setSexo(sexo);
            sql = "select idUsuario from vw_info_encargado where ID=" + idusuario;
            String iduser = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            sql = "select password from tb_usuarios where idusuario=" + iduser;
            String password = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setPass(password);
            user.setPass2(password);
            sql = "select correo from vw_info_encargado where ID=" + idusuario;
            String correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setCorreo(correo);
            mav.addObject("datos", user);
            mav.setViewName("encargado/editarE");
            return mav;
        }else{
            return new ModelAndView("redirect:/home");
        }
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Encargado v, BindingResult result
    ) {
        this.encargadoValidator.validate(v, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", v);
            mav.setViewName("encargado/editarE");
            return mav;
        } else {
            String sql = "select idUsuario from vw_info_encargado where ID = " + v.getIdencargado();
            Object[] parameters = new Object[]{};
            int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            sql = "update tb_usuarios set nombre=?, user =?, sexo = ? where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getSexo());
            sql = "update tb_encargados set correo=?, telefono=? where idEncargado=" + v.getIdencargado();
            this.jdbcTemplate.update(sql, v.getCorreo(), v.getTelefono());
            return new ModelAndView("redirect:lista");
        }
    }

    //Solo pueden entrar admin y vinculacion
    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 1 || tipo == 2){
            id = Integer.parseInt(request.getParameter("id"));
            String sql = "select idUsuario from tb_encargados where idEncargado =" + id;
            Object[] parameters = new Object[]{};
            int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            sql = "select Estado from tb_usuarios where idUsuario =" + idUsuario;
            int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            if (estado == 1) {
                sql = "update tb_usuarios set Estado = 2 where idUsuario=" + idUsuario;
                this.jdbcTemplate.update(sql);
                sql = "update tb_encargados set Estado = 2 where idEncargado =" + id;
            } else {
                sql = "update tb_usuarios set Estado = 1 where idUsuario=" + idUsuario;
                this.jdbcTemplate.update(sql);
                sql = "update tb_encargados set Estado = 1 where idEncargado =" + id;
            }
            this.jdbcTemplate.update(sql);
            return new ModelAndView("redirect:lista");
        }else{
            return new ModelAndView("redirect:home");
        }
    }

}
