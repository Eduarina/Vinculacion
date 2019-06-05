/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Controllers.conectionClass;
import com.fiee.Models.*;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Emrys
 */
@Controller
@RequestMapping(value = "/login")
public class loginController {

    @Autowired
    ServletContext context; 
    
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

    @GetMapping(value = "/perfil")
    public ModelAndView perfil(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            ModelAndView mav = new ModelAndView();
            FileModel file = new FileModel();
            id = (int) session.getAttribute("id");
            tipo = (int) session.getAttribute("tipo");
            switch (tipo) {
                case 1:
                    sql = "select * from tb_usuarios where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
                case 2:
                    sql = "select * from tb_usuarios where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    break;
                case 3:
                    //id=Integer.parseInt(request.getParameter("id"));
                    sql = "select * from tb_maestros where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    mav.addObject("command", file);
                    break;
                case 4:
                    sql = "select * from tb_encargados where idusuario=" + id;
                    lista = this.jdbcTemplate.queryForList(sql);
                    mav.addObject("command", file);
                    break;
                case 5:
                    sql = "SELECT * FROM tb_estudiantes e, ctg_carreras c WHERE e.Carrera = c.idCarrera AND e.idusuario=" + id;
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

    
    @RequestMapping(value = "/eliminarFirmaM")
    public ModelAndView deleteFirm(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        int id = (int) session.getAttribute("id");
        String sql = "Update tb_maestros SET Firma = '' WHERE idUsuario = "+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/login/perfil");
    }

    @RequestMapping(value = "/eliminarFirmaE")
    public ModelAndView deleteFirmE(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        int id = (int) session.getAttribute("id");
        String sql = "Update tb_maestros SET Firma = '' WHERE idUsuario = "+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/login/perfil");
    }
    
    @RequestMapping(value = "/eliminarFirmaEs")
    public ModelAndView deleteFirmEs(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        int id = (int) session.getAttribute("id");
        String sql = "Update tb_estudiantes SET Firma = '' WHERE idUsuario = "+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/login/perfil");
    }
    
//
    //@RequestMapping(path = "/insertarUsuarioV", method = RequestMethod.POST)
  
    @RequestMapping(value = "/perfil", method = RequestMethod.POST)
    public ModelAndView fileUpload(@Validated Fichero file, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return new ModelAndView("return:lista");
        } else {
            HttpSession session = request.getSession();
            String nombre = (String) session.getAttribute("nombre");
            int id = (int) session.getAttribute("id");
            MultipartFile multipartFile = file.getFile();
            String uploadPath = context.getRealPath("/maestros") + File.separator + nombre + File.separator;
            //Now do something with file...
            String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
            String fileName = uploadPath + "firma." + extension;
            FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
            fileName =File.separator + nombre + File.separator + "firma." + extension;
            
            String sql = "update tb_maestros SET firma = ? WHERE idUsuario = ?";
            this.jdbcTemplate.update(sql, fileName, id);
            return new ModelAndView("redirect:/login/perfil");
        }
    }
    
    @RequestMapping(value = "/insertarFirmaE", method = RequestMethod.POST)
    public ModelAndView fileFirm(@Validated Fichero file, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return new ModelAndView("return:lista");
        } else {
            HttpSession session = request.getSession();
            String nombre = (String) session.getAttribute("nombre");
            int id = (int) session.getAttribute("id");
            MultipartFile multipartFile = file.getFile();
            String uploadPath = context.getRealPath("/encargados") + File.separator + nombre + File.separator;
            //Now do something with file...
            String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
            String fileName = uploadPath + "firma." + extension;
            FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
            fileName =File.separator + nombre + File.separator + "firma." + extension;
            
            String sql = "update tb_encargados SET firma = ? WHERE idUsuario = ?";
            this.jdbcTemplate.update(sql, fileName, id);
            return new ModelAndView("redirect:/login/perfil");
        }
    }
    
    @RequestMapping(value = "/insertarFirmaEs", method = RequestMethod.POST)
    public ModelAndView alumnFirm(@Validated Fichero file, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return new ModelAndView("return:lista");
        } else {
            HttpSession session = request.getSession();
            String nombre = (String) session.getAttribute("nombre");
            int id = (int) session.getAttribute("id");
            MultipartFile multipartFile = file.getFile();
            String uploadPath = context.getRealPath("/") + File.separator + nombre + File.separator;
            //Now do something with file...
            String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
            String fileName = uploadPath + "firma." + extension;
            FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
            fileName =File.separator + nombre + File.separator + "firma." + extension;
            
            String sql = "update tb_estudiantes SET firma = ? WHERE idUsuario = ?";
            this.jdbcTemplate.update(sql, fileName, id);
            return new ModelAndView("redirect:/login/perfil");
        }
    }
    
    @RequestMapping(value = "/photoperfil", method = RequestMethod.POST)
    public ModelAndView photoPerfil(@Validated Fichero file, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return new ModelAndView("return:lista");
        } else {
            HttpSession session = request.getSession();
            String nombre = (String) session.getAttribute("nombre");
            int id = (int) session.getAttribute("id");
            MultipartFile multipartFile = file.getFile();
            String uploadPath = context.getRealPath("/resources/dist/img") + File.separator;
            String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
            String fileName = uploadPath + file.getFile().getOriginalFilename();
            
            FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
            fileName = "/dist/img" + File.separator + file.getFile().getOriginalFilename();
            
            String sql = "update tb_usuarios SET path = ? WHERE idUsuario = ?";
            this.jdbcTemplate.update(sql, fileName, id);
            session.removeAttribute("src");
            session.setAttribute("src",fileName);
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
