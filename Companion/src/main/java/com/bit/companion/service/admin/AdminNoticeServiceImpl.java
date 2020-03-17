package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.admin.AdminNoticeDao;
import com.bit.companion.model.entity.admin.AdminArticleVo;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	AdminNoticeDao adminNoticeDao;
	
	// �������� ����Ʈ - selectAll
	@Override
	public void list(Model model) {
		try {
			List<AdminArticleVo> list = adminNoticeDao.selectAll();
			model.addAttribute("adminNoticeList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// �������� �� - selectOne
	@Override
	public void detail(Model model, int article_id) {
		try {
			//count?
			model.addAttribute("adminNoticeOne", adminNoticeDao.selectOne(article_id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// �������� �Է� - insertOne
	@Override
	public void insert(AdminArticleVo bean) {
		try {
			adminNoticeDao.insertOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// �������� ���� - updateOne
	@Override
	public void update(AdminArticleVo bean) {
		try {
			adminNoticeDao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// �������� ���� - deleteOne
	@Override
	public void delete(AdminArticleVo bean) {
		try {
			adminNoticeDao.deleteOne(bean);
		} catch (SQLException e) {
		}
	}

}