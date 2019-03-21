/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Usuario;
import com.fiee.Models.UsuarioValidator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
@RequestMapping(value = "/usuarios")
public class usuarioController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private UsuarioValidator usuarioValidator;

    public usuarioController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.usuarioValidator = new UsuarioValidator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista() {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from usuario";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos", lista);
        mav.setViewName("usuario/indexU");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/insertar")
    public ModelAndView insertar() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("datos", new Usuario());
        mav.setViewName("usuario/insertarU");
        return mav;
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/insertar")
    public ModelAndView insertar(
            @ModelAttribute("datos") @Valid Usuario u, BindingResult result
    ) {
        this.usuarioValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("usuario/insertarU");
            return mav;
        } else {
            String sql = "insert into usuario(nombre, user, password, tipo) values (?,?,?,?)";
            this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getPassword(), u.getTipo());
            return new ModelAndView("redirect:/usuarios/lista");
        }

    }
    
    //poblar select para tipo en insertar
    @ModelAttribute("tipo")
    public Map<String, String> listadoTipo(){
        Map<String, String> tipo = new LinkedHashMap<>();
        tipo.put("1", "Administrador");
        tipo.put("2", "Vinculacion");
        tipo.put("3", "Maestro");
        tipo.put("4", "Servicio");
        tipo.put("5", "Encargado");
        return tipo;
    }
    
    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario)
    {
        ModelAndView mav = new ModelAndView();
        //id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from usuario where idusuario="+idusuario;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos", new Usuario());
        mav.setViewName("usuario/editarU");
        return mav;
    }
    
    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar( Usuario u)
    {
        String sql = "update usuario set nombre=?, user=? where idusuario="+id;
        this.jdbcTemplate.update(sql, u.getNombre(), u.getUser());
        return new ModelAndView("redirect:/usuarios/lista");
    }
    @RequestMapping(value = "/borrar")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from usuario where idusuario="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuarios/lista");
    }
}
