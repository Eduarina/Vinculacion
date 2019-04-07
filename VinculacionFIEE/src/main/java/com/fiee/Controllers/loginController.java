/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Maestro;
import com.fiee.Models.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public loginController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
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
            model.addAttribute("message", "Login failed. Try again.");
            return mav;
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", dato.getUser());
            session.setAttribute("id", dato.getIdusuario());
            session.setAttribute("tipo", dato.getTipo());
            session.setAttribute("nombre", dato.getNombre());
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
        HttpSession session = request.getSession();
        String sql;
        ModelAndView mav = new ModelAndView();
        id = (int) session.getAttribute("id");
        tipo = (int) session.getAttribute("tipo");
        switch (tipo) {
            case 1:
                break;
            case 2:
                sql = "select * from vinculacion";
                lista = this.jdbcTemplate.queryForList(sql);
                break;
            case 3:
                //id=Integer.parseInt(request.getParameter("id"));
                sql = "select * from maestro";
                lista = this.jdbcTemplate.queryForList(sql);
                break;
            case 4:
                sql = "select * from servicio";
                lista = this.jdbcTemplate.queryForList(sql);
                break;
            case 5:
                sql = "select * from encargado";
                lista = this.jdbcTemplate.queryForList(sql);
                break;
        }
        mav.addObject("datos", lista);
        mav.setViewName("login/perfil");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/login/login");
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
