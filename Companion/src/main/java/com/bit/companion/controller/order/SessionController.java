package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.service.order.SessionService;
 
@Controller
public class SessionController {
	
	//TODAY VIEW
	ArrayList<Object> list
	= new ArrayList<Object>();
	
	private static final Logger logger = LoggerFactory.getLogger(SessionController.class);
	
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping(value="/common/scrollbar",method=RequestMethod.GET)
	public String sessionListController(Model model,HttpSession session,HttpServletRequest request) throws SQLException {
		
		int product_id = (int)request.getAttribute("Product_id");
		System.out.println(product_id);
		list.add(product_id);
		System.out.println(list.toString());
//		세션
//		if(list.size()>2) {
//			list.add(0, product_id);;
//			list.remove(3);
//		}else {
//			list.add(0,product_id);
//		}
//		if(list!=null) {
//			sessionService.SessionList(model,list); 
//			session.setAttribute("productList",list); 
//		}
		return "/common/scrollbar";
	}
	
	
	
	
	
	

}
