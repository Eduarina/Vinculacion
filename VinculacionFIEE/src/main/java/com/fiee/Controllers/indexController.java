package com.fiee.Controllers;

import com.fiee.Models.Fichero;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {

    ServletContext context;
    
    @RequestMapping(value = "/")
    public ModelAndView index(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String sql;
            int id = (int) session.getAttribute("id");
            return new ModelAndView("redirect:/home");
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }

    @RequestMapping(value = "/home")
    public ModelAndView home(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id");
            Fichero file = new Fichero();
            ModelAndView mav = new ModelAndView("fileUpload","command", file);
            mav.setViewName("home");  // Este es el nombre del archivo vista .jsp
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }
    
    @RequestMapping(value="/fileUploadPage", method = RequestMethod.POST)
    public String fileUpload(@Validated Fichero file, BindingResult result, ModelMap model) throws IOException {
      if (result.hasErrors()) {
         System.out.println("validation errors");
         return "fileUploadPage";
      } else {            
         System.out.println("Fetching file");
         MultipartFile multipartFile = file.getFile();
         String uploadPath = context.getRealPath("") + File.separator + "temp" + File.separator;
         //Now do something with file...
         FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath+file.getFile().getOriginalFilename()));
         String fileName = multipartFile.getOriginalFilename();
         model.addAttribute("fileName", fileName);
         return "success";
      }
   }
    
}
