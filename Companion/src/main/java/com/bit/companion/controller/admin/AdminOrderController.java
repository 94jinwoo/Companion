package com.bit.companion.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.companion.model.entity.admin.AdminOrderDetailVo;
import com.bit.companion.model.entity.admin.AdminProductVo;
import com.bit.companion.service.admin.AdminOrderService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminOrderController {
	private static final Logger log=LoggerFactory.getLogger(AdminOrderController.class);
	
	@Autowired
	AdminOrderService adminOrderService;
	
	// list
	@RequestMapping(value = "order_list", method = RequestMethod.GET)
	public String orderList(Model model) {
		adminOrderService.list(model);
		return "admin/order_list";
	}
	
	// detail
	@RequestMapping(value = "order_detail", method = RequestMethod.GET)
	public String orderDetail(Model model, @RequestParam int order_id ) {
		log.info("get order datail");
		
		adminOrderService.detail(model, order_id);
		return "admin/order_detail";
	}
	
	// 출고 요청
	@RequestMapping(value = "order_release", method = RequestMethod.POST)
	public String orderRelease(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get order release");
		
		adminOrderService.release(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 주문 취소
	@RequestMapping(value = "order_cancel", method = RequestMethod.POST)
	public String orderCancle(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get order cancel");
		
		adminOrderService.cancel(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 출고 완료
	@RequestMapping(value = "release_done", method = RequestMethod.POST)
	public String releaseDone(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get release done");
		
		adminOrderService.releaseDone(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 배송 완료
	@RequestMapping(value = "delivery_done", method = RequestMethod.POST)
	public String deliveryDone(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get delivery done");
		
		adminOrderService.delivery(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 구매 확정
	@RequestMapping(value = "purchase_confirm", method = RequestMethod.POST)
	public String purchaseConfirm(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get purchase confirm");
		
		adminOrderService.purchase(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 교환
	@RequestMapping(value = "order_exchange", method = RequestMethod.POST)
	public String orderExchange(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get order exchange");
		
		adminOrderService.exchange(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
	
	// 반품
	@RequestMapping(value = "order_return", method = RequestMethod.POST)
	public String orderReturn(@ModelAttribute AdminOrderDetailVo bean, @RequestParam int order_id) {
		log.info("get order return");
		
		adminOrderService.orderReturn(order_id);
		return "redirect:order_detail?order_id="+bean.getOrder_id();
	}
}
