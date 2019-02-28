
package com.fiee.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {
    
    @RequestMapping(value="/")
    public ModelAndView index()
    {
        ModelAndView index = new ModelAndView();
        index.setViewName("index");
        return index;
    }
    
}
