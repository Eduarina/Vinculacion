package com.fiee.Controllers;

import com.fiee.Models.Vinculacion;
import com.fiee.Models.VinculacionValidator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/vinculacion")
public class vinculacionController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private VinculacionValidator vinculacionValidator;
    
    
    public vinculacionController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.vinculacionValidator = new VinculacionValidator();
    }
    
    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from vinculacion";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);    
        mav.setViewName("vinculacion/indexV");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/insertar")
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject("vinculacion", new Vinculacion());
        mav.setViewName("vinculacion/insertarV");
        return mav;
    }
    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "insertar")
    public ModelAndView insertar
        (
            @ModelAttribute("vinculacion") Vinculacion v, BindingResult result, SessionStatus status
        )
    {
        this.vinculacionValidator.validate(v, result);
        if(result.hasErrors()){
            ModelAndView mav = new ModelAndView();
            mav.addObject("vinculacion", new Vinculacion(v.getNombre(),v.getUsuario(),v.getPassword()));
            mav.setViewName("vinculacion/insertarV");
            return mav;
        }else{
            String sql = "insert into vinculacion(nombre, usuario, password) values (?,?,?)";
            this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(), v.getPassword());
            return new ModelAndView("redirect:/vinculacion/listaV");
        }
        
    }
    
    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "editar")
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from vinculacion where idvinculacion="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("vinculacion/editarV");
        return mav;
    }
    
    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar( Vinculacion v)
    {
        String sql = "update vinculacion set nombre=?, usuario=? where idvinculacion="+id;
        this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario());
        return new ModelAndView("redirect:/vinculacion/listaV");
    }
    @RequestMapping(value = "/borrar")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "delete from vinculacion where idvinculacion="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/vinculacion/listaV");
    }
}