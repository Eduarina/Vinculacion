package com.fiee.Controllers;

import com.fiee.Models.Proyecto;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VistasPruebaDB {
    
    private JdbcTemplate jdbcTemplate;

    public VistasPruebaDB() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    
    @RequestMapping(value="/indexDB") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView indexDB()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("PruebaDB");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value="/getAlumnos") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView datosAlumnos()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from proyecto";
        List datosAlumnos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("alumnos",datosAlumnos);    
        mav.setViewName("AlumnosDB");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertAlumnos", method = RequestMethod.GET)
    public ModelAndView insertarAlumno()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Proyecto());
        mav.setViewName("insertarprueba");
        return mav;
    }
    
    @RequestMapping(value = "/insertAlumnos", method = RequestMethod.POST)
    public ModelAndView insertarAlumno( Proyecto p)
    {
        String sql = "insert into proyecto(nombre) values (?)";
        this.jdbcTemplate.update(sql, p.getNombre());
        return new ModelAndView("redirect:/getAlumnos");
    }
    
}
