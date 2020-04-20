package com.bit.companion.controller.order;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.model.entity.order.SessionVo;
import com.bit.companion.service.order.SessionService;
 
@Controller
public class SessionController {
	private static final Logger logger = LoggerFactory.getLogger(SessionController.class);
	
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping(value="/common/scrollbar",method=RequestMethod.GET)
	public String sessionListController(Model model,HttpSession session,HttpServletRequest request) throws SQLException {

		
		int product_id = (int)session.getAttribute("Session");
		sessionService.SessionList(model, product_id);
		

		return "/common/scrollbar";
	}
	
	
	
	
	
	

}
