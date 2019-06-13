/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Fichero;
import com.fiee.Models.FileModel;
import com.fiee.Models.UsuarioValidator;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hp
 */
@Controller
@RequestMapping(value = "/documentos")
public class documentosController {

    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;
    ArrayList<String> documentos;

    @Autowired
    ServletContext context;

    public documentosController() //Constructor de la clase
    {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @GetMapping(value = "/lista")
    public ModelAndView lista(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String sql = "SELECT idEstudiate from tb_estudiantes where idUsuario = " + id;
        Object[] parameters = new Object[]{};
        int idEstudiante = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
        sql = "Select * from vw_documentacion_alumno WHERE Estudiante = " + idEstudiante;
        lista = jdbcTemplate.queryForList(sql);
        ModelAndView response = new ModelAndView();
        response.addObject("datos", lista);
        response.addObject("url", context.getRealPath(""));
        FileModel file = new FileModel();
        response.addObject("command", file);
        response.setViewName("documentos/index");
        return response;
    }
    
    @GetMapping(value = "/ver")
    public ModelAndView ver(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * from vw_documentacion_alumno where Estudiante = " + id;
        lista = jdbcTemplate.queryForList(sql);
        sql = "Select distinct Nombre from vw_documentacion_alumno WHERE Estudiante = "+id; 
        Object[] parameters = new Object[]{};
        String name = this.jdbcTemplate.queryForObject(sql, parameters, String.class);
        ModelAndView response = new ModelAndView();
        response.addObject("datos", lista);
        response.addObject("nombre", name);
        response.setViewName("documentos/ver");
        return response;
    }


    @RequestMapping(value = "/lista", method = RequestMethod.POST)
    public ModelAndView fileUpload(@Validated Fichero file, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return new ModelAndView("return:lista");
        } else {
            HttpSession session = request.getSession();
            String nombre = (String) session.getAttribute("nombre");
            int id = (int) session.getAttribute("id");
            MultipartFile multipartFile = file.getFile();
            String uploadPath = context.getRealPath("/resources/estudiantes") + File.separator + nombre + File.separator;
            
            String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
            String fileName = uploadPath + file.getDescripcion() + "." + extension;
            FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
            fileName = nombre + File.separator + file.getDescripcion() + "." + extension;
            String sql = "select idDocumento from ctg_documentos where descripcion = '" + file.getDescripcion() + "'";
            Object[] parameters = new Object[]{};
            int Documento = this.jdbcTemplate.queryForObject(sql, parameters, int.class);
            sql = "select idEstudiate from tb_estudiantes where idUsuario = " + id;
            int idEstudiante = this.jdbcTemplate.queryForObject(sql, parameters, int.class);

                sql = "update tb_documentacion_alumno SET Path = ?, Estado = 4 WHERE idEstudiante = ? AND idDocumento = ?";
            this.jdbcTemplate.update(sql, fileName, idEstudiante, Documento);
            return new ModelAndView("redirect:lista");
        }
    }

    @RequestMapping("/download/{fileName:.+}")
    public void downloader(HttpServletRequest request, HttpServletResponse response,
            @PathVariable("fileName") String fileName) {
        
        String []archivo = fileName.split("_");
        String path = "/"+archivo[0];
        fileName = archivo[1]+".xlsx";
        String downloadFolder = context.getRealPath(path);
        
        Path file = Paths.get(downloadFolder, fileName);
        // Check if file exists
        if (Files.exists(file)) {
            // set content type
            response.setContentType("application/pdf");
            // add response header
            response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
            try {
                // copies all bytes from a file to an output stream
                Files.copy(file, response.getOutputStream());
                // flushes output stream
                response.getOutputStream().flush();
            } catch (IOException e) {
                System.out.println("Error :- " + e.getMessage());
            }
        } else {
            System.out.println("Sorry File not found!!!!");
        }
    }

}
