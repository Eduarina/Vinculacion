package com.fiee.Controllers;

import com.fiee.Models.*;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {

    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;

    public indexController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @RequestMapping(value = "/")
    public ModelAndView index(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            int id = (int) session.getAttribute("id");
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @RequestMapping(value = "/home")
    public ModelAndView home(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id");
            FileModel file = new FileModel();
            ModelAndView modelAndView = new ModelAndView("home", "command", file);
            return modelAndView;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @GetMapping(value = "/detalles")
    public ModelAndView verReportes(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        int tipo = (int) session.getAttribute("tipo");
        String sql;
        if (tipo == 3) {
            sql = "SELECT * FROM vw_info_reportes_alumnos WHERE idMaestro = " + id;
        } else {
            sql = "SELECT idEncargado from tb_encargados where idUsuario = " + id;
            int idEncargado = this.jdbcTemplate.queryForObject(sql, new Object[]{}, int.class);
            sql = "SELECT * FROM vw_info_reportes_alumnosE WHERE idEncargado = " + idEncargado;
        }
        List<Info_Reportes> reportes = this.jdbcTemplate.query(sql, new RowMapper<Info_Reportes>() {
            @Override
            public Info_Reportes mapRow(ResultSet rs, int i) throws SQLException {
                Info_Reportes ir = new Info_Reportes();
                ir.setIdEstudiante(rs.getInt("idEstudiante"));
                ir.setIdReporte(rs.getInt("idReporte"));
                ir.setTipo(rs.getInt("Tipo"));
                ir.setNum(rs.getInt("Num_Reporte"));
                ir.setEstadoMaestro(rs.getString("VBo_Maestro"));
                ir.setEstadoEncargado(rs.getString("VBo_Encargado"));
                return ir;
            }
        });
        for (Info_Reportes ir : reportes) {
            if (ir.getTipo() == 1) {
                ir.setTipoReporte("Bitácora ");
            } else {
                ir.setTipoReporte("Reporte ");
            }
            sql = "SELECT Nombre from tb_usuarios WHERE idUsuario = " + ir.getIdEstudiante();
            String nombre = this.jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
            ir.setNombreEstudiante(nombre);
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("lista", reportes);
        mav.setViewName("bitacora/indexB");
        return mav;
    }

    @GetMapping(value = "/revisar")
    public ModelAndView revisa(@RequestParam("id") int idReporte, HttpServletRequest request) {

        String sql = "SELECT * FROM tb_reportes WHERE idReporte = " + idReporte;
        Object[] parameters = new Object[]{};
        Bitacora bita = (Bitacora) this.jdbcTemplate.queryForObject(sql, parameters, new BeanPropertyRowMapper(Bitacora.class));
        sql = "SELECT Nombre, Matricula, Carrera, Telefono, Celular, Correo from vw_info_estudiantes WHERE idUsuario = " + bita.getIdEstudiante();
        lista = this.jdbcTemplate.queryForList(sql);
        sql = "Select idProyecto from tb_asignacion_proyecto WHERE idAsignacionProyecto = " + bita.getIdProyecto();
        int idProyecto = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        ModelAndView mav = new ModelAndView();
        mav.addObject("fecha", bita.getFecha());
        mav.addObject("num", bita.getNum_Reporte());
        mav.addObject("infoE", lista);
        mav.addObject("reporte", bita);
        mav.addObject("idR", bita.getIdReporte());
        sql = "SELECT Dependencia, Ubicacion, Horario, Tipo, Titulo from tb_proyectos where idProyecto =" + idProyecto;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("infoP", lista);
        if (bita.getTipo() == 1) {
            mav.setViewName("bitacora/detallesB");
        } else {
            mav.setViewName("reporte/detallesR");
        }
        return mav;
    }

    @PostMapping(value = "/comentar")
    public ModelAndView comentar(@RequestParam("idR") int idReporte, @RequestParam("obse") String obse, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        String sql;
        if (tipo == 3) {
            sql = "UPDATE tb_reportes SET vbo_maestro = ? WHERE idReporte = " + idReporte;
        } else {
            sql = "UPDATE tb_reportes SET vbo_encargado = ? WHERE idReporte = " + idReporte;
        }
        this.jdbcTemplate.update(sql, obse);
        return new ModelAndView("redirect:detalles");
    }

    @GetMapping(value = "/autoriza")
    public ModelAndView autorizar(@RequestParam("id") int idReporte, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int tipo = (int) session.getAttribute("tipo");
        String sql;
        if (tipo == 3) {
            sql = "UPDATE tb_reportes SET vbo_maestro = 2 WHERE idReporte = " + idReporte;
        } else {
            sql = "UPDATE tb_reportes SET vbo_encargado = 2 WHERE idReporte = " + idReporte;
        }
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:detalles");
    }

}
