/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Bitacora;
import com.fiee.Models.Reporte;
import com.fiee.Models.ReporteValidator;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
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

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/reportes")
public class reporteController {

    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;
    private ReporteValidator reporteValidator;

    public reporteController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.reporteValidator = new ReporteValidator();
    }

    @GetMapping(value = "/lista") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista(Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            if (tipo == 3 || tipo == 4 || tipo == 5) {
                if (tipo == 3) {
                    sql = "select * from reporte where idmaestro=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                if (tipo == 4) {
                    sql = "select * from reporte where idservicio=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                if (tipo == 5) {
                    sql = "select * from tb_reportes where tipo = 2 AND idEstudiante =" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                mav.addObject("reportes", lista);
                mav.setViewName("reporte/indexR");  // Este es el nombre del archivo vista .jsp
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }
    
    @GetMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        Object []parameters = new Object[]{};
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "SELECT count(idReporte) from tb_reportes where tipo = 2 AND idEstudiante = "+id;
        int num = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        num++;
        mav.addObject("num",num);
        sql = "SELECT idEstudiate from tb_estudiantes where idUsuario = "+id;
        num = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "SELECT DISTINCT idAsignacionProyecto from tb_asignacion_proyecto WHERE idEstudiante = "+num;
        num = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        mav.addObject("pro",num);
        String fecha = new SimpleDateFormat("dd/MM/yyyy").format( new Date() );
        mav.addObject("fecha",fecha);
        sql = "SELECT * FROM vw_info_estudiantes where idUsuario = "+id;
        lista= this.jdbcTemplate.queryForList(sql);
        mav.addObject("info", lista);
        sql = "SELECT * FROM tb_proyectos WHERE idEstudiante = "+id;
        lista= this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos", lista);
        mav.addObject("reporte",new Bitacora());
        mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
        return mav;
    }


    @RequestMapping(value = "/insertarR", method = RequestMethod.POST)
    public ModelAndView insertar(@ModelAttribute("reporte") @Valid Bitacora u, BindingResult result, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "INSERT INTO tb_reportes (Num_Reporte, idProyecto, Tipo, Actividades, Descripcion, Problemas, Soluciones, Estado, Fecha, idEstudiante, VBo_Maestro, VBo_Encargado) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, u.getNum_Reporte(), u.getIdProyecto(), 2, u.getActividades(), u.getDescripcion(), u.getProblemas(), u.getSoluciones(), 1, u.getFecha(), id, 1,1);
        return new ModelAndView("redirect:lista");
    }

    @GetMapping(value = "/generacion") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generaReporte(HttpServletRequest request, Model model) {
        try {
            ModelAndView mav = new ModelAndView();
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            if (tipo == 4) {
                String sql = "select * from maestro_servicio where idservicio=" + id;
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                sql = "select * from usuario";
                List lista1 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("usuarios", lista1);
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

     @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idreporte, Model model, HttpServletRequest request) {

        String sql = "SELECT * FROM tb_reportes WHERE idReporte = "+idreporte;
        Object [] parameters = new Object[]{} ;
        Bitacora bita = (Bitacora) this.jdbcTemplate.queryForObject(sql, parameters, new BeanPropertyRowMapper(Bitacora.class));
        sql = "SELECT Nombre, Matricula, Carrera, Telefono, Celular, Correo from vw_info_estudiantes WHERE idUsuario = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        sql = "Select idProyecto from tb_asignacion_proyecto WHERE idAsignacionProyecto = "+bita.getIdProyecto();
        int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        ModelAndView mav = new ModelAndView();
        mav.addObject("fecha",bita.getFecha());
        mav.addObject("num", bita.getNum_Reporte());
        mav.addObject("infoE",lista);
        mav.addObject("reporte",bita);
        sql = "SELECT Dependencia, Ubicacion, Horario, Tipo, Titulo from tb_proyectos where idProyecto ="+idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP",lista);
        
        mav.setViewName("reporte/editarR");
        return mav;        
        
    }

    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Bitacora u, BindingResult result, HttpServletRequest request, Model model
    ) {
        String sql = "UPDATE tb_reportes SET Actividades = ?, Descripcion = ? WHERE idReporte = "+u.getIdReporte();
        this.jdbcTemplate.update(sql, u.getActividades(), u.getDescripcion());
        return new ModelAndView("redirect:lista");
    }

    @GetMapping(value="/exportar")
    public ModelAndView borrar(@RequestParam("id") int idreporte, HttpServletRequest request) {
        String sql = "SELECT * FROM tb_reportes WHERE idReporte = "+idreporte;
        Object [] parameters = new Object[]{} ;
        Bitacora bita = (Bitacora) this.jdbcTemplate.queryForObject(sql, parameters, new BeanPropertyRowMapper(Bitacora.class));
        sql = "SELECT Nombre, Matricula, Carrera, Telefono, Celular, Correo from vw_info_estudiantes WHERE idUsuario = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        sql = "Select idProyecto from tb_asignacion_proyecto WHERE idAsignacionProyecto = "+bita.getIdProyecto();
        int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        ModelAndView mav = new ModelAndView();
        mav.addObject("fecha",bita.getFecha());
        mav.addObject("num", bita.getNum_Reporte());
        mav.addObject("infoE",lista);
        mav.addObject("reporte",bita);
        sql = "SELECT Dependencia, Ubicacion, Horario, Tipo, Titulo from tb_proyectos where idProyecto ="+idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP",lista);
        sql = "SELECT m.Firma FROM tb_asignacion a, tb_maestros m WHERE a.idMaestro = m.idUsuario and a.idEstudiante = "+bita.getIdEstudiante();
        String firma = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        mav.addObject("firmaM",firma);
        sql = "SELECT Firma FROM tb_estudiantes WHERE idUsuario = "+bita.getIdEstudiante();
        firma = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        mav.addObject("firmaA",firma);
        mav.setViewName("reporte/exportar");
        sql = "SELECT e.Firma from tb_proyectos p, tb_encargados e WHERE p.idEncargado = e.idEncargado";
        firma = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        mav.addObject("firmaE", firma);
        return mav;
    }
}
