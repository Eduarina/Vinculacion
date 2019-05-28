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
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
            session.setAttribute("src",dato.getPath());
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
            String sql = "update maestro set correo=?, nombre=? where idusuario=" + id;
            this.jdbcTemplate.update(sql, u.getCorreo(), u.getNombre());
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

    public Usuario selectuser(String user, String password) {
        final Usuario users = new Usuario();
        password = getMD5(password);
        String sql = "select * from tb_usuarios where User ='" + user + "' and Password ='" + password + "' and Estado = 1";
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
                    users.setPath(rs.getString("path"));
                }
                return users;
            }
        });
    }

    //poblar select para tipo en insertar
    @ModelAttribute("carrera")
    public Map<String, String> listadoTipo() {
        Map<String, String> carrera = new LinkedHashMap<>();
        carrera.put("ARQUITECTURA", "ARQUITECTURA");
        carrera.put("ING. CIVIL", "ING. CIVIL");
        carrera.put("ING. ELECTRICA", "ING. ELECTRICA");
        carrera.put("ING. ELECTRONICA Y COMUNICACIONES", "ING. ELECTRONICA Y COMUNICACIONES");
        carrera.put("ING. INDUSTRIAL", "ING. INDUSTRIAL");
        carrera.put("ING. INFORMATICA", "ING. INFORMATICA");
        carrera.put("ING. MECANICA", "ING. MECANICA");
        carrera.put("ING. MECATRONICA", "ING. MECATRONICA");
        carrera.put("ING. METALURGICA Y CIENCIA DE LOS MATERIALES", "ING. METALURGICA Y CIENCIA DE LOS MATERIALES");
        carrera.put("ING. NAVAL", "ING. NAVAL");
        carrera.put("ING. QUIMICA", "ING. QUIMICA");
        carrera.put("ING. TOPOGRAGICA GEODESICA", "ING. TOPOGRAGICA GEODESICA");
        return carrera;
    }

    public static String getMD5(String data){ 
        try{
            MessageDigest md =MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(data.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while(hashtext.length() < 32){
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }catch(NoSuchAlgorithmException e){
            throw new RuntimeException(e);
        }
    }
}
