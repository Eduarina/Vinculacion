package com.fiee.Controllers;

import com.fiee.Models.Bitacora;
import com.fiee.Models.BitacoraValidator;
import com.fiee.Models.Proyecto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/proyecto")
public class proyectoController {
    
    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;
    private BitacoraValidator bitacoraValidator;

    public proyectoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.bitacoraValidator = new BitacoraValidator();
    }
    
    @GetMapping(value = "/lista")
    public ModelAndView listar(HttpServletRequest request){
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "SELECT idEncargado from tb_encargados where idUsuario = "+id;
        Object[] parameters = new Object[]{};
        int idEncargado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "SELECT * FROM tb_proyectos WHERE idEncargado = "+idEncargado;
        lista = this.jdbcTemplate.queryForList(sql);
        return new ModelAndView("proyectos/index","datos",lista);
    }
    
    @GetMapping(value = "/insertar")
    public ModelAndView insertarGet(HttpServletRequest request){
        return new ModelAndView("proyectos/insertar","proyecto",new Proyecto());
    }
    
    @PostMapping(value = "/insertar")
    public ModelAndView insertarPost(@ModelAttribute("datos")
            @Valid Proyecto p, BindingResult result, HttpServletRequest request, Model model
    ) {
        
        //Parsear fechas, Cambiar tipo de proyecto, Horario, Obtener idEncargado.
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("id");
        String sql = "INSERT INTO tb_proyectos "
                + "(Titulo, Dependencia, Horario, FechaInicio, FechaFin, Objetivo, Actividades, Ubicacion, Aspirantes, Tipo, idEncargado, Estado) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        String []fecha = p.getFechainicio().split("/");
        String inicio = fecha[1]+"/"+fecha[0]+"/"+fecha[2];
        fecha = p.getFechafin().split("/");
        String fin = fecha[1]+"/"+fecha[0]+"/"+fecha[2];
        String tipo;
        if ( p.getTipo().equals("1") ){
            tipo = "Servicio Social";
        }else{
            tipo = "Practicas Profesionales";
        }
        String sql1 = "SELECT idEncargado FROM tb_encargados where idUsuario = "+id;
        Object []parameters = new Object[]{};
        int idEncargado = this.jdbcTemplate.queryForObject(sql1, parameters, int.class);
        this.jdbcTemplate.update(sql, p.getTitulo(), p.getDependencia(), p.getHorario(), inicio, fin, p.getObjetivo(), p.getActividades(), p.getUbicacion(), 0, tipo, idEncargado, 1);
        return new ModelAndView("redirect:lista");
    }
    
    
}
