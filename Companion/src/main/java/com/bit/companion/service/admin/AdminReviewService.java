package com.bit.companion.service.admin;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.model.entity.admin.AdminQuestionVo;

public interface AdminReviewService {
	
	// Review list
	void list(Model model);
	
	// Review detail
	void detail(Model model, AdminArticleVo bean);
	
	// Review delete
	void delete(AdminArticleVo bean);
	
}
