/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import com.fiee.Models.Encargado;
import com.fiee.Models.Fichero;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Eduar
 */

@Controller
@RequestMapping(value = "/firmas")
public class firmasController {
    
    @Autowired
    ServletContext context; 
    
    private JdbcTemplate jdbcTemplate;
    int id;
    List lista;

    public firmasController() {
        conectionClass con = new conectionClass();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }    
    
    @GetMapping(value="/home")
    public ModelAndView inicio(){
        String sql = "SELECT * FROM tb_firmas";
        lista = this.jdbcTemplate.queryForList(sql);
        ModelAndView mav = new ModelAndView();
        mav.addObject("firma",new Fichero());
        mav.addObject("firmas",lista);
        mav.setViewName("firmas/index");
        return mav;
    }
    
    @PostMapping(value="/addFirma")
    public ModelAndView inicio( @ModelAttribute("firma") @Valid Fichero file, BindingResult result ) throws IOException{
        String uploadPath = context.getRealPath("/resources/dist/firmas") + File.separator;
        String extension = FilenameUtils.getExtension(file.getFile().getOriginalFilename());
        String fileName = uploadPath + "firma"+ file.getDescripcion() +"." + extension;
        FileCopyUtils.copy(file.getFile().getBytes(), new File(fileName));
        fileName = "/dist/firmas" + File.separator + "firma." + extension;
        String sql = "update tb_firmas SET path = ? WHERE idFirma = ?";
        this.jdbcTemplate.update(sql, fileName, file.getDescripcion());
        return new ModelAndView("redirect:/firmas/home");
    }
    
    @RequestMapping(value = "/eliminaFirma")
    public ModelAndView deleteFirmEs(@RequestParam("id") int aut, HttpServletRequest request) {
        String sql = "Update tb_firmas SET path = '/' WHERE idFirma = "+aut;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/firmas/home");
    }
    
}
