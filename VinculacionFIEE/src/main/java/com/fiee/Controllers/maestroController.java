/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;
import com.fiee.Models.Maestro;
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
public class maestroController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public maestroController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/usuariosM") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from maestro";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);    
        mav.setViewName("maestro/indexM");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioM", method = RequestMethod.GET)
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Maestro());
        mav.setViewName("maestro/insertarM");
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioM", method = RequestMethod.POST)
    public ModelAndView insertar( Maestro v)
    {
        String sql = "insert into maestro(nombre, usuario, password,correo) values (?,?,?,?)";
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword(), v.getCorreo());
        return new ModelAndView("redirect:/usuariosM");
    }
    
    @RequestMapping(value = "/editarUsuarioM", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from maestro where idmaestro="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("maestro/editarM");
        return mav;
    }
    @RequestMapping(value = "/editarUsuarioM", method = RequestMethod.POST)
    public ModelAndView editar( Maestro v)
    {
        String sql = "update maestro set nombre=?, usuario=?, correo=? where idmaestro="+id;
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(),v.getCorreo());
        return new ModelAndView("redirect:/usuariosM");
    }
    @RequestMapping(value = "/borrarUsuarioM")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from maestro where idmaestro="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuariosM");
    }
}
