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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/proyecto")
public class proyectoController {
    
    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;
//    private ProyectoValidator proyectoValidator;

    public proyectoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
//        this.proyectoValidator = new ProyectoValidator();
    }
    
    @GetMapping(value = "/lista")
    public ModelAndView listar(HttpServletRequest request){
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 4){
            int id = (int) session.getAttribute("id");
            String sql = "SELECT idEncargado from tb_encargados where idUsuario = "+id;
            Object[] parameters = new Object[]{};
            int idEncargado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            sql = "SELECT * FROM tb_proyectos WHERE idEncargado = "+idEncargado;
            lista = this.jdbcTemplate.queryForList(sql);
            return new ModelAndView("proyectos/index","datos",lista);
        }
        return new ModelAndView("redirect:/home");
    }
    
    @GetMapping(value = "/insertar")
    public ModelAndView insertarGet(HttpServletRequest request){
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 4){
            return new ModelAndView("proyectos/insertar","proyecto",new Proyecto());
        }
        return new ModelAndView("redirect:/home");
    }
    
    @PostMapping(value = "/insertar")
    public ModelAndView insertarPost(@ModelAttribute("datos")
            @Valid Proyecto p, BindingResult result, HttpServletRequest request, Model model
    ) {
        
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
    
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 4){
            Proyecto user = new Proyecto();
            user.setId(id);
            ModelAndView mav = new ModelAndView();
            String sql = "select titulo from tb_proyectos where ID=" + id;
            Object[] parameters = new Object[]{};
            String titulo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setTitulo(titulo);
            sql = "select dependencia from tb_proyectos where ID=" + id;
            String dependencia = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setDependencia(dependencia);
            sql = "select horario from tb_proyectos where ID=" + id;
            String horario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setHorario(horario);
            sql = "select fechainicio from tb_proyectos where ID=" + id;
            String fechainicio = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setFechainicio(fechainicio);
            sql = "select fechafin from tb_proyectos where ID=" + id;
            String fechafin = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setFechafin(fechafin);
            sql = "select objetivo from tb_proyectos where ID=" + id;
            String objetivo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setObjetivo(objetivo);
            sql = "select actividades from tb_proyectos where ID=" + id;
            String actividades = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setActividades(actividades);
            sql = "select ubicacion from tb_proyectos where ID=" + id;
            String ubicacion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setUbicacion(ubicacion);
            sql = "select tipo from tb_proyectos where ID=" + id;
            String type = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setTipo(type);
            mav.addObject("datos", user);
            mav.setViewName("proyectos/editar");
            return mav;
        }
        return new ModelAndView("redirect:/home");
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Proyecto v, BindingResult result
    ) {
  //      this.proyectoValidator.validate(v, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", v);
            mav.setViewName("proyectos/editar");
            return mav;
        } else {
            String sql = "update tb_proyectos set titulo=?, dependencia =?, ubicacion = ?, horario=?, fechainicio=?, fechafin=?, objetivo=?, actividades=?, tipo=? where idProyecto=" + v.getId();
            this.jdbcTemplate.update(sql, v.getTitulo(), v.getDependencia(), v.getUbicacion(), v.getHorario(), v.getFechainicio(), v.getFechafin(), v.getObjetivo(), v.getActividades(), v.getTipo());
            return new ModelAndView("redirect:lista");
        }
    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        if(tipo == 4){
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
        }
        return new ModelAndView("redirect:/home");
    }
    
}
