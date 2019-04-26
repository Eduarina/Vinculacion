/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Bitacora;
import com.fiee.Models.BitacoraValidator;
import com.fiee.Models.Usuario;
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
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 3 || tipo == 4 || tipo == 5) {
                sql = "select * from bitacora";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("bitacoras", lista);
                mav.setViewName("bitacora/indexB");  // Este es el nombre del archivo vista .jsp
                sql = "select * from usuario";
                List list1 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("usuarios", list1);
                sql = "select * from servicio";
                List list2 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("servicios", list2);
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

    @GetMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar(HttpServletRequest request, Model model) {
        try {
            ModelAndView mav = new ModelAndView();
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 4) {
                String sql = "select * from maestro_servicio where idservicio=" + id;
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
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

    @PostMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar2(HttpServletRequest request, Model model) {
        int numero = Integer.parseInt(request.getParameter("numero"));
        HttpSession session = request.getSession();
        id = (int) session.getAttribute("id");
        Object[] parameters = new Object[]{};
        String sql, fecha;
        SimpleDateFormat mask = new SimpleDateFormat("MM/dd/yyyy");
        int idmaestro;
        Bitacora dato = this.checkuser(numero);
        if (dato != null) {
            ModelAndView mav = new ModelAndView();
            sql = "select * from maestro_servicio where idservicio=" + id;
            lista = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", lista);
            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
            sql = "select * from usuario";
            List lista1 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("usuarios", lista1);
            model.addAttribute("message", "No puede generar una bitácora con el mismo número");
            return mav;
        } else {
            switch (numero) {
                case 1:
                    sql = "select fecha from vencimiento where idvencimiento=1";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 2:
                    sql = "select fecha from vencimiento where idvencimiento=2";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    sql = "select fecha from vencimiento where idvencimiento=4";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 4:
                    sql = "select fecha from vencimiento where idvencimiento=5";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 5:
                    sql = "select fecha from vencimiento where idvencimiento=7";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 6:
                    sql = "select fecha from vencimiento where idvencimiento=8";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 7:
                    sql = "select fecha from vencimiento where idvencimiento=10";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 8:
                    sql = "select fecha from vencimiento where idvencimiento=11";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 9:
                    sql = "select fecha from vencimiento where idvencimiento=13";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 10:
                    sql = "select fecha from vencimiento where idvencimiento=14";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 11:
                    sql = "select fecha from vencimiento where idvencimiento=16";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case 12:
                    sql = "select fecha from vencimiento where idvencimiento=17";
                    fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    try {
                        Date fecha2 = mask.parse(fecha);
                        Date hoy = new Date();
                        if (hoy.before(fecha2)) {
                            sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                            idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                            sql = "insert into bitacora (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                        } else {
                            ModelAndView mav = new ModelAndView();
                            sql = "select * from maestro_servicio where idservicio=" + id;
                            lista = this.jdbcTemplate.queryForList(sql);
                            mav.addObject("datos", lista);
                            mav.setViewName("bitacora/generarB");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List lista1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", lista1);
                            model.addAttribute("message", "No puede generar una bitácora si ya vencio.");
                            return mav;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
            }
            return new ModelAndView("redirect:/bitacoras/lista");
        }
    }

//    @GetMapping(value = "/insertar") //Este es el nombre con el que se accede desde el navegador
//    public ModelAndView insertar() {
//        ModelAndView mav = new ModelAndView();
//        mav.addObject(new Bitacora());
//        mav.setViewName("bitacora/insertarB");  // Este es el nombre del archivo vista .jsp
//        return mav;
//    }
//
//    @PostMapping(value = "/insertar")
//    public ModelAndView insertar(Bitacora v) {
//        String sql = "insert into bitacora(alumno, matricula, carrera, dependencia, ubicacion, fechaini, fechafin, nobitacora, actividades, descripcion, problemas, soluciones) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//        //this.jdbcTemplate.update(sql, v.getAlumno(), v.getMatricula(), v.getCarrera(), v.getDependencia(), v.getUbicacion(), v.getFechaini(), v.getFechafin(), v.getNobitacora(), v.getActividades(), v.getDescripcion(), v.getProblemas(), v.getSoluciones());
//        return new ModelAndView("redirect:/bitacoras");
//    }
    @RequestMapping(value = "/editar", method = RequestMethod.GET)
    public ModelAndView editar(@RequestParam("id") int idbitacora, Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 3 || tipo == 4 || tipo == 5) {
                String sql, fecha;
                SimpleDateFormat mask = new SimpleDateFormat("MM/dd/yyyy");
                Object[] parameters = new Object[]{};
                sql = "select fechalim from bitacora where idbitacora=" + idbitacora;
                fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                try {
                    Date fecha2 = mask.parse(fecha);
                    Date hoy = new Date();
                    if (hoy.before(fecha2)) {
                        sql = "select fecha from bitacora where idbitacora=" + idbitacora;
                        String datepicker = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select dependencia from bitacora where idbitacora=" + idbitacora;
                        String dependencia = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select direccion from bitacora where idbitacora=" + idbitacora;
                        String direccion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select numero from bitacora where idbitacora=" + idbitacora;
                        String numero = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select actividades from bitacora where idbitacora=" + idbitacora;
                        String actividades = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select descripcion from bitacora where idbitacora=" + idbitacora;
                        String descripcion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select problemas from bitacora where idbitacora=" + idbitacora;
                        String problemas = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select soluciones from bitacora where idbitacora=" + idbitacora;
                        String soluciones = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select fechalim from bitacora where idbitacora=" + idbitacora;
                        String datepicker2 = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select observaciones from bitacora where idbitacora=" + idbitacora;
                        String observaciones = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select estado from bitacora where idbitacora=" + idbitacora;
                        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        sql = "select idservicio from bitacora where idbitacora=" + idbitacora;
                        int idservicio = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        sql = "select idmaestro from bitacora where idbitacora=" + idbitacora;
                        int idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        //sql = "select idencargado from bitacora where idbitacora=" + idbitacora;
                        //int idencargado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        mav.addObject("datos", new Bitacora(idbitacora, datepicker, dependencia, direccion, numero, actividades, descripcion, problemas, soluciones, datepicker2, observaciones, estado, idservicio, idmaestro));
                        id = (int) session.getAttribute("id");
                        tipo = (int) session.getAttribute("tipo");
                        sql = "select * from usuario where idusuario=" + id;
                        List list1 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("usuario", list1);
                        sql = "select * from servicio where idusuario=" + id;
                        List list2 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("servicio", list2);
                        sql = "select * from bitacora where idbitacora=" + idbitacora;
                        List list3 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("bitacora", list3);
                        mav.setViewName("bitacora/editarB");
                    } else {
                        sql = "select * from bitacora";
                        lista = this.jdbcTemplate.queryForList(sql);
                        mav.addObject("bitacoras", lista);
                        mav.setViewName("bitacora/indexB");  // Este es el nombre del archivo vista .jsp
                        sql = "select * from usuario";
                        List list1 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("usuarios", list1);
                        sql = "select * from servicio";
                        List list2 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("servicios", list2);
                        model.addAttribute("message", "No puede editar una bitácora si ya vencio.");
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Bitacora u, BindingResult result, HttpServletRequest request, Model model
    ) {
        this.bitacoraValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            String sql = "select * from usuario where idusuario=" + id;
            List list1 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("usuario", list1);
            sql = "select * from servicio where idusuario=" + id;
            List list2 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("servicio", list2);
            sql = "select * from bitacora where idbitacora=" + u.getIdbitacora();
            List list3 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("bitacora", list3);
            mav.setViewName("bitacora/editarB");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update bitacora set fecha=?, dependencia=?, direccion=?, actividades=?, descripcion=?, problemas=?, soluciones=?, observaciones=? where idbitacora=" + u.getIdbitacora();
            this.jdbcTemplate.update(sql, u.getDatepicker(), u.getDependencia(), u.getDireccion(), u.getActividades(), u.getDescripcion(), u.getProblemas(), u.getSoluciones(), u.getObservaciones());
            return new ModelAndView("redirect:/bitacoras/lista");
        }
    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(@RequestParam("id") int idbitacora, HttpServletRequest request) {
        String sql = "delete from bitacora where idbitacora=" + idbitacora;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/bitacoras/lista");
    }

    public Bitacora checkuser(int numero) {
        final Bitacora users = new Bitacora();
        String sql = "select * from bitacora where numero='" + numero + "'";
        return (Bitacora) this.jdbcTemplate.query(sql, new ResultSetExtractor<Bitacora>() {
            public Bitacora extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (!rs.isBeforeFirst()) {
                    return null;
                }
                if (rs.next()) {
                    users.setNumero(rs.getString("numero"));
                }
                return users;
            }
        });
    }
}
