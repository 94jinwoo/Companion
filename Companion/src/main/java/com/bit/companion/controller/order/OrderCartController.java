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
import org.springframework.web.servlet.View;

import com.bit.companion.model.entity.login.MemberVo;
import com.bit.companion.model.entity.order.OrderVo;
import com.bit.companion.service.order.OrderService;

import net.sf.json.JSONArray;

@Controller
public class OrderCartController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	// 장바구니 담기.
	 @RequestMapping(value ="/order/orderCart",method=RequestMethod.POST)
	 public String orderCartAdd(Model model,HttpSession session,OrderVo orderVo,HttpServletRequest request) throws SQLException{
	 		MemberVo member = (MemberVo)session.getAttribute("memberVo");
	 		orderVo.setMember_id(member.getMember_id());
		
		orderService.insertCart(model,orderVo);
		
		 return "redirect:productDetail?idx="+orderVo.getProduct_id(); 
	};
	
	//장바구니 주문.
	@RequestMapping(value="/order/orderCartPurchase",method=RequestMethod.POST)
	public String orderCartPurchase(HttpServletRequest req,Model model,List<OrderVo> orderVo) throws SQLException {
		orderService.insert_test(orderVo);
		 
		return "/order/successOrder";
	}
	
	
}
