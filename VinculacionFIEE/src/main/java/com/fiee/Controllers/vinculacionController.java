package com.fiee.Controllers;

import com.fiee.Models.Vinculacion;
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
public class vinculacionController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public vinculacionController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from vinculacion";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);    
        mav.setViewName("indexV");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioV", method = RequestMethod.GET)
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Vinculacion());
        mav.setViewName("insertarV");
        return mav;
    }
    
    @RequestMapping(value = "/insertarUsuarioV", method = RequestMethod.POST)
    public ModelAndView insertar( Vinculacion v)
    {
        String sql = "insert into vinculacion(nombre, usuario, password) values (?,?,?)";
        this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword());
        return new ModelAndView("redirect:/usuariosV");
    }
    
    @RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from vinculacion where idvinculacion="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("editarV");
        return mav;
    }
    @RequestMapping(value = "/editarUsuarioV", method = RequestMethod.POST)
    public ModelAndView editar( Vinculacion v)
    {
        String sql = "update vinculacion set nombre=?, usuario=?, password=? where idvinculacion="+id;
        this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword());
        return new ModelAndView("redirect:/usuariosV");
    }
    @RequestMapping(value = "/borrarUsuarioV")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from vinculacion where idvinculacion="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuariosV");
    }
}
