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

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminProductVo;
import com.bit.companion.model.entity.admin.AdminReservationVo;
import com.bit.companion.service.admin.AdminReservationService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminReservationController {

	private static final Logger log=LoggerFactory.getLogger(AdminReservationController.class);
	
	@Autowired
	AdminReservationService adminReservationService;
	
	// reservation list
	@RequestMapping(value="reservation_list", method=RequestMethod.GET)
	public String reservationList(Model model) {
		log.info("get reservation list");
		
		adminReservationService.list(model);
		return "admin/reservation_list";
	}
	
	// reservation detail - get
	@RequestMapping(value="reservation_detail", method = RequestMethod.GET)
	public String reservationDetail(Model model, @RequestParam int reserve_id) {
		log.info("get reservation detail");
		
		adminReservationService.detail(model, reserve_id);
		return "admin/reservation_detail";
	}
	
	// reservation edit - get
	@RequestMapping(value="reservation_edit", method = RequestMethod.GET)
	public String reservationEdit(Model model, @RequestParam int reserve_id) {
		log.info("get reservation edit");
		
		adminReservationService.detail(model, reserve_id);
		return "admin/reservation_edit";
	}
	
	// reservation edit - post
		@RequestMapping(value="reservation_edit", method = RequestMethod.POST)
		public String reservationDetail(@ModelAttribute AdminReservationVo bean) {
			log.info("post reservation state edit");
			System.out.println(bean.getReserve_id());
			adminReservationService.update(bean);
			System.out.println(bean.getReserve_id());
			return "redirect:/admin/reservation_detail?reserve_id="+bean.getReserve_id();
		}

	
}
