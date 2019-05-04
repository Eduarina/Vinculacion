/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

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
                    sql = "select * from reporte where idencargado=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                }
                mav.addObject("reportes", lista);
                mav.setViewName("reporte/indexR");  // Este es el nombre del archivo vista .jsp
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

    @RequestMapping(value = "/insertarR", method = RequestMethod.GET) //Este es el nombre con el que se accede desde el navegador
    public ModelAndView insertar() {
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Reporte());
        mav.setViewName("reporte/insertarR");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    @RequestMapping(value = "/insertarR", method = RequestMethod.POST)
    public ModelAndView insertar(Reporte v) {
        String sql = "insert into reporte(nombre, carrera, correo, telefono, celular, matricula, noreporte, fecha, dependencia, telefonod, proyecto, horario, actividades, descripcion) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getCarrera(), v.getCorreo(), v.getTelefono(), v.getCelular(), v.getMatricula(), v.getNoreporte(), v.getFecha(), v.getDependencia(), v.getTelefonod(), v.getProyecto(), v.getHorario(), v.getActividades(), v.getDescripcion());
        return new ModelAndView("redirect:/reportes");
    }

    @GetMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar(HttpServletRequest request, Model model) {
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

    @PostMapping(value = "/generar") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView generar2(HttpServletRequest request, Model model) {
        try {
            int numero = Integer.parseInt(request.getParameter("numero"));
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            Object[] parameters = new Object[]{};
            String sql, fecha;
            SimpleDateFormat mask = new SimpleDateFormat("MM/dd/yyyy");
            int idmaestro;
            Reporte dato = this.checkuser(numero, id);
            if (dato != null) {
                ModelAndView mav = new ModelAndView();
                sql = "select * from maestro_servicio where idservicio=" + id;
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                sql = "select * from usuario";
                List lista1 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("usuarios", lista1);
                model.addAttribute("message", "No puede generar un reporte con el mismo número");
                return mav;
            } else {
                switch (numero) {
                    case 1:
                        sql = "select fecha from vencimiento where idvencimiento=3";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 2:
                        sql = "select fecha from vencimiento where idvencimiento=6";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 3:
                        sql = "select fecha from vencimiento where idvencimiento=9";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 4:
                        sql = "select fecha from vencimiento where idvencimiento=12";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 5:
                        sql = "select fecha from vencimiento where idvencimiento=15";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 6:
                        sql = "select fecha from vencimiento where idvencimiento=18";
                        fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        try {
                            Date fecha2 = mask.parse(fecha);
                            Date hoy = new Date();
                            if (hoy.before(fecha2)) {
                                sql = "select idmaestro from maestro_servicio where idservicio=" + id;
                                idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                                sql = "insert into reporte (numero, fechalim, idmaestro, idservicio) values (?, ?, ?, ?)";
                                this.jdbcTemplate.update(sql, numero, fecha, idmaestro, id);
                            } else {
                                ModelAndView mav = new ModelAndView();
                                sql = "select * from maestro_servicio where idservicio=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                                mav.addObject("datos", lista);
                                mav.setViewName("reporte/generarR");  // Este es el nombre del archivo vista .jsp
                                sql = "select * from usuario";
                                List lista1 = this.jdbcTemplate.queryForList(sql);
                                model.addAttribute("usuarios", lista1);
                                model.addAttribute("message", "No puede generar un reporte si ya vencio.");
                                return mav;
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        break;
                }
                return new ModelAndView("redirect:/reportes/lista");
            }
        } catch (Exception s) {
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
                    model.addAttribute("message", "El campo número de reporte es obligatorio.");
                    return mav;
                }
                return new ModelAndView("redirect:/home");
            } catch (Exception e) {
                return new ModelAndView("redirect:/login/login");
            }
        }

    }

//    @GetMapping(value = "/editarR")
//    public ModelAndView editar(HttpServletRequest request) {
//        ModelAndView mav = new ModelAndView();
//        id = Integer.parseInt(request.getParameter("id"));
//        String sql = "select * from reporte where idreporte=" + id;
//        lista = this.jdbcTemplate.queryForList(sql);
//        mav.addObject("lista", lista);
//        mav.setViewName("reporte/editarR");
//        return mav;
//    }
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idreporte, Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            if (tipo == 3 || tipo == 4 || tipo == 5) {
                String sql, fecha;
                SimpleDateFormat mask = new SimpleDateFormat("MM/dd/yyyy");
                Object[] parameters = new Object[]{};
                sql = "select fechalim from reporte where idreporte=" + idreporte;
                fecha = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                try {
                    Date fecha2 = mask.parse(fecha);
                    Date hoy = new Date();
                    if (hoy.before(fecha2)) {
                        sql = "select fecha from reporte where idreporte=" + idreporte;
                        String datepicker = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select dependencia from reporte where idreporte=" + idreporte;
                        String dependencia = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select numero from reporte where idreporte=" + idreporte;
                        String numero = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select telefono from reporte where idreporte=" + idreporte;
                        String telefono = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select proyecto from reporte where idreporte=" + idreporte;
                        String proyecto = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select horario from reporte where idreporte=" + idreporte;
                        String horario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select actividades from reporte where idreporte=" + idreporte;
                        String actividades = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select descripcion from reporte where idreporte=" + idreporte;
                        String descripcion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select fechalim from reporte where idreporte=" + idreporte;
                        String datepicker2 = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select observaciones from reporte where idreporte=" + idreporte;
                        String observaciones = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                        sql = "select estado from reporte where idreporte=" + idreporte;
                        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        sql = "select idservicio from reporte where idreporte=" + idreporte;
                        int idservicio = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        sql = "select idmaestro from reporte where idreporte=" + idreporte;
                        int idmaestro = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        //sql = "select idencargado from bitacora where idbitacora=" + idbitacora;
                        //int idencargado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                        mav.addObject("datos", new Reporte(idreporte, numero, datepicker, dependencia, telefono, proyecto, horario, actividades, descripcion, datepicker2, estado, observaciones, idmaestro, idservicio));
                        id = (int) session.getAttribute("id");
                        tipo = (int) session.getAttribute("tipo");
                        sql = "select * from usuario where idusuario=" + idservicio;
                        List list1 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("usuario", list1);
                        sql = "select * from servicio where idusuario=" + idservicio;
                        List list2 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("servicio", list2);
                        sql = "select * from reporte where idreporte=" + idreporte;
                        List list3 = this.jdbcTemplate.queryForList(sql);
                        model.addAttribute("reporte", list3);
                        mav.setViewName("reporte/editarR");
                    } else {
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
                                sql = "select * from reporte where idencargado=" + id;
                                lista = this.jdbcTemplate.queryForList(sql);
                            }
                            mav.addObject("reportes", lista);
                            mav.setViewName("reporte/indexR");  // Este es el nombre del archivo vista .jsp
                            sql = "select * from usuario";
                            List list1 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("usuarios", list1);
                            sql = "select * from servicio";
                            List list2 = this.jdbcTemplate.queryForList(sql);
                            model.addAttribute("servicios", list2);
                            model.addAttribute("message", "No puede editar un reporte si ya vencio.");
                            return mav;
                        }
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
            @Valid Reporte u, BindingResult result, HttpServletRequest request, Model model
    ) {
        this.reporteValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            String fecha = request.getParameter("datepicker");
            u.setDatepicker(fecha);
            String telefono = request.getParameter("telefono");
            u.setTelefono(telefono);
            mav.addObject("datos", u);
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            String sql = "select * from usuario where idusuario=" + u.getIdservicio();
            List list1 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("usuario", list1);
            sql = "select * from servicio where idusuario=" + u.getIdservicio();
            List list2 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("servicio", list2);
            sql = "select * from reporte where idreporte=" + u.getIdreporte();
            List list3 = this.jdbcTemplate.queryForList(sql);
            model.addAttribute("reporte", list3);
            mav.setViewName("reporte/editarR");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update reporte set fecha=?, dependencia=?, telefono=?, proyecto=?, horario=?, actividades=?, descripcion=?, observaciones=? where idreporte=" + u.getIdreporte();
            this.jdbcTemplate.update(sql, u.getDatepicker(), u.getDependencia(), u.getTelefono(), u.getProyecto(), u.getHorario(), u.getActividades(), u.getDescripcion(), u.getObservaciones());
            return new ModelAndView("redirect:/reportes/lista");
        }
    }

//    @RequestMapping(value = "/editarR", method = RequestMethod.POST)
//    public ModelAndView editar(Reporte v) {
//        String sql = "update reporte set nombre=?, carrera=?, correo=?, telefono=?, celular=?, matricula=?, noreporte=?, fecha=?, dependencia=?, telefonod=?, proyecto=?, horario=?, actividades=?, descripcion=? where idreporte=" + id;
//        //this.jdbcTemplate.update(sql, v.getNombre(), v.getCarrera(), v.getCorreo(), v.getTelefono(), v.getCelular(), v.getMatricula(), v.getNoreporte(), v.getFecha(), v.getDependencia(), v.getTelefonod(), v.getProyecto(), v.getHorario(), v.getActividades(), v.getDescripcion());
//        return new ModelAndView("redirect:/reportes");
//    }
    @GetMapping(value = "/detalles")
    public ModelAndView detalles(@RequestParam("id") int idreporte, Model model, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            if (tipo == 3 || tipo == 4 || tipo == 5) {
                String sql;
                Object[] parameters = new Object[]{};
                sql = "select idservicio from reporte where idreporte=" + idreporte;
                int idservicio = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                sql = "select * from usuario where idusuario=" + idservicio;
                List list1 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("usuario", list1);
                sql = "select * from servicio where idusuario=" + idservicio;
                List list2 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("servicio", list2);
                sql = "select * from reporte where idreporte=" + idreporte;
                List list3 = this.jdbcTemplate.queryForList(sql);
                model.addAttribute("reporte", list3);
                mav.setViewName("reporte/detallesR");
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(@RequestParam("id") int idreporte, HttpServletRequest request) {
        String sql = "delete from reporte where idreporte=" + idreporte;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/reportes/lista");
    }

    public Reporte checkuser(int numero, int id) {
        final Reporte users = new Reporte();
        String sql = "select * from reporte where numero='" + numero + "'and idservicio='" + id + "'";
        return (Reporte) this.jdbcTemplate.query(sql, new ResultSetExtractor<Reporte>() {
            public Reporte extractData(ResultSet rs) throws SQLException, DataAccessException {
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
