package com.fiee.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {

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
            ModelAndView mav = new ModelAndView();
            mav.setViewName("home");  // Este es el nombre del archivo vista .jsp
            return mav;
        } catch (Exception e) {
            return new ModelAndView("redirect:/login/login");
        }
    }
}
