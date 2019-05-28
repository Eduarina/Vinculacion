/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.MaestroTable;
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
@RequestMapping(value = "/alumnos")
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
                sql = "select * from vw_info_estudiantes";
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
                sql = "select * from ctg_carreras";
                lista = this.jdbcTemplate.queryForList(sql);
                mav.addObject("carrera", lista);
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
        Usuario dato = null;
        //Usuario dato = this.checkuser(u.getUser());
        if(dato == null){
            
            u.setPassword( loginController.getMD5(u.getPassword()) );
        String path;
        
        if (u.getSexo().equals("H")) {
            path = "/dist/img/user2-160x160.jpg";
        } else {
            path = "/dist/img/avatar2.png";
        }
        String sql = "insert into tb_usuarios(nombre, user, password, tipo, sexo, path, estado) values (?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getPassword(), 5, u.getSexo(), path, 1);
        
        sql = "select idUsuario from last_ID";
        Object[] parameters = new Object[]{};
        int lastID = this.jdbcTemplate.queryForObject(sql, parameters, int.class);

        sql = "insert into tb_estudiantes (matricula, correo, carrera, semestre, celular, telefono, Estado, idUsuario) values (?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, u.getMatricula(), u.getCorreo(), u.getCarrera(), u.getSemestre(), u.getCelular(), u.getTelefono() , 1, lastID);
        
        return new ModelAndView("redirect:/alumnos/lista");
        
        }else{
           return new ModelAndView(); 
        }
    }
    
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario, HttpServletRequest request) {
        Usuario user = new Usuario();
        user.setIdestudiante(idusuario);
        ModelAndView mav = new ModelAndView();
        String sql = "select nombre from vw_info_estudiantes where ID=" + idusuario;
        Object[] parameters = new Object[]{};
        String nombre = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setNombre(nombre);
        sql = "select usuario from vw_info_estudiantes where ID=" + idusuario;
        String usuario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setUser(usuario);
        sql = "select sexo from vw_info_estudiantes where ID=" + idusuario;
        String sexo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setSexo(sexo);
        sql = "select correo from vw_info_estudiantes where ID=" + idusuario;
        String correo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setCorreo(correo);
        sql = "select matricula from vw_info_estudiantes where ID=" + idusuario;
        String matricula = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setMatricula(matricula);
        sql = "select telefono from vw_info_estudiantes where ID=" + idusuario;
        String telefono = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setTelefono(telefono);
        sql = "select celular from vw_info_estudiantes where ID=" + idusuario;
        String celular = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        user.setCelular(celular);
        sql = "select ncarrera from vw_info_estudiantes where ID=" + idusuario;
        int carrera = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        user.setCarrera(carrera);
        mav.addObject("datos", user);
        sql = "select * from ctg_carreras";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("carrera", lista);
        mav.setViewName("usuario/editarU");
        return mav;
    }   
    
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Usuario u, BindingResult result
    ) {
        String sql = "select idUsuario from vw_info_estudiantes where ID = "+u.getIdestudiante();
        Object[] parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "update tb_usuarios set nombre=?, user =?, sexo = ? where idUsuario=" + idUsuario;
        this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getSexo());
        sql = "update tb_estudiantes set matricula = ?, celular = ?, telefono = ?, carrera = ?, correo=? where idEstudiate=" + u.getIdestudiante();
        this.jdbcTemplate.update(sql, u.getMatricula(), u.getCelular(),u.getTelefono(), u.getCarrera(), u.getCorreo());
        return new ModelAndView("redirect:lista");

    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(@RequestParam("id") int idusuario
    ) {
        String sql = "select idUsuario from tb_estudiantes where idEstudiate =" + idusuario;
        Object[] parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "select Estado from tb_usuarios where idUsuario =" + idUsuario;
        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        if(estado == 1){
           sql = "update tb_usuarios set Estado = 2 where idUsuario=" + idUsuario;
           this.jdbcTemplate.update(sql);
           sql = "update tb_estudiantes set Estado = 2 where idEncargado =" + id;
        }else{
            sql = "update tb_usuarios set Estado = 1 where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql);
            sql = "update tb_estudiantes set Estado = 1 where idEncargado =" + id;
        }
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/usuarios/lista");
    }

    public Usuario checkuser(String user) {
        final Usuario users = new Usuario();
        String sql = "select * from tb_usuarios where user='" + user + "'";
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
