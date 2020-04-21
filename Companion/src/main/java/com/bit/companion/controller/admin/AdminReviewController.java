package com.bit.companion.controller.admin;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.model.entity.admin.AdminQuestionVo;
import com.bit.companion.service.admin.AdminReviewService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminReviewController {

	private static final Logger logger=LoggerFactory.getLogger(AdminArticleController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	AdminReviewService adminReviewService;
	
	// review list - get 
	@RequestMapping(value = {"review_list"}, method = RequestMethod.GET)
	public String reviewList(Model model) {
		logger.info("get review list");
		adminReviewService.list(model);
		return "admin/review_list";
	}
	
	// review detail - get 
	@RequestMapping(value = {"review_detail"}, method = RequestMethod.GET)
	public String reviewDetail(Model model, @ModelAttribute AdminArticleVo bean) {
		logger.info("get review detail");
		adminReviewService.detail(model, bean);
		return "admin/review_detail";
	}
	
	//review delete - post
	@RequestMapping(value = "review_delete", method = RequestMethod.POST)
	public String reviewDelete(@ModelAttribute AdminArticleVo bean){
		logger.info("post review delete");
		System.out.println(bean.toString());
		adminReviewService.delete(bean);
		return "redirect:/admin/review_list";
	}
}
