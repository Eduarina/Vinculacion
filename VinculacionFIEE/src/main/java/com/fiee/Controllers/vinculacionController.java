package com.fiee.Controllers;

import com.fiee.Models.Usuario;
import com.fiee.Models.UsuarioValidator;
import com.fiee.Models.Vinculacion;
import com.fiee.Models.VinculacionValidator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
@RequestMapping(value = "/vinculacion")
public class vinculacionController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    private UsuarioValidator usuarioValidator;

    public vinculacionController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.usuarioValidator = new UsuarioValidator();
    }

    //@RequestMapping(value="/usuariosV") //Este es el nombre con el que se accede desde el navegador
    @GetMapping(value = "/lista")
    public ModelAndView lista() {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from tb_usuarios Where tipo = 2";
        lista = this.jdbcTemplate.queryForList(sql);
        mav.addObject("usuarios", lista);
        mav.setViewName("vinculacion/index");  // Este es el nombre del archivo vista .jsp
        return mav;
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/insertar")
    public ModelAndView insertar() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("usuario", new Usuario());
        mav.setViewName("vinculacion/insertarV");
        return mav;
    }

    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "insertar")
    public ModelAndView insertar(
            @ModelAttribute("usuario") Usuario u, BindingResult result, SessionStatus status, HttpServletRequest request
    ) {
        this.usuarioValidator.validate(u, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("usuario", u);
            mav.setViewName("vinculacion/insertarV");
            return mav;
        } else {
            u.setPassword(loginController.getMD5(u.getPassword()));
            String path;

            if (u.getSexo() == "H") {
                path = "/dist/img/user2-160x160.jpg";
            } else {
                path = "/dist/img/avatar2.png";
            }
            String sql = "insert into tb_usuarios(nombre, user, password, tipo, sexo, path, estado) values (?,?,?,?,?,?,?)";
            this.jdbcTemplate.update(sql, u.getNombre(), u.getUser(), u.getPassword(), 2, u.getSexo(), path, 1);
            HttpSession session = request.getSession();
            int tipo = (int) session.getAttribute("tipo");
            if (tipo == 3) {
                int id = (int) session.getAttribute("id");
                sql = "SELECT idUsurioa from last_id";
                Object[] parameters = new Object[]{};
                int idEstudiante = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
                sql = "insert into tb_asignacion (idmaestro, idestudiante, estado) values (?,?,?)";
                this.jdbcTemplate.update(sql, id, idEstudiante, 1);
            }

            return new ModelAndView("redirect:/vinculacion/lista");

        }

    }

    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.GET)
    @GetMapping(value = "/editar")
    public ModelAndView editar(@RequestParam("id") int idusuario, HttpServletRequest request) {
        try {
            Usuario user = new Usuario();
            user.setIdusuario(idusuario);
            ModelAndView mav = new ModelAndView();
            String sql = "select nombre from tb_usuarios where idusuario=" + idusuario;
            Object[] parameters = new Object[]{};
            String nombre = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setNombre(nombre);
            sql = "select user from tb_usuarios where idusuario=" + idusuario;
            String usuario = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setUser(usuario);
            sql = "select password from tb_usuarios where idusuario=" + idusuario;
            String password = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setPassword(password);
            user.setPassword2(password);
            sql = "select sexo from tb_usuarios where idusuario=" + idusuario;
            String sexo = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
            user.setSexo(sexo);
            mav.addObject("datos", user);
            mav.setViewName("vinculacion/editarV");
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    //@RequestMapping(value = "/editarUsuarioV", method = RequestMethod.POST)
    @PostMapping(value = "/editar")
    public ModelAndView editar(
            @ModelAttribute("datos")
            @Valid Usuario v, BindingResult result
    ) {
        this.usuarioValidator.validate(v, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("datos", v);
            mav.setViewName("vinculacion/editarV");
            return mav;
        } else {
            String sql = "update tb_usuarios set nombre=?, user=? where idUsuario=" + v.getIdusuario();
            this.jdbcTemplate.update(sql, v.getNombre(), v.getUser());
            return new ModelAndView("redirect:/vinculacion/lista");
        }

    }

    @RequestMapping(value = "/borrar")
    public ModelAndView borrar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select Estado from tb_usuarios where idUsuario=" + id;
        Object[] parameters = new Object[]{};
        int estado = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        if (estado == 1) {
            sql = "update tb_usuarios set Estado = 2 where idUsuario=" + id;
        } else {
            sql = "update tb_usuarios set Estado = 1 where idUsuario=" + id;
        }
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/vinculacion/lista");
    }

    //poblar select para tipo en insertar
    @ModelAttribute("sexo")
    public Map<String, String> listadoTipo() {
        Map<String, String> sexo = new LinkedHashMap<>();
        sexo.put("H", "Hombre");
        sexo.put("M", "Mujer");
        return sexo;
    }
}
