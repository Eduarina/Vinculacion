/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Asignacion_Proyecto;
import com.fiee.Models.Bitacora;
import com.fiee.Models.BitacoraValidator;
import com.fiee.Models.Encargado;
import com.fiee.Models.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
@RequestMapping(value = "/bitacoras")
public class bitacoraController {

    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;
    private BitacoraValidator bitacoraValidator;

    public bitacoraController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.bitacoraValidator = new BitacoraValidator();
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
                    sql = "select * from tb_reportes where tipo = 1";
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                if (tipo == 4) {
                    sql = "select * from bitacora where idservicio=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                if (tipo == 5) {
                    sql = "SELECT count(idProyecto) FROM tb_proyectos WHERE idEstudiante = "+id;
                    int count = this.jdbcTemplate.queryForObject(sql, new Object[]{}, int.class);
                    mav.addObject("total",count);
                    sql = "select * from tb_reportes where tipo = 1 AND idEstudiante =" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    
                }
                mav.addObject("bitacoras", lista);
                mav.setViewName("bitacora/indexB");  // Este es el nombre del archivo vista .jsp
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }
    
    @RequestMapping(value = "/generar", method = RequestMethod.POST)
    public ModelAndView insertar(@ModelAttribute("bitacora") @Valid Bitacora u, BindingResult result, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "INSERT INTO tb_reportes (Num_Reporte, idProyecto, Tipo, Actividades, Descripcion, Problemas, Soluciones, Estado, Fecha, idEstudiante, VBo_Maestro, VBo_Encargado) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, u.getNum_Reporte(), u.getIdProyecto(), 1, u.getActividades(), u.getDescripcion(), u.getProblemas(), u.getSoluciones(), 1, u.getFecha(), id, 1,1);
        return new ModelAndView("redirect:lista");
    }
    
    @GetMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        Object []parameters = new Object[]{};
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
            String sql = "SELECT count(idReporte) from tb_reportes where tipo = 1 AND idEstudiante = "+id;
            int num = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            num++;
            mav.addObject("num",num);
            
            sql = "SELECT idEstudiate from tb_estudiantes WHERE idUsuario = "+id;
            int idEstudiante = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            
            sql = "Select idAsignacionProyecto from tb_asignacion_proyecto WHERE idEstudiante = "+idEstudiante;
            int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            mav.addObject("pro",idProyecto);
            
            
            String fecha = new SimpleDateFormat("dd/MM/yyyy").format( new Date() );
            mav.addObject("fecha",fecha);
            sql = "SELECT * FROM vw_info_estudiantes where idUsuario = "+id;
            lista= this.jdbcTemplate.queryForList(sql);
            mav.addObject("info", lista);
            sql = "SELECT * FROM tb_proyectos WHERE idEstudiante = "+id;
            lista= this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", lista);
            mav.addObject("bitacora",new Bitacora());
            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
            return mav;
    }

    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idbitacora, Model model, HttpServletRequest request) {
        String sql = "SELECT * FROM tb_reportes WHERE idReporte = "+idbitacora;
        Object [] parameters = new Object[]{} ;
        Bitacora bita = (Bitacora) this.jdbcTemplate.queryForObject(sql, parameters, new BeanPropertyRowMapper(Bitacora.class));
        sql = "SELECT Nombre, Matricula, Carrera from vw_info_estudiantes WHERE idUsuario = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        sql = "Select idProyecto from tb_asignacion_proyecto WHERE idAsignacionProyecto = "+bita.getIdProyecto();
        int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        ModelAndView mav = new ModelAndView();
        mav.addObject("fecha",bita.getFecha());
        mav.addObject("num", bita.getNum_Reporte());
        mav.addObject("infoE",lista);
        mav.addObject("bitacora",bita);
        sql = "SELECT Dependencia, Ubicacion from tb_proyectos where idProyecto ="+idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP",lista);
        
        mav.setViewName("bitacora/editarB");
        return mav;        
    }

    @PostMapping(value = "/editar")
    public ModelAndView editar( @ModelAttribute("datos") @Valid Bitacora u, BindingResult result, HttpServletRequest request, Model model ) {
        
        String sql = "SELECT vbo_maestro FROM tb_reportes where idReporte = "+u.getIdReporte();
        String revision = this.jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
        if( !revision.equals("2") ){
            sql = "Update tb_reportes SET vbo_maestro = 1 WHERE idReporte = "+u.getIdReporte();
            this.jdbcTemplate.update(sql);
        }
        sql = "SELECT vbo_encargado FROM tb_reportes where idReporte = "+u.getIdReporte();
        revision = this.jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
        if( !revision.equals("2") ){
            sql = "Update tb_reportes SET vbo_encargado = 1 WHERE idReporte = "+u.getIdReporte();
            this.jdbcTemplate.update(sql);
        }
        
        sql = "UPDATE tb_reportes SET Actividades = ?, Descripcion = ?, Problemas = ?, Soluciones = ? WHERE idReporte = "+u.getIdReporte();
        this.jdbcTemplate.update(sql,u.getActividades(),u.getDescripcion(),u.getProblemas(),u.getSoluciones());
        return new ModelAndView("redirect:lista");
    }

    @GetMapping(value="/exportar")
    public ModelAndView borrar(@RequestParam("id") int idbitacora, HttpServletRequest request) {
        String sql = "SELECT * FROM tb_reportes WHERE idReporte = "+idbitacora;
        Object [] parameters = new Object[]{} ;
        Bitacora bita = (Bitacora) this.jdbcTemplate.queryForObject(sql, parameters, new BeanPropertyRowMapper(Bitacora.class));
        sql = "SELECT Nombre, Matricula, Carrera from vw_info_estudiantes WHERE idUsuario = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        sql = "Select idProyecto from tb_asignacion_proyecto WHERE idAsignacionProyecto = "+bita.getIdProyecto();
        int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        ModelAndView mav = new ModelAndView();
        mav.addObject("fecha",bita.getFecha());
        mav.addObject("num", bita.getNum_Reporte());
        mav.addObject("infoE",lista);
        mav.addObject("bitacora",bita);
        sql = "SELECT Dependencia, Ubicacion from tb_proyectos where idProyecto ="+idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP",lista);
        sql = "SELECT Dependencia, Ubicacion, Horario, Tipo, Titulo from tb_proyectos where idProyecto ="+idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP",lista);
        sql = "SELECT u.Nombre, m.Firma FROM tb_asignacion a, tb_maestros m, tb_usuarios u  WHERE a.idMaestro = m.idUsuario AND a.idMaestro = u.idUsuario and a.idEstudiante = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("firmaM",lista);
        sql = "SELECT u.Nombre, e.Firma FROM tb_estudiantes e, tb_usuarios u WHERE e.idUsuario = u.idUsuario AND e.idUsuario = "+bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("firmaA",lista);
        mav.setViewName("bitacora/exportar");
        return mav;
    }
    
}
