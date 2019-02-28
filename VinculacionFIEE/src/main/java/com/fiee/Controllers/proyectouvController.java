
package com.fiee.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class proyectouvController {
    
    @RequestMapping(value="/proyectouv")
    public ModelAndView proyectouv()
    {
        ModelAndView index = new ModelAndView();
        index.setViewName("proyectouv");
        return index;
    }
    
}
