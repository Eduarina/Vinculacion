/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;
import com.fiee.Models.Servicio;
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
public class servicioController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public servicioController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/usuariosS") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from servicio";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);    
        mav.setViewName("servicio/indexS");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioS", method = RequestMethod.GET)
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Servicio());
        mav.setViewName("servicio/insertarS");
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioS", method = RequestMethod.POST)
    public ModelAndView insertar( Servicio v)
    {
        String sql = "insert into servicio(nombre, usuario, password,correo,matricula,creditos,semestre) values (?,?,?,?,?,?,?)";
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword(), v.getCorreo(),v.getMatricula(),v.getCreditos(),v.getSemestre());
        return new ModelAndView("redirect:/usuariosS");
    }
    
    @RequestMapping(value = "/editarUsuarioS", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from servicio where idservicio="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("servicio/editarS");
        return mav;
    }
    @RequestMapping(value = "/editarUsuarioS", method = RequestMethod.POST)
    public ModelAndView editar( Servicio v)
    {
        String sql = "update servicio set nombre=?, usuario=?, correo=?, matricula=?, creditos=?, semestre=? where idservicio="+id;
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getCorreo(),v.getMatricula(),v.getCreditos(),v.getSemestre());
        return new ModelAndView("redirect:/usuariosS");
    }
    @RequestMapping(value = "/borrarUsuarioS")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from servicio where idservicio="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuariosS");
    }
}
