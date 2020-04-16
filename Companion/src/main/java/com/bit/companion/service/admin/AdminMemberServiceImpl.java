package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.bit.companion.model.admin.AdminMemberDao;
import com.bit.companion.model.entity.admin.AdminMemberViewVo;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	AdminMemberDao adminMemberDao;

	// member list
	@Override
	public void list(Model model) {
		try {
			List<AdminMemberViewVo> list=adminMemberDao.selectAll();
			model.addAttribute("adminMemberList",list);
			} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// member detail
	@Override
	public void detail(Model model, AdminMemberViewVo bean) {
		try {
			model.addAttribute("adminMemberOne", adminMemberDao.selectOne(bean));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// member update
	@Transactional
	@Override
	public void update(AdminMemberViewVo bean) {
		try {
			adminMemberDao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 
}
