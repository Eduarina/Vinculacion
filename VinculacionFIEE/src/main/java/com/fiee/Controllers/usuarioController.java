/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Usuario;
import com.fiee.Models.UsuarioValidator;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/usuarios")
public class usuarioController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private UsuarioValidator usuarioValidator;

    public usuarioController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.usuarioValidator = new UsuarioValidator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 1 || tipo == 2) {
                sql = "select * from usuario";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("datos", lista);
                mav.setViewName("usuario/indexU");  // Este es el nombre del archivo vista .jsp
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/insertar")
    public ModelAndView insertar(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 1 || tipo == 2) {
                mav.addObject("datos", new Usuario());
                mav.setViewName("usuario/insertarU");
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/insertar")
    public ModelAndView insertar(
            @ModelAttribute("datos") @Valid Usuario u, BindingResult result, Model model
    ) {
        this.usuarioValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("usuario/insertarU");
            return mav;
        } else {
            Usuario dato = this.checkuser(u.getUser());
            if (dato == null) {
                String sql = "insert into usuario(nombre, user, password, tipo) values (?,?,?,?)";
                this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getPassword(), u.getTipo());
                sql = "select idusuario from usuario where user='" + u.getUser() + "'";
                Object[] parameters = new Object[]{};
                String id = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                if (id != null) {
                    switch (u.getTipo()) {
                        case 1:
                            break;
                        case 2:
                            sql = "insert into vinculacion(idusuario) values (?)";
                            this.jdbcTemplate.update(sql, id);
                            break;
                        case 3:
                            sql = "insert into maestro(idusuario, estatus) values (?,?)";
                            this.jdbcTemplate.update(sql, id, 1);
                            break;
                        case 4:
                            sql = "insert into servicio(idusuario, estatus, creditos, semestre) values (?, ?, ?, ?)";
                            this.jdbcTemplate.update(sql, id, 1, 0, 0);
                            break;
                        case 5:
                            sql = "insert into encargado(idusuario, estatus) values (?,?)";
                            this.jdbcTemplate.update(sql, id, 1);
                            break;
                    }
                }
                return new ModelAndView("redirect:/usuarios/lista");
            } else {
                ModelAndView mav = new ModelAndView();
                mav.addObject("datos", u);
                mav.setViewName("usuario/insertarU");
                model.addAttribute("message", "Este usuario ya existe.");
                return mav;
            }
        }
    }

    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario, HttpServletRequest request
    ) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            id = (int) session.getAttribute("id");
            int tipo2 = (int) session.getAttribute("tipo");
            if (tipo2 == 1 || tipo2 == 2) {
                //id=Integer.parseInt(request.getParameter("id"));
                sql = "select nombre from usuario where idusuario=" + idusuario;
                Object[] parameters = new Object[]{};
                String nombre = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                sql = "select user from usuario where idusuario=" + idusuario;
                String usuario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                sql = "select tipo from usuario where idusuario=" + idusuario;
                int tipo = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                sql = "select password from usuario where idusuario=" + idusuario;
                String password = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
                mav.addObject("datos", new Usuario(idusuario, nombre, usuario, password, password, tipo));
                mav.setViewName("usuario/editarU");
                return mav;
            }
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }

    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Usuario u, BindingResult result
    ) {
        this.usuarioValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", u);
            mav.setViewName("usuario/editarU");
            return mav;
        } else {
            String sql = "update usuario set nombre=?, user=?, tipo=? where idusuario=" + u.getIdusuario();
            this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getTipo());
            return new ModelAndView("redirect:/usuarios/lista");
        }

    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(@RequestParam("id") int idusuario
    ) {
        String sql = "delete from usuario where idusuario=" + idusuario;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuarios/lista");
    }

//    @GetMapping("/info")
//    public String userInfo(@SessionAttribute("usuario") Usuario user) {
//
//        System.out.println("Usuario: " + user.getUser());
//        System.out.println("Nombre: " + user.getNombre());
//        System.out.println("Tipo: " + user.getTipo());
//
//        return "perfil";
//    }
    //poblar select para tipo en insertar
    @ModelAttribute("tipo")
    public Map<String, String> listadoTipo() {
        Map<String, String> tipo = new LinkedHashMap<>();
        tipo.put("1", "Administrador");
        tipo.put("2", "Vinculacion");
        tipo.put("3", "Maestro");
        tipo.put("4", "Servicio");
        tipo.put("5", "Encargado");
        return tipo;
    }

    public Usuario checkuser(String user) {
        final Usuario users = new Usuario();
        String sql = "select * from usuario where user='" + user + "'";
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
