package com.bit.companion.service.admin;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.common.Search;
import com.bit.companion.model.admin.AdminReservationDao;
import com.bit.companion.model.entity.admin.AdminHotelServiceVo;
import com.bit.companion.model.entity.admin.AdminReservationVo;

import net.sf.json.JSONArray;

@Service
public class AdminReservationServiceImpl implements AdminReservationService {
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	AdminReservationDao adminReservationDao;

	//reservation list
	@Override
	public void list(Model model) {
		try {
			
			List<AdminReservationVo> list=adminReservationDao.selectAll();
			
			model.addAttribute("adminReservationList", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//hotelservice list - selectHotelService
	@Override
	public void service(Model model) {
		try {
			List<AdminHotelServiceVo> service= adminReservationDao.selectService();
			model.addAttribute("adminHotelService", JSONArray.fromObject(service));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// reservation detail
	@Override
	public void detail(Model model, int reserve_id) {
		try {
			model.addAttribute("adminReservationOne", adminReservationDao.selectOne(reserve_id));
			System.out.println(adminReservationDao.selectOne(reserve_id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// reservation edit
	@Override
	public void update(AdminReservationVo bean) {
		try {
			adminReservationDao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}



}
