/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;
import com.fiee.Models.Encargado;
import com.fiee.Models.MaestroTable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/encargados")
public class encargadoController {
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    public encargadoController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(value="/lista") //Este es el nombre con el que se accede desde el navegador
    public ModelAndView lista()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from vw_info_encargado";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("encargados", lista);    
        mav.setViewName("encargado/indexE");  // Este es el nombre del archivo vista .jsp
        return mav;
    }
    
    @RequestMapping(value = "/insertar", method = RequestMethod.GET)
    public ModelAndView insertar()
    {
        ModelAndView mav = new ModelAndView();
        mav.addObject("nuevo", new Encargado());
        mav.setViewName("encargado/insertarE");
        return mav;
    }
    
    @PostMapping(value = "insertar")
    public ModelAndView insertar(
            @ModelAttribute("nuevo") Encargado e, BindingResult result, SessionStatus status
    ) {
        e.setPass(loginController.getMD5(e.getPass()));
        String path;
        if (e.getSexo().equals("H")) {
            path = "/dist/img/user2-160x160.jpg";
        } else {
            path = "/dist/img/avatar2.png";
        }
        String sql = "insert into tb_usuarios(nombre, user, password, tipo, sexo, path, estado) values (?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, e.getNombre(), e.getUsuario(), e.getPass(), 4, e.getSexo(), path, 1);

        sql = "select idUsuario from last_ID";
        Object[] parameters = new Object[]{};
        int lastID = this.jdbcTemplate.queryForObject(sql, parameters, int.class);

        sql = "insert into tb_encargados (correo, telefono, Estado, idUsuario) values (?,?,?,?)";
        this.jdbcTemplate.update(sql, e.getCorreo(), e.getTelefono(), 1, lastID);

        return new ModelAndView("redirect:/encargados/lista");
    }
    
    @RequestMapping(value = "/editarUsuarioE", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        id=Integer.parseInt(request.getParameter("id"));
        String sql = "select * from encargado where idencargado="+id;
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", lista);
        mav.setViewName("encargado/editarE");
        return mav;
    }
    @RequestMapping(value = "/editarUsuarioE", method = RequestMethod.POST)
    public ModelAndView editar( Encargado v)
    {
        String sql = "update encargado set nombre=?, usuario=?, correo=? where idencargado="+id;
        //this.jdbcTemplate.update(sql, v.getNombre(), v.getUsuario(),v.getCorreo());
        return new ModelAndView("redirect:/usuariosE");
    }
    @RequestMapping(value = "/borrar")
    public ModelAndView borrar( HttpServletRequest request)
    {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select idUsuario from tb_encargados where idEncargado =" + id;
        Object[] parameters = new Object[]{};
        int idUsuario = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "select Estado from tb_usuarios where idUsuario =" + idUsuario;
        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        if(estado == 1){
           sql = "update tb_usuarios set Estado = 2 where idUsuario=" + idUsuario;
           this.jdbcTemplate.update(sql);
           sql = "update tb_encargados set Estado = 2 where idEncargado =" + id;
        }else{
            sql = "update tb_usuarios set Estado = 1 where idUsuario=" + idUsuario;
            this.jdbcTemplate.update(sql);
            sql = "update tb_encargados set Estado = 1 where idEncargado =" + id;
        }
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:lista");
    }
}
