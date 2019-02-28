/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fiee.Controllers;

import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Anemc
 */
@Controller
public class pruebadbController {
    @Autowired
	private DataSource dataSource;

	@RequestMapping("/checkConnection")
	public ModelAndView greet() {

		try {
			if (dataSource.getConnection() != null) {

				return new ModelAndView("prueba", "msg", "Database Connection Successfully Established.");

			} else {

				return new ModelAndView("prueba", "msg", "Failed to connect database.");
			}
		} catch (SQLException e) {
			e.printStackTrace();

			return new ModelAndView("prueba", "msg", "Failed to connect database.");
		}
	}
}
