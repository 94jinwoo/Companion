package com.bit.companion.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.companion.model.entity.admin.AdminQuestionVo;
import com.bit.companion.service.admin.AdminQuestionService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminQuestionController {

	private static final Logger logger=LoggerFactory.getLogger(AdminArticleController.class);
	
	@Autowired
	AdminQuestionService adminQuestionService;
	
	// question List -get
	@RequestMapping(value = "question_list", method = RequestMethod.GET)
	public String questionList(Model model) {
		logger.info("get question List");
		adminQuestionService.list(model);
		return "admin/question_list";
	}
	
	// question detail - get
	@RequestMapping(value = "question_detail", method = RequestMethod.GET)
	public String questionDetail(Model model, @ModelAttribute AdminQuestionVo bean){
		logger.info("get question detail");
		adminQuestionService.detail(model, bean);
		return "admin/question_detail";
	}
	
	// question edit - get
	@RequestMapping(value = "question_edit", method = RequestMethod.GET)
	public String questionEdit(Model model, @ModelAttribute AdminQuestionVo bean){
		logger.info("get question edit");
		adminQuestionService.type(model);
		adminQuestionService.detail(model, bean);
		return "admin/question_edit";
	}
	
	// question edit - post
	@RequestMapping(value = "question_edit", method = RequestMethod.POST)
	public String questionEdit(@ModelAttribute AdminQuestionVo bean){
		logger.info("post question edit");
		adminQuestionService.update(bean);
		return "redirect:/admin/question_detail?question_id="+bean.getQuestion_id();
	}
	
	//question delete - post
	@RequestMapping(value = "question_delete", method = RequestMethod.POST)
	public String questionDelete(@ModelAttribute AdminQuestionVo bean){
		logger.info("post question delete");
		adminQuestionService.delete(bean);
		return "redirect:/admin/question_list";
	}
}
