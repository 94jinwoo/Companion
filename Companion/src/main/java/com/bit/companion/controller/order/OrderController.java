package com.bit.companion.controller.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.order.OrderVo;
import com.bit.companion.service.order.OrderService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;

	//상품 구매 페이지
	@RequestMapping(value = "/order/orderPurchase",method= {RequestMethod.GET,RequestMethod.POST})
	public String orderPurchase(Model model,HttpSession session,OrderVo orderVo,@RequestParam("idx") int product_id) throws SQLException {
		logger.debug("product purchase controller start");
		
		
		MemberVo member = (MemberVo)session.getAttribute("memberVo");
		orderVo.setMember_id(member.getMember_id());
		orderVo.setMember_name(member.getMember_name());
		orderVo.setMember_phone(member.getMember_phone());
		orderVo.setMember_email(member.getMember_email());
		
		session.setAttribute("orderVo",orderVo);
		//상품 목록 표시. 
		orderService.list(model, product_id);
		
		return "order/orderPurchase";
	}
	
	//카카오 API컨트롤러
	@RequestMapping(value = "/order/payApi")
	public String apiTest(Model model) {
		return "order/payApi";
	}

	// 주문성공페이지
	@RequestMapping(value = "/order/successOrder",method= RequestMethod.POST)
	public void orderSuccess(Model model,OrderVo orderVo,HttpSession session,HttpServletRequest request) {
		
		  MemberVo member = (MemberVo)session.getAttribute("memberVo");
		  orderVo.setMember_id(member.getMember_id());
		  orderVo.setMember_name(member.getMember_name());
		  orderVo.setMember_phone(member.getMember_phone());
		  orderVo.setMember_email(member.getMember_email());
		  
		orderService.OrderInfo_Detail(orderVo); 
	}
	
	

}
