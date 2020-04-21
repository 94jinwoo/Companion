package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.bit.companion.model.admin.AdminReviewDao;
import com.bit.companion.model.entity.admin.AdminArticleVo;
import com.bit.companion.model.entity.admin.AdminQuestionVo;

@Repository
public class AdminReviewServiceImpl implements AdminReviewService{
	Logger logger=LoggerFactory.getLogger(getClass());

	@Autowired
	AdminReviewDao adminReviewDao;

	// Review list - selectAll
	@Override
	public void list(Model model) {
		try {
			List<AdminArticleVo> list = adminReviewDao.selectAll();
			model.addAttribute("adminReviewList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Review detail - selectOne
	@Override
	public void detail(Model model, AdminArticleVo bean) {
		try {
			model.addAttribute("adminReviewOne", adminReviewDao.selectOne(bean));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Review delete
	@Override
	public void delete(AdminArticleVo bean) {
		try {
			adminReviewDao.deleteOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
