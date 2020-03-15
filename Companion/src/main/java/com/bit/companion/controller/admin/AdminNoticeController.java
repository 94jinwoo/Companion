package com.bit.companion.controller.admin;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.model.entity.admin.AdminNoticeVo;
import com.bit.companion.service.admin.AdminService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminNoticeController {

	@Autowired
	AdminService adminService;
	
	// �������� ����Ʈ ������
	@RequestMapping(value = "testnoticelist")
	public String noticeList(Model model) {
		adminService.list(model);
		return "admin/testnoticelist";
	}
	
	// �������� �� ������
	@RequestMapping(value = "testnoticedetail/{idx}")
	public String noticeDetail(Model model, @PathVariable("idx") int article_id) {
		adminService.detail(model, article_id);
		return "admin/testnoticedetail";
	}
	
	//�������� �Է� ������ GET
	@RequestMapping(value = "testnoticeadd", method = RequestMethod.GET)
	public String noticeAdd() {
		return "admin/testnoticeadd";
	}
	//�������� �Է� ������ POST
	@RequestMapping(value = "testnoticeadd", method = RequestMethod.POST)
	public String noticeAdd(@ModelAttribute AdminNoticeVo bean ) {
		adminService.insert(bean);
		return "redirect:testnoticelist";
	}
}
