package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.SessionVo;
import com.bit.companion.model.order.SessionDao;

@Service
public class SessionServiceImpl implements SessionService {

	@Autowired
	SessionDao sessionDao;
	
	@Override
	public void SessionList(Model model,int product_id) {
		List<SessionVo> list;
		System.out.println("sessionList SERVICE RUN......");
		
		try {
			list=sessionDao.sessionList(product_id);
			model.addAttribute("sessionList",list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


