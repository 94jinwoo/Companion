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

import com.bit.companion.model.entity.admin.AdminMemberViewVo;
import com.bit.companion.service.admin.AdminMemberService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminMemberController {
	
	private static final Logger log=LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	AdminMemberService adminMemberService;
	
	// member list
	@RequestMapping(value = "member_list", method = RequestMethod.GET)
	public String memberList(Model model) {
		log.info("get member list");
		
		adminMemberService.list(model);
		return "admin/member_list";
	}
	
	// member detail
	@RequestMapping(value = "member_detail", method = RequestMethod.GET)
	public String memberDetail(Model model, @ModelAttribute AdminMemberViewVo bean) {
		log.info("get member datail");
		
		adminMemberService.detail(model, bean);
		return "admin/member_detail";
	}
	
	// member edit - get
	@RequestMapping(value = "member_edit", method = RequestMethod.GET)
	public String memberEdit(Model model, @ModelAttribute AdminMemberViewVo bean) {
		log.info("get member edit");
		
		adminMemberService.detail(model, bean);
		return "admin/member_edit";
	}
	
	// member edit - post
	@RequestMapping(value = "member_edit", method = RequestMethod.POST)
	public String memberEdit(@ModelAttribute AdminMemberViewVo bean) {
		log.info("post member edit");
		adminMemberService.update(bean);
		
		return "redirect:/admin/member_detail?member_id="+bean.getMember_id();
	}
	
}
