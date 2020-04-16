package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.bit.companion.model.admin.AdminQuestionDao;
import com.bit.companion.model.entity.admin.AdminQuestionVo;

import net.sf.json.JSONArray;

@Service
public class AdminQuestionServiceImpl implements AdminQuestionService{

	@Autowired
	AdminQuestionDao adminQuestionDao;

	// question list
	@Override
	public void list(Model model) {
		try {
			// Total list Count
			int listCnt = adminQuestionDao.selectTotal();
			
			List<AdminQuestionVo> list = adminQuestionDao.selectAll();
			
			model.addAttribute("total", listCnt);
			model.addAttribute("adminQuestionList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	// question detail
	@Override
	public void detail(Model model, AdminQuestionVo bean) {
		try {
			model.addAttribute("adminQuestionOne",adminQuestionDao.selectOne(bean));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// question type
	@Override
	public void type(Model model) {
		try {
			List<AdminQuestionVo> type=adminQuestionDao.selectType();
			model.addAttribute("adminQuestionType",JSONArray.fromObject(type));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// question edit
	@Transactional
	@Override
	public void update(AdminQuestionVo bean) {
		try {
			adminQuestionDao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// question delete
	@Transactional
	@Override
	public void delete(AdminQuestionVo bean) {
		try {
			adminQuestionDao.deleteOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
