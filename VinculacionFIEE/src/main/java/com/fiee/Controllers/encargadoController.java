/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;
import com.fiee.Models.Encargado;
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
public class encargadoController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public encargadoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/usuariosE") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from encargado";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);    
        mav.setViewName("indexE");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioE", method = RequestMethod.GET)
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Encargado());
        mav.setViewName("insertarE");
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioE", method = RequestMethod.POST)
    public ModelAndView insertar( Encargado v)
    {
        String sql = "insert into encargado(nombre, usuario, password,correo) values (?,?,?,?)";
        this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword(), v.getCorreo());
        return new ModelAndView("redirect:/usuariosE");
    }
    
    @RequestMapping(value = "/editarUsuarioE", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from encargado where idencargado="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("editarE");
        return mav;
    }
    @RequestMapping(value = "/editarUsuarioE", method = RequestMethod.POST)
    public ModelAndView editar( Encargado v)
    {
        String sql = "update encargado set nombre=?, usuario=?, password=?, correo=? where idencargado="+id;
        this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword(),v.getCorreo());
        return new ModelAndView("redirect:/usuariosE");
    }
    @RequestMapping(value = "/borrarUsuarioE")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from encargado where idencargado="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuariosE");
    }
}
