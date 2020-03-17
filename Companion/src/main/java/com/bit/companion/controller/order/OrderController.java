package com.bit.companion.controller.order;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.service.admin.AdminService;
import com.bit.companion.service.order.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/order/orderMain")
	public String orderMain(Model model) {
		orderService.list(model);
		return "order/orderMain";
	}	
	@RequestMapping(value = "/order/orderPurchase")
	public String orderPurchase(Model model) {
		orderService.list(model);
		return "order/orderPurchase";
	}
	@RequestMapping(value = "/order/payApi")
	public String apiTest(Model model) {
		return "order/payApi";
	}
	
	

}
