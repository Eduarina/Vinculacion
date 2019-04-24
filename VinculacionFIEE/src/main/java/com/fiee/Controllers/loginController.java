/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Encargado;
import com.fiee.Models.EncargadoValidator;
import com.fiee.Models.Maestro;
import com.fiee.Models.MaestroValidator;
import com.fiee.Models.Servicio;
import com.fiee.Models.ServicioValidator;
import com.fiee.Models.Usuario;
import com.fiee.Models.Vinculacion;
import com.fiee.Models.VinculacionValidator;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Emrys
 */
@Controller
@RequestMapping(value = "/login")
public class loginController {

    private JdbcTemplate jdbcTemplate;
    int id, tipo;
    List lista;
    private VinculacionValidator vinculacionValidator;
    private MaestroValidator maestroValidator;
    private ServicioValidator servicioValidator;
    private EncargadoValidator encargadoValidator;

    public loginController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.vinculacionValidator = new VinculacionValidator();
        this.maestroValidator = new MaestroValidator();
        this.servicioValidator = new ServicioValidator();
        this.encargadoValidator = new EncargadoValidator();
    }

    @GetMapping(value = "/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("usuario", new Usuario());
        mav.setViewName("login/login");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

//    @PostMapping("/login")
//    public String login(@ModelAttribute("usuario") Usuario usuario, Model model){
//        // Implement your business logic
//      if (usuario.getUser().equals("qwe") && usuario.getPassword().equals("123")) {
//         // Set user dummy data
//         usuario.setIdusuario(2);
//         usuario.setNombre("qwewqe");
//         usuario.setPassword("123");
//         usuario.setPassword2("123");
//         usuario.setTipo(3);
//         usuario.setUser("qwe");
//      } else {
//         model.addAttribute("message", "Login failed. Try again.");
//         return "login";
//      }
//      return "sucess";
//    }
    @PostMapping(value = "/login")
    public ModelAndView login(
            @ModelAttribute("usuario") Usuario u, Model model, HttpServletRequest request) {
        Usuario dato = this.selectuser(u.getUser(), u.getPassword());
        if (dato == null) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", new Usuario(u.getUser(), u.getPassword()));
            mav.setViewName("login/login");
            model.addAttribute("message", "Usuario o contraseña son incorrectos. Intente de nuevo..");
            return mav;
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", dato.getUser());
            session.setAttribute("id", dato.getIdusuario());
            session.setAttribute("tipo", dato.getTipo());
            session.setAttribute("nombre", dato.getNombre());
            session.setAttribute("band", 1);
            ModelAndView mav = new ModelAndView();
            mav.setViewName("login/sucess");
            return mav;
        }

    }
//    @GetMapping(value = "/lista")
//    public ModelAndView lista() {
//        ModelAndView mav = new ModelAndView();
//        String sql = "select * from usuario";
//        lista = this.jdbcTemplate.queryForList(sql);
//        mav.addObject("datos", lista);
//        mav.setViewName("usuario/indexU");  // Este es el nombre del archivo vista .jsp
//        return mav;
//    }
    //@GetMapping(value = "/info")

    @GetMapping(value = "/perfil")
    public ModelAndView perfil(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            switch (tipo) {
                case 1:
                    break;
                case 2:
                    sql = "select * from vinculacion where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
                case 3:
                    //id=Integer.parseInt(request.getParameter("id"));
                    sql = "select * from maestro where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
                case 4:
                    sql = "select * from servicio where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
                case 5:
                    sql = "select * from encargado where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
            }
            mav.addObject("datos", lista);
            mav.setViewName("login/perfil");  // Este es el nombre del archivo vista .jsp
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        session.invalidate();
        return new ModelAndView("redirect:/login/login");
    }

    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            Object[] parameters = new Object[]{};
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            switch (tipo) {
                case 1:
                    break;
                case 2:
                    sql = "select correo from vinculacion where idusuario =" + id;
                    String correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select carrera from vinculacion where idusuario =" + id;
                    String carrera = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    mav.addObject("datos", new Vinculacion(id, correo, carrera));
                    break;
                case 3:
                    sql = "select correo from maestro where idusuario =" + id;
                    correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select carrera from maestro where idusuario =" + id;
                    carrera = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    mav.addObject("datos", new Maestro(id, correo, carrera));
                    break;
                case 4:
                    sql = "select correo from servicio where idusuario =" + id;
                    correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select carrera from servicio where idusuario =" + id;
                    carrera = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select matricula from servicio where idusuario =" + id;
                    String matricula = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select creditos from servicio where idusuario =" + id;
                    int creditos = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                    sql = "select telefono from servicio where idusuario =" + id;
                    String telefono = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select celular from servicio where idusuario =" + id;
                    String celular = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select cv from servicio where idusuario =" + id;
                    String cv = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select semestre from servicio where idusuario =" + id;
                    int semestre = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                    sql = "select horario from servicio where idusuario =" + id;
                    String horario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    mav.addObject("datos", new Servicio(id, matricula, creditos, correo, telefono, celular, cv, carrera, semestre, horario));
                    break;
                case 5:
                    sql = "select correo from encargado where idusuario =" + id;
                    correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select dependencia from encargado where idusuario =" + id;
                    String dependencia = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select direccion from encargado where idusuario =" + id;
                    String direccion = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    sql = "select telefono from encargado where idusuario =" + id;
                    telefono = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                    mav.addObject("datos", new Encargado(id, correo, dependencia, direccion, telefono));
                    break;
            }
            mav.setViewName("login/editarP");
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }
//
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)

    @PostMapping(value = "/editar2")
    public ModelAndView editar2(
            @ModelAttribute("datos")
            @Valid Vinculacion u, BindingResult result, HttpServletRequest request
    ) {
        this.vinculacionValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("login/editarP");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update vinculacion set correo=?, carrera=? where idusuario=" + id;
            this.jdbcTemplate.update(sql, u.getCorreo(), u.getCarrera());
            return new ModelAndView("redirect:/login/perfil");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar3")
    public ModelAndView editar3(
            @ModelAttribute("datos")
            @Valid Maestro u, BindingResult result, HttpServletRequest request
    ) {
        this.maestroValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("login/editarP");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update maestro set correo=?, carrera=? where idusuario=" + id;
            this.jdbcTemplate.update(sql, u.getCorreo(), u.getCarrera());
            return new ModelAndView("redirect:/login/perfil");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar4")
    public ModelAndView editar4(
            @ModelAttribute("datos")
            @Valid Servicio u, BindingResult result, HttpServletRequest request
    ) {
        this.servicioValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("login/editarP");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update servicio set matricula=?, creditos=?, correo=?, telefono=?, celular=?, cv=?, carrera=?, semestre=?, horario=? where idusuario=" + id;
            this.jdbcTemplate.update(sql, u.getMatricula(), u.getCreditos(), u.getCorreo(), u.getTelefono(), u.getCelular(), u.getCv(), u.getCarrera(), u.getSemestre(), u.getHorario());
            return new ModelAndView("redirect:/login/perfil");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar5")
    public ModelAndView editar5(
            @ModelAttribute("datos")
            @Valid Encargado u, BindingResult result, HttpServletRequest request
    ) {
        this.encargadoValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("login/editarP");
            return mav;
        } else {
            HttpSession session = request.getSession();
            id = (int) session.getAttribute("id");
            String sql = "update encargado set correo=?, dependencia=?, direccion=?, telefono=? where idusuario=" + id;
            this.jdbcTemplate.update(sql, u.getCorreo(), u.getDependencia(), u.getDireccion(), u.getTelefono());
            return new ModelAndView("redirect:/login/perfil");
        }

    }

    public Usuario selectuser(String user, String password) {
        final Usuario users = new Usuario();
        String sql = "select * from usuario where user='" + user + "' and password='" + password + "'";
        return (Usuario) this.jdbcTemplate.query(sql, new ResultSetExtractor<Usuario>() {
            public Usuario extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (!rs.isBeforeFirst()) {
                    return null;
                }
                if (rs.next()) {
                    users.setIdusuario(rs.getInt("idusuario"));
                    users.setNombre(rs.getString("nombre"));
                    users.setUser(rs.getString("user"));
                    users.setPassword(rs.getString("password"));
                    users.setPassword2(rs.getString("password"));
                    users.setTipo(rs.getInt("tipo"));
                }
                return users;
            }
        });
    }

}
